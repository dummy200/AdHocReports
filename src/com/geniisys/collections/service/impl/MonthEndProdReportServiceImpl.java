package com.geniisys.collections.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.geniisys.collections.dao.RegularReportsDAO;
import com.geniisys.collections.dao.impl.RegularReportsDAOImpl;
import com.geniisys.collections.service.MonthEndProdReportService;
import com.geniisys.common.entity.RegularReport;

public class MonthEndProdReportServiceImpl implements MonthEndProdReportService{
	
	private RegularReportsDAO regularReportsDAO = new RegularReportsDAOImpl();

	@Override
	public String setMonthEndReportsList() throws SQLException {
		List<RegularReport> reportList = getReportList();
		Integer count = 1;
		String reportListString = "{ rows: [";
		for(RegularReport report : reportList){
			reportListString = reportListString + "{  id:" + count + ", data: [\""+ false + "\"" +",\"" + count +"\"" +",\""+ report.getReportCategory() +"\"" +",\""+report.getReportName() + "\"" + "]}, ";
			count++;
		}
		reportListString = reportListString.substring(0, reportListString.length() - 1) + "]}";
		reportListString.trim();
		System.out.println(reportListString);
		return reportListString;
	}
	
	public List<RegularReport> getReportList() throws SQLException{
		List<RegularReport> reportList =  regularReportsDAO.getReportList();
		return reportList;
		}
	
	public String getFolderName(String reportName){
		String folderName = "";
		if (reportName.equalsIgnoreCase("OS PS")){
			folderName = "COLLECTION";
		}
		return folderName;
	}

}
