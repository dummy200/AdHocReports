package com.geniisys.underwriting.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Line;
import com.geniisys.common.entity.Subline;
import com.geniisys.common.service.BranchService;
import com.geniisys.common.service.LineService;
import com.geniisys.common.service.SublineService;
import com.geniisys.common.service.TariffService;
import com.geniisys.common.service.impl.BranchServiceImpl;
import com.geniisys.common.service.impl.LineServiceImpl;
import com.geniisys.common.service.impl.SublineServiceImpl;
import com.geniisys.common.service.impl.TariffServiceImpl;
import com.geniisys.underwriting.service.BatchGenerationService;
import com.geniisys.underwriting.service.impl.BatchGenerationServiceImpl;
import com.google.gson.Gson;
import com.ibatis.sqlmap.client.SqlMapClient;

public class BatchGenerationController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Gson gson = new Gson();
		String action = request.getParameter("action");
		String page = "/pages/underwriting/batch generation/batchGeneration.jsp";
		String page2 = "/BatchGenerationController?action=toBatchGenerationPage";
		String errorMsg = "";
		/* request.getParameter("redirectPage"); */

		if (action.equals("toBatchGenerationPage")) {
			BranchService branchService = new BranchServiceImpl();
			LineService lineService = new LineServiceImpl();
			TariffService tariffService = new TariffServiceImpl();
				
			String branchList = (String) branchService.getAllBranches3();
			List<Line> lineCdList = (List<Line>) lineService.getAllLines();
			String tariffList = (String) tariffService.getAllTariff();
			
			request.setAttribute("branchList", branchList);
			request.setAttribute("lineCdList", lineCdList);
			request.setAttribute("tariffList", tariffList);
			request.setAttribute("pageTitle", "Batch Generation of Policy through PDF Maintenance");

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
		if(action.equals("getSublineList")){
			String redirectUrl = request.getParameter("redirectUrl");
			String selectedLineCd = request.getParameter("lineCd");
			SublineService sublineService = new SublineServiceImpl();
			String sublineCdList = (String) sublineService.getAllSublineForDataGrid(request);
			request.setAttribute("sublineCdList", sublineCdList);
			request.setAttribute("selectedLineCd", selectedLineCd);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectUrl);
			dispatcher.forward(request, response);
		}
		
		if(action.equals("saveChanges")){
			BatchGenerationService batchGenerationService = new BatchGenerationServiceImpl();
			System.out.println("saving....");
			batchGenerationService.updateTables(request);
			System.out.println("saving done.");
			/*batchGenerationService.updateGiisSubline(request);
			batchGenerationService.updateGiisIssource(request);
			batchGenerationService.updateGiisTariff(request);*/
			System.out.println(errorMsg);
			request.setAttribute("errorMsg", errorMsg);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page2);
			dispatcher.forward(request, response);
		}
	}
}
