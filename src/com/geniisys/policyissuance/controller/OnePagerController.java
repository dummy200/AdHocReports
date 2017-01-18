package com.geniisys.policyissuance.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.geniisys.common.entity.Assured;
import com.geniisys.common.entity.Gipi_Invoice;
import com.geniisys.common.entity.Gipi_Polbasic;
import com.geniisys.common.entity.Item;
import com.geniisys.common.service.AssuredService;
import com.geniisys.common.service.ExtractIdService;
import com.geniisys.common.service.Gipi_InvoiceService;
import com.geniisys.common.service.Gipi_PolbasicService;
import com.geniisys.common.service.ItemService;
import com.geniisys.common.service.PolicyNoService;
import com.geniisys.common.service.impl.AssuredServiceImpl;
import com.geniisys.common.service.impl.ExtractIdServiceImpl;
import com.geniisys.common.service.impl.Gipi_InvoiceServiceImpl;
import com.geniisys.common.service.impl.Gipi_PolbasicServiceImpl;
import com.geniisys.common.service.impl.ItemServiceImpl;
import com.geniisys.common.service.impl.PolicyNoServiceImpl;
import com.geniisys.policyissuance.service.OnePagerService;
import com.geniisys.policyissuance.service.impl.OnePagerServiceImpl;
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
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

