package com.geniisys.reinsurance.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.geniisys.common.service.PolicyNoService;
import com.geniisys.common.service.impl.PolicyNoServiceImpl;
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

public class RiBinderController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String redirectPage = request.getParameter("redirectPage");
		String reportName = "RI_BINDER_REP";
		
		//on click print button(individual)
		if(action.equals("printBondsReport")){
			String lineCd = request.getParameter("lineCd");
			String sublineCd = request.getParameter("sublineCd");
			String issCd = request.getParameter("issCd");
			String issueYY = request.getParameter("issueYY");
			String polSeqNo = request.getParameter("polSeqNo");
			String renewNo = request.getParameter("renewNo");
			String page = request.getParameter("page");
			
			System.out.println("session id: " + request.getRequestedSessionId());
			
			/*Configure paths*/
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			
			errorMsg = null;
			String dir = getServletContext().getInitParameter("REPORTS_DIR");

			String fileName = dir  + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			System.out.println(reportName);
			System.out.println("test "+dir+sublineCd);
			System.out.println("test "+outputPdf+sublineCd);
			
			/*fetch data from database using service*/
			PolicyNoService policyNoService = new PolicyNoServiceImpl();
			try {
				Integer policyId = policyNoService.getPolicyId(request);
				request.setAttribute("errorMsg", errorMsg);
				parameters.put("P_LINE", lineCd);
				parameters.put("P_SUBLINE", sublineCd);
				parameters.put("P_ISS_CD", issCd);
				parameters.put("P_ISSUE_YY", issueYY);
				parameters.put("P_POL_SEQ_NO", polSeqNo);
				parameters.put("P_RENEW_NO", renewNo);
				
				
				System.out.println("policy "+policyId+sublineCd);
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
				request.setAttribute("reportUrl", outputPdf);
				request.setAttribute("reportTitle", reportName);
				
				//redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/reinsurance/ri binder/hiddenDiv.jsp");
            	dispatcher.forward(request,response);
			}
		}
	}
}
