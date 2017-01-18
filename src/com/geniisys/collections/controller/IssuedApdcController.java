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

import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Signatory;
import com.geniisys.common.entity.User;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.SignatoryService;
import com.geniisys.common.service.UserService;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.common.service.impl.SignatoryServiceImpl;
import com.geniisys.common.service.impl.UserServiceImpl;
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

public class IssuedApdcController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String redirectPage = "/IssuedApdcController?action=IssuedApdc";
		String page = "/pages/collections/issued apdc/issuedApdc.jsp";
		String tranCd = "94";

		if (action.equals("IssuedApdc")) {
			SignatoryService signatoryService = new SignatoryServiceImpl();
			BranchService branchService = new BranchServiceImpl();
			UserService userService = new UserServiceImpl();
			List<Signatory> signatoryList = null;
			List<Branch> branches = null;
			List<User> users = null;
			try {
				signatoryList = (List<Signatory>) signatoryService.getAllActiveSignatory();
				branches = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
				users = (List<User>) userService.getAllUsers();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("signatoryList", signatoryList);
			request.setAttribute("branches", branches);
			request.setAttribute("users", users);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		if (action.equals("printBondsReport")) {

			String dateFrom = request.getParameter("dateFrom");
			String dateTo = request.getParameter("dateTo");
			// Integer datagroup =
			// Integer.parseInt(request.getParameter("datagroup"));
			String datagroup = request.getParameter("datagroup");
			String datatag = request.getParameter("datatag");
			String branch = request.getParameter("branch");
			String checkby1 = request.getParameter("checkby1");
			String checkby2 = request.getParameter("checkby2");
			String checkby3 = request.getParameter("checkby3");
			String checkby4 = request.getParameter("checkby4");
			String userId = request.getParameter("userId");

			sqlMap = MyAppSqlConfig.getSqlMapInstance();

			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String reportName = "ISSUED_APDC_REPD";

			errorMsg = null;

			System.out.println(dateFrom + dateTo + branch);

			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			request.setAttribute("errorMsg", errorMsg);

			parameters.put("P_DATE_FROM", dateFrom);
			parameters.put("P_DATE_TO", dateTo);
			parameters.put("P_STATUS_FLAG", datatag);
			parameters.put("P_USER_GRP", datagroup);
			parameters.put("P_BRANCH", branch);
			parameters.put("P_CHECKED_BY", checkby3);
			parameters.put("P_PRINTED_BY", checkby1);
			parameters.put("P_NOTED_BY", checkby2);
			parameters.put("P_RECEIVED_BY", checkby4);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_TRAN_CD",tranCd);

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

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/collections/issued apdc/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
