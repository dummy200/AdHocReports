<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#selIntm option {
width:300px;
}

#selAssd option { 
width:340px; 
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
	value="${reportTitle}">
<input type="hidden" id="reportName" name="reportName"
	value="${reportName}">
<input type="hidden" id="reportUrl" name="reportUrl"
	value="${reportUrl}">
<input type="hidden" id="reportXls" name="reportXls"
	value="${reportXls}">
</div>
<input type="hidden" id="selDestination" name="selDestination"
	value="screen">
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Paid Premiums Report</label>
	</div>
</div>
<div id="premiumProductionDetailsDiv">
	<div id="premiumProductionSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="premiumProductionMainDiv"
			style="width: 90%; height: 500px; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				
				<!-- report type input div -->
				<div class="sectionDiv" id="cutOffTypeDiv"
					style="width: 30%; height: 75px; margin-left: 25%; margin-top: 9px; float: left;border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td><input type="radio" id="rdoPost"
								name="cutOffType" value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoPost"
								style="margin-top: 3px;">Posting Date</label></td>
						</tr>
						<tr>

							<td class="rightAligned"><input type="radio"
								id="rdoTran" name="cutOffType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoTran"
								style="margin-top: 3px;">Tran Date</label></td>
						</tr>
					</table>
				</div>
				
				<!-- report type2 input div -->
				<div class="sectionDiv" id="tranFlagTypeDiv"
					style="width: 30%; height: 75px; margin-left: 2%; margin-top: 9px; float: left;border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td>
								<input type="checkbox" id="chkBox1"
							name="chkBox1"> Closed Transaction
								</td>
						</tr>
						<tr>

							<td>
								<input type="checkbox" id="chkBox2"
							name="chkBox2"> Open Transaction
								</td>
						</tr>
					</table>
				</div>
				
				<!-- report type3 input div -->
				<div class="sectionDiv" id="reportTypeDiv"
					style="width: 30%; height: 75px; margin-left: 40%; margin-top: 9px; float: left;border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
					<tr>
							<td style="width: 30%;">Type of Report:</td>
						</tr>
						<tr>
							<td><input type="radio" id="rdoIntm"
								name="reportType" value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoIntm"
								style="margin-top: 3px;">Per Intermediary</label></td>
						</tr>
						<tr>

							<td class="rightAligned"><input type="radio"
								id="rdoIntmType" name="reportType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoIntmType"
								style="margin-top: 3px;">Per Intermediary Type</label></td>
						</tr>
					</table>
				</div>
				
				<!-- dateRange Div -->
				<div class="sectionDiv" id="dateTypeDiv"
					style="width: 35%; height: 100px; margin-left: 40%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 30%;">Date Range:</td>
						</tr>
						<tr>
							<td>
								<!-- from to div -->
								<div id="fromToDiv">
									<table style="margin-top: 10px; width: 100%;">
										<tr>
											<td class="rightAligned" style="width: 5%;">From</td>
											<td class="leftAligned" style="width: 42%;">
												<div
													style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
													<input type="text"
														style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
														name="fmDate" id="txtFromDate" readonly="readonly" required/> <img
														id="imgFromDate" alt="imgFromDate" style="height: 18px;"
														class="hover"
														src="${pageContext.request.contextPath}/images/misc/but_calendar.gif"/>
												</div>
											</td>
										</tr>
										<tr>
											<td class="rightAligned" style="width: 5%;">To</td>
											<td class="leftAligned" style="width: 42%;">
												<div
													style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
													<input type="text"
														style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
														name="toDate" id="txtToDate" readonly="readonly" required/> <img
														id="imgToDate" alt="imgToDate" style="height: 18px;"
														class="hover"
														src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
												</div>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>
				
				<!-- branch div -->
				<div class="sectionDiv" id="branchDiv"
					style="width: 50%; margin-left: 22%; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 25%;">Branch</td>
							<td class="leftAligned"><select name="selBranch"
								id="selBranch" style="width: 100%;">
									<option value=""></option>
									<c:forEach var="branch" items="${ branchList }">
										<option value="${branch.issCd}">${branch.issName}</option>
									</c:forEach>
							</select> <!-- <input id="txtBranch" name="capsField" class="leftAligned"
								type="text" style="width: 65%;" value="" title="Branch Name"
								disabled /> --></td>
						</tr>
					</table>
				</div>
				
				<!-- intm div -->
				<div class="sectionDiv" id="intmDiv"
					style="width: 50%; margin-left: 22%; float: left; border-color: white;">
					<table style="width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 25%;">Intermediary</td>
							<td class="leftAligned"><select name="selIntm"
								id="selIntm" style="width: 100%;">
									<option value=""></option>
									<c:forEach var="intm" items="${ intmList }">
										<option>${intm.intmName}</option>
									</c:forEach>
							</select> 
							<input id="txtIntmType" name="capsField" class="leftAligned"
								type="hidden" style="width: 30%;" value="" title="Intermediary Type"
								disabled />
							</td>
						</tr>
					</table>
				</div>
				
				<!-- type div -->
				<div class="sectionDiv" id="lineDiv"
					style="width: 50%; margin-left: 22%; float: left; border-color: white;">
					<table style="width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 25%;">Type</td>
							<td class="leftAligned"><select name="selIntmType"
								id="selIntmType" style="width: 30%;">
									<option value=""></option>
									<c:forEach var="intmType" items="${ intmTypeList }">
										<option>${intmType.intmType}</option>
									</c:forEach>
							</select> <input id="txtIntmTypeName" name="capsField" class="leftAligned"
								type="text" style="width: 65%;" value="" title="Intermediary Type Name"
								disabled /></td>
						</tr>
					</table>
				</div>
				
				<br />
				<br /> <br />
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
	$("hiddenDiv").hide();
	var page = $F("page");
	var reportName = 'PAID_PREM_REP';
	var reportType = 1;
	var cutOffParam = 1;
	var tranFlag = '';
	makeInputFieldUpperCase();
	
	var branchCd = '';
	var intmNo = '';
	var intmType = '';
	
	$("rdoTran").checked = true;
	$("chkBox1").checked = true;
	$("rdoIntm").checked = true;
	
	$$("input[name='cutOffType']").each(function(radio) {
		radio.observe("click", function() {
			toggleCutOffType(radio.value);
		});
	});
	
	function toggleCutOffType(option){
		if(option == 1){
			$("chkBox1").checked = true;
			$("chkBox1").disable();
			$("chkBox2").checked = false;
			$("chkBox2").disable();
			cutOffParam = 2;
		}else{
			$("chkBox1").checked = true;
			$("chkBox1").enable();
			$("chkBox2").enable();
			cutOffParam = 1;
		}
	}
	
	$$("input[name='reportType']").each(function(radio) {
		radio.observe("click", function() {
			toggleReportType(radio.value);
		});
	});
	
	function toggleReportType(option){
		if (option == 1){
			reportType = 1;
		}else
			reportType = 2;
	}
	
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});

	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});

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
	
	//print function
	$("btnPrint")
	.observe(
			"click",
			function() {
				var fromDate = $F("txtFromDate");
				var toDate = $F("txtToDate");
				var userId = $F("userId");
				//var userId = 'CPIRALPH';
				var chkBox1 = "";
				var chkBox2 = "";
				if(!($("rdoPost").checked ? true : false)){
					chkBox1 = $("chkBox1").checked ? 'C' : "";
					chkBox2 = $("chkBox2").checked ? 'O' : "";
					var val = chkBox1 + chkBox2;
					if(($("chkBox1").checked ? true : false) && ($("chkBox2").checked ? true : false)){
						tranFlag = '';
					}else if(val == 'C'){
						tranFlag = val;
					}else if(val == 'O'){
						tranFlag = val;
					}else
						tranFlag = '';
				}else{
					tranFlag = 'P';
				}
					if (validateInput(fromDate,toDate)){
						branchCd = $F("selBranch");
							 new Ajax.Request(
									//"mainContents",
									contextPath + "/PaidPremiumsController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printReport",
											fromDate : fromDate,
											toDate : toDate,
											reportName : reportName,
											branchCd : branchCd,
											intmNo : intmNo,
											intmType : intmType,
											userId : userId,
											cutOffParam : cutOffParam,
											tranFlag : tranFlag,
											reportType : reportType
										},
										onCreate : showNotice("Generating report. Please wait..."),
										onComplete : function(response) {
											//printOutputXls();
											$("hiddenDiv").update(response.responseText);
										}
									});
					}
			});
	
	function validateInput(fromDate,toDate){
		if(checkBlankNull(fromDate) || checkBlankNull(toDate)){
			showMessageBox("Please enter \"From Date\" and \"To Date\"", "I");
			return false
		}else if(compareDate(fromDate,toDate)){
			showMessageBox(
					"\"From Date\" must be earlier from \"To Date\".",
					"E");
			return false;
		}/* else if(checkBlankNull(intmNo)){
			showMessageBox(
					"Intermediary is required.",
					"E"); 
		}*/else
			return true;
	}
	
	//intmType
	$("selIntmType").observe("change", function(){
		var selected = $("selIntmType").getValue();
		intmType = '';
		getIntmType(selected,"txtIntmTypeName");
	});
	
	function getIntmType(selected,txtIntmType){
		var intmType2 = [
		                 <c:forEach var="intm" items="${intmTypeList}" varStatus="loop">
		                   "${intm.intmType}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var intmName = [
		                 <c:forEach var="intm" items="${intmTypeList}" varStatus="loop">
		                   "${intm.intmName}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var intmTypeName = ''; 
		for (var i = 0; i < intmType2.length; i++) {
		if (selected == intmType2[i]) {
			intmType = intmType2[i];
			intmTypeName = intmName[i];
			
		}
		}
		$(txtIntmType).writeAttribute("value",intmTypeName);
		}
	
	//intermediary
	$("selIntm").observe("change", function(){
		var selected = $("selIntm").getValue();
		intmNo = '';
		getIntm(selected,"txtIntmType");
	});
	
	function getIntm(selected,txtIntmType){
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
		for (var i = 0; i < intmName.length; i++) {
		if (selected == intmName[i]) {
			intmNo = intmNo2[i];
			iType = intmType[i];
		}
		}
		$(txtIntmType).writeAttribute("value",iType);
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
			+ "/OutputController?action=showExcel&reportXls=" + reportXls;
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
				}
			});
		}
	}
	
	function compareDate(fromDate, toDate) {
		var date1 = new Date(fromDate);
		var date2 = new Date(toDate);
		if (date1.getTime() > date2.getTime()) {
			return true
		}else
			return false;
	}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
