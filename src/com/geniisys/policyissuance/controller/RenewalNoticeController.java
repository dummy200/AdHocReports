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

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.geniisys.common.entity.Assured;
import com.geniisys.common.entity.Gipi_Polbasic;
import com.geniisys.common.entity.Item;
import com.geniisys.common.service.AssuredService;
import com.geniisys.common.service.ExtractIdService;
import com.geniisys.common.service.Gipi_PolbasicService;
import com.geniisys.common.service.ItemService;
import com.geniisys.common.service.PolicyNoService;
import com.geniisys.common.service.impl.AssuredServiceImpl;
import com.geniisys.common.service.impl.ExtractIdServiceImpl;
import com.geniisys.common.service.impl.Gipi_PolbasicServiceImpl;
import com.geniisys.common.service.impl.ItemServiceImpl;
import com.geniisys.common.service.impl.PolicyNoServiceImpl;
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

public class RenewalNoticeController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String renewalNoticePage = "/pages/policy issuance/renewal notice/renewalNotice.jsp";
		String redirectPage = request.getParameter("redirectPage");
		String tranCd = "95";
		String errorMsg = "";
		
		//menu redirect page
		if(action.equals("toMCRenewal")){
			setRequestPerPage("MC",request);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(renewalNoticePage);
    		dispatcher.forward(request,response);
		}
		if(action.equals("toFIRenewal")){
			setRequestPerPage("FI",request);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(renewalNoticePage);
    		dispatcher.forward(request,response);
		}
		if(action.equals("toENRenewal")){
			setRequestPerPage("EN",request);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(renewalNoticePage);
    		dispatcher.forward(request,response);
		}
		if(action.equals("toPARenewal")){
			setRequestPerPage("PA",request);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(renewalNoticePage);
    		dispatcher.forward(request,response);
		}
		if(action.equals("toOCRenewal")){
			setRequestPerPage("OC",request);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(renewalNoticePage);
    		dispatcher.forward(request,response);
		}
		
		if(action.equals("checkPolicyId")){
			
			//using service
			PolicyNoService policyNoService = new PolicyNoServiceImpl();
			ExtractIdService extractIdservice = new ExtractIdServiceImpl();
			AssuredService assuredService = new AssuredServiceImpl();
			ItemService itemService = new ItemServiceImpl();
			//Gipi_InvoiceService gipiInvoiceService = new Gipi_InvoiceServiceImpl();
			Gipi_PolbasicService gipiPolbasicService = new Gipi_PolbasicServiceImpl();
			//Gixx_PolbasicService gixxPolbasicService = new Gixx_PolbasicServiceImpl();
			
			String lineCd = request.getParameter("lineCd");
			List<Assured> assured = null;
			List<Item> item = null;
			//List<Assured> assuredGipiPolbasic = null;
			List<Gipi_Polbasic> Gipi_Polbasic= null;
			//List<Gipi_Invoice> gipi_Invoices = null;
			//String bond_dtl = null;
			//String fetchPolicyIdErrorMsg = "";
			Integer policyId = null;
			Integer resultPolicyId = null;
			try {
				//Integer extractId = null;
				policyId = (Integer)policyNoService.getPolicyIdRenew(request);
				if (policyId == null){
					errorMsg = "No data found.";
					request.setAttribute("errorMsg", errorMsg);
				}else{
					resultPolicyId = (Integer)policyNoService.getResultPolicyIdRenewal(policyId,tranCd,request);
					if (resultPolicyId == null){
						errorMsg = "User has no access.";
						request.setAttribute("errorMsg", errorMsg);
					}else
						request.setAttribute("policyId", resultPolicyId);
				}
				/*extractId = (Integer)extractIdservice.getExtractId(policyId);
				System.out.println("policyId: " + policyId);
				System.out.println("extractId: " + extractId);
				if (extractId == null){
					errorMsg = "No data found.";
				}else
					errorMsg = null;
					item = itemService.getItem(extractId,lineCd);
					System.out.println("item: " + item);
				if(policyId == null){
					errorMsg = "No data found.";
				}else
					errorMsg = null;*/
				
				/*Integer assdNo = assuredService.fetchAssuredNo(policyId);
				System.out.println("assd: " + assdNo);
				assured = assuredService.getAssured(assdNo);
				System.out.println("assured: " + assured);
				Integer assdNoGipiPolbasic = assuredService.fetchAssdNoGipiPolbasic(policyId);
				Gipi_Polbasic = gipiPolbasicService.fetchRefPolNo(policyId);*/
				//assuredGipiPolbasic = assuredService.getAssured(assdNoGipiPolbasic);
				//bond_dtl = gipiPolbasicService.getBondDtl(policyId);
				//gipi_Invoices = gipiInvoiceService.fetchGipiInvoice(policyId);
				
				//request.setAttribute("errorMsg", errorMsg);
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				errorMsg = e1.getMessage().toString();
			}finally{
				System.out.println(errorMsg);
				System.out.println(resultPolicyId);
				System.out.println(policyId);
				//request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("lineCd", lineCd);
				//request.setAttribute("policyId", policyId);
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectPage);
        		dispatcher.forward(request,response);
			}
		}
		
		
		//on click print button(individual)
		if(action.equals("printRenewalNotice")){
			DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
			JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
				    "net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");
			String pdfSw = request.getParameter("pdfSw");
			String lineCd = request.getParameter("lineCd");
			String page = request.getParameter("page");
			String sales = request.getParameter("sales");
			String contacts = request.getParameter("contacts");
			Integer polId = Integer.parseInt((request.getParameter("policyId")));
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			//String dir = getServletContext().getRealPath("WEB-INF/classes/com/geniisys/policyissuance/reports/");
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String reportName = request.getParameter("reportName");
			String fileName = dir  + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			
			//using service
			PolicyNoService policyNoService = new PolicyNoServiceImpl();
			ExtractIdService extractIdservice = new ExtractIdServiceImpl();
			try {
				Integer policyId = policyNoService.getPolicyId(request);
				Integer extractId = extractIdservice.getExtractId(policyId);
				request.setAttribute("errorMsg", errorMsg);
				parameters.put("P_EXTRACT_ID", extractId);
				//parameters.put("P_POLICY_ID", policyId);
				parameters.put("P_POLICY_ID", polId);
				parameters.put("P_CONTACT_DETAILS", contacts);
				parameters.put("P_CONTACT_PERSON", sales);
				parameters.put("P_PDF_SW", pdfSw);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				errorMsg = e1.getMessage().toString();
			}
				
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
				//e.printStackTrace();
				System.out.println("jre exception: " + e.getMessage().toString());
				/*errorMsg = "jre exception: " + e.getMessage().toString();*/
				errorMsg = "jre exception: " + e.getCause().toString();
			} catch (SQLException e) {
				//e.printStackTrace();
				System.out.println("sql exception: " + e.getMessage().toString());
				errorMsg = "sql exception: " + e.getMessage().toString();
			} finally {
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("reportUrl", outputPdf);
				request.setAttribute("reportTitle", reportName);
				
				
				setRequestPerPage(page,request);
				
				//redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/policy issuance/renewal notice/hiddenDiv.jsp");
            	dispatcher.forward(request,response);
			}
		}
		
		if(action.equals("printBatch")){
			errorMsg = "";
			DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
			JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
				    "net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");
			String pdfSw = request.getParameter("pdfSw");
			String lineCd = request.getParameter("lineCd");
			String page = request.getParameter("page");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String sublineCd = request.getParameter("sublineCd");
			String issCd = request.getParameter("issCd");
			String userId = request.getParameter("userId");	
			String sales = request.getParameter("sales");
			String contacts = request.getParameter("contacts");
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String reportName = "RENEW_NIA_BATCH"; /*request.getParameter("reportName");*/
			String fileName = dir  + "/" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			
			/*//using service
			PolicyNoService policyNoService = new PolicyNoServiceImpl();
			ExtractIdService extractIdservice = new ExtractIdServiceImpl();
			try {
				Integer policyId = policyNoService.getPolicyId(request);
				Integer extractId = extractIdservice.getExtractId(policyId);
				request.setAttribute("errorMsg", errorMsg);
				parameters.put("P_EXTRACT_ID", extractId);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				errorMsg = e1.getMessage().toString();
			}*/
			
			parameters.put("P_LINE_CD", lineCd);
			parameters.put("P_SUBLINE_CD", sublineCd);
			parameters.put("P_ISS_CD", issCd);
			parameters.put("P_TO_DATE", toDate);
			parameters.put("P_FROM_DATE", fromDate);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_CONTACT_DETAILS", contacts);
			parameters.put("P_CONTACT_PERSON", sales);
			parameters.put("P_PDF_SW", pdfSw);
			parameters.put("P_TRAN_CD",tranCd);
			
			System.out.println(lineCd);
			System.out.println(sublineCd);
			System.out.println(issCd);
			System.out.println(fromDate);
			System.out.println(toDate);
			System.out.println(userId);
			System.out.println(contacts);
			System.out.println(sales);
			System.out.println(pdfSw);
			System.out.println(fileName);
			
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
				//check if file exists, else set errorMsg
				File sourceReport = new File(fileName);
				if(!sourceReport.exists() && sourceReport.isDirectory()) { 
				    errorMsg = "Report not found in reports directory.";
				}
				File outputFile = new File(outputPdf);
				if(!outputFile.exists() && outputFile.isDirectory()) { 
				    errorMsg = "Output not found in generated reports directory.";
				}
				
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("reportUrl", outputPdf);
				request.setAttribute("reportTitle", reportName);
				
				setRequestPerPage(page,request);
	
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/policy issuance/renewal notice/hiddenDiv.jsp");
            	dispatcher.forward(request,response);
			}
		}
	}
	
	
	//sets request per line.. can add redirect page too?
	public void setRequestPerPage(String lineCd,HttpServletRequest request){
		request.setAttribute("reportName", "RENEW_NIA");
		request.setAttribute("reportBatch", "RENEW_NIA_BATCH");
		
		if(lineCd.equals("MC")){
			request.setAttribute("page", "MC");
			request.setAttribute("lineCd", "MC");
			request.setAttribute("pageTitle", "Motor Car - Renewal Notice");
		}
		if(lineCd.equals("FI")){
			request.setAttribute("page", "FI");
			request.setAttribute("lineCd", "FI");
			request.setAttribute("pageTitle", "FI - Renewal Notice");
		}
		if(lineCd.equals("EN")){
			request.setAttribute("page", "EN");
			request.setAttribute("lineCd", "EN");
			request.setAttribute("pageTitle", "Engineering - Renewal Notice");
		}
		if(lineCd.equals("PA")){
			request.setAttribute("page", "PA");
			request.setAttribute("lineCd", "PA");
			request.setAttribute("pageTitle", "PA - Renewal Notice");
		}
		if(lineCd.equals("OC")){
			request.setAttribute("page", "OC");
			request.setAttribute("lineCd", "OC");
			request.setAttribute("pageTitle", "OC - Renewal Notice");
		}
	}
}
