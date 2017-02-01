package com.geniisys.common.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.geniisys.common.entity.UserAccess;
import com.geniisys.common.service.UserService;
import com.geniisys.common.service.impl.UserServiceImpl;
import com.geniisys.util.MyAppSqlConfig;
import com.google.gson.Gson;
import com.ibatis.sqlmap.client.SqlMapClient;

public class GIISUserController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String PAGE = null;
		Gson gson = new Gson();
		HttpSession session = request.getSession();
		
		if(action.equalsIgnoreCase("setReportParamsToSession")){
			String reportUrl = request.getParameter("reportUrl");
			String reportTitle = request.getParameter("reportTitle");
			PAGE = "/pages/policy issuance/renewal notice/renewalNotice.jsp";
			
			 session.setAttribute("reportUrl", reportUrl);
			 session.setAttribute("reportTitle", reportTitle);

		}
		if(action.equalsIgnoreCase("fetchUserName")){
			UserService userService = new UserServiceImpl();
			String userName = "";
			try {
				userName = userService.fetchUserName(request);
				
			} catch (SQLException e) {
				System.out.println("Error fetching username: " + e.getMessage());
			}
			//System.out.println("userName: " + userName);
			session.setAttribute("userName", userName);
			PAGE = "/pages/welcomeUser.jsp";
		}
		if(action.equalsIgnoreCase("getUserAccess")){
			UserService userService = new UserServiceImpl();
			List<UserAccess> userAccessList = null;
			List<Integer> userTranCdList = null;
			List<String> userClaimsLineCdList = null;
			List<String> userPolIssuanceLineCdList = null;
			List<String> userPolIssuanceIssCdList = null;
			List<String> userModuleList = null;
			String userAccessList1 = "";
			try {
				userAccessList = (List<UserAccess>) userService.fetchUserAccess(request);
				userTranCdList = (List<Integer>) userService.fetchUserTranCd(request);
				userClaimsLineCdList = (List<String>) userService.fetchUserLineCdByTranCd(request,"93");
				userPolIssuanceLineCdList = (List<String>) userService.fetchUserLineCdByTranCd(request,"95");
				userPolIssuanceIssCdList = (List<String>) userService.fetchUserIssCdByTranCd(request,"95");
				userModuleList = (List<String>) userService.fetchUserModules(request);
				
				userAccessList1 = userService.fetchUserAccess1(request);
			} catch (SQLException e) {
				System.out.println("Error fetching User Access: " + e.getMessage());
			}
			session.setAttribute("userAccessList", gson.toJson(userAccessList));
			session.setAttribute("userTranCdList", gson.toJson(userTranCdList));
			session.setAttribute("userClaimsLineCdList", gson.toJson(userClaimsLineCdList));
			session.setAttribute("userPolIssuanceLineCdList", gson.toJson(userPolIssuanceLineCdList));
			session.setAttribute("userPolIssuanceIssCdList", gson.toJson(userPolIssuanceIssCdList));
			session.setAttribute("userModuleList", gson.toJson(userModuleList));
			//request.setAttribute("userAccessList", userAccessList);
			
			session.setAttribute("userAccessList1", userAccessList1);
			PAGE = "/pages/userAccess.jsp";
		}
		if(action.equalsIgnoreCase("getDBName")){
			SqlMapClient sqlMap = MyAppSqlConfig.getSqlMapInstance();
			String dbName = "";
			try {
				dbName = (String) sqlMap.queryForObject("fetchDBName");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("dbName", dbName.toUpperCase());
			PAGE = "/pages/dbName.jsp";
		}
		if(action.equalsIgnoreCase("getServerDateAndTime")){
				request.setAttribute("serverDateAndTime", new java.text.SimpleDateFormat("MMM dd, yyyy HH:mm:ss").format(new java.util.Date()));
				//log.info(request.getAttribute("serverDate"));
				PAGE = "/pages/serverDateAndTime.jsp";
		}
		if(action.equalsIgnoreCase("logOut")){
			session = request.getSession();
			//PAGE = "/pages/index.jsp";
			PAGE = "/pages/logout.jsp";
			session.invalidate();
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(PAGE);
		 dispatcher.forward(request,response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
