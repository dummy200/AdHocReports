package com.geniisys.common.service.impl;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.geniisys.common.dao.Gipi_PolbasicDAO;
import com.geniisys.common.dao.impl.Gipi_PolbasicDAOImpl;
import com.geniisys.common.entity.Gipi_Polbasic;
import com.geniisys.common.entity.PolicyNo;
import com.geniisys.common.service.Gipi_PolbasicService;

public class Gipi_PolbasicServiceImpl implements Gipi_PolbasicService {
	
	private Gipi_PolbasicDAO gipi_polbasicDAO = new Gipi_PolbasicDAOImpl();

	public Gipi_PolbasicDAO getGipi_polbasicDAO() {
		return gipi_polbasicDAO;
	}

	public void setGipi_polbasicDAO(Gipi_PolbasicDAO gipi_polbasicDAO) {
		this.gipi_polbasicDAO = gipi_polbasicDAO;
	}

	@Override
	public List<Gipi_Polbasic> fetchRefPolNo(Integer policyId) throws SQLException {
		return this.getGipi_polbasicDAO().fetchRefPolNo(policyId);
		//return this.gipi_polbasicDAO.fetchRefPolNo(policyId);
	}

	@Override
	public String getBondDtl(Integer policyID) throws SQLException {
		//return this.gipi_polbasicDAO.getBondDtl(policyID);
		return this.getGipi_polbasicDAO().getBondDtl(policyID);
	}

	@Override
	public Integer fetchPolicyId(HttpServletRequest request) throws SQLException {
		String lineCd = request.getParameter("lineCd").toUpperCase().trim();
		String sublineCd = request.getParameter("sublineCd").toUpperCase().trim();
		String issCd = request.getParameter("issCd").toUpperCase().trim();
		Integer issueYY = Integer.parseInt(request.getParameter("issueYY").trim());
		Integer polSeqNo = Integer.parseInt(request.getParameter("polSeqNo").trim());
		Integer renewNo = Integer.parseInt(request.getParameter("renewNo").trim());
		PolicyNo policyNo = new PolicyNo(lineCd,sublineCd,issCd,issueYY,polSeqNo,renewNo);
		return this.getGipi_polbasicDAO().fetchPolicyId(policyNo);
	}

	@Override
	public Integer fetchTpPolicyId(HttpServletRequest request) throws SQLException {
		String lineCd = request.getParameter("lineCd").toUpperCase().trim();
		String sublineCd = request.getParameter("sublineCd").toUpperCase().trim();
		String issCd = request.getParameter("issCd").toUpperCase().trim();
		Integer issueYY = Integer.parseInt(request.getParameter("issueYY").trim());
		Integer polSeqNo = Integer.parseInt(request.getParameter("polSeqNo").trim());
		Integer renewNo = Integer.parseInt(request.getParameter("renewNo").trim());
		PolicyNo policyNo = new PolicyNo(lineCd,sublineCd,issCd,issueYY,polSeqNo,renewNo);
		return this.getGipi_polbasicDAO().fetchTpPolicy(policyNo);
	}



}
