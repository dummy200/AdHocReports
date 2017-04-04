<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>
<input type="hidden" id="errorMsg2" name="errorMsg2" value="${fetchPolicyIdErrorMsg}">

<table style="margin-top: 0px; width: 100%;">

<tr>
	<c:if test="${assured eq null}">
		<td class="rightAligned" style="width: 25%;">Assured</td>
		<td class="leftAligned"><input id="txtAssured" class="leftAligned" type="text" name="capsField" 
			style="width: 80%;" title="Assured" disabled/></td>
	</c:if>
</tr>
<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;">Incept Date</td>
		<td class="leftAligned"><input id="txtInceptDate" class="leftAligned" type="text" name="intField"  
			style="width: 10%;" title="Incept Date" disabled/>
	</c:if>
	<c:if test="${Gipi_Polbasic eq null}">
		Expiry Date<input id="txtExpiryDate" class="leftAligned" type="text" name="capsField" 
			style="width: 10%;" title="Expiry Date" disabled/>
	</c:if>
	<c:if test="${Gipi_Polbasic eq null}">
		Issue Date<input id="txtIssueDate" class="leftAligned" type="text" name="capsField" 
			style="width: 10%;" title="Issue Date" disabled/>
	</c:if>
</tr>
<tr>
	<c:forEach var="assured" items="${assured}">
		<td class="rightAligned" style="width: 25%;">Assured</td>
		<td class="leftAligned"><input id="txtAssured" class="leftAligned" type="text" name="capsField" 
			style="width: 80%;" value="${assured.assdName}" title="Assured" disabled/></td>
	</c:forEach>
</tr>
<tr>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Incept Date</td>
		<td class="leftAligned"><input id="txtInceptDate" class="leftAligned" type="text" name="intField"  
			style="width: 10%;"  value="${Gipi_Polbasic.inceptDate}" title="Incept Date" disabled/>
	</c:forEach>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		Expiry Date<input id="txtExpiryDate" class="leftAligned" type="text" name="capsField" 
			style="width: 10%;" value="${Gipi_Polbasic.expiryDate}" title="Expiry Date" disabled/>
	</c:forEach>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		Issue Date<input id="txtIssueDate" class="leftAligned" type="text" name="capsField" 
			style="width: 10%;" value="${Gipi_Polbasic.issueDate}" title="Issue Date" disabled/>
	</c:forEach>
</tr>
</table>

<script type="text/javascript">
var errorMsg2 = $F("errorMsg2");
if (!checkBlankNull(errorMsg2)) {
	if (checkBlankNull(errorMsg)){
		showMessageBox(errorMsg,"E");
	}else
		showMessageBox(errorMsg2,"E");
	$("btnPrintReport").disable();
} else
	$("btnPrintReport").enable();
</script>