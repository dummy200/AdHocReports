package com.geniisys.underwriting.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.User;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.UserService;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.common.service.impl.UserServiceImpl;
import com.geniisys.util.ConnectionUtil;

import net.sf.jasperreports.engine.DefaultJasperReportsContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRPropertiesUtil;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
public class PamsCashierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PamsCashierController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		//String errorMsg = "";
		//HttpSession session = request.getSession();
		List<User> userList  = new ArrayList<User>();
		List<Branch> branchList = new ArrayList<Branch>();
		UserService userService = new UserServiceImpl();
		if (action.equals("toPamsCashierPage")) {	
			
			try {
				userList = userService.getCashierUsers();
				request.setAttribute("cashierList", userList);
				
			} catch (SQLException e) {
				e.printStackTrace();
				//errorMsg = "SQL has an error";
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/underwriting/pams cashier/pamsCashier.jsp");
			dispatcher.forward(request, response);
		}
		
		if (action.equals("getBranches")) {	
			BranchService  branchService = new BranchServiceImpl();
			try {
				branchList = branchService.getCashierBranchesByUserAndTranCd(request);
				request.setAttribute("cashierBranchList", branchList);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/underwriting/pams cashier/list.jsp");
			dispatcher.forward(request, response);
		}
		
		if (action.equals("getAllBranches")) {	
			BranchService  branchService = new BranchServiceImpl();
			branchList = branchService.getAllBranches2();
			request.setAttribute("cashierBranchList", branchList);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/underwriting/pams cashier/list.jsp");
			dispatcher.forward(request, response);
		}
		
		if (action.equals("printReport")) {	
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String userId = request.getParameter("userId");
			String branchCd = request.getParameter("branchCd");
			String user = request.getParameter("user");
			String reportName = request.getParameter("reportName");
			String errorMsg = request.getParameter("errorMsg");
			
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			//String outputXls = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".xls";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			
			parameters.put("P_DATE_FROM", fromDate);
			parameters.put("P_DATE_TO", toDate);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_BRANCH_CD", branchCd);
			parameters.put("P_ADHOC_USER_ID", user);
			
			try {
				System.out.println("converting report................");
				DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
						"net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");

				Connection conn = ConnectionUtil.getConnection();

				JasperPrint jasperPrint = JasperFillManager.fillReport(fileName, parameters, conn);

				//JRXlsxExporter exp = new JRXlsxExporter();
				//exp.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
				//exp.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, outputXls);

				//exp.exportReport();
				
				JRPdfExporter exporter = new JRPdfExporter();
				ByteArrayOutputStream out = new ByteArrayOutputStream();
				exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
				exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
				exporter.exportReport();
				JasperExportManager.exportReportToPdfFile(jasperPrint, outputPdf);
			} catch (JRException e) {
				System.out.println("jre exception: " + e.getMessage().toString());
				errorMsg = "jre exception: " + e.getMessage().toString();
			} catch (SQLException e) {
				System.out.println("sql exception: " + e.getMessage().toString());
				errorMsg = "sql exception: " + e.getMessage().toString();
			} finally {
				File sourceReport = new File(fileName);
				if (!sourceReport.exists() && sourceReport.isDirectory()) {
					errorMsg = "Report not found in reports directory.";
				}
				File outputFile = new File(outputPdf);
				if (!outputFile.exists() && outputFile.isDirectory()) {
					errorMsg = "Output not found in generated reports directory.";
				}

				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("reportUrl", outputPdf);
				//request.setAttribute("reportXls", outputXls);
				request.setAttribute("reportTitle", reportName);

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/underwriting/pams cashier/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
