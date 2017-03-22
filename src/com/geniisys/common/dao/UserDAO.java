package com.geniisys.common.dao;

import java.sql.SQLException;
import java.util.List;

import com.geniisys.common.entity.User;
import com.geniisys.common.entity.UserAccess;

public interface UserDAO {
	String fetchUserName(String userId) throws SQLException;
	List<UserAccess> fetchUserAccess(String userId) throws SQLException;
	List<Integer> fetchUserTranCd(String userId) throws SQLException;
	List<String> fetchUserLineCdByTranCd(String userId,String tranCd) throws SQLException;
	List<String> fetchUserIssCdByTranCd(String userId,String tranCd) throws SQLException;
	List<String> fetchUserModules(String userId) throws SQLException;
	List<User> getAllUsers() throws SQLException;
	List<User> getCashierUsers() throws SQLException;
}
