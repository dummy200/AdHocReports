package com.geniisys.collections.dao;

import java.sql.SQLException;
import java.util.List;

import com.geniisys.common.entity.RegularReport;

public interface RegularReportsDAO {
	public List<RegularReport> getReportList() throws SQLException;

}
