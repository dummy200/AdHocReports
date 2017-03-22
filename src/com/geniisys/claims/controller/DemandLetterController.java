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

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.geniisys.claims.dao.DemandLetterDAO;
import com.geniisys.claims.entity.ClaimNo;
import com.geniisys.claims.entity.DemandLetter;
import com.geniisys.claims.entity.DemandLetterInsert;
import com.geniisys.claims.entity.DemandLetterParameter;
import com.geniisys.claims.entity.DemandLetterReprint;
import com.geniisys.claims.entity.McSworn;
import com.geniisys.claims.service.DemandLetterService;
import com.geniisys.claims.service.McSwornService;
import com.geniisys.claims.service.impl.DemandLetterServiceImpl;
import com.geniisys.claims.service.impl.McSwornServiceImpl;
import com.geniisys.util.ConnectionUtil;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapSession;
import com.ibatis.sqlmap.client.SqlMapTransactionManager;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

public class DemandLetterController extends HttpServlet{
	
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
		String demandLetterPage = "/pages/claims/Demand Letter/demandLetter.jsp";
		String reportName = request.getParameter("reportName");
		Integer letterType = 1;
		String errorMsg = "";
		
		if (action.equals("checkClaimNo")){
			DemandLetterService demandLetterService = new DemandLetterServiceImpl();
			List<DemandLetter> demandLetterList = null;	
			Integer claimId = null;
			Integer recoveryId = null;
			Boolean reprintFirst = false;
			Boolean reprintSecond = false;
			
			try {
				demandLetterList =(List<DemandLetter>) demandLetterService.populateDemandLetterInfo(request);
				try{
					Integer listSize = demandLetterList.size();
					errorMsg = "";
				}catch(NullPointerException e){
					errorMsg = "No data found.";
				}
				if(!errorMsg.equals("No data found")){
				Integer claimCount = (Integer) demandLetterService.checkClaimIdFromDBDemandLetter(request);
				recoveryId = demandLetterList.get(0).getRecoveryId();
				claimId = demandLetterList.get(0).getClaimId();
				if(claimCount.equals(1) || claimCount.equals(2)){
					letterType = 2;
				}else
					letterType = 0;
				//check reprint
				DemandLetterReprint firstLetter = new DemandLetterReprint();
				firstLetter.setClaimId(claimId);
				firstLetter.setDemandType("FIRST");
				reprintFirst = (Boolean) demandLetterService.checkIfExistsInReprint(firstLetter);
				DemandLetterReprint secondLetter = new DemandLetterReprint();
				secondLetter.setClaimId(claimId);
				secondLetter.setDemandType("SECOND");
				reprintSecond = (Boolean) demandLetterService.checkIfExistsInReprint(secondLetter);
				}
				/*Integer listSize = demandLetterList.size();
				if(listSize.equals(0)){
					errorMsg = "No data found.";
				}else{
					errorMsg = "";
					Integer claimCount = (Integer) demandLetterService.checkClaimIdFromDBDemandLetter(request);
					recoveryId = demandLetterList.get(0).getRecoveryId();
					claimId = demandLetterList.get(0).getClaimId();
					if(claimCount.equals(1) || claimCount.equals(2)){
						letterType = 2;
					}else
						letterType = 0;
					//check reprint
					DemandLetterReprint firstLetter = new DemandLetterReprint();
					firstLetter.setClaimId(claimId);
					firstLetter.setDemandType("FIRST");
					reprintFirst = (Boolean) demandLetterService.checkIfExistsInReprint(firstLetter);
					DemandLetterReprint secondLetter = new DemandLetterReprint();
					secondLetter.setClaimId(claimId);
					secondLetter.setDemandType("SECOND");
					reprintSecond = (Boolean) demandLetterService.checkIfExistsInReprint(secondLetter);
				}*/
				//System.out.println(demandLetterList.get(0).getClaimNo());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				errorMsg = e.getMessage();/*
			}catch (NullPointerException e){
				e.printStackTrace();
				errorMsg = "No data found.";*/
			}finally{
				System.out.println(errorMsg);
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("demandLetterList", demandLetterList);
				request.setAttribute("letterType", letterType);
				request.setAttribute("claimId", claimId);
				request.setAttribute("recoveryId", recoveryId);
				request.setAttribute("reprintFirst", reprintFirst);
				request.setAttribute("reprintSecond", reprintSecond);
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectPage);
        		dispatcher.forward(request,response);
			}
		}
		
		if(action.equals("printDemandLetter")){
			String userId = request.getParameter("userId");
			String userEmail = request.getParameter("userEmail");
	
			Integer claimId = Integer.parseInt(request.getParameter("claimId"));
			Integer recoveryId = Integer.parseInt(request.getParameter("recoveryId"));
			
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir  + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_CLAIM_ID", claimId);
			parameters.put("P_RECOVERY_ID", recoveryId);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_USER_EMAIL",userEmail);
			//System.out.println(claimId + " " + recoveryId + " " + userId + " " + userEmail + " " + reportName);
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
				request.setAttribute("testClaimId", claimId);
				request.setAttribute("testRecoveryId", recoveryId);
				request.setAttribute("testUserId", userId);
				request.setAttribute("testUserEmail", userEmail);
				
				//redirect to right line
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(demandLetterPage);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/claims/Demand Letter/hiddenDiv.jsp");
            	dispatcher.forward(request,response);
			}
		}
		
		if(action.equals("insertToTables")){
			DemandLetterService demandLetterService = new DemandLetterServiceImpl();
			Integer claimId = Integer.parseInt(request.getParameter("testClaimId"));
			Integer recoveryId = Integer.parseInt(request.getParameter("testRecoveryId"));
			String userId = request.getParameter("testUserId");
			String userEmail = request.getParameter("testUserEmail");
			String demandTypeVar = request.getParameter("letterType");
			System.out.println("reportName: " + request.getParameter("reportName"));
		
			System.out.println(claimId + " " + recoveryId + " " + userId + " " + userEmail);
			DemandLetterParameter params = new DemandLetterParameter(claimId, recoveryId, userId);
			try {
				sqlMap.startTransaction();
				sqlMap.startBatch();
				DemandLetterInsert insertDetails = (DemandLetterInsert) demandLetterService.fetchFirstReportDetails(params);
				System.out.println("demands before: " + insertDetails.getDemands());
				insertDetails.setDemands(demandTypeVar);
				System.out.println("demands after: " + insertDetails.getDemands());
				DemandLetterInsert secondInsertDetails = (DemandLetterInsert) demandLetterService.fetchSecondReportDetails(params);
				System.out.println("demands before: " + secondInsertDetails.getDemands());
				secondInsertDetails.setDemands(demandTypeVar);
				System.out.println("demands after: " + secondInsertDetails.getDemands());
				System.out.println("update demand letter table");
				demandLetterService.insertIntoDBDemandLetter(insertDetails,claimId,reportName);
				System.out.println("update reprint table");
				demandLetterService.insertIntoDBDemandReprint(secondInsertDetails,insertDetails.getAmtWord1(),claimId,reportName,userEmail);
				sqlMap.executeBatch();
				sqlMap.commitTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
				errorMsg = e.getMessage();
			}finally{
				request.setAttribute("testClaimId", claimId);
				request.setAttribute("claimId", claimId);
				request.setAttribute("errorMsg", errorMsg);
				try {
					sqlMap.endTransaction();
				} catch (SQLException e) {
					e.printStackTrace();
					errorMsg = e.getMessage();
				}
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/claims/Demand Letter/blank.jsp");
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/claims/Demand Letter/hiddenDiv.jsp");
				dispatcher.forward(request,response);
			}
		}
		
		if(action.equalsIgnoreCase("reprintDemand")){
			Integer claimId = Integer.parseInt(request.getParameter("claimId"));
			System.out.println("claim id " + claimId);
			System.out.println("reportName : " + request.getParameter("reportName") );
					
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir  + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_CLAIM_ID", claimId);
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
				request.setAttribute("reportUrl", outputPdf);
				request.setAttribute("reportTitle", reportName);
			
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(demandLetterPage);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/claims/Demand Letter/hiddenDiv.jsp");
				dispatcher.forward(request,response);
			}
		}
	}

}
