package com.geniisys.claims.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.geniisys.claims.controller.DemandLetterController;
import com.geniisys.claims.dao.DemandLetterDAO;
import com.geniisys.claims.dao.impl.DemandLetterDAOImpl;
import com.geniisys.claims.entity.ClaimNo;
import com.geniisys.claims.entity.DemandLetter;
import com.geniisys.claims.entity.DemandLetterInsert;
import com.geniisys.claims.entity.DemandLetterParameter;
import com.geniisys.claims.entity.DemandLetterReprint;
import com.geniisys.claims.entity.DemandLetterTbl;
import com.geniisys.claims.service.DemandLetterService;

public class DemandLetterServiceImpl implements DemandLetterService {

	private DemandLetterDAO demandLetterDAO = new DemandLetterDAOImpl();
	//DemandLetterController demandLetter = new DemandLetterController();

	public DemandLetterDAO getDemandLetterDAO() {
		return demandLetterDAO;
	}

	public void setDemandLetterDAO(DemandLetterDAO demandLetterDAO) {
		this.demandLetterDAO = demandLetterDAO;
	}

	@Override
	public List<DemandLetterParameter> fetchDemandLetterParameters(HttpServletRequest request) throws SQLException {
		ClaimNo claimNo = (ClaimNo) prepareClaimNo(request);
		return this.getDemandLetterDAO().fetchDemandLetterParameters(claimNo);
	}

	@Override
	public List<DemandLetter> populateDemandLetterInfo(HttpServletRequest request) throws SQLException {
		List<DemandLetterParameter> demandLetterList = (List<DemandLetterParameter>) fetchDemandLetterParameters(
				request);
		// System.out.println(demandLetterList.size());
		Integer listSize = demandLetterList.size();
		if (!listSize.equals(0)) {
			// System.out.println(demandLetterList.get(0).getClaimId());
			// System.out.println(demandLetterList.get(0).getRecoveryId());
			Integer claimId = demandLetterList.get(0).getClaimId();
			Integer recoveryId = demandLetterList.get(0).getRecoveryId();
			DemandLetterParameter params = new DemandLetterParameter(claimId, recoveryId);
			return this.getDemandLetterDAO().populateDemandLetterInfo(params);
		} else {
			//demandLetter.errorMsg = "No data found.";
			List<DemandLetter> noList = null;
			return noList;
		}
	}

	@Override
	public Integer checkClaimIdFromDBDemandLetter(HttpServletRequest request) throws SQLException {
		List<DemandLetter> demandLetterList = populateDemandLetterInfo(request);
		Integer claimId = demandLetterList.get(0).getClaimId();
		return this.getDemandLetterDAO().checkClaimIdFromDBDemandLetter(claimId);
	}

	@Override
	public Boolean checkIfExistsInReprint(DemandLetterReprint reprint) throws SQLException {
		return this.getDemandLetterDAO().checkIfExistsInReprint(reprint);
	}

	/*@Override
	public void insertIntoDBDemandLetter(HttpServletRequest request) throws SQLException {
		DemandLetterTbl demandLetterTab = (DemandLetterTbl) prepareDemandLetterTbl(request);
		this.getDemandLetterDAO().insertIntoDBDemandLetter(demandLetterTab);
	}*/
	
	public void insertIntoDBDemandLetter(DemandLetterInsert insertDetails,Integer claimId,String reportName) throws SQLException {
		Integer policyId = insertDetails.getPolicyId();
		String branchCd = insertDetails.getBranchCd();
		String demandType = "FIRST";
		if(reportName.equals("GICLR025_B_PCI")){
			demandType = "SECOND";
		}
		String userId = insertDetails.getUserId();
		
		DemandLetterTbl demandLetterTab = new DemandLetterTbl(claimId,
				policyId,
				"",
				checkStringIfNull(branchCd),
				"",
				"",
				checkStringIfNull(demandType),
				"",
				checkStringIfNull(userId)
				,"");
		this.getDemandLetterDAO().insertIntoDBDemandLetter(demandLetterTab);
	}

