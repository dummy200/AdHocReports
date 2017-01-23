package com.geniisys.common.dao;

import java.sql.SQLException;
import java.util.Map;

import com.geniisys.common.entity.PolicyNo;

public interface PolicyNoDAO {
	Integer getPolicyId(PolicyNo policyNo) throws SQLException;
	Integer getPolicyIdNonRenew(PolicyNo policyNo) throws SQLException;
	Integer getPolicyIdRenew(Map<String, Object> params) throws SQLException;
	Integer getResultPolicyIdRenewal(Map<String, Object> params) throws SQLException;
	Integer getPolicyIdNonRenewByUserId(Map<String, Object> params) throws SQLException;
}
