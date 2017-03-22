package com.geniisys.common.dao;

import java.sql.SQLException;
import java.util.List;

import com.geniisys.common.entity.Url;

public interface UrlDAO {
	List<Url> getAllUrl() throws SQLException;
}
