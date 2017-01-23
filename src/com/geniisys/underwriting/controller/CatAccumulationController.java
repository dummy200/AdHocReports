package com.geniisys.underwriting.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.geniisys.common.entity.Signatory;
import com.geniisys.common.service.SignatoryService;
import com.geniisys.common.service.impl.SignatoryServiceImpl;
import com.ibatis.sqlmap.client.SqlMapClient;

public class CatAccumulationController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/underwriting/CAT/catAccumulation.jsp";
		String page2 = "/CatAccumulationController?action=toCATAccumulationPage";
		String reportName = "FCLTOTOFFR";
		String errorMsg = "";
		/* request.getParameter("redirectPage"); */

		if (action.equals("toCATAccumulationPage")) {
			SignatoryService signatoryService = new SignatoryServiceImpl();
			try {
				List<Signatory> signatoryList = (List<Signatory>) signatoryService.getAllActiveSignatory();
				request.setAttribute("signatoryList", signatoryList);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("pageTitle", "CAT Accumulation");
			request.setAttribute("reportName", reportName);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
	}
}
