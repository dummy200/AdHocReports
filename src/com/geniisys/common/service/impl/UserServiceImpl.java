package com.geniisys.common.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.geniisys.common.dao.UserDAO;
import com.geniisys.common.dao.impl.UserDAOImpl;
import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Tariff;
import com.geniisys.common.entity.User;
import com.geniisys.common.entity.UserAccess;
import com.geniisys.common.service.UserService;

public class UserServiceImpl implements UserService{
	
	private UserDAO userDAO = new UserDAOImpl();

	@Override
	public List<UserAccess> fetchUserAccess(HttpServletRequest request) throws SQLException {
		String userId = request.getParameter("userId");
		return this.userDAO.fetchUserAccess(userId);
	}

	@Override
	public List<Integer> fetchUserTranCd(HttpServletRequest request) throws SQLException {
		String userId = request.getParameter("userId");
		return this.userDAO.fetchUserTranCd(userId);
	}

	@Override
	public List<String> fetchUserLineCdByTranCd(HttpServletRequest request,String tranCd) throws SQLException {
		String userId = request.getParameter("userId");
		//String tranCd = request.getParameter("tranCd");
		return this.userDAO.fetchUserLineCdByTranCd(userId, tranCd);
	}

	@Override
	public List<String> fetchUserIssCdByTranCd(HttpServletRequest request, String tranCd) throws SQLException {
		String userId = request.getParameter("userId");
		//String tranCd = request.getParameter("tranCd");
		return this.userDAO.fetchUserIssCdByTranCd(userId, tranCd);
	}

	@Override
	public String fetchUserName(HttpServletRequest request) throws SQLException {
		String userId = request.getParameter("userId");
		return this.userDAO.fetchUserName(userId);
	}

	@Override
	public List<String> fetchUserModules(HttpServletRequest request) throws SQLException {
		String userId = request.getParameter("userId");
		return this.userDAO.fetchUserModules(userId);
	}

	@Override
	public String fetchUserAccess1(HttpServletRequest request) throws SQLException {
		String userId = request.getParameter("userId");
		List<UserAccess> userAccess = this.userDAO.fetchUserAccess(userId);
		//{"tranCd":1,"lineCd":"EN","issCd":"AG"}
		String str = "{userAccess :[";
		Integer count = 1;
		for (UserAccess user: userAccess) {
			str = str + "{tranCd: "+ user.getTranCd() +
								 ",lineCd:"+user.getLineCd() +
								 ",issCd:"+ user.getIssCd() +
								 "]},";
		}
		str = str.substring(0, str.length() - 1) + "]}";
		str.trim();
		return str;
	}

	@Override
	public List<User> getAllUsers() throws SQLException {
		return this.userDAO.getAllUsers();
	}

	@Override
	public List<User> getCashierUsers() throws SQLException {
		 return this.userDAO.getCashierUsers();
	}
	
}
