package com.geniisys.common.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.geniisys.common.entity.Gipi_Polbasic;
import com.geniisys.common.entity.PolicyNo;

public interface Gipi_PolbasicService {
	List<Gipi_Polbasic> fetchRefPolNo(Integer policyId) throws SQLException;
	String getBondDtl(Integer policyID) throws SQLException;
	Integer fetchPolicyId(HttpServletRequest request) throws SQLException;
	Integer fetchTpPolicyId(HttpServletRequest request) throws SQLException;
	Integer fetchClgPolicyId(HttpServletRequest request) throws SQLException;
}
