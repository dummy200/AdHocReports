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

import com.geniisys.common.entity.Subline;
import com.geniisys.common.service.SublineService;
import com.geniisys.common.service.impl.SublineServiceImpl;
import com.geniisys.util.ConnectionUtil;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

import net.sf.jasperreports.engine.DefaultJasperReportsContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRPropertiesUtil;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;

public class IssuedBondsController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/underwriting/issued bonds/issuedBonds.jsp";
		String page2 = "/IssuedBondsController?action=toIssuedBondsPage";
		String tranCd = "94";
		/* request.getParameter("redirectPage"); */

		if (action.equals("toIssuedBondsPage")) {
			SublineService sublineService = new SublineServiceImpl();
			
			List<Subline> sublineList = (List<Subline>) sublineService.getAllSublineBonds();
			request.setAttribute("sublineList", sublineList);
			
			request.setAttribute("pageTitle", "Issued Bonds");

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
		if (action.equals("printReport")) {
			String reportName = request.getParameter("reportName");
			String sublineCd = request.getParameter("sublineCd");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String userId = request.getParameter("userId");
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String fileName = dir + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			String outputXls = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".xls";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_SUBLINE", sublineCd);
			parameters.put("P_FROM", fromDate);
			parameters.put("P_TO", toDate);
			parameters.put("P_USER_ID",userId);
			parameters.put("P_TRAN_CD", tranCd);

			try {
				System.out.println("converting report................");
				DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
				JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
						"net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");

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

				request.setAttribute("errorMsg", errorMsg);
				request.setAttribute("reportTitle", reportName);
				request.setAttribute("reportXls", outputXls);

				// redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page2);
				dispatcher.forward(request, response);
			}
			}
		}
}
