<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>

<input type="hidden" id="assuredList2" name="assuredList2"
	value='${assuredList2}'>

<table style="width: 100%;">
	<%-- <tr>
		<td class="rightAligned" style="width: 25%;">Assured</td>
		<td class="leftAligned"><input id="txtAssuredName"
			name="capsField" class="leftAligned" type="text" style="width: 88%;"
			value="" title="Assured Name" disabled /> <span> <img
				src="${pageContext.request.contextPath}/images/misc/searchIcon.png"
				id="searchForAssured" name="searchForAssured" alt="Go"
				style="margin-top: 2px;" title="Search Assured" />
		</span></td>
	</tr> --%>
	<tr>
		<td class="rightAligned" style="width: 25%;">Assured</td>
		<td><div id="comboDivAssured1" style="width: 100%;"></div></td>
	</tr>
</table>

<script>
//var comboAssured;
var dataAssured = $F("assuredList2");

comboAssured = new dhtmlXCombo("comboDivAssured1");
comboAssured.load(dataAssured);
comboAssured.setFilterHandler(function(mask, option){
	var r = false;
	if (mask.length == 0) {
		r = true;
	} else if (option.text.match(new RegExp("^"+mask,"i")) != null) {
		r = true;
	}
	return r; 
});

//assdNo = comboAssured.getSelectedValue();
</script>