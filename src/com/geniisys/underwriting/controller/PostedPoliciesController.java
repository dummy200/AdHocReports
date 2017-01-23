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

import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Signatory;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.SignatoryService;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.common.service.impl.SignatoryServiceImpl;
import com.ibatis.sqlmap.client.SqlMapClient;

public class PostedPoliciesController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String page = "/pages/underwriting/posted policy/postedPolicy.jsp";
		String page2 = "/PostedPoliciesController?action=toPostedPolicyPage";
		String reportName = "FCLTOTOFFR";
		String errorMsg = "";
		/* request.getParameter("redirectPage"); */

		if (action.equals("toPostedPolicyPage")) {
			BranchService branchService = new BranchServiceImpl();
			List<Branch> branchList = (List<Branch>) branchService.getAllBranches();
			request.setAttribute("branchList", branchList);
			
			request.setAttribute("pageTitle", "Posted Policies Per User");
			request.setAttribute("reportName", reportName);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
	}
}
