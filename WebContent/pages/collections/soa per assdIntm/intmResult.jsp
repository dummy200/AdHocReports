<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>

<div id="intmHiddenDiv">
	<input type="hidden" id="intmList" name="intmList"
		value='${intmList}'>
</div>

<div id="gridIntermediaryResult"
	style="width: 90%; height: 200px; overflow: hidden"></div>
<input type="hidden" id="txtIntermediaryNo">

<script>
var intmList = $F("intmList");

gridIntm = new dhtmlXGridObject('gridIntermediaryResult');
gridIntm.setImagePath(contextPath + '/css/codebase/imgs/');
//gridIntm.setHeader("Intm No., Intm Type, Intermediary Name");
//gridIntm.setHeader("&nbsp;,&nbsp;,&nbsp;");
gridIntm.setHeader("Intm No.,#combo_filter, Intermediary Name");
gridIntm.setInitWidths("60,60,*");
gridIntm.setColAlign("left,left,left");
gridIntm.setColTypes("ro,ro,ro");
gridIntm.setColSorting("str,str,str");
gridIntm.init();
gridIntm.enableSmartRendering(true);
gridIntm.parse(intmList,"json");

gridIntm.attachEvent("onRowSelect", function(id,ind){
	intermediaryNo = gridIntm.cells(id, 0).getValue();
	$("txtIntermediaryNo").value = gridIntm.cells(id, 0).getValue();
});
</script>