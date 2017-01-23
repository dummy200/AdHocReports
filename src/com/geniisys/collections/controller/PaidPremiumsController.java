package com.geniisys.collections.controller;

import java.io.File;
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

import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Intermediary;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.IntermediaryService;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.common.service.impl.IntermediaryServiceImpl;
import com.geniisys.util.ConnectionUtil;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;

public class PaidPremiumsController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@SuppressWarnings("deprecation")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/collections/paid premiums/paidPremiums.jsp";
		String page2 = "/PaidPremiumsController?action=toPaidPremiumsPage";
		String reportName = request.getParameter("reportName");
		String tranCd = "94";
		String errorMsg = "";
		/* request.getParameter("redirectPage"); */

		if (action.equals("toPaidPremiumsPage")) {
			BranchService branchService = new BranchServiceImpl();
			IntermediaryService intmService = new IntermediaryServiceImpl();

			List<Branch> branchList = null;
			try {
				branchList = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			List<Intermediary> intmList = (List<Intermediary>) intmService.getAllActiveIntermediary();
			List<Intermediary> intmTypeList = (List<Intermediary>) intmService.getAllIntmType();
			// List<Assured> assdList = null;
			request.setAttribute("branchList", branchList);
			request.setAttribute("intmList", intmList);
			request.setAttribute("intmTypeList", intmTypeList);

			request.setAttribute("pageTitle", "Paid Premiums by Intermediary");
			request.setAttribute("reportName", reportName);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}

		if (action.equals("printReport")) {
			// params
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String branchCd = request.getParameter("branchCd");
			String intmNo = request.getParameter("intmNo");
			String intmType = request.getParameter("intmType");
			String userId = request.getParameter("userId");
			String cutOffParam = request.getParameter("cutOffParam");
			String tranFlag = request.getParameter("tranFlag");
			String reportType = request.getParameter("reportType");

			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			String outputXls = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".xls";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_FROM_DATE", fromDate);
			parameters.put("P_TO_DATE", toDate);
			parameters.put("P_BRANCH_CD", branchCd);
			parameters.put("P_INTM_NO", intmNo);
			parameters.put("P_INTM_TYPE", intmType);
			parameters.put("P_USER_ID", userId);
			parameters.put("P_CUT_OFF_PARAM", cutOffParam);
			parameters.put("P_TRAN_FLAG", tranFlag);
			parameters.put("P_REPORT_TYPE", reportType);
			parameters.put("P_TRAN_CD", tranCd);
			
			System.out.println("fromDate" + fromDate);
			System.out.println("toDate" + toDate);
			System.out.println("branchCd" + branchCd);
			System.out.println("intmNo" + intmNo);
			System.out.println("intmType" + intmType);
			System.out.println("userId" + userId);
			System.out.println("cutOffParam" + cutOffParam);
			System.out.println("tranFlag" + tranFlag);
			System.out.println("reportType" + reportType);
			
			try {
				System.out.println("converting report................" + reportName);
				/*DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
						"net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");*/

				Connection conn = ConnectionUtil.getConnection();

				JasperPrint jasperPrint = JasperFillManager.fillReport(fileName, parameters, conn);
				
				JRXlsxExporter exp = new JRXlsxExporter();
				exp.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
				exp.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, outputXls);

				exp.exportReport();
				
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
				request.setAttribute("reportXls", outputXls);
				request.setAttribute("reportTitle", reportName);

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/collections/paid premiums/hiddenDiv.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
