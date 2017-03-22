package com.geniisys.common.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.geniisys.common.dao.IntermediaryDAO;
import com.geniisys.common.dao.UrlDAO;
import com.geniisys.common.dao.impl.IntermediaryDAOImpl;
import com.geniisys.common.dao.impl.UrlDAOImpl;
import com.geniisys.common.entity.Assured;
import com.geniisys.common.entity.Intermediary;
import com.geniisys.common.entity.Url;
import com.geniisys.common.service.IntermediaryService;
import com.geniisys.common.service.UrlService;

public class UrlServiceImpl implements UrlService{
	
	private UrlDAO urlDAO = new UrlDAOImpl();

	@Override
	public String getAllUrl() throws SQLException {
		List<Url> urlList = this.urlDAO.getAllUrl();
		String urlString = "{ rows: [";
		Integer count = 1;
		if(!urlList.isEmpty()){
		for (Url url : urlList) {
			urlString = urlString + "{id:" + count + ", data: [\"" + url.getUrlNo() + "\",\""+ url.getUrlName() + "\",\""+ url.getUrl() + "\"]},";
			count++;
		}
		System.out.println("count " +count);
		urlString = urlString.substring(0, urlString.length() - 1) + "]}";
		urlString.trim();
		}else{
			urlString = "";
		}
		return urlString;
	}
	
	
}
