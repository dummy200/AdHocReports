package com.geniisys.collections.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.geniisys.collections.dao.RegularReportsDAO;
import com.geniisys.common.entity.RegularReport;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

public class RegularReportsDAOImpl implements RegularReportsDAO{
	
	private SqlMapClient sqlMap =  MyAppSqlConfig.getSqlMapInstance();

	@SuppressWarnings("unchecked")
	@Override
	public List<RegularReport> getReportList() throws SQLException {
		List<RegularReport> regReportList = sqlMap.queryForList("getReportList");
		return regReportList;
	}

}
