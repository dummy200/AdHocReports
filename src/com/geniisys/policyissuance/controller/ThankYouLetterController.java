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
import com.geniisys.common.entity.Signatory;
import com.geniisys.common.service.AssuredService;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.PolicyNoService;
import com.geniisys.common.service.SignatoryService;
import com.geniisys.common.service.impl.AssuredServiceImpl;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.common.service.impl.PolicyNoServiceImpl;
import com.geniisys.common.service.impl.SignatoryServiceImpl;
import com.geniisys.util.ConnectionUtil;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

public class ThankYouLetterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/policy issuance/thank you letter/thankYouLetter.jsp";
		String page2 = "/ThankYouLetterController?action=toThankYouPage";
		String redirectPage = "/pages/policy issuance/thank you letter/infoDiv.jsp";
		String reportName = request.getParameter("reportName");
		String tranCd = "95";
		
		if (action.equals("toThankYouPage")) {
			SignatoryService signatoryService = new SignatoryServiceImpl();
			BranchService branchService = new BranchServiceImpl();
			try {
				List<Branch> branchList = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
				List<Signatory> signatoryList = (List<Signatory>) signatoryService.getAllActiveSignatory();
				request.setAttribute("signatoryList", signatoryList);
				request.setAttribute("branchList", branchList);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("pageTitle", "Thank You Letter");

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		if (action.equals("checkPolicyId")) {
			PolicyNoService policyNoService = new PolicyNoServiceImpl();
			AssuredService assuredService = new AssuredServiceImpl();
			Integer policyId = 0;
			String assuredName = "";
			try {
				policyId = policyNoService.getPolicyId(request);
				Integer assdNo = assuredService.fetchAssdNoGipiPolbasic(policyId);
				
				if (policyId.equals(0)) {
					errorMsg = "No data found.";
				} else{
					errorMsg = "";
					List<Assured> assured = assuredService.getAssured(assdNo);
					assuredName = assured.get(0).getAssdName();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				errorMsg = e.getMessage();
			} finally {
				System.out.println(errorMsg);
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("policyId", policyId);
				request.setAttribute("assuredName", assuredName);

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectPage);
				dispatcher.forward(request, response);
			}
		}

		if (action.equals("printThankYouLetter")) {
			//params
			String str = request.getParameter("policyId");
			Integer policyId = null;
			System.out.println(str);
			if(!str.equals("")){
				policyId = Integer.parseInt(request.getParameter("policyId"));
			}
			
			String branchCd = request.getParameter("branchCd");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String signatory = request.getParameter("signatory");
			String designation = request.getParameter("designation");
			String userId = request.getParameter("userId");

			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_POLICY_ID", policyId);
			parameters.put("P_CRED_BRANCH", branchCd);
			parameters.put("P_FROM_DATE", fromDate);
			parameters.put("P_TO_DATE", toDate);
			parameters.put("P_SIGNATORY", signatory);
			parameters.put("P_DESIGNATION", designation);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_TRAN_CD",tranCd);

			try {
				Connection conn = ConnectionUtil.getConnection();
				JasperPrint print = JasperFillManager.fillReport(fileName, parameters, conn);
				JRPdfExporter exporter = new JRPdfExporter();
				ByteArrayOutputStream out = new ByteArrayOutputStream();
				exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
				exporter.setExporterInput(new SimpleExporterInput(print));
				exporter.exportReport();
				JasperExportManager.exportReportToPdfFile(print, outputPdf);
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
				request.setAttribute("reportTitle", reportName);

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/policy issuance/thank you letter/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
