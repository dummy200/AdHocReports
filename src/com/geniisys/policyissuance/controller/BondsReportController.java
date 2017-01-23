package com.geniisys.policyissuance.controller;

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

import com.geniisys.common.entity.Assured;
import com.geniisys.common.entity.CoSignatory;
import com.geniisys.common.entity.Gipi_Invoice;
import com.geniisys.common.entity.Gipi_Polbasic;
import com.geniisys.common.entity.Item;
import com.geniisys.common.entity.Signatory;
import com.geniisys.common.service.AssuredService;
import com.geniisys.common.service.CoSignatoryService;
import com.geniisys.common.service.Gipi_InvoiceService;
import com.geniisys.common.service.Gipi_PolbasicService;
import com.geniisys.common.service.PolicyNoService;
import com.geniisys.common.service.SignatoryService;
import com.geniisys.common.service.impl.AssuredServiceImpl;
import com.geniisys.common.service.impl.CoSignatoryServiceImpl;
import com.geniisys.common.service.impl.Gipi_InvoiceServiceImpl;
import com.geniisys.common.service.impl.Gipi_PolbasicServiceImpl;
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

public class BondsReportController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String redirectPage = request.getParameter("redirectPage");
		String page = "/pages/policy issuance/Surety Other Bond Documents/OtherBondDoc.jsp";
		String back = "/BondsReportController?action=toSOtherBondDoc";
		String fetchPolicyIdErrorMsg = "";
		String errorMsg = "";
		//String redirectPage = "/pages/policy issuance/Surety Other Bond Documents/infoOtherBondDoc.jsp";
		
		if (action.equals("toSOtherBondDoc")) {
			SignatoryService signatoryService = new SignatoryServiceImpl();
			CoSignatoryService CosignatoryService = new CoSignatoryServiceImpl();
			try {
				List<Signatory> signatoryList = (List<Signatory>) signatoryService.getAllActiveSignatory();
				request.setAttribute("signatoryList", signatoryList);
				
				List<CoSignatory> CosignatoryList = (List<CoSignatory>) CosignatoryService.getCoAllActiveSignatory();
				request.setAttribute("CosignatoryList", CosignatoryList);
				
				System.out.println(CosignatoryList.get(0).getPrinId());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
		//on click print button(individual)
		if(action.equals("printBondsReport")){
			AssuredService assuredService = new AssuredServiceImpl();
			Gipi_InvoiceService gipiInvoiceService = new Gipi_InvoiceServiceImpl();
			Gipi_PolbasicService gipiPolbasicService = new Gipi_PolbasicServiceImpl();
			
			List<Assured> assured = null;
			List<Item> item = null;
			List<Assured> assuredGipiPolbasic = null;
			List<Gipi_Polbasic> Gipi_Polbasic= null;
			List<Gipi_Invoice> gipi_Invoices = null;
			String bond_dtl = null;
			
			String rdButton = request.getParameter("rdButton");
			String prinId = request.getParameter("prinId");
			
			
			String lineCd = request.getParameter("lineCd");
			String sublineCd = request.getParameter("sublineCd");
			String issCd = request.getParameter("issCd");
			String issueYY = request.getParameter("issueYY");
			String polSeqNo = request.getParameter("polSeqNo");
			String renewNo = request.getParameter("renewNo");
			
			String trial = request.getParameter("trial");
			String withNess = request.getParameter("withNess");
			String designation = request.getParameter("designation");
			
			
			String notedBySign = request.getParameter("notedBySign");
			String notedByDesig = request.getParameter("notedByDesig");
			String sign = request.getParameter("sign");
			String desig = request.getParameter("desig");
			String resign = request.getParameter("resign");
			String redesig = request.getParameter("redesig");
			String Cosign = request.getParameter("Cosign");
			String Codesig = request.getParameter("Codesig");
			
			String doc1 = request.getParameter("doc1");
			String doc2 = request.getParameter("doc2");
			String page1 = request.getParameter("page1");
			String page2 = request.getParameter("page2");
			String book1 = request.getParameter("book1");
			String book2 = request.getParameter("book2");
			String series = request.getParameter("series");
			
			/*Configure paths*/
			sqlMap = MyAppSqlConfig.getSqlMapInstance();

			
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String reportName = null;
			
			errorMsg = null;
			
			if (rdButton.equals("rdOther"))
			{
					if (sublineCd.equals("JCL16")){
						reportName = "REP_WRITPOSS_BOND";
					}else if (sublineCd.equals("OWR")){
						reportName = "REP_WARRANTY_BOND";
					}else if (sublineCd.equals("G16")){
						reportName = "REP_SURETY_BOND";
					}else if (sublineCd.equals("JCL13")){
						reportName = "REP_REPLEVIN_BOND";
					}else if (sublineCd.equals("G13")){
						reportName = "REP_PERFORMANCE_BOND";
					}else if (sublineCd.equals("OIM")){
						reportName = "REP_INDEMNITY";
					}else if (sublineCd.equals("G28")){
						reportName = "REP_HEIRSBOND";
					}else if (sublineCd.equals("JCL6")){
						reportName = "REP_HEIRSBONDJCL6";
					}else if (sublineCd.equals("G02")){
						reportName = "REP_BIDDERS";
					}else{
						//do nothing
					}
		    }
			    	
			if (rdButton.equals("rdAck1")){
			    reportName = "REP_ACK_ONE";
			}else if (rdButton.equals("rdAck2")){
				reportName = "REP_RENEWAL_CERT";
			}else if (rdButton.equals("rdIndm")){
				reportName = "REP_INDEMNITY_CERT_ONE";
			}else if (rdButton.equals("rdRep1")){
				reportName = "REP_CERTIFICATE_REPLEVIN";
			}else if (rdButton.equals("rdRep2")){
				reportName = "REP_ENDT_REPLEVIN";
			}else if (rdButton.equals("rdRep3")){
				reportName = "REP_AFF_WAIVER";
			}else if (rdButton.equals("rdRep5")){
				reportName = "REP_AUT_REPLEVIN";
			}else if (rdButton.equals("rdCert")){
				reportName = "REP_MAIN_CERT"; //WALA DAW TO
			}else if (rdButton.equals("rdRep4")){
				reportName = "REP_JUSTIFICATION";
			}


			
			String fileName = dir  + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			
			/*fetch data from database using service*/
			PolicyNoService policyNoService = new PolicyNoServiceImpl();
			try {
				Integer policyId = policyNoService.getPolicyId(request);
				request.setAttribute("errorMsg", errorMsg);
				parameters.put("P_POLICY_ID", policyId);
				parameters.put("P_WITNESS", withNess);
				parameters.put("P_WITDES", designation);
				
				parameters.put("P_SIGNATORY", notedBySign);
				parameters.put("P_SIGNATORY2", sign);
				parameters.put("P_DESIGNATION", desig);
				
				parameters.put("P_COSIGN", Cosign);
				parameters.put("P_CODES", Codesig);
				
				parameters.put("P_REP_SIGNATORY", resign);
				parameters.put("P_REP_DESIGNATION", redesig);
				
				parameters.put("P_TRIAL", trial);
				parameters.put("P_TRIAL_ID", prinId);
				
				
				parameters.put("P_DOC1", doc1);
				parameters.put("P_DOC2", doc2);
				parameters.put("P_PAGE1", page1);
				parameters.put("P_PAGE2", page2);
				parameters.put("P_BOOK1", book1);
				parameters.put("P_BOOK2", book2);
				parameters.put("P_SERIES1", series);
				
				parameters.put("P_LINE_CD", lineCd);
				parameters.put("P_SUBLINE_CD", sublineCd);
				parameters.put("P_ISS_CD", issCd);
				parameters.put("P_ISSUE_YY", issueYY);
				parameters.put("P_POL_SEQ_NO", polSeqNo);
				parameters.put("P_RENEW_NO", renewNo);
				
				
				
				
				System.out.println("policy "+policyId+resign+notedByDesig);
				System.out.println(fileName);

				Integer assdNo = assuredService.fetchAssuredNo(policyId);
				assured = assuredService.getAssured(assdNo);
				
				Integer assdNoGipiPolbasic = assuredService.fetchAssdNoGipiPolbasic(policyId);
				Gipi_Polbasic = gipiPolbasicService.fetchRefPolNo(policyId);
				assuredGipiPolbasic = assuredService.getAssured(assdNoGipiPolbasic);
				bond_dtl = gipiPolbasicService.getBondDtl(policyId);
				gipi_Invoices = gipiInvoiceService.fetchGipiInvoice(policyId);
				
				request.setAttribute("errorMsg", errorMsg);
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				errorMsg = e1.getMessage().toString();
			}
			
			/*then transfer it into jasper parameters*/
			try {
				Connection conn = ConnectionUtil.getConnection();
				JasperPrint print = JasperFillManager.fillReport(fileName, parameters, conn);
				JRPdfExporter exporter = new JRPdfExporter();
				java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
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
				request.setAttribute("assured", assured);
				request.setAttribute("lineCd", lineCd);
				request.setAttribute("item", item);
				request.setAttribute("fetchPolicyIdErrorMsg", fetchPolicyIdErrorMsg);
				request.setAttribute("Gipi_Polbasic", Gipi_Polbasic);
				request.setAttribute("bond_dtl", bond_dtl);
				request.setAttribute("gipi_Invoices", gipi_Invoices);
				request.setAttribute("assuredGipiPolbasic", assuredGipiPolbasic);

				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("reportUrl", outputPdf);
				request.setAttribute("reportTitle", reportName);
				
				//redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(back/*redirectPage*/);
            	dispatcher.forward(request,response);
			}
		}
	}
}
