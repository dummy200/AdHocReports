<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
</script>
<title>GENIISYS - General Insurance Information System - Home</title>
<!-- load all js & css first... -->
<jsp:include page="head.jsp"></jsp:include>
<link id="commonCss"
	href="${pageContext.request.contextPath}/css/theme_colors/common-darkblue.css"
	rel="stylesheet" type="text/css" />
<link id="menuCss" rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/theme_colors/ddsmoothmenu-darkblue.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ajaxTags.css"
	type="text/css" media="screen" />
</head>
<body id="mainBody">

	<!-- NOTICE 'TO FOR LOADING - whofeih 07.07.2010-->
	<div style="float: left; height: 100%; width: 100%; background-color: #000; margin: 0; position: fixed; left: 0; top: 0; opacity: 0.4; z-index: 90000000; display: none;" id="noticeOverlay"></div>
	<div id="notice" name="notice" style="color: gray; position: fixed; font-size: 11px; padding: 5px; width: 30%; -moz-border-radius: 5px; -webkit-border-radius: 3px;	border-radius: 3px; float: left; margin: 200px 30%; z-index: 90000001; padding: 20px 0; border: 3px solid #fff; background-color: #e8e8e8; opacity: 0.8; display: none;">
		<table align="center">
			<tr id="noticeLoadingImg">
				<td style="text-align: center;">
					<img src="${contextPath}/images/misc/loading3.gif" />
				</td>
			</tr>
			<tr>
				<td style="text-align: center; font-size: 11px;"><label id="noticeMessage" style="width: 100%; text-align: center;"></label></td>
			</tr>
		</table>
	</div>
	
	
	<!-- START OF MAIN DIV-->
	<div id="mainContainerDiv">
	
		<div id="topDiv">
			<div id="siteBanner">
				<jsp:include page="/pages/top.jsp" />
			</div>
		</div>
		
		<div id="dynamicDiv">
			<jsp:include page="/pages/main.jsp" />
		</div>
		
		<div id="footer">
			<jsp:include page="/pages/footer.jsp"></jsp:include>
		</div>
		
	</div>
	<!-- END OF MAIN DIV -->
	
	<div id="opaqueOverlay" style="position: fixed;"></div>
	<div id="contentHolder" name="contentHolder" src=""></div>
</body>
</html>
