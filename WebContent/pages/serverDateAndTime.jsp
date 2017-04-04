<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>
<script type="text/javascript">
	serverDate = Date.parse("${serverDateAndTime}");
	runtimeDate();
</script>