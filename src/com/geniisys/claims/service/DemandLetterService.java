package com.geniisys.claims.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.geniisys.claims.entity.ClaimNo;
import com.geniisys.claims.entity.DemandLetter;
import com.geniisys.claims.entity.DemandLetterInsert;
import com.geniisys.claims.entity.DemandLetterParameter;
import com.geniisys.claims.entity.DemandLetterReprint;
import com.geniisys.claims.entity.DemandLetterTbl;

public interface DemandLetterService {
	List<DemandLetterParameter> fetchDemandLetterParameters(HttpServletRequest request) throws SQLException;
	List<DemandLetter> populateDemandLetterInfo(HttpServletRequest request) throws SQLException;
	Integer checkClaimIdFromDBDemandLetter(HttpServletRequest request) throws SQLException;
	Boolean checkIfExistsInReprint(DemandLetterReprint reprint) throws SQLException;
	void insertIntoDBDemandLetter(DemandLetterInsert insertDetails,Integer claimId,String reportName) throws SQLException;
	void insertIntoDBDemandReprint(DemandLetterInsert insertDetails,String firstPrintWordAmt,Integer claimId,String reportName,String userEmail) throws SQLException;
	DemandLetterInsert fetchFirstReportDetails(DemandLetterParameter params) throws SQLException;
	DemandLetterInsert fetchSecondReportDetails(DemandLetterParameter params) throws SQLException;
	
	ClaimNo prepareClaimNo(HttpServletRequest request);
	DemandLetterTbl prepareDemandLetterTbl(HttpServletRequest request);
	DemandLetterReprint prepareDemandLetterReprint(HttpServletRequest request);
}
