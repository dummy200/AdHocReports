<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/* #selIntm option {
	width: 400px;
} */

/* #selAssd option {
	width: 340px;
} */
#selMonth option {
	width: 100%;
}
</style>

<div id="menuDiv">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="btnExit">Exit</a></li>
			</ul>
		</div>
	</div>
</div>


<!-- hidden fields -->
<input type="hidden" id="page" name="page" value="${page}">
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<div id="hiddenDiv">
	<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
	<input type="hidden" id="reportTitle" name="reportTitle"
		value="${reportTitle}"> <input type="hidden" id="reportName"
		name="reportName" value="${reportName}"> <input type="hidden"
		id="reportUrl" name="reportUrl" value="${reportUrl}"> <input
		type="hidden" id="reportXls" name="reportXls" value="${reportXls}">
	<input type="hidden" id="outputType" name="outputType"
		value="${outputType}"> <input type="hidden"
		id="selDestination" name="selDestination" value="screen">
</div>

<%-- <input type="hidden" id="assuredList2" name="assuredList2" value='${assuredList2}'> --%>
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Statement of Account</label>
	</div>
</div>
<div id="SOADetailsDiv">
	<div id="SOASectionDiv" class="sectionDiv" style="margin-bottom: 10px;">
		<div class="sectionDiv" id="SOAMainDiv"
			style="width: 90%; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				
				<!-- report type div -->
				<div class="sectionDiv" id="reportTypeDiv"
					style="width: 100%; margin-left: 10%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td></td>
						</tr>
						<tr>
							<td style="width: 20%;"><b>SOA Type</b></td>
						</tr>
						<tr>
							<td style="width: 100%;"><input type="radio"
								id="rdoPremProd" name="reportType" value="1"
								style="margin-left: 10px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoPremProd" style="margin-top: 3px;">Per
									Assured</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio"
								id="rdoDailProd" name="reportType" value="2"
								style="margin-left: 10px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoDailProd" style="margin-top: 3px;">Per
									Intermediary</label></td>
						</tr>
					</table>
				</div>
				
				<!-- branch div -->
				<div class="sectionDiv" id="branchDiv"
					style="width: 50%; margin-left: 1%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 25%;">Branch</td>
							<td class="leftAligned"><select name="selBranch"
								id="selBranch" style="width: 100%;">
									<option value=""></option>
									<c:forEach var="branch" items="${ branchList }">
										<option>${branch.issName}</option>
									</c:forEach>
							</select><!--  <input id="txtBranch" name="capsField" class="leftAligned"
								type="text" style="width: 65%;" value="" title="Branch Name"
								disabled /> -->
								<input id="txtBranchCd" name="capsField" class="leftAligned"
								type="hidden" style="width: 65%;" value="" title="Branch Name"
								disabled /> 
								</td>
						</tr>
					</table>
				</div>
				
				<!-- old -->
				<%-- <div class="sectionDiv" id="intmDiv"
					style="width: 50%; margin-left: 1%; float: left; border-color: white;">
					<table style="width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 25%;">Intermediary</td>
							<td class="leftAligned"><select name="selIntm" id="selIntm"
								style="width: 100%;">
									<option value=""></option>
									<c:forEach var="intm" items="${ intmList }">
										<option value="${intm.intmNo}">${intm.intmName}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 25%;">Intm No.</td>
							<td class="leftAligned"><input id="txtIntmNo"
								name="capsField" class="leftAligned" type="text"
								style="width: 30%;" value="" title="Intermediary No" disabled />
								&nbsp;&nbsp;&nbsp; Intm Type <input id="txtIntmType"
								name="capsField" class="leftAligned" type="text"
								style="width: 30%;" value="" title="Intermediary Type" disabled />
							</td>
						</tr>
					</table>
				</div> --%>

				<!-- new search intm -->
				<div class="sectionDiv" id="intermediaryDiv"
					style="width: 100%; margin-left: 1%; float: left; border-color: white;">
					<table style="width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 12%;">Intermediary</td>
							<td class="leftAligned"><input id="txtIntmSearch"
								name="capsField" class="leftAligned" type="text"
								style="width: 45%;" value="" title="Search Intermediary" placeholder="TYPE INTERMEDIARY HERE.."/> <span>
									<img
									src="${pageContext.request.contextPath}/images/misc/searchIcon.png"
									id="searchForIntm" name="searchForIntm" alt="Go"
									style="margin-top: 2px;" title="Search Intermediary" />
							</span></td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 12%;"></td>
							<td class="leftAligned">
								<div class="sectionDiv" id="intermediaryResultDiv"
									style="width: 90%; float: left; border-color: white;">
									<div id="gridIntermediaryResult" style="width:90%; height: 200px; overflow:hidden"></div>
									<input type="hidden" id="txtIntermediaryNo">
								</div>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="sectionDiv" id="assdDiv"
					style="width: 100%; margin-left: 1%; float: left; border-color: white;">
					<table style="width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 12%;">Assured</td>
							<td class="leftAligned"><input id="txtAssuredSearch"
								name="capsField" class="leftAligned" type="text"
								style="width: 45%;" value="" title="Search Assured" placeholder="TYPE ASSURED HERE.."/> <span>
									<img
									src="${pageContext.request.contextPath}/images/misc/searchIcon.png"
									id="searchForAssured" name="searchForAssured" alt="Go"
									style="margin-top: 2px;" title="Search Assured" />
							</span></td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 12%;"></td>
							<td class="leftAligned">
								<div class="sectionDiv" id="assuredResultDiv"
									style="width: 90%; float: left; border-color: white;">
									<div id="gridAssuredResult" style="width:90%; height: 200px; overflow:hidden"></div>
									<input type="hidden" id="txtAssuredNo">
								</div>
							</td>
						</tr>
					</table>
				</div>
				
				

				

				<div class="sectionDiv"
					style="width: 100%; height: 1%; float: left; border-color: white;">
				</div>

				<!-- <div class="sectionDiv" id="agentDiv"
					style="width: 50%; margin-left: 23%; float: left; border-color: white;">
					<table style="width: 100%;">
						<tr>
							<td colspan="10" style="text-align: center;"><b>Type
									Name and Contact Number of Agent/Broker</b></td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 25%;">Name/s of Agent</td>
							<td colspan="10" class="leftAligned"><input
								id="txtAgentName" name="capsField" class="leftAligned"
								type="text" style="width: 95%;" value="" title="Agent Name" />
							</td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 25%;">Phone No.</td>
							<td class="leftAligned"><input id="txtPhone1"
								name="capsField" class="leftAligned" type="text"
								style="width: 20%;" value="" title="Phone No" /> - <input
								id="txtPhone2" name="capsField" class="leftAligned" type="text"
								style="width: 20%;" value="" title="Phone No" /> - <input
								id="txtPhone3" name="capsField" class="leftAligned" type="text"
								style="width: 20%;" value="" title="Phone No" /></td>
						</tr>
					</table>
				</div> -->

				<div class="sectionDiv"
					style="width: 100%; height: 1%; float: left; border-color: white;">
				</div>

				<br /> <br /> <br />
				<div class="sectionDiv" id="printDiv"
					style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
					<div id="printofferLetterButtonsDiv" align="center">
						<input type="button" class="button" style="width: 90px;"
							id="btnCancel" value="Cancel"> <input type="button"
							class="button" style="width: 90px;" id="btnPrint" value="Print">
					</div>
				</div>
			</div>
		</div>
		<div id="blankDiv"></div>
	</div>
