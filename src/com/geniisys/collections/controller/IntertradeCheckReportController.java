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
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.geniisys.common.entity.AccountingEntry;
import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Signatory;
import com.geniisys.common.service.AccountingEntryService;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.SignatoryService;
import com.geniisys.common.service.impl.AccountingEntryServiceImpl;
import com.geniisys.common.service.impl.BranchServiceImpl;
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
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

public class IntertradeCheckReportController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@SuppressWarnings("deprecation")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/collections/intertrade check report/checkReport.jsp";
		String page2 = "/IntertradeCheckReportController?action=toPage";
		String tranCd = "94";
		String errorMsg = "";
		/* request.getParameter("redirectPage"); */

		if (action.equals("toPage")) {
			SignatoryService signatoryService = new SignatoryServiceImpl();
			BranchService branchService = new BranchServiceImpl();
			//AccountingEntryService accountingEntryService = new AccountingEntryServiceImpl();
			List<Signatory> signatoryList = null;
			List<Branch> branches = null;
			//List<AccountingEntry> accountingEntry = null;
			try {
				signatoryList = (List<Signatory>) signatoryService.getAllActiveSignatory();
				branches = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
				//accountingEntry = (List<AccountingEntry>) accountingEntryService.getAllDate();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("signatoryList", signatoryList);
			request.setAttribute("branches", branches);
			//request.setAttribute("accountingEntry", accountingEntry);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		if (action.equals("printReport")) {
			String reportName = request.getParameter("reportName");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String asofDate = request.getParameter("asofDate");
			String branch = request.getParameter("branch");
			String userId = request.getParameter("userId");
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_BRANCH", branch);
			parameters.put("P_FROM_DATE", fromDate);
			parameters.put("P_AS_OF", asofDate);
			parameters.put("P_TO_DATE", toDate);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_TRAN_CD", tranCd);
			
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
				request.setAttribute("reportTitle", reportName);
				request.setAttribute("reportUrl", outputPdf);

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/collections/intertrade check report/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
