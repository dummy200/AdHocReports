package com.geniisys.underwriting.controller;

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

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Intermediary;
import com.geniisys.common.entity.Line;
import com.geniisys.common.entity.Subline;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.IntermediaryService;
import com.geniisys.common.service.LineService;
import com.geniisys.common.service.SublineService;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.common.service.impl.IntermediaryServiceImpl;
import com.geniisys.common.service.impl.LineServiceImpl;
import com.geniisys.common.service.impl.SublineServiceImpl;
import com.geniisys.underwriting.service.PremProductionService;
import com.geniisys.underwriting.service.impl.PremProductionServiceImpl;
import com.geniisys.util.ConnectionUtil;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

@SuppressWarnings("deprecation")
public class PremProductionController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@SuppressWarnings("deprecation")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/underwriting/premium production/premiumProduction.jsp";
		String page2 = "/PremProductionController?action=toPremProductionPage";
		String tranCd = "98";
		String errorMsg = "";
		/* request.getParameter("redirectPage"); */

		if (action.equals("toPremProductionPage")) {
			LineService lineService = new LineServiceImpl();
			BranchService branchService = new BranchServiceImpl();
			IntermediaryService intmService = new IntermediaryServiceImpl();
			// AssuredService assuredService = new AssuredServiceImpl();

			//List<Line> lineList = (List<Line>) lineService.getAllLines();
			List<Line> lineList = null;
			List<Branch> branchList = null;
			List<Intermediary> intmTypeList = null;
			try {
				lineList = (List<Line>) lineService.getLinesByUserAndTranCd(request);
				branchList = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
				intmTypeList = (List<Intermediary>) intmService.getAllIntmType();
			} catch (SQLException e) {
				errorMsg = e.getMessage();
			}
			//List<Branch> branchList = (List<Branch>) branchService.getAllBranches();
			
			List<Intermediary> intmList = (List<Intermediary>) intmService.getAllActiveIntermediary();
			// List<Assured> assdList = (List<Assured>)
			// assuredService.getAllActiveAssured();
			request.setAttribute("errorMsg", errorMsg);
			request.setAttribute("lineList", lineList);
			request.setAttribute("branchList", branchList);
			request.setAttribute("intmTypeList", intmTypeList);
			request.setAttribute("intmList", intmList);
			// request.setAttribute("assdList", assdList);

			request.setAttribute("pageTitle", "Premium Production Report");

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
		if(action.equals("getSublineList")){
			LineService lineService = new LineServiceImpl();
			SublineService sublineSerive = new SublineServiceImpl();
			
			List<Line> lineList = null;
			List<Subline> sublineList = null;
			try {
				sublineList = (List<Subline>) sublineSerive.getAllSubline(request);
				lineList = (List<Line>) lineService.getLinesByUserAndTranCd(request);
				String lineCd = request.getParameter("lineCd");
				
				request.setAttribute("lineCd", lineCd);
				request.setAttribute("lineList", lineList);
				request.setAttribute("sublineList", sublineList);
				
			} catch (SQLException e) {
				errorMsg = e.getMessage();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/underwriting/premium production/lineDiv.jsp");
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
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/underwriting/premium production/intmResult.jsp");
			dispatcher.forward(request, response);
		}

		if (action.equals("printReport")) {
			String reportName = request.getParameter("reportName");
			String outputType = request.getParameter("outputType");
			String lineCd = request.getParameter("lineCd");
			String sublineCd = request.getParameter("sublineCd");
			String issCd = request.getParameter("branchCd");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String vsFromDate = request.getParameter("fromDate2");
			String vsToDate = request.getParameter("toDate2");
			String bookingMonth = request.getParameter("bookingMonth");
			Integer bookingYear = Integer.parseInt(request.getParameter("bookingYear"));
			String branchCd = request.getParameter("branchCd");
			String stringIntmNo = request.getParameter("intmNo");
			String getVsDate = request.getParameter("getVsDate");
			String userId = request.getParameter("userId");
			String intmType = request.getParameter("intmType");
			Integer intmNo;
			// Integer intmNo =
			// Integer.parseInt(request.getParameter("intmNo"));

			// get vs date
			if (getVsDate.equals("true")) {
				String fromDate2 = "";
				String toDate2 = "";
				
				/*
				DateFormat df = new SimpleDateFormat("yyyy-M-d");
				Date startDate;
				Date endDate;
				String fromDate2 = "";
				String toDate2 = "";
				try {
					startDate = df.parse(fromDate);
					endDate = df.parse(toDate);
					Integer year = startDate.getYear() + 1900 - 1;
					Integer month = startDate.getMonth() + 1;
					Integer date = startDate.getDate();
					fromDate2 = year.toString() + "-" + month.toString() + "-" + date.toString();
					System.out.println(fromDate2);
					year = endDate.getYear() + 1900 - 1;
					month = endDate.getMonth() + 1;
					date = endDate.getDate();
					toDate2 = year.toString() + "-" + month.toString() + "-" + date.toString();
					System.out.println(toDate2);
				} catch (ParseException e1) {
					errorMsg = "Error parsing date : " + e1.getMessage();
				}*/
				PremProductionService premProductionService = new PremProductionServiceImpl();
				
				if (vsFromDate.equals(null) || vsFromDate.equals("")) {
					//vsFromDate = fromDate2;
					vsFromDate = premProductionService.parseVsDate(fromDate);
				}
				if (vsToDate.equals(null) || vsToDate.equals("")) {
					//vsToDate = toDate2;
					vsToDate = premProductionService.parseVsDate(toDate);
				}

			}
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			String outputXls = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".xls";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			
			//issCd == branchCd
			//yung ibang report ibang parameter para s branchCd
			//p_iss_cd,p_branch_cd, at p_cred_branch pero same value lng pinapasa ng java s report :/
			parameters.put("P_LINE_CD", lineCd);
			parameters.put("P_SUBLINE_CD", sublineCd);
			parameters.put("P_ISS_CD", issCd);
			parameters.put("P_DATE_FROM", fromDate);
			parameters.put("P_DATE_TO", toDate);
			parameters.put("P_DATE_FROM_VS", vsFromDate);
			parameters.put("P_DATE_TO_VS", vsToDate);
			parameters.put("P_BOOKING_MONTH", bookingMonth);
			parameters.put("P_BOOKING_YEAR", bookingYear);
			parameters.put("P_BRANCH_CD", branchCd);
			parameters.put("P_CRED_BRANCH", branchCd);
			
			parameters.put("P_USER_ID", userId);
			parameters.put("P_TRAN_CD",tranCd);
			parameters.put("P_INTM_TYPE", intmType);
			
			System.out.println(lineCd);
			System.out.println(issCd);
			System.out.println(fromDate);
			System.out.println(toDate);
			System.out.println(reportName);
			// parameters.put("P_INTM_NO", intmNo);

			if (stringIntmNo.equals("") || stringIntmNo.equals(null)) {
				parameters.put("P_INTM_NO", null);
			} else
				parameters.put("P_INTM_NO", Integer.parseInt(request.getParameter("intmNo")));

			try {
				System.out.println("converting report................");
				/*DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
						"net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");*/

				Connection conn = ConnectionUtil.getConnection();
				if (outputType.equals("1")) {
					JasperPrint print = JasperFillManager.fillReport(fileName, parameters, conn);
					JRPdfExporter exporter = new JRPdfExporter();
					ByteArrayOutputStream out = new ByteArrayOutputStream();
					exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
					exporter.setExporterInput(new SimpleExporterInput(print));
					exporter.exportReport();
					JasperExportManager.exportReportToPdfFile(print, outputPdf);
				}
				if (outputType.equals("2")) {
					// try excel
					JasperPrint jasperPrint = JasperFillManager.fillReport(fileName, parameters, conn);

					JRXlsxExporter exp = new JRXlsxExporter();
					exp.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
					exp.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, outputXls);

					exp.exportReport();
				}
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
				request.setAttribute("outputType", outputType);

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/underwriting/premium production/hiddenDiv.jsp");
				dispatcher.forward(request, response);
				
			}
		}
	}
}
