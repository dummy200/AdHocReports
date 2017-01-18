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

import com.geniisys.common.entity.AccountingEntry;
import com.geniisys.common.entity.Branch;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.impl.BranchServiceImpl;

import com.geniisys.common.entity.AccountingEntry;
import com.geniisys.common.service.AccountingEntryService;
import com.geniisys.common.service.impl.AccountingEntryServiceImpl;

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

public class OsApdcController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String redirectPage = "/OsApdcController?action=OsApdc";
		String page = "/pages/collections/os apdc/OsApdc.jsp";
		
		if (action.equals("OsApdc")) {
			BranchService branchService = new BranchServiceImpl();
			AccountingEntryService accountingEntryService = new AccountingEntryServiceImpl();
			try {
				List<Branch> branches = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
				request.setAttribute("branches", branches);
				
				List<AccountingEntry> accountingEntry = (List<AccountingEntry>) accountingEntryService.getAllDate();
				request.setAttribute("accountingEntry", accountingEntry);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		if(action.equals("printBondsReport")){			
			
			String dateFrom = request.getParameter("dateFrom");
			String dateTo = request.getParameter("dateTo");
			String asofDate = request.getParameter("asofDate");
			String branch = request.getParameter("branch");
			String userId = request.getParameter("userId");

			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String reportName = request.getParameter("reportName");
			
			errorMsg = null;
			
			
			System.out.println(dateFrom+dateTo+branch);

			String fileName = dir  + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			
			request.setAttribute("errorMsg", errorMsg);
			
			parameters.put("P_FROM_DATE", dateFrom);
			parameters.put("P_TO_DATE", dateTo);
			parameters.put("P_ASOF_DATE", asofDate);
			parameters.put("P_BRANCH", branch);
			parameters.put("P_USER_ID", userId);

			
			System.out.println(fileName);
			request.setAttribute("errorMsg", errorMsg);
			
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
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/collections/os apdc/hiddenDiv.jsp");
            	dispatcher.forward(request,response);
			}
		}
	}
}
