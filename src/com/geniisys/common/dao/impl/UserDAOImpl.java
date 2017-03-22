package com.geniisys.common.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.geniisys.common.dao.UserDAO;
import com.geniisys.common.entity.User;
import com.geniisys.common.entity.UserAccess;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

public class UserDAOImpl implements UserDAO{
	private SqlMapClient sqlMap;
	

	@SuppressWarnings("unchecked")
	@Override
	public List<UserAccess> fetchUserAccess(String userId) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		List<UserAccess> userAccessList = (List<UserAccess>) sqlMap.queryForList("fetchUserAccess", userId);
		return userAccessList;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> fetchUserTranCd(String userId) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		List<Integer> userAccessList = (List<Integer>) sqlMap.queryForList("fetchUserTranCd", userId);
		return userAccessList;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<String> fetchUserLineCdByTranCd(String userId, String tranCd) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		Map<String,String> paramMap =new HashMap<String, String>();
	    paramMap.put("userId", userId);
	    paramMap.put("tranCd", tranCd);
		List<String> userAccessList = (List<String>) sqlMap.queryForList("fetchUserLineCdByTranCd", paramMap);
		return userAccessList;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<String> fetchUserIssCdByTranCd(String userId, String tranCd) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		Map<String,String> paramMap =new HashMap<String, String>();
	    paramMap.put("userId", userId);
	    paramMap.put("tranCd", tranCd);
		List<String> userAccessList = (List<String>) sqlMap.queryForList("fetchUserIssCdByTranCd", paramMap);
		return userAccessList;
	}


	public String fetchUserName(String userId) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		String userName = (String) sqlMap.queryForObject("fetchUserName", userId);
		return userName;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<String> fetchUserModules(String userId) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		List<String> userModuleList = (List<String>) sqlMap.queryForList("fetchUserModules", userId);
		return userModuleList;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		List<User> users = (List<User>) sqlMap.queryForList("getAllUsers");
		return users;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<User> getCashierUsers() throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		List<User> users = (List<User>) sqlMap.queryForList("getCashierUsers");
		return users;
	}
	
}
