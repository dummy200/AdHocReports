package com.geniisys.common.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.geniisys.common.dao.SublineDAO;
import com.geniisys.common.entity.Subline;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

public class SublineDAOImpl implements SublineDAO{
private SqlMapClient sqlMap;

	@SuppressWarnings("unchecked")
	@Override
	public List<Subline> getAllSublineBonds() {
		List<Subline> sublineList = null;
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		try {
			sublineList =  sqlMap.queryForList("getAllSubline","SU");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sublineList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String getAllSublineForDataGrid(String lineCd) {
		String sublineList = null;
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		try {
			sublineList = (String) sqlMap.queryForObject("getAllSublineForDataGrid",lineCd);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sublineList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Subline> getAllSubline(String lineCd) throws SQLException {
		List<Subline> sublineList = null;
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		try {
			sublineList =  sqlMap.queryForList("getAllSubline",lineCd);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sublineList;
	}
}
