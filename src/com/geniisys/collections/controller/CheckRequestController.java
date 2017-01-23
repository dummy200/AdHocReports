package com.geniisys.collections.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibatis.sqlmap.client.SqlMapClient;

public class CheckRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SqlMapClient sqlMap;
	//public String errorMsg = "";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	@SuppressWarnings("static-access")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equals("toCheckRequest")) {
			String page = "http://10.20.39.122/intertrade/intertrade_request.php?useraccess=";
			HttpSession session = request.getSession();

			//String userId = (String) session.getAttribute("adhocUser");
			String userId = request.getParameter("userId");
			
			//System.out.println(toMd5(userId));

			//request.setAttribute("url", page + toMd5(userId));
			request.setAttribute("url", page + userId);
			System.out.println(page + userId);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/blank.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	private String toMd5(String userId){

        MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        md.update(userId.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        //System.out.println("Digest(in hex format):: " + sb.toString());

        //convert the byte to hex format method 2
        StringBuffer hexString = new StringBuffer();
    	for (int i=0;i<byteData.length;i++) {
    		String hex=Integer.toHexString(0xff & byteData[i]);
   	     	if(hex.length()==1) hexString.append('0');
   	     	hexString.append(hex);
    	}
    	hexString.insert(10, "G");
    	//System.out.println("Digest(in hex format):: " + hexString.toString());
    	
    	return hexString.toString();
	}
}
