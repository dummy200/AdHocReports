package com.geniisys.underwriting.controller;

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

import com.geniisys.common.entity.Signatory;
import com.geniisys.common.service.SignatoryService;
import com.geniisys.common.service.impl.SignatoryServiceImpl;
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

public class ToyotaDealersController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/underwriting/toyota dealers/toyotaDealers.jsp";
		String page2 = "/ToyotaDealersController?action=toToyotaDealersPage";
		String errorMsg = "";
		/* request.getParameter("redirectPage"); */

		if (action.equals("toToyotaDealersPage")) {
			SignatoryService signatoryService = new SignatoryServiceImpl();
			try {
				List<Signatory> signatoryList = (List<Signatory>) signatoryService.getAllActiveSignatory();
				request.setAttribute("signatoryList", signatoryList);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("pageTitle", "Toyota Premium Production and Claim Report");

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		if (action.equals("printReport")) {
			String reportName = request.getParameter("reportName");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String user = request.getParameter("user");
			String notedBy = request.getParameter("notedBy");

			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_DATE_FROM", fromDate);
			parameters.put("P_DATE_TO", toDate);
			parameters.put("P_USER", user);
			parameters.put("P_NOTED_BY", notedBy);

			try {
				System.out.println("converting report................");
				DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
						"net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");

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

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page2);
				dispatcher.forward(request, response);
			}
		}
	}
}
