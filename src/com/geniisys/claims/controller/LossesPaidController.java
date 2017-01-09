package com.geniisys.claims.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

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

public class LossesPaidController extends HttpServlet {

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
		String redirectPage = request.getParameter("redirectPage");
		String PAGE = "/pages/claims/Losses Paid/lossesPaid.jsp";
		String reportName = "MTSHOP_REPORT";

		if (action.equals("printLossesPaid")) {
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String userId = request.getParameter("userId");
			String summary = request.getParameter("summary");
			String detailed = request.getParameter("detailed");

			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir + "/" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			System.out.println(fromDate);
			System.out.println(toDate);
			parameters.put("P_FROM_DATE", fromDate);
			parameters.put("P_TO_DATE", toDate);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_SUMMARY", summary);
			parameters.put("P_DETAILED", detailed);

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

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(PAGE);
				dispatcher.forward(request, response);
			}
		}
	}
}
