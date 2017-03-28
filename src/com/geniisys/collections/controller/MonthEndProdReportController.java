package com.geniisys.collections.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.geniisys.collections.service.MonthEndProdReportService;
import com.geniisys.collections.service.impl.MonthEndProdReportServiceImpl;
import com.geniisys.common.entity.AccountingEntry;
import com.geniisys.common.service.AccountingEntryService;
import com.geniisys.common.service.impl.AccountingEntryServiceImpl;
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


@WebServlet("/MonthEndProdReportController")
public class MonthEndProdReportController extends HttpServlet {
	private SqlMapClient sqlMap;
	private static final long serialVersionUID = 1L;
	
    public MonthEndProdReportController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action  = request.getParameter("action");
		String errorMsg = "";
		MonthEndProdReportService monthEndProdReportService = new MonthEndProdReportServiceImpl();
		String page =  "";
		String outputPath = "";
		String outputXls = "";
		if(action.equals("toMonthEndReportPage")){
			String reportList;
			try {
				reportList = monthEndProdReportService.setMonthEndReportsList();
				AccountingEntryService accountingEntryService = new AccountingEntryServiceImpl();
				List<AccountingEntry> dateList  = accountingEntryService.getAllDate();
				request.setAttribute("reportList", reportList);
				request.setAttribute("dateList", dateList);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			page =  "/pages/collections/month end/monthEndReports.jsp";
		}else if(action.equals("printReport")){
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dir = getServletContext().getInitParameter("REPORTS_DIR");
			String[] reportNameList = request.getParameter("reportNameArray").split(",");
			String[] reportCatList = request.getParameter("reportCatArray").split(",");
			HashMap<String, Object> parameters = new HashMap<String, Object>();
			//setting the parameter to print report
			parameters.put("P_MONTH_YEAR", request.getParameter("date"));
			parameters.put("P_USER", request.getParameter("userId"));
			//preparing for report conversion
			for (int i = 0; i < reportNameList.length; i++) {
				System.out.println("reportName: " + reportNameList[i]); 
				String fileName = dir + "/" + reportNameList[i].replaceAll("\\s","_") + ".jasper";
				System.out.println("file_name: " + fileName );
				if(reportCatList[i].equalsIgnoreCase("ACCOUNTING")){
					 outputPath = "\\\\10.20.39.55\\IT_Files\\END OF MONTH\\" + new SimpleDateFormat("MMMM YYYY").format(new Date()) +"\\";
				}else{
					 outputPath = "\\\\10.20.39.55\\IT_Files\\END OF MONTH\\" + new SimpleDateFormat("MMMM YYYY").format(new Date()) +"\\" + reportCatList[i] + "\\";
				}
				 outputXls = outputPath + reportNameList[i] + ".xls";
				System.out.println("outputXls: " + outputXls);
				//process of conversion
				try {
					File dest = new File(outputXls);
					if (!dest.exists()) {
			            System.out.println("No Folder");
			            new File(outputPath).mkdirs();
			            System.out.println("Folder created");
			        }
					System.out.println("converting report................");
					DefaultJasperReportsContext context = DefaultJasperReportsContext.getInstance();
					JRPropertiesUtil.getInstance(context).setProperty("net.sf.jasperreports.xpath.executer.factory",
							"net.sf.jasperreports.engine.util.xml.JaxenXPathExecuterFactory");

					Connection conn = ConnectionUtil.getConnection();
					JasperPrint jasperPrint = JasperFillManager.fillReport(fileName, parameters, conn);
					JRXlsxExporter exp = new JRXlsxExporter();
					exp.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
					exp.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
					exp.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, outputXls);
					exp.exportReport();
				} catch (JRException e) {
					System.out.println("jre exception: " + e.getMessage().toString());
					errorMsg = "jre exception: " + e.getMessage().toString();
				} catch (SQLException e) {
					System.out.println("sql exception: " + e.getMessage().toString());
					errorMsg = "sql exception: " + e.getMessage().toString();
				}finally {
					File sourceReport = new File(fileName);
					if (!sourceReport.exists() && sourceReport.isDirectory()) {
						errorMsg = "Report not found in reports directory.";
					}
					File outputFile = new File(outputXls);
					if (!outputFile.exists() && outputFile.isDirectory()) {
						errorMsg = "Output not found in generated reports directory.";
					}
					request.setAttribute("errorMsg", errorMsg);
					request.setAttribute("reportXls", outputXls);
					page = "/pages/collections/month end/hiddenDiv.jsp";
				}
			}
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
