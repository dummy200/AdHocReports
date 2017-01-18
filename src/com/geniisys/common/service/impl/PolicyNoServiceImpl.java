package com.geniisys.common.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.geniisys.common.dao.PolicyNoDAO;
import com.geniisys.common.dao.impl.PolicyNoDAOImpl;
import com.geniisys.common.entity.PolicyNo;
import com.geniisys.common.service.PolicyNoService;

public class PolicyNoServiceImpl implements PolicyNoService{
	
	private PolicyNoDAO policyNoDAO = new PolicyNoDAOImpl();
	

	public PolicyNoDAO getPolicyNoDAO() {
		return policyNoDAO;
	}


	public void setPolicyNoDAO(PolicyNoDAO policyNoDAO) {
		this.policyNoDAO = policyNoDAO;
	}


	@Override
	public Integer getPolicyId(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
				String lineCd = request.getParameter("lineCd").toUpperCase();
				String sublineCd = request.getParameter("sublineCd").toUpperCase();
				String issCd = request.getParameter("issCd").toUpperCase();
				Integer issueYY = Integer.parseInt(request.getParameter("issueYY"));
				Integer polSeqNo = Integer.parseInt(request.getParameter("polSeqNo"));
				Integer renewNo = Integer.parseInt(request.getParameter("renewNo"));
				PolicyNo policyNo = new PolicyNo(lineCd,sublineCd,issCd,issueYY,polSeqNo,renewNo);
				return this.getPolicyNoDAO().getPolicyId(policyNo);
	}
	
	@Override
	public Integer getPolicyIdRenew(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
				String lineCd = request.getParameter("lineCd").toUpperCase();
				String sublineCd = request.getParameter("sublineCd").toUpperCase();
				String issCd = request.getParameter("issCd").toUpperCase();
				Integer issueYY = Integer.parseInt(request.getParameter("issueYY"));
				Integer polSeqNo = Integer.parseInt(request.getParameter("polSeqNo"));
				Integer renewNo = Integer.parseInt(request.getParameter("renewNo"));
				String userId = request.getParameter("userId").toUpperCase();
				Map<String, Object> params = new HashMap<>();
				params.put("lineCd", lineCd);
				params.put("sublineCd", sublineCd);
				params.put("issCd", issCd);
				params.put("issueYY", issueYY);
				params.put("polSeqNo", polSeqNo);
				params.put("renewNo", renewNo);
				params.put("userId", userId);
				System.out.println(lineCd + sublineCd + issCd + issueYY + polSeqNo + renewNo + userId);
				return this.getPolicyNoDAO().getPolicyIdRenew(params);
	}


	@Override
	public Integer getPolicyIdNonRenew(HttpServletRequest request) throws SQLException {
		String lineCd = request.getParameter("lineCd").toUpperCase();
		String sublineCd = request.getParameter("sublineCd").toUpperCase();
		String issCd = request.getParameter("issCd").toUpperCase();
		Integer issueYY = Integer.parseInt(request.getParameter("issueYY"));
		Integer polSeqNo = Integer.parseInt(request.getParameter("polSeqNo"));
		Integer renewNo = Integer.parseInt(request.getParameter("renewNo"));
		PolicyNo policyNo = new PolicyNo(lineCd,sublineCd,issCd,issueYY,polSeqNo,renewNo);
		return this.getPolicyNoDAO().getPolicyIdNonRenew(policyNo);
	}


	@Override
	public Integer getResultPolicyIdRenewal(Integer policyId,String tranCd,HttpServletRequest request) throws SQLException {
		String userId = request.getParameter("userId");
		Map<String, Object> params = new HashMap<>();
		params.put("policyId", policyId);
		params.put("userId", userId);
		params.put("tranCd", tranCd);
		return this.getPolicyNoDAO().getResultPolicyIdRenewal(params);
	}

}
