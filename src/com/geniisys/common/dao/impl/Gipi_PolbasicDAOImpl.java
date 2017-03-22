package com.geniisys.common.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.geniisys.common.dao.Gipi_PolbasicDAO;
import com.geniisys.common.entity.Gipi_Polbasic;
import com.geniisys.common.entity.PolicyNo;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

public class Gipi_PolbasicDAOImpl implements Gipi_PolbasicDAO{
	private static SqlMapClient sqlMap;

	@SuppressWarnings("unchecked")
	@Override
	public List<Gipi_Polbasic> fetchRefPolNo(Integer policyId) throws SQLException {
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
		
			List<Gipi_Polbasic> gipiPolbasic = (List<Gipi_Polbasic>) sqlMap.queryForList("fetchRefPolNo", policyId);
			return gipiPolbasic;
		}

	@Override
	public String getBondDtl(Integer policyID) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		String bondDtl = (String) sqlMap.queryForObject("getBondDtl", policyID);
		return bondDtl;
	}

	@Override
	public Integer fetchPolicyId(PolicyNo policyNo) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		Integer policyId = (Integer) sqlMap.queryForObject("onePagerFetchPolicyId", policyNo);
		return policyId;
	}

	@Override
	public Integer fetchTpPolicyId(PolicyNo policyNo) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		Integer policyId = (Integer) sqlMap.queryForObject("fetchTpPolicyId", policyNo);
		return policyId;
	}

	@Override
	public Integer fetchClgPolicyId(PolicyNo policyNo) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		Integer policyId = (Integer) sqlMap.queryForObject("fetchClgPolicyId", policyNo);
		return policyId;
	}

	@Override
	public Integer fetchRegPolicyId(Map<String, Object> params) throws SQLException {
		sqlMap = MyAppSqlConfig.getSqlMapInstance();
		Integer policyId = (Integer) sqlMap.queryForObject("fetchRegPolicyId", params);
		return policyId;
	}
	
	}
