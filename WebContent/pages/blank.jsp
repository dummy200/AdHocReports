<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>


<div id="blankDiv1">
<a href="${url}" target="_blank" id="openURL">Link</a> 
</div>
<script>
$("blankDiv1").hide();
$("openURL").click();
$("openURL").hide();
location.reload();
</script>