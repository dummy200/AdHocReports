package com.geniisys.claims.controller;

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

import com.geniisys.claims.entity.ClaimNo;
import com.geniisys.claims.entity.OfferLetter;
import com.geniisys.claims.service.DemandLetterService;
import com.geniisys.claims.service.OfferLetterService;
import com.geniisys.claims.service.impl.DemandLetterServiceImpl;
import com.geniisys.claims.service.impl.OfferLetterServiceImpl;
import com.geniisys.common.entity.Signatory;
import com.geniisys.common.service.SignatoryService;
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

public class TransmittalController extends HttpServlet{
			
	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/claims/Transmittal/transmittal.jsp";
		String redirectPage = "/pages/claims/Transmittal/infoDiv.jsp";
		String reportName = "FCLTRNSMTL";
		String errorMsg = "";
		
		if (action.equals("toTransmittalPage")) {
			SignatoryService signatoryService = new SignatoryServiceImpl();
			try {
				List<Signatory> signatoryList = (List<Signatory>) signatoryService.getAllActiveSignatory();
				request.setAttribute("signatoryList", signatoryList);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("pageTitle", "Motor Car - Transmittal (Total Loss/Carnap)");
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
		if (action.equals("checkClaimNo")){
			DemandLetterService demandLetterService = new DemandLetterServiceImpl();
			OfferLetterService offerLetterService = new OfferLetterServiceImpl();
			List<OfferLetter> transmittal = null;
			ClaimNo claimNo = null;
			try {
				claimNo = (ClaimNo) demandLetterService.prepareClaimNo(request);
				transmittal = (List<OfferLetter>) offerLetterService.fetchOfferLetter(claimNo);
				Integer listSize = transmittal.size();
				if(listSize.equals(0)){
					errorMsg = "No data found.";
				}else
					errorMsg = "";
			} catch (SQLException e) {
				e.printStackTrace();
				errorMsg = e.getMessage();
			}finally{
				System.out.println(errorMsg);
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("transmittal", transmittal);
				request.setAttribute("claimNo", claimNo);
				request.setAttribute("lineCd", claimNo.getLineCd());
				request.setAttribute("sublineCd", claimNo.getSublineCd());
				request.setAttribute("issCd", claimNo.getIssCd());
				request.setAttribute("clmYy", claimNo.getClmYy());
				request.setAttribute("clmSeqNo", claimNo.getClmSeqNo());
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectPage);
        		dispatcher.forward(request,response);
			}
		}
		
		if(action.equals("printTransmittal")){
			//claimNo
			String lineCd = request.getParameter("lineCd");
			String sublineCd = request.getParameter("sublineCd");
			String issCd = request.getParameter("issCd");
			Integer clmYy = Integer.parseInt(request.getParameter("clmYy"));
			Integer clmSeqNo = Integer.parseInt(request.getParameter("clmSeqNo"));
			//checkBox
			String chkBox1 = request.getParameter("chkBox1");
			String chkBox2 = request.getParameter("chkBox2");
			String chkBox3 = request.getParameter("chkBox3");
			String chkBox4 = request.getParameter("chkBox4");
			String chkBox5 = request.getParameter("chkBox5");
			String chkBox6 = request.getParameter("chkBox6");
			String chkBoxFront = request.getParameter("chkBoxFront");
			String chkBoxBack = request.getParameter("chkBoxBack");
			String chkBox7 = request.getParameter("chkBox7");
			String chkBox8 = request.getParameter("chkBox8");
			String chkBox9 = request.getParameter("chkBox9");
			String chkBox10 = request.getParameter("chkBox10");
			String chkBox11 = request.getParameter("chkBox11");
			String chkBox12 = request.getParameter("chkBox12");
			String chkBox13 = request.getParameter("chkBox13");
			String chkBox14 = request.getParameter("chkBox14");
			String chkVoucher = request.getParameter("chkVoucher");
			String chkBox15 = request.getParameter("chkBox15");
			String chkBox15a = request.getParameter("chkBox15a");
			String chkBox15b = request.getParameter("chkBox15b");
			String chkBox16 = request.getParameter("chkBox16");
			String chkBox16a = request.getParameter("chkBox16a");
			String chkBox17 = request.getParameter("chkBox17");
			String chkBox18 = request.getParameter("chkBox18");
			String chkBox19 = request.getParameter("chkBox19");
			String txtOthers = request.getParameter("txtOthers");
			//sign
			String signatory = request.getParameter("signatory");
			String designation = request.getParameter("designation");
			
			String userId = request.getParameter("userId");
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir  + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			
			parameters.put("P_NC_TAG1", chkBox1);
			parameters.put("P_NC_TAG2", chkBox2);
			parameters.put("P_NC_TAG3", chkBox3);
			parameters.put("P_NC_TAG4", chkBox4);
			parameters.put("P_NC_TAG5", chkBox5);
			parameters.put("P_NC_TAG6", chkBox6);
			parameters.put("P_PLT_FRONT", chkBoxFront);
			parameters.put("P_PLT_BACK", chkBoxBack);
			parameters.put("P_NC_TAG7", chkBox7);
			parameters.put("P_NC_TAG8", chkBox8);
			parameters.put("P_NC_TAG9", chkBox9);
			parameters.put("P_NC_TAG10", chkBox10);
			parameters.put("P_NC_TAG11", chkBox11);
			parameters.put("P_NC_TAG12", chkBox12);
			parameters.put("P_NC_TAG13", chkBox13);
			parameters.put("P_NC_TAG14", chkBox14);
			parameters.put("P_CHECK_VOUCHER", chkVoucher);
			parameters.put("P_NC_TAG15", chkBox15);
			parameters.put("P_DS_FROM", chkBox15a);
			parameters.put("P_DS_TO", chkBox15b);
			parameters.put("P_NC_TAG16", chkBox16);
			parameters.put("P_OR_CR_DATE", chkBox16a);
			parameters.put("P_NC_TAG17", chkBox17);
			parameters.put("P_NC_TAG18", chkBox18);
			parameters.put("P_NC_TAG19", chkBox19);
			parameters.put("P_OTHERS", txtOthers);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_SIGNATURE", signatory);
			parameters.put("P_DESIGNATION", designation);
			parameters.put("P_LINE_CD", lineCd);
			parameters.put("P_SUBLINE_CD", sublineCd);
			parameters.put("P_ISS_CD", issCd);
			parameters.put("P_CLM_YY", clmYy);
			parameters.put("P_CLM_SEQ_NO", clmSeqNo);
			
			
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
				
				//redirect to right line
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/TransmittalController?action=toTransmittalPage");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/claims/Transmittal/hiddenDiv.jsp");
            	dispatcher.forward(request,response);
			}
		}
	}
}
