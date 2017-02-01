package com.geniisys.common.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.geniisys.common.dao.BranchDAO;
import com.geniisys.common.dao.IntermediaryDAO;
import com.geniisys.common.dao.UrlDAO;
import com.geniisys.common.entity.Assured;
import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Intermediary;
import com.geniisys.common.entity.Url;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

public class UrlDAOImpl implements UrlDAO{
private SqlMapClient sqlMap;

	@SuppressWarnings("unchecked")
	@Override
	public List<Url> getAllUrl() throws SQLException {
		List<Url> urlList = null;
		sqlMap = MyAppSqlConfig.getSqlMapInstance();

		try {
			urlList =  sqlMap.queryForList("getAllUrl");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return urlList;
	}
}
