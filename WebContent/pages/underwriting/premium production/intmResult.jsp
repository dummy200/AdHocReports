<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="intmHiddenDiv">
	<input type="hidden" id="intmList" name="intmList"
		value='${intmList}'>
</div>

<div id="gridIntermediaryResult"
	style="width: 500px; height: 200px; overflow: hidden"></div>
<input type="hidden" id="txtIntermediaryNo">

<script>
var intmList = $F("intmList");
$("gridIntermediaryResult").show();
gridIntm = new dhtmlXGridObject('gridIntermediaryResult');
gridIntm.setImagePath(contextPath + '/css/codebase/imgs/');
//gridIntm.setHeader("Intm No., Intm Type, Intermediary Name");
//gridIntm.setHeader("&nbsp;,&nbsp;,&nbsp;");
//if(filterGridBy == 'DL'){
if(reportName == 'DEALERS_PROD_REP'){
	gridIntm.setHeader("Intm No.,Intm Type, Intermediary Name");
}else{
gridIntm.setHeader("Intm No.,#combo_filter, Intermediary Name");
}
gridIntm.setInitWidths("60,60,*");
gridIntm.setColAlign("left,left,left");
gridIntm.setColTypes("ro,ro,ro");
gridIntm.setColSorting("str,str,str");
gridIntm.init();
gridIntm.parse(intmList,"json");
if(reportName == 'DEALERS_PROD_REP'){
			gridIntm.filterBy(1,'DL');
		}
//gridIntm.filterBy(1,filterGridBy);
gridIntm.attachEvent("onRowSelect", function(id,ind){
	intermediaryNo = gridIntm.cells(id, 0).getValue();
	$("txtIntermediaryNo").value = gridIntm.cells(id, 0).getValue();
});
</script>