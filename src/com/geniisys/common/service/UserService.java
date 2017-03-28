package com.geniisys.common.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.geniisys.common.entity.User;
import com.geniisys.common.entity.UserAccess;

public interface UserService {
	String fetchUserName(HttpServletRequest request) throws SQLException;
	List<UserAccess> fetchUserAccess(HttpServletRequest request) throws SQLException;
	List<Integer> fetchUserTranCd(HttpServletRequest request) throws SQLException;
	List<String> fetchUserLineCdByTranCd(HttpServletRequest request,String tranCd) throws SQLException;
	List<String> fetchUserIssCdByTranCd(HttpServletRequest request,String tranCd) throws SQLException;
	List<String> fetchUserModules(HttpServletRequest request) throws SQLException;
	String fetchUserAccess1(HttpServletRequest request) throws SQLException;
	List<User> getAllUsers() throws SQLException;
	List<User> getCashierUsers() throws SQLException;
}
