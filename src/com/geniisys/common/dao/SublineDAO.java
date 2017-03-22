package com.geniisys.common.dao;

import java.sql.SQLException;
import java.util.List;

import com.geniisys.common.entity.Subline;

public interface SublineDAO {
	List<Subline> getAllSublineBonds();
	String getAllSublineForDataGrid(String lineCd);
	List<Subline> getAllSubline(String lineCd) throws SQLException;
}