	/*@Override
	public void insertIntoDBDemandReprint(HttpServletRequest request) throws SQLException {
		DemandLetterReprint reprintTab = (DemandLetterReprint) prepareDemandLetterReprint(request);
		this.getDemandLetterDAO().insertIntoDBDemandReprint(reprintTab);
	}*/
	
	@Override
	public void insertIntoDBDemandReprint(DemandLetterInsert insertDetails,String firstPrintWordAmt,Integer claimId,String reportName,String userEmail) throws SQLException {
		String assdName = insertDetails.getAssdName();
		String policyNo = insertDetails.getPolicyNumber();
		String recoveryNo = insertDetails.getRecoveryNo();
		String lossAddr = insertDetails.getLossLoc1();
		String car1 = insertDetails.getCar1();
		String plateNo1 = insertDetails.getPlateNo1();
		String car2 = insertDetails.getCar2();
		String plateNo2 = insertDetails.getPlateNo2();
		String amtWord1 = firstPrintWordAmt;//insertDetails.getAmtWord1();
		String amtWord2 = insertDetails.getAmtWord2();
		String amtWord3 = insertDetails.getAmtWord3();
		String userId = insertDetails.getUserId();
		String contactNo = insertDetails.getContactNo();
		String branchCd = insertDetails.getBranchCd();
		String claimNo = insertDetails.getClaimNo();
		String lossDate = insertDetails.getDspLossDate();
		//String demandType = insertDetails.getDemands();
		String demandType = "FIRST";
		if(reportName.equals("GICLR025_B_PCI")){
			amtWord1 = insertDetails.getAmtWord1();
			demandType = "SECOND";
		}
		
		DemandLetterReprint demandLetterTab = new DemandLetterReprint(claimId,
				checkStringIfNull(assdName),
				checkStringIfNull(policyNo),
				checkStringIfNull(recoveryNo),
				"",
				"",
				"",
				checkStringIfNull(lossDate),
				checkStringIfNull(lossAddr),
				"",
				"", 
				checkStringIfNull(car1),
				checkStringIfNull(plateNo1), 
				checkStringIfNull(car2),
				checkStringIfNull(plateNo2), 
				checkStringIfNull(amtWord1), 
				checkStringIfNull(amtWord2), 
				checkStringIfNull(amtWord3),
				"",
				"",
				"",
				"",
				"",
				"",
				checkStringIfNull(userId),
				"",
				"",
				checkStringIfNull(demandType),
				checkStringIfNull(contactNo),
				"",
				"",
				"",
				"",
				"",
				checkStringIfNull(claimNo),
				checkStringIfNull(branchCd),
				checkStringIfNull(userId),
				checkStringIfNull(userEmail),
				"");
		
		System.out.println("demandLetterTab Type : " + demandLetterTab.getDemandType());
		this.getDemandLetterDAO().insertIntoDBDemandReprint(demandLetterTab);
	}
	
	@Override
	public DemandLetterInsert fetchFirstReportDetails(DemandLetterParameter params) throws SQLException {
		return this.getDemandLetterDAO().fetchFirstReportDetails(params);
	}
	
	@Override
	public DemandLetterInsert fetchSecondReportDetails(DemandLetterParameter params) throws SQLException {
		return this.getDemandLetterDAO().fetchSecondReportDetails(params);
	}

	@Override
	public ClaimNo prepareClaimNo(HttpServletRequest request) {
		String lineCd = request.getParameter("lineCd").toUpperCase().trim();
		String sublineCd = request.getParameter("sublineCd").toUpperCase().trim();
		String issCd = request.getParameter("issCd").toUpperCase().trim();
		Integer clmYy = Integer.parseInt(request.getParameter("clmYy").trim());
		Integer clmSeqNo = Integer.parseInt(request.getParameter("clmSeqNo").trim());

		ClaimNo claimNo = new ClaimNo(lineCd, sublineCd, issCd, clmYy, clmSeqNo);
		return claimNo;
	}

