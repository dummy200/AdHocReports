<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<div id="siteBanner1" style="width: 100.2%;">
	<div id="siteBanner2">
		<img id="imgBanner"
			src="${pageContext.request.contextPath}/images/misc/geniisys-logo-banner.png"
			style="float: left; height: 70%; margin: 10px 0 20px 0; cursor: pointer;"
			alt="" />
			<!-- client banner here -->
			<%-- <img
			src="${pageContext.request.contextPath}/images/banner/${clientBanner}"
			style="height: 60px; margin: 5px 0 0 35px; float: left;" alt=" " /> --%>
	</div>
	<div id="welcomeUser">
		<span id="welcomeUserDiv">
		</span>
	</div>
</div>

<script type="text/javascript">
getUserName($F("userId"));
</script>