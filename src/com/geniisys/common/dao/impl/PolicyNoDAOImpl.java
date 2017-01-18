package com.geniisys.common.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.geniisys.common.dao.PolicyNoDAO;
import com.geniisys.common.entity.PolicyNo;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

public class PolicyNoDAOImpl implements PolicyNoDAO {
	private SqlMapClient sqlMap;

	@Override
	public Integer getPolicyId(PolicyNo policyNo) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		Integer policyId = (Integer) sqlMap.queryForObject("getPolicyId", policyNo);
		return policyId;
	}

	@Override
	public Integer getPolicyIdNonRenew(PolicyNo policyNo) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		Integer policyId = (Integer) sqlMap.queryForObject("getPolicyIdNonRenew", policyNo);
		return policyId;
	}
	
	public Integer getPolicyIdRenew(Map<String, Object> params) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		Integer policyId = (Integer) sqlMap.queryForObject("getPolicyIdRenewalNotice", params);
		return policyId;
	}

	@Override
	public Integer getResultPolicyIdRenewal(Map<String, Object> params) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		Integer policyId = (Integer) sqlMap.queryForObject("getResultPolicyIdRenewal", params);
		return policyId;
	}
}