</div>

<script type="text/javascript">
	//$("intmDiv").hide();
	
	makeAllInputFieldsUpperCase();
	var page = $F("page");
	var reportName = 'SOA_PER_INTM_EXCEL';
	var reportType = 2;
	var branch = "";
	var intmNo = "";
	var assuredNo = "";
	var assdNo = "";
	var userId = $F("userId");
	
	var intermediaryNo = "";
	
	var gridAssured;
	var assuredList = "";
	var gridIntm;
	var intmList = "";
	var data={ rows: []};
	emptyAssuredGrid();
	emptyIntmGrid();
	
	function emptyAssuredGrid(){
		gridAssured = new dhtmlXGridObject('gridAssuredResult');
		gridAssured.setImagePath(contextPath + '/css/codebase/imgs/');
		gridAssured.setHeader("Assured No., Assured Name");
		gridAssured.setInitWidths("60,*");
		gridAssured.setColAlign("left,left");
		gridAssured.setColTypes("ro,ro");
		gridAssured.setColSorting("str,str");
		gridAssured.init();
		gridAssured.parse(data,"json");
	}
	
	function emptyIntmGrid(){
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
		gridIntm.parse(data,"json");
	}
	
	$("searchForAssured").observe("click",function() {
		var parameter = $F("txtAssuredSearch");
		assdNo = '';
		
		if(!parameter == ''){
			new Ajax.Request(contextPath +'/SOAperAssdIntmController',
					{
						method : "POST",
						parameters : {
							action : "searchAssured",
							parameter : parameter
						},
						onCreate : showNotice("Fetching Assured Details. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
							$("assuredResultDiv").update(response.responseText);
						}
					});
		}else{
			assdNo = '';
			$("txtAssuredNo").value = "";
			emptyAssuredGrid();
		}
		
	});
	
	$("searchForIntm").observe("click",function() {
		var parameter = $F("txtIntmSearch");
		intermediaryNo = '';
		
		if(!parameter == ''){
			new Ajax.Request(contextPath +'/SOAperAssdIntmController',
					{
						method : "POST",
						parameters : {
							action : "searchIntermediary",
							parameter : parameter
						},
						onCreate : showNotice("Fetching Intermediary Details. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
							$("intermediaryResultDiv").update(response.responseText);
						}
					});
		}else{
			intermediaryNo = '';
			$("txtIntermediaryNo").value = "";
			emptyIntmGrid();
		}
	});
	
	$("rdoPremProd").checked = true;
	
	$$("input[name='reportType']").each(function(radio) {
		radio.observe("click", function() {
			toggleReportType(radio.value);
			$('txtAssuredSearch').value= '';
			assdNo = '';
			$("txtAssuredNo").value = "";
			emptyAssuredGrid();
		});
	});
	
	function toggleReportType(option){
		resetFields();
		if (option == 1){
			$("assdDiv").show();
			reportType = 2;
		}else if(option == 2){
			$("assdDiv").hide();
			reportType = 1;    // 1= per intermediary
		}
	}
	
	function resetFields(){
		intmNo = "";
		assuredNo = "";
		intermediaryNo = "";
		//$("selAssd").value = "";
		//$("txtAssdNo").writeAttribute("value",'');
		//$("txtAssuredName").writeAttribute("value",'');
		$("txtAssuredNo").value = "";
		//$("selIntm").value = "";
		//$("txtIntmNo").writeAttribute("value",'');
		//$("txtIntmType").writeAttribute("value",'');
	}
	
	//print function
	$("btnPrint")
	.observe(
			"click",
			function() {
					//if (validateInput()){
						assdNo = $F("txtAssuredNo");
						intermediaryNo = $F("txtIntermediaryNo");
						branch = $F("txtBranchCd");
						userId = $F("userId");
							new Ajax.Request(
									contextPath + "/SOAperAssdIntmController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printReport",
											branchCd : branch,
											intmNo : intermediaryNo,//intmNo,
											//assdNo : assuredNo,
											assdNo : assdNo,
											reportName : reportName,
											reportType : reportType,
											userId : userId
										},
										onCreate : showNotice("Generating report. Please wait..."),
										onComplete : function(response) {
											$("hiddenDiv").update(response.responseText);
											//printOutputXls();
										}
									});
					//}
			});
	
	/* function validateInput(){
		//check if atleast 1 of the fields must have value = true
		//else showMessageBox
		if(branch == '' || assuredNo == '' || intmNo == ''){
			return true;
		}else{
			showMessageBox("Please input a value on at least one of the fields", "I");
			return false;
		}
	} */

	$("btnExit").observe(
			"click",
			function() {
				goToModule(divToUpdate, contextPath + "/pages/main.jsp",
						"Please wait.....", "Home");
			});

	$("btnCancel").observe(
			"click",
			function() {
				goToModule(divToUpdate, contextPath + "/pages/main.jsp",
						"Please wait.....", "Home");
			});
	
	
	
	//branch
	$("selBranch").observe("change", function(){
		var selected = $("selBranch").getValue();
		getBranchName(selected,"txtBranchCd");
	});
	
	function getBranchName(selected,txtBranchName){
		var branchCd = [
		                 <c:forEach var="branch" items="${branchList}" varStatus="loop">
		                   "${branch.issCd}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var branchName = [
		                 <c:forEach var="branch" items="${branchList}" varStatus="loop">
		                   "${branch.issName}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var bName = ''; 
		for (var i = 0; i < branchName.length; i++) {
		if (selected == branchName[i]) {
			bName = branchName[i];
			branch = branchCd[i];
		}
		}
		$(txtBranchName).writeAttribute("value",branch);
		//$(txtBranchName).value = bName;
		}
	
	//assured
	/*  $("selAssd").observe("change", function(){
		var selected = $("selAssd").getValue();
		//getAssdNo(selected,"txtAssdNo");
	}); */
	
	function getAssdNo(selected,txtAssdNo){
	/* try{ */
		/* var assdNo2 = [
		                 <c:forEach var='assd' items='${assdList}' varStatus='loop'>
		                   "${assd.assdNo}"
		                   <c:if test='${!loop.last}'>,</c:if>
		                 </c:forEach>
		               ];
		
		var assdName = [
		                 <c:forEach var='assd' items='${assdList}' varStatus='loop'>
		                   //'${assd.assdName}'
		                   '${assd.assdName}'
		                  <c:if test='${!loop.last}'>,</c:if>
		                 </c:forEach>
		               ]; */
		 var assdNo2 = [
		      		 <c:forEach var="assd" items="${assdList}" varStatus="loop">
		      				"${assd.assdNo}"
		      		  <c:if test="${!loop.last}">,</c:if>
		      		  </c:forEach>
		      		   ];
		var assdName =[
		               <c:forEach var="assd" items="${assdList}" varStatus="loop">
		      		     "${assd.assdName}"
		      		     //${!loopStatus.last?',':''}
		      		//<c:if test="${not loop.last}">,</c:if>
		      		// ${!loop.end ? "," : ""}
		      		<c:if test="${!loop.last}">,</c:if>
		      		    </c:forEach> 
		      		     ];
		var aNo = '';
		for (var i = 0; i < assdName.length; i++) {
		if (selected == assdName[i]) {
			aNo = assdNo2[i];
		}
		}
		assuredNo = aNo;
		$(txtAssdNo).writeAttribute("value",aNo);
		//$(txtAssdNo).value = aNo;
	/*  }catch(err) {
			// goToModule("mainContents",contextPath + "/SOAperAssdIntmController?action=toSOAPage",'Please wait......',"Statement of Account");
	    }  */
	}
	
	//intermediary
	/* $("selIntm").observe("change", function(){
		var selected = $("selIntm").getValue();
		getIntmType(selected,"txtIntmType");
	}); */
	
	function getIntmType(selected,txtIntmType){
		var intmNo2 = [
		                 <c:forEach var="intm" items="${intmList}" varStatus="loop">
		                   "${intm.intmNo}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		
		var intmName = [
		                 <c:forEach var="intm" items="${intmList}" varStatus="loop">
		                   "${intm.intmName}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var intmType = [
		                 <c:forEach var="intm" items="${intmList}" varStatus="loop">
		                   "${intm.intmType}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var iType = '';
		var iNo = '';
		for (var i = 0; i < intmNo2.length; i++) {
		if (selected == intmNo2[i]) {
			iType = intmType[i];
			iNo = intmNo2[i];
		}
		}
		intmNo = iNo;
		$(txtIntmNo).writeAttribute("value",iNo);
		$(txtIntmType).writeAttribute("value",iType);
		//$(txtIntmNo).value = iNo;
		//$(txtIntmType).value = iType;
		}

	function printOutputXls() {
		var reportUrl = $F("reportUrl");
		var reportXls = $F("reportXls");
		var reportTitle = $F("reportTitle");
		var errorMsg = $F("errorMsg");
		if (!checkBlankNull(errorMsg)) {
			hideNotice("");
			showMessageBox(errorMsg, "E");
		} else {
			var content = contextPath
					+ "/OutputController?action=showPdf&reportUrl=" + reportXls;
			new Ajax.Request(contextPath + "/GIISUserController", {
				action : "POST",
				asynchronous : false,
				parameters : {
					action : "setReportParamsToSession",
					reportUrl : content,
					reportTitle : $F("reportTitle")
				},
				onComplete : function(response) {
					window.open(contextPath + "/OutputController?action=showExcel&reportXls=" + reportXls);
					hideNotice("");
					//goToModule(divToUpdate,contextPath + "/SOAperAssdIntmController?action=toSOAPage","Please wait.........","Statement of Account");
				}
			});
		}
	}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
