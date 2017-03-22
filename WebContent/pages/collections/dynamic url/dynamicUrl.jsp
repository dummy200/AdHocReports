<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="otherBondMenu">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="otherBondExit">Exit</a></li>
			</ul>
		</div>
	</div>
</div>

<!-- hidden fields -->
<input type="hidden" id="urlList" name="urlList" value='${urlList}'>
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<div id="hiddenDiv">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="reportTitle" name="reportTitle" value="${reportTitle}">
<input type="hidden" id="reportUrl" name="reportUrl" value="${reportUrl}">
<input type="hidden" id="selDestination" name="selDestination" value="screen">
<!--  -->
</div>

<br />
<br />
<div id ="outerDiv" name="outerDiv">
	<div id ="innerDiv" name="outerDiv">
		<label id="pageTitle">Dynamic Url</label>
	</div>
</div>
<div id="otherBondDetailsDiv">
	<div id="otherBondSectionDiv" class="sectionDiv" style="margin-bottom: 10px;">
		<%-- <jsp:include page="/pages/underwriting/reportsPrinting/policyCertificates/policyCertDetails.jsp"></jsp:include> --%>
	<!-- added from policyCertDetails.jsp  -->
	<br/>
	<br/>
	<table style="margin-top: 10px; width: 100%;">
		<tr>
			<td class="rightAligned" style="width: 20%;">
			</td>
			<td>
			<div id="gridbox1" style="width: 80%; height: 240px; overflow:hidden"></div>
			<input type="hidden" id="txtUrl">
			</td>
		</tr>
		<!-- <tr>
			<td class="rightAligned" style="width: 20%;">
				URL
			</td>
			<td class="leftAligned">
					<input id="txtUrl" class="leftAligned required" type="text" name="capsField" style="width: 80%;" value="" title="URL"/>
			</td>
		</tr> -->
		</table>
		<br/>
		<br/>
	</div> 
	
	<div id="otherBondButtonsDiv" align="center">
		<input type="button" class="button" style="width: 90px;" id="btnCancel" value="Cancel">
		<input type="button" class="button" style="width: 90px;" id="btnPrintReport" value="Go">
	</div>
</div>
<div id="blankDiv1">
</div>

<script type="text/javascript">
	$("hiddenDiv").hide();
	$("blankDiv1").hide();
	//makeAllInputFieldsUpperCase();
	//$("txtUrl").focus();
	var url = "";
	var oldId = "";
	
	var gridUrl;
	var urlList = $F("urlList");
	var imgPath = contextPath + '/css/codebase/imgs/';
	gridUrl = new dhtmlXGridObject('gridbox1');
	gridUrl.setImagePath(imgPath);
	gridUrl.setHeader("URL No, URL Name, URL");
	gridUrl.setInitWidths("50,200,*");
	gridUrl.setColAlign("left,left,left");
	gridUrl.setColTypes("ro,ro,ro");
	gridUrl.setColSorting("str,str,str");
	gridUrl.init();
	gridUrl.parse(urlList,"json");
	
	gridUrl.attachEvent("onRowSelect",onRowSelect);
	//gridUrl.attachEvent("onEditCell",doOnCellEdit);
	
	//select and deselect
	function onRowSelect(id,ind){
		/* var oldTxt = $F("txtUrl");
		var newTxt = gridUrl.cells(id, 2).getValue();
		
		if(oldTxt == newTxt || oldTxt != ''){
			gridUrl.clearAll();
			gridUrl.parse(urlList,"json");
			$("txtUrl").value = '';
		}else{
			url = gridUrl.cells(id, 2).getValue();
			$("txtUrl").value = gridUrl.cells(id, 2).getValue();
		} */
		if(id == oldId){
			gridUrl.clearAll();
			gridUrl.parse(urlList,"json");
			$("txtUrl").value = '';
			oldId = '';
		}else{
			url = gridUrl.cells(id, 2).getValue();
			$("txtUrl").value = gridUrl.cells(id, 2).getValue();
			oldId = id;
		} 
	}
	
	function doOnCellEdit(stage,rowId,cellInd){
		if(stage==0){
			alert("User starting cell editing: row id is"+rowId+", cell index is "+cellInd)
		}else if(stage==1){
			alert("Cell editor opened");
		}else if(stage==2){
			alert("Cell editor closed");
		}
		return true;
	}
	
	
	$("btnPrintReport").observe("click", function() {
		var url = $F("txtUrl");
		var userId = $F("userId");
		if (checkBlankNull(url)) {
			showMessageBox("Please select url","I");
		} else {
			new Ajax.Request(
					//"mainContents",
					contextPath
							+ "/DynamicUrlController",
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "goToURL",
							url : url,
							userId : userId
						},
						onCreate : showNotice("Generating report. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
							$("blankDiv1").update(response.responseText);
							//outputToPDF($F("reportUrl"), $F("reportTitle"), $F("errorMsg"));
						}
					});
		}
	});
			
	goToPage("otherBondExit","/pages/main.jsp","Please wait.....", "Home");
	goToPage("btnCancel","/pages/main.jsp","Please wait.....", "Home");
	
	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
	
</script>
