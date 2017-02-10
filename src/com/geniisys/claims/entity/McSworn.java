package com.geniisys.claims.entity;

import java.math.BigDecimal;

public class McSworn {
	private String claimNo;
	private String policyNo;
	private String assuredName;
	private String modelyear;
	private String motorTypeDesc;
	private String motorNo;
	private String serialNo;
	private String plateNo;
	private String lossDay;
	private String lossTime;
	private String lossMonth;
	private String inceptDate;
	private String expiryDate;
	private String totalTag;
	private BigDecimal lossAmt;
	private BigDecimal deductible;
	private BigDecimal totalAmount;
	

	public McSworn() {
	}

	public McSworn(String claimNo, String policyNo, String assuredName, String modelyear, String motorTypeDesc,
			String motorNo, String serialNo, String plateNo, String lossDay, String lossTime, String lossMonth,
			String inceptDate, String expiryDate, String totalTag, BigDecimal lossAmt, BigDecimal deductible, BigDecimal totalAmount) {
		this.claimNo = claimNo;
		this.policyNo = policyNo;
		this.assuredName = assuredName;
		this.modelyear = modelyear;
		this.motorTypeDesc = motorTypeDesc;
		this.motorNo = motorNo;
		this.serialNo = serialNo;
		this.plateNo = plateNo;
		this.lossDay = lossDay;
		this.lossTime = lossTime;
		this.lossMonth = lossMonth;
		this.inceptDate = inceptDate;
		this.expiryDate = expiryDate;
		this.lossAmt = lossAmt;
		this.deductible = deductible;
		this.totalAmount = totalAmount;
		this.totalTag = totalTag;
	}

	public String getClaimNo() {
		return claimNo;
	}

	public void setClaimNo(String claimNo) {
		this.claimNo = claimNo;
	}

	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}

	public String getAssuredName() {
		return assuredName;
	}

	public void setAssuredName(String assuredName) {
		this.assuredName = assuredName;
	}

	public String getModelyear() {
		return modelyear;
	}

	public void setModelyear(String modelyear) {
		this.modelyear = modelyear;
	}

	public String getMotorTypeDesc() {
		return motorTypeDesc;
	}

	public void setMotorTypeDesc(String motorTypeDesc) {
		this.motorTypeDesc = motorTypeDesc;
	}

	public String getMotorNo() {
		return motorNo;
	}

	public void setMotorNo(String motorNo) {
		this.motorNo = motorNo;
	}

	public String getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	public String getPlateNo() {
		return plateNo;
	}

	public void setPlateNo(String plateNo) {
		this.plateNo = plateNo;
	}

	public String getLossDay() {
		return lossDay;
	}

	public void setLossDay(String lossDay) {
		this.lossDay = lossDay;
	}

	public String getLossTime() {
		return lossTime;
	}

	public void setLossTime(String lossTime) {
		this.lossTime = lossTime;
	}

	public String getLossMonth() {
		return lossMonth;
	}

	public void setLossMonth(String lossMonth) {
		this.lossMonth = lossMonth;
	}

	public String getInceptDate() {
		return inceptDate;
	}

	public void setInceptDate(String inceptDate) {
		this.inceptDate = inceptDate;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public BigDecimal getLossAmt() {
		return lossAmt;
	}

	public void setLossAmt(BigDecimal lossAmt) {
		this.lossAmt = lossAmt;
	}

	public BigDecimal getDeductible() {
		return deductible;
	}

	public void setDeductible(BigDecimal deductible) {
		this.deductible = deductible;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}
	

	public String getTotalTag() {
		return totalTag;
	}

	public void setTotalTag(String totalTag) {
		this.totalTag = totalTag;
	}
	
}
