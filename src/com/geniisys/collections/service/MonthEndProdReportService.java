package com.geniisys.collections.service;

import java.sql.SQLException;

public interface MonthEndProdReportService {
	public String setMonthEndReportsList()throws SQLException;
	public String getFolderName(String reportName);

}
