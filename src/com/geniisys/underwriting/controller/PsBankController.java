package com.geniisys.underwriting.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

public class PsBankController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String redirectPage = request.getParameter("redirectPage");
		String tranCd = "98";
		String page = "/pages/underwriting/ps bank posted/PsBank.jsp";

		if(action.equals("printBondsReport")){			
			String dateFrom = request.getParameter("dateFrom");
			String dateTo = request.getParameter("dateTo");
			String fromtext = request.getParameter("fromtext");
			String totext = request.getParameter("totext");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String re = request.getParameter("re");
			String linecd = request.getParameter("linecd");		
			String userId = request.getParameter("userId");
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String reportName = "REP_PS_POSTED";
			
			errorMsg = null;
			
			String fileName = dir  + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			
			request.setAttribute("errorMsg", errorMsg);
			
			parameters.put("P_FROM", dateFrom);
			parameters.put("P_TO", dateTo);
			parameters.put("P_TO_TEXT", fromtext);
			parameters.put("P_FROM_TEXT", totext);
			parameters.put("P_ADDRESS1", address1);
			parameters.put("P_ADDRESS2", address2);
			parameters.put("P_RE", re);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_TRAN_CD", tranCd);

			request.setAttribute("errorMsg", errorMsg);
			
			try {
				DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
						"net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");
				
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
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
            	dispatcher.forward(request,response);
			}
		}
	}
}
