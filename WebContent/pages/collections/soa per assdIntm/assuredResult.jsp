<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>

<div id="assuredHiddenDiv">
	<input type="hidden" id="assuredList" name="assuredList"
		value='${assuredList}'>
</div>

<div id="gridAssuredResult"
	style="width: 90%; height: 200px; overflow: hidden"></div>
<input type="hidden" id="txtAssuredNo">

<script>
var assuredList = $F("assuredList")

gridAssured = new dhtmlXGridObject('gridAssuredResult');
gridAssured.setImagePath(contextPath + '/css/codebase/imgs/');
gridAssured.setHeader("Assured No., Assured Name");
gridAssured.setInitWidths("60,*");
gridAssured.setColAlign("left,left");
gridAssured.setColTypes("ro,ro");
gridAssured.setColSorting("str,str");
gridAssured.init();
gridAssured.parse(assuredList,"json");

gridAssured.attachEvent("onRowSelect", function(id,ind){
	assdNo = gridAssured.cells(id, 0).getValue();
	$("txtAssuredNo").value = gridAssured.cells(id, 0).getValue();
});
</script>