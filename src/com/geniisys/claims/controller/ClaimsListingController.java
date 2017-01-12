package com.geniisys.claims.controller;

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

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.geniisys.claims.dao.DemandLetterDAO;
import com.geniisys.claims.entity.ClaimNo;
import com.geniisys.claims.entity.DemandLetter;
import com.geniisys.claims.entity.DemandLetterInsert;
import com.geniisys.claims.entity.DemandLetterParameter;
import com.geniisys.claims.entity.DemandLetterReprint;
import com.geniisys.claims.entity.McSworn;
import com.geniisys.claims.service.DemandLetterService;
import com.geniisys.claims.service.McSwornService;
import com.geniisys.claims.service.impl.DemandLetterServiceImpl;
import com.geniisys.claims.service.impl.McSwornServiceImpl;
import com.geniisys.common.entity.AccountingEntry;
import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Line;
import com.geniisys.common.service.AccountingEntryService;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.IntermediaryService;
import com.geniisys.common.service.LineService;
import com.geniisys.common.service.TariffService;
import com.geniisys.common.service.impl.AccountingEntryServiceImpl;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.common.service.impl.IntermediaryServiceImpl;
import com.geniisys.common.service.impl.LineServiceImpl;
import com.geniisys.common.service.impl.TariffServiceImpl;
import com.geniisys.util.ConnectionUtil;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapSession;
import com.ibatis.sqlmap.client.SqlMapTransactionManager;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

public class ClaimsListingController extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	public static String errorMsg = "";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String redirectPage = request.getParameter("redirectPage");
		String page = "/pages/claims/Claims Listing/claimsListing.jsp";
		String tranCd = "93";
		
		if (action.equals("toClaimsListingPage")) {
			LineService lineService = new LineServiceImpl();
			BranchService branchService = new BranchServiceImpl();

			List<Line> lineList = null;
			List<Branch> branchList = null;
			try {
				lineList = (List<Line>) lineService.getLinesByUserAndTranCd(request);
				branchList = (List<Branch>) branchService.getAllBranchesByUserAndTranCd(request);
				request.setAttribute("lineList", lineList);
				request.setAttribute("branchList", branchList);
			} catch (SQLException e) {
				errorMsg = e.getMessage();
			}
			
			request.setAttribute("errorMsg", errorMsg);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
		if(action.equals("printclaimsListing")){
			String asOfDate = request.getParameter("asOfDate");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String lineCd = request.getParameter("lineCd");
			String branchCd = request.getParameter("branchCd");
			String userId = request.getParameter("userId");
			String processor = request.getParameter("processor");
			String reportName = request.getParameter("reportName");
			
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String pdfDir = getServletContext().getRealPath("");
			String fileName = dir  + "\\" + reportName + ".jasper";
			String outputPdf = getServletContext().getInitParameter("GENERATED_REPORTS_DIR") + reportName + ".pdf";
			HashMap<String, Object> parameters = new HashMap<String, Object>();

			parameters.put("P_DATE_AS_OF", asOfDate);
			parameters.put("P_DATE_FROM", fromDate);
			parameters.put("P_DATE_TO", toDate);
			parameters.put("P_LINE_CD", lineCd);
			parameters.put("P_CRED_BRANCH", branchCd);
			parameters.put("P_USER_ID",userId);
			parameters.put("P_PROCESSOR", processor);
			parameters.put("P_TRAN_CD", tranCd);
			
			try {
				Connection conn = ConnectionUtil.getConnection();
				JasperPrint print = JasperFillManager.fillReport(fileName, parameters, conn);
				JRPdfExporter exporter = new JRPdfExporter();
				ByteArrayOutputStream out = new ByteArrayOutputStream();
				exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
				exporter.setExporterInput(new SimpleExporterInput(print));
				exporter.exportReport();
				JasperExportManager.exportReportToPdfFile(print, outputPdf);
				errorMsg="";
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
				
				//redirect to right line
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/claims/Claims Listing/hiddenDiv.jsp");
            	dispatcher.forward(request,response);
			}
		}
	}

}
