package com.geniisys.collections.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.geniisys.common.entity.Assured;
import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Intermediary;
import com.geniisys.common.entity.Line;
import com.geniisys.common.service.AssuredService;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.IntermediaryService;
import com.geniisys.common.service.LineService;
import com.geniisys.common.service.impl.AssuredServiceImpl;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.common.service.impl.IntermediaryServiceImpl;
import com.geniisys.common.service.impl.LineServiceImpl;
import com.geniisys.util.ConnectionUtil;
import com.geniisys.util.MyAppSqlConfig;
import com.google.gson.Gson;
import com.ibatis.sqlmap.client.SqlMapClient;

import net.sf.jasperreports.engine.DefaultJasperReportsContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRPropertiesUtil;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

@SuppressWarnings("deprecation")
public class SOAperAssdIntmController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/collections/soa per assdIntm/soa.jsp";
		String page2 = "/SOAperAssdIntmController?action=toSOAPage";
		String tranCd = "94";
		Gson gson = new Gson();
		/* request.getParameter("redirectPage"); */

		if (action.equals("toSOAPage")) {
			BranchService branchService = new BranchServiceImpl();
			IntermediaryService intmService = new IntermediaryServiceImpl();

			//List<Branch> branchList = (List<Branch>) branchService.getAllBranches();
			List<Intermediary> intmList = (List<Intermediary>) intmService.getAllActiveIntermediary();
			List<Branch> branchList = null;
			
			try{
				branchList = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
			}catch(SQLException e){
				errorMsg = e.getMessage();
			}
			
			
			request.setAttribute("branchList", branchList);
			request.setAttribute("intmList", intmList);
			request.setAttribute("pageTitle", "SOA per Assured/Intermediary");
			System.out.println("to SOA page");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
		if(action.equals("searchAssured")){
			String assuredDivPage = request.getParameter("assuredDivPage");
			System.out.println("fetching assured list.....");
			AssuredService assuredService = new AssuredServiceImpl();
			/*String assuredList2 = (String) assuredService.getAllActiveAssured2();
			request.setAttribute("assuredList2", assuredList2);*/
			String assuredList = "";
			try {
				assuredList = (String) assuredService.searchAssured(request);
			} catch (SQLException e) {
				errorMsg = e.getMessage();
			}
			request.setAttribute("assuredList", assuredList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/collections/soa per assdIntm/assuredResult.jsp");
			dispatcher.forward(request, response);
		}
		
		if(action.equals("searchIntermediary")){
			System.out.println("fetching intm list......");
			IntermediaryService intmService = new IntermediaryServiceImpl();
			String intmList = "";
			try{
				intmList = (String) intmService.searchIntermediary(request);
			}catch (SQLException e) {
				errorMsg = e.getMessage();
			}
			request.setAttribute("intmList", intmList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/collections/soa per assdIntm/intmResult.jsp");
			dispatcher.forward(request, response);
		}

		if (action.equals("printReport")) {
			String reportName = request.getParameter("reportName");
			String branchCd = request.getParameter("branchCd");
			String intmNo = request.getParameter("intmNo");
			String assdNo = request.getParameter("assdNo");
			String userId = request.getParameter("userId");
			String reportType = request.getParameter("reportType");

			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			String outputXls = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".xls";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			System.out.println(assdNo);
			parameters.put("P_REPORT_TYPE", reportType);
			parameters.put("P_BRANCH_CD", branchCd);
			parameters.put("P_INTM_NO", intmNo);
			parameters.put("P_ASSD_NO", assdNo);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_TRAN_CD", tranCd);

			try {
				System.out.println("converting report................");
				/*DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
						"net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");*/

				Connection conn = ConnectionUtil.getConnection();
				// try excel
				JasperPrint jasperPrint = JasperFillManager.fillReport(fileName, parameters, conn);

				JRXlsxExporter exp = new JRXlsxExporter();
				exp.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
				exp.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, outputXls);

				exp.exportReport();
			} catch (JRException e) {
				System.out.println("jre exception: " + e.getMessage().toString());
				errorMsg = "jre exception: " + e.getMessage().toString();
			} catch (SQLException e) {
				System.out.println("sql exception: " + e.getMessage().toString());
				errorMsg = "sql exception: " + e.getMessage().toString();
			} finally {

				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("reportUrl", outputPdf);
				request.setAttribute("reportTitle", reportName);
				request.setAttribute("reportXls", outputXls);

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/collections/soa per assdIntm/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
