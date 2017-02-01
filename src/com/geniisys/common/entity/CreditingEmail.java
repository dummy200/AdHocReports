package com.geniisys.common.entity;

public class CreditingEmail {
	
	private String credBranchCd;
	private String emailAdd;
	private String primarySw;
	
	public CreditingEmail() {}
	
	public CreditingEmail(String credBranchCd,String emailAdd, String primarySw){
		this.credBranchCd = credBranchCd;
		this.emailAdd = emailAdd;
		this.primarySw = primarySw;
	}

	public String getCredBranchCd() {
		return credBranchCd;
	}

	public void setCredBranchCd(String credBranchCd) {
		this.credBranchCd = credBranchCd;
	}

	public String getEmailAdd() {
		return emailAdd;
	}

	public void setEmailAdd(String emailAdd) {
		this.emailAdd = emailAdd;
	}

	public String getPrimarySw() {
		return primarySw;
	}

	public void setPrimarySw(String primarySw) {
		this.primarySw = primarySw;
	}

}
