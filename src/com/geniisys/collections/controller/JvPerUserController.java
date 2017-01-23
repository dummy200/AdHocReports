package com.geniisys.collections.controller;

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

import com.geniisys.common.entity.Signatory;
import com.geniisys.common.entity.User;
import com.geniisys.common.service.SignatoryService;
import com.geniisys.common.service.UserService;
import com.geniisys.common.service.impl.SignatoryServiceImpl;
import com.geniisys.common.service.impl.UserServiceImpl;
//import com.geniisys.underwriting.controller.ByteArrayOutputStream;
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
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

public class JvPerUserController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@SuppressWarnings("deprecation")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String page = "/pages/collections/journal voucher/jvPerUser.jsp";
        String page2 = "/JvPerUserController?action=toJvPerUserPage";
        String errorMsg = "";
		//String reportName = "FCLTOTOFFR";
		/* request.getParameter("redirectPage"); */

		if (action.equals("toJvPerUserPage")) {
			SignatoryService signatoryService = new SignatoryServiceImpl();
			UserService usersService = new UserServiceImpl();
			try {
				List<Signatory> signatoryList = (List<Signatory>) signatoryService.getAllActiveSignatory();
				request.setAttribute("signatoryList", signatoryList);
				
				List<User> users = (List<User>) usersService.getAllUsers();
				request.setAttribute("users", users);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("pageTitle", "JV PER USER");
			//request.setAttribute("reportName", reportName);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
		if(action.equals("printReport")){			
			System.out.println("Test");
			
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String UserId = request.getParameter("UserId");
			String checkBy = request.getParameter("checkBy");
			String checkDesig = request.getParameter("checkDesig");
			String approvedBy = request.getParameter("approvedBy");
			String approveDesig = request.getParameter("approveDesig");
			
			String outputType = request.getParameter("outputType");

			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String reportName = request.getParameter("reportName");;
			
			errorMsg = null;
			System.out.println(outputType);

			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			String outputXls = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".xls";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			
			
			request.setAttribute("errorMsg", errorMsg);
			
	
			parameters.put("P_FROM", fromDate);
			parameters.put("P_TO", toDate);
			parameters.put("P_USER", UserId);
			
			parameters.put("P_CHECKBY", checkBy);
			parameters.put("P_CHECKDESG", checkDesig);
			
			System.out.println(fileName);
			request.setAttribute("errorMsg", errorMsg);
			
			try {		
				System.out.println("converting report................");
				DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
						"net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");

				Connection conn = ConnectionUtil.getConnection();
				if (outputType.equals("1")) {
					// try excel
					JasperPrint jasperPrint = JasperFillManager.fillReport(fileName, parameters, conn);

					JRXlsxExporter exp = new JRXlsxExporter();
					exp.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
					exp.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, outputXls);

					exp.exportReport();
				}if (outputType.equals("2")) {
					JasperPrint print = JasperFillManager.fillReport(fileName, parameters, conn);
					JRPdfExporter exporter = new JRPdfExporter();
					java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
					exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
					exporter.setExporterInput(new SimpleExporterInput(print));
					exporter.exportReport();
					JasperExportManager.exportReportToPdfFile(print, outputPdf);
				}
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
				request.setAttribute("reportXls", outputXls);
				request.setAttribute("outputType", outputType);

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page2);
				dispatcher.forward(request, response);
			}
		}
		
	}
}