public class OnePagerController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String onePagerPage = "/pages/policy issuance/one pager/onePager.jsp";
		String tranCd = "95";
		
		// menu redirect page
		if (action.equals("toMC")) {
			setRequestPerPage("MC", request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if (action.equals("to12PMC")) {
			setRequestPerPage("12pMC", request);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if (action.equals("toPSFI")) {
			setRequestPerPage("psFI", request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if (action.equals("toCLGFI")) {
			setRequestPerPage("clgFI", request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if (action.equals("to12PFI")) {
			setRequestPerPage("12pFI", request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if (action.equals("toREGFI")) {
			setRequestPerPage("regFI", request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if (action.equals("toOC")) {
			setRequestPerPage("OC", request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if (action.equals("toOtherOC")) {
			setRequestPerPage("otherOC", request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if (action.equals("to3yOC")) {
			setRequestPerPage("3yOC", request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if (action.equals("to12pPA")) {
			setRequestPerPage("12pPA", request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		
		if(action.equals("toClgOnePager")){
			setRequestPerPage("ClgOnePager", request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if(action.equals("toPSBankOnePager")){
			setRequestPerPage("PsBankOnePager", request);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}
		if(action.equals("to12PlanOnePager")){
			request.setAttribute("tag", "Y");
			setRequestPerPage("12PlanOnePager", request);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(onePagerPage);
			dispatcher.forward(request, response);
		}

		// output
		if (action.equals("checkPolicyId")) {
			String redirectPage = request.getParameter("redirectPage");
			String moduleId = request.getParameter("moduleId");
			String page = request.getParameter("page");
			// using service
			PolicyNoService policyNoService = new PolicyNoServiceImpl();
			ExtractIdService extractIdservice = new ExtractIdServiceImpl();
			AssuredService assuredService = new AssuredServiceImpl();
			ItemService itemService = new ItemServiceImpl();
			Gipi_InvoiceService gipiInvoiceService = new Gipi_InvoiceServiceImpl();
			Gipi_PolbasicService gipiPolbasicService = new Gipi_PolbasicServiceImpl();

			String lineCd = request.getParameter("lineCd");
			List<Assured> assured = null;
			List<Item> item = null;
			List<Assured> assuredGipiPolbasic = null;
			List<Gipi_Polbasic> Gipi_Polbasic = null;
			List<Gipi_Invoice> gipi_Invoices = null;
			String bond_dtl = null;
			String fetchPolicyIdErrorMsg = "";
			Integer policyId = null;
			try {

				if(page.equals("12PlanOnePager")){
					policyId = (Integer) gipiPolbasicService.fetchTpPolicyId(request);
				}else if(page.equals("ClgOnePager") && lineCd.equals("FI")){
					policyId = (Integer) gipiPolbasicService.fetchClgPolicyId(request);
				}else{
					policyId = (Integer) gipiPolbasicService.fetchPolicyId(request);
				}
				item = itemService.getGipiItem(policyId, lineCd);

				Integer assdNo = assuredService.fetchAssuredNo(policyId);
				assured = assuredService.getAssured(assdNo);

				Integer assdNoGipiPolbasic = assuredService.fetchAssdNoGipiPolbasic(policyId);
				Gipi_Polbasic = gipiPolbasicService.fetchRefPolNo(policyId);
				assuredGipiPolbasic = assuredService.getAssured(assdNoGipiPolbasic);
				bond_dtl = gipiPolbasicService.getBondDtl(policyId);
				gipi_Invoices = gipiInvoiceService.fetchGipiInvoice(policyId);

				request.setAttribute("errorMsg", errorMsg);
				if (policyId == null) {
					fetchPolicyIdErrorMsg = "No data found.";
				} else
					fetchPolicyIdErrorMsg = null;
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				errorMsg = e1.getMessage().toString();
			} finally {
				System.out.println(errorMsg);
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("assured", assured);
				request.setAttribute("lineCd", lineCd);
				request.setAttribute("item", item);
				request.setAttribute("policyId", policyId);

				request.setAttribute("fetchPolicyIdErrorMsg", fetchPolicyIdErrorMsg);
				request.setAttribute("Gipi_Polbasic", Gipi_Polbasic);
				request.setAttribute("bond_dtl", bond_dtl);
				request.setAttribute("gipi_Invoices", gipi_Invoices);
				request.setAttribute("assuredGipiPolbasic", assuredGipiPolbasic);

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectPage);
				dispatcher.forward(request, response);
			}
		}

		// on click print button(individual)
		if (action.equals("printOnePager")) {
			String lineCd = request.getParameter("lineCd");
			String page = request.getParameter("page");
			String userId = request.getParameter("userId");
			String OCReportType = request.getParameter("OCReportType");
			String reportName = request.getParameter("reportName");
			String issuePlace = request.getParameter("issuePlace");
			Integer polId = Integer.parseInt(request.getParameter("policyId").trim());
			String pdfSw = request.getParameter("pdfSw");
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			// using service
			PolicyNoService policyNoService = new PolicyNoServiceImpl();
			ExtractIdService extractIdservice = new ExtractIdServiceImpl();
			Gipi_PolbasicService gipiPolbasicService = new Gipi_PolbasicServiceImpl();
			OnePagerService onePagerService = new OnePagerServiceImpl();
			try {
				Integer policyId = gipiPolbasicService.fetchPolicyId(request);
				System.out.println(policyId);
				request.setAttribute("errorMsg", errorMsg);
				// parameters.put("P_POLICY_ID", policyId);
				parameters.put("P_POLICY_ID", polId);
				parameters.put("P_USER", userId);
				//parameters.put("P_USER_ID", userId);
				parameters.put("P_PLACE", issuePlace);
				parameters.put("P_PDF_SW", pdfSw);
				//parameters.put("P_TRAN_CD", tranCd);
				
				if (page.equalsIgnoreCase("OC")) {
					Integer yearDiff = onePagerService.getYearDiff(policyId);
					reportName = "POLICY_DOCUMENT_OTHER_OC_ONEPAGER";
					if (OCReportType.equalsIgnoreCase("DEFAULT")) {
						if (yearDiff == 1) {
							reportName = "POLICY_DOCUMENT_OC_ONEPAGER";
						} else if (yearDiff == 3) {
							reportName = "POLICY_DOCUMENT_3Y_OC_ONEPAGER";
						}
					}
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				errorMsg = e1.getMessage().toString();
			}

			// String dir =
			// getServletContext().getRealPath("WEB-INF/classes/com/geniisys/policyissuance/reports/");
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");

			String fileName = dir + "/" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			System.out.println(fileName);
			System.out.println(outputPdf);
			try {
				DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
					    "net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");
				
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
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("reportUrl", outputPdf);
				request.setAttribute("reportTitle", reportName);

				setRequestPerPage(page, request);

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/policy issuance/one pager/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}

		if (action.equals("printBatch")) {
			String lineCd = request.getParameter("lineCd");
			String page = request.getParameter("page");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String sublineCd = request.getParameter("sublineCd");
			String issCd = request.getParameter("issCd");
			String dateType = request.getParameter("dateType");
			String issuePlace = request.getParameter("issuePlace");
			String issueCd = request.getParameter("issueCd");
			String pdfSw = request.getParameter("pdfSw");
			
			String userId = request.getParameter("userId");
			String batchUserId = request.getParameter("batchUserId");
			
			System.out.println("Issue code: " + issueCd);

			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String reportName = request.getParameter("reportName");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_LINE_CD", lineCd);
			parameters.put("P_SUBLINE_CD", sublineCd);
			parameters.put("P_ISS_CD", issCd);
			parameters.put("P_CRED_BRANCH", issueCd);
			parameters.put("P_TO_DATE", toDate);
			parameters.put("P_FROM_DATE", fromDate);
			parameters.put("P_ADHOC_USER", userId);
			parameters.put("P_USER", batchUserId);
			//parameters.put("P_USER_ID", userId);
			parameters.put("P_DATE_TYPE", dateType);
			parameters.put("P_PLACE", issuePlace);
			parameters.put("P_PDF_SW", pdfSw);
			parameters.put("P_TRAN_CD", tranCd);
			
			try {
				DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
					    "net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");
				
				Connection conn = ConnectionUtil.getConnection();
				JasperPrint print = JasperFillManager.fillReport(fileName, parameters, conn);
				JRPdfExporter exporter = new JRPdfExporter();
				ByteArrayOutputStream out = new ByteArrayOutputStream();
				exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
				exporter.setExporterInput(new SimpleExporterInput(print));
				exporter.exportReport();
				JasperExportManager.exportReportToPdfFile(print, outputPdf);
				// JasperExportManager.exportReportToPdfFile(print, outputPdf2);
				// JasperViewer.viewReport(print, false);
			} catch (JRException e) {
				// e.printStackTrace();
				System.out.println("jre exception: " + e.getMessage().toString());
				errorMsg = "jre exception: " + e.getMessage().toString();
			} catch (SQLException e) {
				// e.printStackTrace();
				System.out.println("sql exception: " + e.getMessage().toString());
				errorMsg = "sql exception: " + e.getMessage().toString();
			} finally {
				// check if file exists, else set errorMsg
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

				setRequestPerPage(page, request);

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/policy issuance/one pager/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	// sets request per line.. can add redirect page too?
	public void setRequestPerPage(String lineCd, HttpServletRequest request) {
		if (lineCd.equals("MC")) {
			request.setAttribute("page", "MC");
			request.setAttribute("lineCd", "MC");
			request.setAttribute("pageTitle", "Motor Car Policy One Pager");
			request.setAttribute("reportName", "POLICY_DOCUMENT_MTR_ONEPAGER");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_MTR_ONEPAGER_BATCH");
		}
		if (lineCd.equals("12pMC")) {
			request.setAttribute("page", "12pMC");
			request.setAttribute("lineCd", "MC");
			request.setAttribute("pageTitle", "12P Motor Car Policy One Pager");
			// request.setAttribute("reportName",
			// "POLICY_DOCUMENT_12PMTR_ONEPAGER");
			request.setAttribute("reportName", "POLICY_DOCUMENT_12PMTR");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_12PMTR_ONEPAGER_BATCH");
		}
		if (lineCd.equals("psFI")) {
			request.setAttribute("page", "psFI");
			request.setAttribute("lineCd", "FI");
			request.setAttribute("pageTitle", "PS Fire Policy One Pager");
			request.setAttribute("reportName", "POLICY_DOCUMENT_PS_FI_ONEPAGER");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_PS_FI_ONEPAGER_BATCH");
		}
		if (lineCd.equals("12pFI")) {
			request.setAttribute("page", "12pFI");
			request.setAttribute("lineCd", "FI");
			request.setAttribute("pageTitle", "12P Fire Policy One Pager");
			request.setAttribute("reportName", "POLICY_DOCUMENT_REG_TP_ONEPAGER");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_REG_TP_ONEPAGER_BATCH");
		}
		if (lineCd.equals("clgFI")) {
			request.setAttribute("page", "clgFI");
			request.setAttribute("lineCd", "FI");
			request.setAttribute("pageTitle", "CLG Fire Policy One Pager");
			request.setAttribute("reportName", "POLICY_DOCUMENT_REG_CLG_ONEPAGER");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_REG_CLG_ONEPAGER_BATCH");
		}
		if (lineCd.equals("regFI")) {
			request.setAttribute("page", "regFI");
			request.setAttribute("lineCd", "FI");
			request.setAttribute("pageTitle", "REG Fire Policy One Pager");
			request.setAttribute("reportName", "POLICY_DOCUMENT_REG_FI_ONEPAGER");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_REG_FI_ONEPAGER_BATCH");
		}
		if (lineCd.equals("OC")) {
			request.setAttribute("page", "OC");
			request.setAttribute("lineCd", "OC");
			request.setAttribute("pageTitle", "Other Casualty Policy One Pager");
			request.setAttribute("reportName", "POLICY_DOCUMENT_OC_ONEPAGER");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_OC_ONEPAGER_BATCH");
		}
		if (lineCd.equals("otherOC")) {
			request.setAttribute("page", "otherOC");
			request.setAttribute("lineCd", "OC");
			request.setAttribute("pageTitle", "Other Casualty Policy One Pager");
			request.setAttribute("reportName", "POLICY_DOCUMENT_OTHER_OC_ONEPAGER");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_OTHER_OC_ONEPAGER_BATCH");
		}
		if (lineCd.equals("3yOC")) {
			request.setAttribute("page", "3yOC");
			request.setAttribute("lineCd", "OC");
			request.setAttribute("pageTitle", "3Y Other Casualty Policy One Pager");
			request.setAttribute("reportName", "POLICY_DOCUMENT_3Y_OC_ONEPAGER");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_3Y_OC_ONEPAGER_BATCH");
		}
		if (lineCd.equals("12pPA")) {
			request.setAttribute("page", "12pPA");
			request.setAttribute("lineCd", "PA");
			request.setAttribute("pageTitle", "12P Personal Accident Policy One Pager");
			request.setAttribute("reportName", "POLICY_DOCUMENT_PA_TP_ONEPAGER");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_PA_TP_ONEPAGER_BATCH");
		}
		if (lineCd.equals("ClgOnePager")){
			List<String> lineCdArray = new ArrayList<>();
			lineCdArray.add("FI");
			lineCdArray.add("MC");
			
			request.setAttribute("lineCdArray",lineCdArray);
			request.setAttribute("page", "ClgOnePager");
			request.setAttribute("pageTitle", "CLG One Pager");
		}
		if (lineCd.equals("PsBankOnePager")){
			List<String> lineCdArray = new ArrayList<>();
			lineCdArray.add("FI");
			lineCdArray.add("MC");
			
			request.setAttribute("lineCdArray",lineCdArray);
			request.setAttribute("page", "PsBankOnePager");
			request.setAttribute("pageTitle", "PS BANK One Pager");
		}
		if (lineCd.equals("12PlanOnePager")){
			List<String> lineCdArray = new ArrayList<>();
			lineCdArray.add("FI");
			lineCdArray.add("MC");
			lineCdArray.add("PA");
			
			request.setAttribute("lineCdArray",lineCdArray);
			request.setAttribute("page", "12PlanOnePager");
			request.setAttribute("pageTitle", "12 Plan One Pager");
		}
	}
}
