package com.geniisys.policyissuance.controller;

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

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.geniisys.common.entity.Assured;
import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Intermediary;
import com.geniisys.common.entity.Line;
import com.geniisys.common.entity.Signatory;
import com.geniisys.common.service.AssuredService;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.IntermediaryService;
import com.geniisys.common.service.LineService;
import com.geniisys.common.service.PolicyNoService;
import com.geniisys.common.service.SignatoryService;
import com.geniisys.common.service.impl.AssuredServiceImpl;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.common.service.impl.IntermediaryServiceImpl;
import com.geniisys.common.service.impl.LineServiceImpl;
import com.geniisys.common.service.impl.PolicyNoServiceImpl;
import com.geniisys.common.service.impl.SignatoryServiceImpl;
import com.geniisys.util.ConnectionUtil;
import com.geniisys.util.MyAppSqlConfig;
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

public class ConfirmedPolicyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/policy issuance/confirmed policy/confirmedPolicy.jsp";
		String page2 = "/ConfirmedPolicyController?action=toConfirmedPolicyPage";
		String reportName = request.getParameter("reportName");
		String tranCd = "95";

		if (action.equals("toConfirmedPolicyPage")) {
			LineService lineService = new LineServiceImpl();
			BranchService branchService = new BranchServiceImpl();
			IntermediaryService intmService = new IntermediaryServiceImpl();

			//List<Line> lineList = (List<Line>) lineService.getAllLines();
			//List<Branch> branchList = (List<Branch>) branchService.getAllBranches();
			List<Line> lineList = null;
			List<Branch> branchList = null;
			try {
				lineList = (List<Line>) lineService.getLinesByUserAndTranCd(request);
				branchList = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
			} catch (SQLException e) {
				errorMsg = e.getMessage();
			}
			List<Intermediary> intmList = (List<Intermediary>) intmService.getAllDealersIntm();
			request.setAttribute("branchList", branchList);
			request.setAttribute("lineList", lineList);
			request.setAttribute("intmList", intmList);
			request.setAttribute("pageTitle", "Confirmed Policy");

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		if (action.equals("printConfirmedPolicy")) {
			// params
			String lineCd = request.getParameter("lineCd");
			String branchCd = request.getParameter("branchCd");
			String tpCd = request.getParameter("tpCd");
			String fromDateAED = request.getParameter("fromDateAED");
			String toDateAED = request.getParameter("toDateAED");
			String fromDateID = request.getParameter("fromDateID");
			String toDateID = request.getParameter("toDateID");
			String fromDatePSD = request.getParameter("fromDatePSD");
			String toDatePSD = request.getParameter("toDatePSD");
			String dealersCd = request.getParameter("dealersCd");
			String userId = request.getParameter("userId");
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			String outputXls = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".xls";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_LINE_CD", lineCd);
			parameters.put("P_CRED_BRANCH", branchCd);
			parameters.put("P_TP_ISS_CD", tpCd);
			parameters.put("P_FROM_DATE_AED", fromDateAED);
			parameters.put("P_TO_DATE_AED", toDateAED);
			parameters.put("P_FROM_DATE_ID", fromDateID);
			parameters.put("P_TO_DATE_ID", toDateID);
			parameters.put("P_FROM_DATE_PSD", fromDatePSD);
			parameters.put("P_TO_DATE_PSD", toDatePSD);
			parameters.put("P_DEALER", dealersCd);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_TRAN_CD", tranCd);

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
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/policy issuance/confirmed policy/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
