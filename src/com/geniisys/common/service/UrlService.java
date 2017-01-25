package com.geniisys.common.service;

import java.sql.SQLException;
import java.util.List;

import com.geniisys.common.entity.Url;

public interface UrlService {
	String getAllUrl() throws SQLException;
}
