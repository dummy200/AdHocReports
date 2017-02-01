package com.geniisys.common.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.geniisys.common.dao.BranchDAO;
import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.CreditingEmail;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

public class BranchDAOImpl implements BranchDAO{
private SqlMapClient sqlMap;
	
	@SuppressWarnings("unchecked")
	public List<Branch> getAllBranches() {
		List<Branch> branches = null;
		sqlMap = MyAppSqlConfig.getSqlMapInstance();

		try {
			branches =  sqlMap.queryForList("getAllBranches");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return branches;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Branch> getAllBranches2() {
		List<Branch> branches = null;
		sqlMap = MyAppSqlConfig.getSqlMapInstance();

		try {
			branches =  sqlMap.queryForList("getAllBranches2");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return branches;
	}

	@Override
	public String getAllBranches3() {
		String branchList = null;
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		try {
			branchList = (String) sqlMap.queryForObject("getAllBranches3");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return branchList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Branch> getAllBranchesByUserAndTranCd(Map<String, Object> params) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		List<Branch> branchList = sqlMap.queryForList("getAllBranchesByUserAndTranCd",params);
		return branchList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CreditingEmail> fetchCredBranchEmail(String branchCd) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		List<CreditingEmail> emailList = sqlMap.queryForList("fetchCredBranchEmail",branchCd);
		return emailList;
	}

	@Override
	public void updateCreditingEmail(Map<String,Object> params) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		sqlMap.update("updateCreditingEmail", params);
	}

	@Override
	public void insertCreditingEmail(Map<String, Object> params) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		sqlMap.insert("insertCreditingEmail", params);
	}
}
