package com.geniisys.collections.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.geniisys.common.entity.Employee;
import com.geniisys.common.service.EmployeeService;
import com.geniisys.common.service.impl.EmployeeServiceImpl;
import com.ibatis.sqlmap.client.SqlMapClient;

public class InquiryMetrobankController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/collections/inquiry metrobank/inquiryMetrobank.jsp";
		String page2 = "/pages/collections/inquiry metrobank/infoDiv.jsp";
		String errorMsg = "";
		
		if (action.equals("getEmployee")) {
			EmployeeService employeeService = new EmployeeServiceImpl();
			Employee employee = null;
			try {
				employee = employeeService.getEmployee(request);
			} catch (SQLException e) {
				errorMsg = e.getMessage();
			}
			request.setAttribute("employee", employee);
			request.setAttribute("errorMsg", errorMsg);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page2);
			dispatcher.forward(request, response);
		}
	}
}
