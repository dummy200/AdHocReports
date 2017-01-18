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

public class PamsIssuanceController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String redirectPage = "/PamsIssuanceController?action=PamsIssuance";
		String page = "/pages/claims/pams posted/PamsIssuance.jsp";
		String tranCd = "98";

		if (action.equals("PamsIssuance")) {
			SignatoryService signatoryService = new SignatoryServiceImpl();
			BranchService branchService = new BranchServiceImpl();
			UserService usersService = new UserServiceImpl();
			try {
				List<Signatory> signatoryList = (List<Signatory>) signatoryService.getAllActiveSignatory();
				request.setAttribute("signatoryList", signatoryList);

				List<Branch> branches = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
				request.setAttribute("branches", branches);

				List<User> users = (List<User>) usersService.getAllUsers();
				request.setAttribute("users", users);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		if (action.equals("printBondsReport")) {
			System.out.println("Test");

			String dateFrom = request.getParameter("dateFrom");
			String dateTo = request.getParameter("dateTo");
			String user = request.getParameter("user");
			String branch = request.getParameter("branch");
			String rdbutton = request.getParameter("rdbutton");
			String checkby = request.getParameter("checkby");
			String checkdes = request.getParameter("checkdes");
			String userId = request.getParameter("userId");

			sqlMap = MyAppSqlConfig.getSqlMapInstance();

			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String reportName = null;

			errorMsg = null;

			if (rdbutton.equals("rdSummary")) {
				reportName = "REP_PAMS_POSTED";
			} else if (rdbutton.equals("rdPerSpoilage")) {
				reportName = "REP_PAMS_SPOILAGE";
			} else if (rdbutton.equals("rdPerAssued")) {
				reportName = "REP_PAMS_ASSD";
			}

			System.out.println(dateFrom + dateTo + user + branch + rdbutton);

			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			request.setAttribute("errorMsg", errorMsg);

			parameters.put("P_FROM", dateFrom);
			parameters.put("P_TO", dateTo);
			parameters.put("P_USER", user);
			parameters.put("P_BRANCH", branch);

			parameters.put("P_CHECKBY", checkby);
			parameters.put("P_CHECKDESG", checkdes);

			parameters.put("P_USER_ID", userId);
			parameters.put("P_TRAN_CD", tranCd);

			System.out.println(fileName + user);
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

				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/pages/claims/pams posted/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
