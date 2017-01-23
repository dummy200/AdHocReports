package com.geniisys.underwriting.service.impl;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.geniisys.common.entity.Branch;
import com.geniisys.common.entity.Subline;
import com.geniisys.common.entity.Tariff;
import com.geniisys.underwriting.controller.BatchGenerationController;
import com.geniisys.underwriting.dao.BatchGenerationDAO;
import com.geniisys.underwriting.dao.impl.BatchGenerationDAOImpl;
import com.geniisys.underwriting.service.BatchGenerationService;
import com.geniisys.util.MyAppSqlConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

public class BatchGenerationServiceImpl implements BatchGenerationService {

	private BatchGenerationDAO batchGenerationDAO = new BatchGenerationDAOImpl();
	//BatchGenerationController batchGenController = new BatchGenerationController();
	private SqlMapClient sqlMap;

	@Override
	public void updateGiisIssource(HttpServletRequest request) throws SQLException {
		String issCd = request.getParameter("issCdArray");
		String intmVal = request.getParameter("intmValArray");
		String credVal = request.getParameter("credValArray");
		String[] issCdArray = issCd.split(",");
		String[] intmValArray = intmVal.split(",");
		String[] credValArray = credVal.split(",");
		String userId = request.getParameter("userId");
		System.out.println("==========updateGiisIssource============");
		for (int i = 0; i < issCdArray.length; i++) {

			String iVal = "";
			String cVal = "";
			if (intmValArray[i].equals("1")) {
				iVal = "Y";
			}
			if (credValArray[i].equals("1")) {
				cVal = "Y";
			}
			//System.out.println(issCdArray[i] + " " + iVal + " " + cVal);
			Branch branchParams = new Branch(issCdArray[i], "", iVal, cVal);
			this.batchGenerationDAO.updateGiisIssource(branchParams);

		}
		System.out.println("=========end updateGiisIssource=========");
	}

	@Override
	public void updateGiisSubline(HttpServletRequest request) throws SQLException {
		String sublineCd = request.getParameter("sublineCdArray");
		String pdfVal = request.getParameter("sublinePdfValArray");
		String lineCd = request.getParameter("lineCd");
		String[] sublineCdArray = sublineCd.split(",");
		String[] sublinePdfValArray = pdfVal.split(",");
		String userId = request.getParameter("userId");
		//System.out.println("update line cd: " + lineCd);
		System.out.println("==========updateGiisSubline============");
		for (int i = 0; i < sublineCdArray.length; i++) {

			String pdf = "";
			if (sublinePdfValArray[i].equals("1")) {
				pdf = "Y";
			}
			//System.out.println(sublineCdArray[i] + " " + pdf);
			Subline sublineParams = new Subline(lineCd, sublineCdArray[i], "", pdf);
			this.batchGenerationDAO.updateGiisSubline(sublineParams);
		}
		System.out.println("=========end updateGiisSubline=========");
	}

	@Override
	public void updateGiisTariff(HttpServletRequest request) throws SQLException{
		String tariffCd = request.getParameter("tariffCdArray");
		String pdfVal = request.getParameter("tariffPdfValArray");
		String[] tariffCdArray = tariffCd.split(",");
		String[] tariffPdfValArray = pdfVal.split(",");
		String userId = request.getParameter("userId");
		System.out.println("==========updateGiisTariff============");
		for (int i = 0; i < tariffCdArray.length; i++) {

			String pdf = "";
			if (tariffPdfValArray[i].equals("1")) {
				pdf = "Y";
			}
			//System.out.println(tariffCdArray[i] + " " + pdf);
			Tariff tariffParams = new Tariff(tariffCdArray[i], "", pdf);
			this.batchGenerationDAO.updateGiisTariff(tariffParams);
		}
		System.out.println("=========end updateGiisTariff=========");
	}

	@Override
	public void updateTables(HttpServletRequest request) {
		try {
			sqlMap = MyAppSqlConfig.getSqlMapInstance();
			sqlMap.startTransaction();
			sqlMap.startBatch();
			updateGiisIssource(request);
			updateGiisSubline(request);
			updateGiisTariff(request);
			sqlMap.executeBatch();
			sqlMap.commitTransaction();
		} catch (Exception e) {
			//batchGenController.errorMsg = e.getMessage();
			e.printStackTrace();
		} finally {
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				//batchGenController.errorMsg = e.getMessage();
				e.printStackTrace();
			}
		}
	}

}
