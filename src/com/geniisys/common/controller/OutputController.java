package com.geniisys.common.controller;

import java.awt.Desktop;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.geniisys.common.entity.Assured;
import com.geniisys.common.entity.Gipi_Invoice;
import com.geniisys.common.entity.Gipi_Polbasic;
import com.geniisys.common.entity.Item;
import com.geniisys.common.service.AssuredService;
import com.geniisys.common.service.ExtractIdService;
import com.geniisys.common.service.Gipi_InvoiceService;
import com.geniisys.common.service.Gipi_PolbasicService;
import com.geniisys.common.service.Gixx_PolbasicService;
import com.geniisys.common.service.ItemService;
import com.geniisys.common.service.PolicyNoService;
import com.geniisys.common.service.impl.AssuredServiceImpl;
import com.geniisys.common.service.impl.ExtractIdServiceImpl;
import com.geniisys.common.service.impl.Gipi_InvoiceServiceImpl;
import com.geniisys.common.service.impl.Gipi_PolbasicServiceImpl;
import com.geniisys.common.service.impl.Gixx_PolbasicServiceImpl;
import com.geniisys.common.service.impl.ItemServiceImpl;
import com.geniisys.common.service.impl.PolicyNoServiceImpl;
import com.ibatis.sqlmap.client.SqlMapClient;

