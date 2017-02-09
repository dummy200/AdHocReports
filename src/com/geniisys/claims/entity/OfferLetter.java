package com.geniisys.claims.entity;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Locale;

public class OfferLetter {
	private Integer claimId;
	private String claimNo;
	private Integer assdNo;
	private String accidentOf;
	private String assdName;
	private String assdAddress;
	private String userId;
	private String motorNo;
	private String plateNo;
	private String serialNo;
	private String insuredUnit;
	private BigDecimal lossAmt;
	private BigDecimal dedAmt;
	private BigDecimal netTotal;
	private String checkVoucher;

	public OfferLetter() {
	}

	public OfferLetter(Integer claimId, String claimNo, Integer assdNo, String accidentOf, String assdName,
			String assdAddress, String userId, String motorNo, String plateNo, String serialNo, String insuredUnit,
			BigDecimal lossAmt, BigDecimal dedAmt, BigDecimal netTotal,String checkVoucher) {
		this.claimId = claimId;
		this.claimNo = claimNo;
		this.assdNo = assdNo;
		this.accidentOf = accidentOf;
		this.assdName = assdName;
		this.assdAddress = assdAddress;
		this.userId = userId;
		this.motorNo = motorNo;
		this.plateNo = plateNo;
		this.serialNo = serialNo;
		this.insuredUnit = insuredUnit;
		this.lossAmt = lossAmt;
		this.dedAmt = dedAmt;
		this.netTotal = netTotal;
		this.checkVoucher = checkVoucher;
	}

	public Integer getClaimId() {
		return claimId;
	}

	public void setClaimId(Integer claimId) {
		this.claimId = claimId;
	}

	public String getClaimNo() {
		return claimNo;
	}

	public void setClaimNo(String claimNo) {
		this.claimNo = claimNo;
	}

	public Integer getAssdNo() {
		return assdNo;
	}

	public void setAssdNo(Integer assdNo) {
		this.assdNo = assdNo;
	}

	public String getAccidentOf() {
		return accidentOf;
	}

	public void setAccidentOf(String accidentOf) {
		this.accidentOf = accidentOf;
	}

	public String getAssdName() {
		return assdName;
	}

	public void setAssdName(String assdName) {
		this.assdName = assdName;
	}

	public String getAssdAddress() {
		return assdAddress;
	}

	public void setAssdAddress(String assdAddress) {
		this.assdAddress = assdAddress;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMotorNo() {
		return motorNo;
	}

	public void setMotorNo(String motorNo) {
		this.motorNo = motorNo;
	}

	public String getPlateNo() {
		return plateNo;
	}

	public void setPlateNo(String plateNo) {
		this.plateNo = plateNo;
	}

	public String getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	public String getInsuredUnit() {
		return insuredUnit;
	}

	public void setInsuredUnit(String insuredUnit) {
		this.insuredUnit = insuredUnit;
	}

	public BigDecimal getLossAmt() {
		int val = 0;
		if (lossAmt != null){
			return lossAmt.setScale(2, BigDecimal.ROUND_DOWN);
		}else{
			return lossAmt = BigDecimal.valueOf(val);
		}
		
		//DecimalFormat df = new DecimalFormat("#,##0.00");
		//return new BigDecimal(df.format((lossAmt)));
	}

	public void setLossAmt(BigDecimal lossAmt) {
		this.lossAmt = lossAmt;
	}

	public BigDecimal getDedAmt() throws ParseException {
		//return dedAmt.setScale(2, BigDecimal.ROUND_DOWN);
		int val = 0;
		if (dedAmt != null){
			return dedAmt.setScale(2, BigDecimal.ROUND_DOWN);
		}else{
			return dedAmt = BigDecimal.valueOf(val);
		}
	}

	public void setDedAmt(BigDecimal dedAmt) {
		this.dedAmt = dedAmt;
	}

	public BigDecimal getNetTotal() {
		//DecimalFormat df = new DecimalFormat("#,###,##0.00");
	     //System.out.println(df.format(new BigDecimal(123456.75)));
		//return new BigDecimal(df.format((netTotal)));
		//return netTotal.setScale(2, BigDecimal.ROUND_DOWN);
		int val = 0;
		if (netTotal != null){
			return netTotal.setScale(2, BigDecimal.ROUND_DOWN);
		}else{
			return netTotal = BigDecimal.valueOf(val);
		}
	}

	public void setNetTotal(BigDecimal netTotal) {
		this.netTotal = netTotal;
	}

	public String getCheckVoucher() {
		return checkVoucher;
	}

	public void setCheckVoucher(String checkVoucher) {
		this.checkVoucher = checkVoucher;
	}
}