	@Override
	public DemandLetterTbl prepareDemandLetterTbl(HttpServletRequest request) {
		Integer claimId = Integer.parseInt(request.getParameter("claimId"));
		Integer policyId = Integer.parseInt(request.getParameter("policyId"));
		String extra1 = request.getParameter("extra1");
		String extra2 = request.getParameter("extra2");
		String extra3 = request.getParameter("extra3");
		String dateSend = request.getParameter("dateSend");
		String demands = request.getParameter("demands");
		String ctrlNo = request.getParameter("ctrlNo");
		String userId = request.getParameter("userId");
		String lastUpdate = request.getParameter("lastUpdate");

		DemandLetterTbl demandLetterTab = new DemandLetterTbl(claimId, policyId, extra1,extra2, extra3, dateSend,
				demands, ctrlNo, userId, lastUpdate);

		return demandLetterTab;
	}

	@Override
	public DemandLetterReprint prepareDemandLetterReprint(HttpServletRequest request) {
		Integer claimId = Integer.parseInt(request.getParameter("claimId"));
		String assdName = request.getParameter("assdName");
		String policyNo = request.getParameter("policyNo");
		String recoveryNo = request.getParameter("recoveryNo");
		String controlNo = request.getParameter("controlNo");
		String adName = request.getParameter("adName");
		String adAddr = request.getParameter("adAddr");
		String dateLoss = request.getParameter("dateLoss");
		String lossAddr1 = request.getParameter("lossAddr1");
		String lossAddr2 = request.getParameter("lossAddr2");
		String lossAddr3 = request.getParameter("lossAddr3");
		String car1 = request.getParameter("car1");
		String plateNo1 = request.getParameter("plateNo1");
		String car2 = request.getParameter("car2");
		String plateNo2 = request.getParameter("plateNo2");
		String amtWord1 = request.getParameter("amtWord1");
		String amtWord2 = request.getParameter("amtWord2");
		String amtWord3 = request.getParameter("amtWord3");
		String amtFig1 = request.getParameter("amtFig1");
		String amtFig2 = request.getParameter("amtFig2");
		String amtFig3 = request.getParameter("amtFig3");
		String notes = request.getParameter("notes");
		String signtory = request.getParameter("signtory");
		String designation = request.getParameter("designation");
		String userId = request.getParameter("userId");
		String lastUpdate = request.getParameter("lastUpdate");
		String dateSend = request.getParameter("dateSend");
		String demandType = request.getParameter("demandType");
		String contactNo = request.getParameter("contactNo");
		String signtory2 = request.getParameter("signtory2");
		String designation2 = request.getParameter("designation2");
		String adName2 = request.getParameter("adName2");
		String adAddr2 = request.getParameter("adAddr2");
		String your = request.getParameter("your");
		String claimNo = request.getParameter("claimNo");
		String branchCd = request.getParameter("branchCd");
		String userName = request.getParameter("userName");
		String forText = request.getParameter("forText");
		String conAssd = request.getParameter("conAssd");

		DemandLetterReprint reprintTab = new DemandLetterReprint(claimId, assdName, policyNo, recoveryNo, controlNo,
				adName, adAddr, dateLoss, lossAddr1, lossAddr2, lossAddr3, car1, plateNo1, car2, plateNo2, amtWord1,
				amtWord2, amtWord3, amtFig1, amtFig2, amtFig3, notes, signtory, designation, userId, lastUpdate,
				dateSend, demandType, contactNo, signtory2, designation2, adName2, adAddr2, your, claimNo, branchCd,
				userName, forText, conAssd);
		return reprintTab;
	}
	
	//check if null
			String checkStringIfNull(String string){
				String isNull = string;
				try {
					if (string.equalsIgnoreCase(null)){
						isNull = "";
					}
				} catch (NullPointerException e) {
					isNull = "";
				}
				return isNull;
			}
			
			/*Integer checkIntegerIfNull(Integer integer){
				Integer isNull = integer;
				try {
					if (intege){
						isNull = 0;
					}
				} catch (NullPointerException e) {
					isNull = 0;
				}
				return isNull;
			}*/
	

}
