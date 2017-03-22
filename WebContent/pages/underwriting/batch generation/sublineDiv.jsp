<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<div id="hiddenDiv">
<input type="hidden" id="selectedLineCd" name="selectedLineCd" value="${selectedLineCd}">
<input type="hidden" id="sublineCdList" name="sublineCdList"
	value='${sublineCdList}'>
</div>
<input type="hidden" id="lineCdList" name="lineCdList"
	value='${lineCdList}'>

<table>
<tr>
<td>Line</td>
<td><select name="seLLineCd" id="seLLineCd">
	<!-- <option value=""></option> -->
	<c:forEach var="line" items="${ lineCdList }">
		<option value="${line.lineCd}">${line.lineName}</option>
	</c:forEach>
	</select> <!-- <input id="txtLineName" name="capsField" class="leftAligned"
	type="text" value="" title="Line Name"disabled /> -->
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Check/Uncheck All: <input type="checkbox" id="checkSubline" name="checkSubline" value="">
</td>
</tr>
<tr>
<td colspan = "2">
	<div id="gridbox" style="width:450px; height: 270px; overflow:hidden"></div>
</td>
</tr>
</table>

<script>
var sublineList = "";
//var gridSubline;
var data={ rows: []};
var selected1 = $("seLLineCd").getValue();
//getLineName(selected1,"txtLineName");
getSublineList(selected1);

gridSubline = new dhtmlXGridObject('gridbox');
gridSubline.setImagePath(contextPath + '/css/codebase/imgs/');
gridSubline.setHeader("Subline Code, Subline Name, PDF");
gridSubline.setInitWidths("78,*,30");
gridSubline.setColAlign("left,left,left");
gridSubline.setColTypes("ro,ro,ch");
gridSubline.setColSorting("str,str,str");
gridSubline.init();
gridSubline.parse(data,"json");



$("seLLineCd").observe("change", function(){
	var selected = $("seLLineCd").getValue();
	//getLineName(selected,"txtLineName");
	getSublineList(selected);
	if($("checkSubline").checked){
		$("checkSubline").click();
	}
});

function getSublineList(value){
	new Ajax.Updater(
			"hiddenDiv",
			contextPath + "/BatchGenerationController",
			{
				evalScripts : true,
				method : "POST",
				parameters : {
					action : "getSublineList",
					redirectUrl : "/pages/underwriting/batch generation/sublineListDiv.jsp",
					lineCd : value
				},
				//onCreate : showNotice("Retrieving data. Please wait..."),
				onComplete : function(response) {
					hideNotice("");
					sublineList = $F("sublineCdList");
					populateGridSubline(sublineList);
				}
			}); 
}

function populateGridSubline(value){
	
	gridSubline = new dhtmlXGridObject('gridbox');
	gridSubline.setImagePath(contextPath + '/css/codebase/imgs/');
	gridSubline.setHeader("Subline Code, Subline Name, PDF");
	gridSubline.setInitWidths("78,*,30");
	gridSubline.setColAlign("left,left,left");
	gridSubline.setColTypes("ro,ro,ch");
	gridSubline.setColSorting("str,str,str");
	gridSubline.init();
	gridSubline.parse(value,"json");
}
 
function getLineName(selected,txtLineName){
	var lineCd = [
	                 <c:forEach var="line" items="${lineCdList}" varStatus="loop">
	                   "${line.lineCd}"
	                   <c:if test="${!loop.last}">,</c:if>
	                 </c:forEach>
	               ];
	var lineName = [
	                 <c:forEach var="line" items="${lineCdList}" varStatus="loop">
	                   "${line.lineName}"
	                   <c:if test="${!loop.last}">,</c:if>
	                 </c:forEach>
	               ];
	var sName = '';
	var subCd = '';
	for (var i = 0; i < lineCd.length; i++) {
	if (selected == lineCd[i]) {
		sName = lineName[i];
		subCd = lineCdList[i];
	}
	}
	$(txtLineName).writeAttribute("value",sName);
	}
	
var isCheckedSubline = 1;
$('checkSubline').observe('click', function(e) {
	toggleSubline();
});

function toggleSubline(){
	if(isCheckedSubline == 1){
		for (var i=0; i<gridSubline.getRowsNum(); i++){
			gridSubline.cellById(i+1,2).setValue("1");
		}
		isCheckedSubline = 2;
	}else{
		for (var i=0; i<gridSubline.getRowsNum(); i++){
			gridSubline.cellById(i+1,2).setValue("0");
		}
		isCheckedSubline = 1;
	}
}
</script>