package com.geniisys.common.entity;

public class Url {
	
	private String urlNo;
	private String urlName;
	private String url;
	
	public Url() {}
	
	public Url(String urlNo,String urlName, String url){
		this.urlNo = urlNo;
		this.urlName = urlName;
		this.url = url;
	}

	public String getUrlNo() {
		return urlNo;
	}

	public void setUrlNo(String urlNo) {
		this.urlNo = urlNo;
	}

	public String getUrlName() {
		return urlName;
	}

	public void setUrlName(String urlName) {
		this.urlName = urlName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
