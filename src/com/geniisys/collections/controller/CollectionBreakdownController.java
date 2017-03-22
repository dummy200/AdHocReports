package com.geniisys.collections.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.geniisys.common.entity.Branch;
import com.geniisys.common.service.AssuredService;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.impl.AssuredServiceImpl;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.util.ConnectionUtil;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

import net.sf.jasperreports.engine.DefaultJasperReportsContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRPropertiesUtil;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;

public class CollectionBreakdownController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/collections/collection breakdown/collectionBreakdown.jsp";
		String page2 = "/CollectionBreakdownController?action=toCollectionBreakdownPage";
		String reportName = request.getParameter("reportName");
		String tranCd = "94";
		String errorMsg = "";
		/* request.getParameter("redirectPage"); */

		if (action.equals("toCollectionBreakdownPage")) {
			BranchService branchService = new BranchServiceImpl();
			List<Branch> branchList = null;
			try {
				branchList = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			/*String branchList4 = (String) branchService.getAllBranches4();*/
			
			/*AssuredService assuredService = new AssuredServiceImpl();
			String assuredList2 = (String) assuredService.getAllActiveAssured2();
			request.setAttribute("assuredList2", assuredList2);*/
			
			request.setAttribute("branchList", branchList);
			/*request.setAttribute("branchList4", branchList4);*/
			request.setAttribute("pageTitle", "Commission Fund");
			request.setAttribute("reportName", reportName);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		if (action.equals("printReport")) {
			// params

			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String branchCd = request.getParameter("branchCd");
			String payMode = request.getParameter("payMode");
			String userId = request.getParameter("userId");

			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			String outputXls = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".xls";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_FROM_DATE", fromDate);
			parameters.put("P_TO_DATE", toDate);
			parameters.put("P_BRANCH", branchCd);
			parameters.put("P_PAY_MODE", payMode);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_TRAN_CD",tranCd);

			try {
				System.out.println("converting report................");
				DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
						"net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");

				Connection conn = ConnectionUtil.getConnection();

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
				File sourceReport = new File(fileName);
				if (!sourceReport.exists() && sourceReport.isDirectory()) {
					errorMsg = "Report not found in reports directory.";
				}
				File outputFile = new File(outputPdf);
				if (!outputFile.exists() && outputFile.isDirectory()) {
					errorMsg = "Output not found in generated reports directory.";
				}

				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("reportUrl", outputPdf);
				request.setAttribute("reportXls", outputXls);
				request.setAttribute("reportTitle", reportName);

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/collections/collection breakdown/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
