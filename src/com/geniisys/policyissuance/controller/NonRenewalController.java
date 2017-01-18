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
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.geniisys.common.entity.Assured;
import com.geniisys.common.entity.Gipi_Invoice;
import com.geniisys.common.entity.Gipi_Polbasic;
import com.geniisys.common.entity.Item;
import com.geniisys.common.entity.Signatory;
import com.geniisys.common.service.AssuredService;
import com.geniisys.common.service.ExtractIdService;
import com.geniisys.common.service.Gipi_InvoiceService;
import com.geniisys.common.service.Gipi_PolbasicService;
import com.geniisys.common.service.Gixx_PolbasicService;
import com.geniisys.common.service.ItemService;
import com.geniisys.common.service.PolicyNoService;
import com.geniisys.common.service.SignatoryService;
import com.geniisys.common.service.impl.AssuredServiceImpl;
import com.geniisys.common.service.impl.ExtractIdServiceImpl;
import com.geniisys.common.service.impl.Gipi_InvoiceServiceImpl;
import com.geniisys.common.service.impl.Gipi_PolbasicServiceImpl;
import com.geniisys.common.service.impl.Gixx_PolbasicServiceImpl;
import com.geniisys.common.service.impl.ItemServiceImpl;
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

public class NonRenewalController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/policy issuance/non renewal/nonRenewal.jsp";
		String redirectPage = "/pages/policy issuance/non renewal/infoDiv.jsp";
		/*request.getParameter("redirectPage");*/
		
		if (action.equals("toNonRenewPage")) {
			SignatoryService signatoryService = new SignatoryServiceImpl();
			try {
				List<Signatory> signatoryList = (List<Signatory>) signatoryService.getAllActiveSignatory();
				request.setAttribute("signatoryList", signatoryList);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("pageTitle", "Non Renewal");
			request.setAttribute("reportName", "POLICY_DOCUMENT_MTR_ONEPAGER");
			request.setAttribute("reportBatch", "POLICY_DOCUMENT_MTR_ONEPAGER_BATCH");

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		if (action.equals("checkPolicyId")) {

			// using service
			PolicyNoService policyNoService = new PolicyNoServiceImpl();
			ExtractIdService extractIdservice = new ExtractIdServiceImpl();
			AssuredService assuredService = new AssuredServiceImpl();
			ItemService itemService = new ItemServiceImpl();
			Gipi_InvoiceService gipiInvoiceService = new Gipi_InvoiceServiceImpl();
			Gipi_PolbasicService gipiPolbasicService = new Gipi_PolbasicServiceImpl();
			Gixx_PolbasicService gixxPolbasicService = new Gixx_PolbasicServiceImpl();

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
				
				Integer extractId = null;
				policyId = (Integer) policyNoService.getPolicyIdNonRenew(request);
				extractId = (Integer) extractIdservice.getExtractId(policyId);
				System.out.println("policyId: " + policyId);
				System.out.println("extractId: " + extractId);
				if (extractId == null) {
					errorMsg = "No data found.";
				} else
					errorMsg = null;
				item = itemService.getItem(extractId, lineCd);
				System.out.println("item: " + item);
				if (policyId == null) {
					errorMsg = "No data found.";
				} else
					errorMsg = null;

				Integer assdNo = assuredService.fetchAssuredNo(policyId);
				System.out.println("assd: " + assdNo);
				assured = assuredService.getAssured(assdNo);
				System.out.println("assured: " + assured);
				Integer assdNoGipiPolbasic = assuredService.fetchAssdNoGipiPolbasic(policyId);
				Gipi_Polbasic = gipiPolbasicService.fetchRefPolNo(policyId);
				assuredGipiPolbasic = assuredService.getAssured(assdNoGipiPolbasic);
				bond_dtl = gipiPolbasicService.getBondDtl(policyId);
				gipi_Invoices = gipiInvoiceService.fetchGipiInvoice(policyId);

				// request.setAttribute("errorMsg", errorMsg);

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

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectPage);
				dispatcher.forward(request, response);
			}
		}

		// on click print button
		if (action.equals("printNonRenew")) {
			String lineCd = request.getParameter("lineCd");
			String reason1 = request.getParameter("reason1");
			String reason2 = request.getParameter("reason2");
			String reason3 = request.getParameter("reason3");
			String notedBySign = request.getParameter("notedBySign");
			String notedByDesig = request.getParameter("notedByDesig");
			String sign = request.getParameter("sign");
			String desig = request.getParameter("desig");
			String userId = (String) session.getAttribute("adhocUser");
			Integer polId = Integer.parseInt(request.getParameter("policyId"));
			
			//System.out.println(reason1);
			//System.out.println(reason2);
			//System.out.println(reason3);

			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String reportName = "NON_RENEW_PCI";/*request.getParameter("reportName");*/
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			// using service
			PolicyNoService policyNoService = new PolicyNoServiceImpl();
			ExtractIdService extractIdservice = new ExtractIdServiceImpl();
			try {
				Integer policyId = (Integer)policyNoService.getPolicyIdNonRenew(request);
				request.setAttribute("errorMsg", errorMsg);
				System.out.println(policyId);
				if(reason1.equals("on"))
					parameters.put("P_REASON1", reason1);
				if(reason2.equals("on"))
					parameters.put("P_REASON2", reason2);
				if(!reason3.equals(""))
					parameters.put("P_REASON3", reason3);
				
				//parameters.put("P_POLICY_ID", policyId);
				parameters.put("P_POLICY_ID", polId);
				//parameters.put("P_REASON1", reason1);
				//parameters.put("P_REASON2", reason2);
				//parameters.put("P_REASON3", reason3);
				parameters.put("P_NOTED_BY", notedBySign);
				parameters.put("P_NOTED_BY_DESIGNATION", notedByDesig);
				parameters.put("P_SIGNATORY", sign);
				parameters.put("P_DESIGNATION", desig);
				parameters.put("P_USER_ID", userId);
				
			} catch (SQLException e1) {
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
				System.out.println("jre exception: " + e.getMessage().toString());
				errorMsg = "jre exception: " + e.getMessage().toString();
			} catch (SQLException e) {
				System.out.println("sql exception: " + e.getMessage().toString());
				errorMsg = "sql exception: " + e.getMessage().toString();
			} finally {
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("reportUrl", outputPdf);
				request.setAttribute("reportTitle", reportName);
				request.setAttribute("pageTitle", "Non Renewal Notice");
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/policy issuance/non renewal/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
