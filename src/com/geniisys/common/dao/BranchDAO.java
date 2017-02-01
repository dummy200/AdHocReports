package com.geniisys.common.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.CreditingEmail;

public interface BranchDAO {
	List<Branch> getAllBranches();
	List<Branch> getAllBranches2();
	List<Branch> getAllBranchesByUserAndTranCd(Map<String,Object> params) throws SQLException;
	String getAllBranches3();
	List<CreditingEmail> fetchCredBranchEmail(String branchCd) throws SQLException;
	void updateCreditingEmail(Map<String,Object> params) throws SQLException;
	void insertCreditingEmail(Map<String,Object> params) throws SQLException;
}
