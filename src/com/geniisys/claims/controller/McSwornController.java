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

import com.geniisys.claims.entity.McSworn;
import com.geniisys.claims.service.McSwornService;
import com.geniisys.claims.service.impl.McSwornServiceImpl;
import com.geniisys.common.service.ExtractIdService;
import com.geniisys.common.service.Gipi_PolbasicService;
import com.geniisys.common.service.PolicyNoService;
import com.geniisys.common.service.impl.ExtractIdServiceImpl;
import com.geniisys.common.service.impl.Gipi_PolbasicServiceImpl;
import com.geniisys.common.service.impl.PolicyNoServiceImpl;
import com.geniisys.policyissuance.service.OnePagerService;
import com.geniisys.policyissuance.service.impl.OnePagerServiceImpl;
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

public class McSwornController extends HttpServlet{

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
		String mcSwornPage = "/pages/claims/MC Sworn/mcSworn.jsp";
		String reportName = "GICLR_SWORN_PCI";
		String errorMsg = "";
				
		if (action.equals("checkClaimNo")){
			McSwornService mcSwornService = new McSwornServiceImpl();
			List<McSworn> mcSwornList = null;
			try {
				mcSwornList = (List<McSworn>)mcSwornService.populateMcSworn(request);
				Integer listSize = mcSwornList.size();
				if(listSize.equals(0)){
					errorMsg = "No data found.";
				}else
					errorMsg = "";
				System.out.println(listSize);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				errorMsg = e.getMessage();
			}finally{
				System.out.println(errorMsg);
				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("mcSwornList", mcSwornList);
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectPage);
        		dispatcher.forward(request,response);
			}
		}
		
		if(action.equals("printMcSworn")){
			String lineCd = request.getParameter("lineCd");
			String sublineCd = request.getParameter("sublineCd");
			String issCd = request.getParameter("issCd");
			Integer clmYy = Integer.parseInt(request.getParameter("clmYy"));
			Integer clmSeqNo = Integer.parseInt(request.getParameter("clmSeqNo"));
			String userId = request.getParameter("userId");
			String witness = request.getParameter("witness");
			Integer lossType = Integer.parseInt(request.getParameter("lossType"));
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir  + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			
			parameters.put("LINE_CD", lineCd);
			parameters.put("SUBLINE_CD", sublineCd);
			parameters.put("ISS_CD", issCd);
			parameters.put("CLM_YY", clmYy);
			parameters.put("CLM_SEQ_NO", clmSeqNo);
			parameters.put("WITNESS", witness);
			parameters.put("P_LOSS_TYPE", lossType);
			parameters.put("P_USER", userId);
			
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
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(mcSwornPage);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/claims/MC Sworn/hiddenDiv.jsp");
            	dispatcher.forward(request,response);
			}
		}
	}

}