public class OutputController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";
	
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String redirectPage = request.getParameter("redirectPage");
		String moduleId = request.getParameter("moduleId");
		HttpSession session = request.getSession();
		String errorMsg = "";
		
		if(action.equals("checkPolicyId")){
			
			//using service
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
			List<Gipi_Polbasic> Gipi_Polbasic= null;
			List<Gipi_Invoice> gipi_Invoices = null;
			String bond_dtl = null;
			String fetchPolicyIdErrorMsg = "";
			
			try {
				Integer policyId = null;
				Integer extractId = null;
				if(moduleId.equals("onePager")){
					policyId = (Integer)gipiPolbasicService.fetchPolicyId(request);
					item = itemService.getGipiItem(policyId, lineCd);
					
				}else
					policyId = (Integer)policyNoService.getPolicyId(request);
				if(moduleId.equals("renewalNotice")){
					extractId = (Integer)extractIdservice.getExtractId(policyId);
					if (extractId == null){
						errorMsg = "No data found.";
					}else
						errorMsg = null;
						item = itemService.getItem(extractId,lineCd);
				}
				if(policyId == null){
					fetchPolicyIdErrorMsg = "No data found.";
				}else
					fetchPolicyIdErrorMsg = null;
				Integer assdNo = assuredService.fetchAssuredNo(policyId);
				assured = assuredService.getAssured(assdNo);
				Integer assdNoGipiPolbasic = assuredService.fetchAssdNoGipiPolbasic(policyId);
				Gipi_Polbasic = gipiPolbasicService.fetchRefPolNo(policyId);
				assuredGipiPolbasic = assuredService.getAssured(assdNoGipiPolbasic);
				bond_dtl = gipiPolbasicService.getBondDtl(policyId);
				gipi_Invoices = gipiInvoiceService.fetchGipiInvoice(policyId);
				
				//request.setAttribute("errorMsg", errorMsg);
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				errorMsg = e1.getMessage().toString();
			}finally{
				System.out.println(errorMsg);
				
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("assured", assured);
				request.setAttribute("lineCd", lineCd);
				request.setAttribute("item", item);
				
				request.setAttribute("fetchPolicyIdErrorMsg", fetchPolicyIdErrorMsg);
				request.setAttribute("Gipi_Polbasic", Gipi_Polbasic);
				request.setAttribute("bond_dtl", bond_dtl);
				request.setAttribute("gipi_Invoices", gipi_Invoices);
				request.setAttribute("assuredGipiPolbasic", assuredGipiPolbasic);
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectPage);
        		dispatcher.forward(request,response);
			}
		}
		
		if(action.equals("checkPolicyIdBonds")){
			//using service
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
			List<Gipi_Polbasic> Gipi_Polbasic= null;
			List<Gipi_Invoice> gipi_Invoices = null;
			String bond_dtl = null;
			String fetchPolicyIdErrorMsg = "";
			
			try {
				Integer policyId = (Integer)policyNoService.getPolicyId(request);
				Integer extractId = (Integer)extractIdservice.getExtractId(policyId);
				Integer assdNo = assuredService.fetchAssuredNo(policyId);
				assured = assuredService.getAssured(assdNo);
				
				Integer assdNoGipiPolbasic = assuredService.fetchAssdNoGipiPolbasic(policyId);
				Gipi_Polbasic = gipiPolbasicService.fetchRefPolNo(policyId);
				assuredGipiPolbasic = assuredService.getAssured(assdNoGipiPolbasic);
				bond_dtl = gipiPolbasicService.getBondDtl(policyId);
				gipi_Invoices = gipiInvoiceService.fetchGipiInvoice(policyId);
				
				request.setAttribute("errorMsg", errorMsg);
				if (extractId == null){
					errorMsg = "No data found.";
				}else
					errorMsg = null;
					item = itemService.getItem(extractId,lineCd);
					
				if(policyId == null){
					fetchPolicyIdErrorMsg = "No data found.";
				}else
					fetchPolicyIdErrorMsg = null;
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				errorMsg = e1.getMessage().toString();
			}finally{
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("assured", assured);
				request.setAttribute("lineCd", lineCd);
				request.setAttribute("item", item);
				request.setAttribute("fetchPolicyIdErrorMsg", fetchPolicyIdErrorMsg);
				request.setAttribute("Gipi_Polbasic", Gipi_Polbasic);
				request.setAttribute("bond_dtl", bond_dtl);
				request.setAttribute("gipi_Invoices", gipi_Invoices);
				request.setAttribute("assuredGipiPolbasic", assuredGipiPolbasic);
				/*RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/policy issuance/mc renewal cover/infoDiv.jsp");*/
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/policy issuance/one pager/infoDiv.jsp");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectPage);
        		dispatcher.forward(request,response);
        		
			}
		}
		
		if (action.equals("showPdf")){
			String path = request.getParameter("reportUrl").toString();
			
			FileInputStream fis = null;
			FileOutputStream os = null;
			ServletOutputStream out = null;
			ByteArrayInputStream bais = null;
			byte[] pdfByte = null;

			System.out.println("Opening report " + path);

			try {
				fis = new FileInputStream(path);
				pdfByte = new byte[fis.available()];
				fis.read(pdfByte);
				File newFile = File.createTempFile("GENIISYSADHOC-REP", ".pdf");
				os = new FileOutputStream(newFile);
				//System.out.println("byte size:" + pdfByte.length);
				os.write(pdfByte);
				os.flush();
				out = response.getOutputStream();
				response.setContentType("application/pdf");
				response.addHeader("Content-Disposition",
						"inline; filename=" + path + ";");
				
				//System.out.println("PRODUCE HERE");
				bais = new ByteArrayInputStream(pdfByte);

				int i = 0;
				while ((i = bais.read()) != -1) {
					out.write(i);
				}
				out.flush();
			} catch (IOException e) {
				System.out.println("IOEXCEPTION: " + e.getMessage());
			} finally {
				if (fis != null) {
					fis.close();
				}
				if (os != null) {
					os.close();
				}
				if (out != null) {
					out.close();
				}
				if (bais != null) {
					bais.close();
				}
			}
			
		}
		
		if (action.equals("showExcel")){
			String path = request.getParameter("reportXls").toString();
			
			//to prompt to save or view excel....
			FileInputStream fis = null;
			FileOutputStream os = null;
			ServletOutputStream out = null;
			ByteArrayInputStream bais = null;
			byte[] pdfByte = null;

			System.out.println("Opening report " + path);

			try {
				fis = new FileInputStream(path);
				pdfByte = new byte[fis.available()];
				fis.read(pdfByte);
				File newFile = File.createTempFile("GENIISYSADHOC-REP", ".xls");
				os = new FileOutputStream(newFile);
				//System.out.println("byte size:" + pdfByte.length);
				os.write(pdfByte);
				os.flush();
				out = response.getOutputStream();
				response.setContentType("application/xls");
				response.addHeader("Content-Disposition",
						"attachment; filename=" + path + ";");
				//System.out.println("PRODUCE HERE");
				bais = new ByteArrayInputStream(pdfByte);

				int i = 0;
				while ((i = bais.read()) != -1) {
					out.write(i);
				}
				out.flush();
			} catch (IOException e) {
				System.out.println("IOEXCEPTION: " + e.getMessage());
			} finally {
				if (fis != null) {
					fis.close();
				}
				if (os != null) {
					os.close();
				}
				if (out != null) {
					out.close();
				}
				if (bais != null) {
					bais.close();
				}
				
				
			}
			
			//to directly open excel... (but opens empty new tab =.=)
			/*try {
			     Desktop.getDesktop().open(new File(path));
			} catch (IOException e) {e.printStackTrace();}*/
			
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

}
