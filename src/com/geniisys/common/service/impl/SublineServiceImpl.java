package com.geniisys.common.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.geniisys.common.dao.SublineDAO;
import com.geniisys.common.dao.impl.SublineDAOImpl;
import com.geniisys.common.entity.Subline;
import com.geniisys.common.service.SublineService;

public class SublineServiceImpl implements SublineService{
	
	private SublineDAO sublineDAO = new SublineDAOImpl();

	@Override
	public List<Subline> getAllSublineBonds() {
		return this.sublineDAO.getAllSublineBonds();
	}

	@Override
	public String getAllSublineForDataGrid(HttpServletRequest request) {
		String lineCd = request.getParameter("lineCd");
		return this.sublineDAO.getAllSublineForDataGrid(lineCd);
	}

	@Override
	public List<Subline> getAllSubline(HttpServletRequest request) throws SQLException {
		String lineCd = request.getParameter("lineCd");
		return this.sublineDAO.getAllSubline(lineCd);
	}
}
