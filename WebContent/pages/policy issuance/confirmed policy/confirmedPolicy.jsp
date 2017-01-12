<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- datepicker -->

<!--  -->
<script>
	
</script>

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
<%-- <input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}"> --%>
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<%-- <input type="hidden" id="reportTitle" name="reportTitle"
	value="${reportTitle}">
<input type="hidden" id="reportName" name="reportName"
	value="${reportName}">
<input type="hidden" id="reportUrl" name="reportUrl"
	value="${reportUrl}">
<input type="hidden" id="reportXls" name="reportXls"
	value="${reportXls}"> --%>
<input type="hidden" id="selDestination" name="selDestination"
	value="screen">
	
<div id="hiddenDiv">
	<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
	<input type="hidden" id="reportTitle" name="reportTitle"
		value="${reportTitle}"> <input type="hidden" id="reportName"
		name="reportName" value="${reportName}"> <input type="hidden"
		id="reportUrl" name="reportUrl" value="${reportUrl}"> <input
		type="hidden" id="reportXls" name="reportXls" value="${reportXls}">
	<input type="hidden" id="outputType" name="outputType"
		value="${outputType}">
</div>
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Confirmed Policy</label>
	</div>
</div>
<div id="confirmedPolicyDetailsDiv">
	<div id="confirmedPolicySectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="confirmedPolicyMainDiv"
			style="width: 90%; height: 400px; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">

				<div class="sectionDiv" id="miscDiv"
					style="width: 50%; margin-left: 22%; margin-top: 9px; margin-bottom: 10px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 25%;">Line</td>
							<td class="leftAligned"><select name="selLine" id="selLine"
								style="width: 65%;">
									<option value=""></option>
									<c:forEach var="line" items="${ lineList }">
										<option value="${line.lineCd}">${line.lineName}</option>
									</c:forEach>
							</select> <!-- <input id="txtLineName" name="capsField" class="leftAligned"
								type="text" style="width: 65%;" value="" title="Line Name"
								disabled /> --></td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 25%;">Source</td>
							<td class="leftAligned"><select name="selBranch"
								id="selBranch" style="width: 65%;">
									<option value=""></option>
									<c:forEach var="branch" items="${ branchList }">
										<option value="${branch.issCd}">${branch.issName}</option>
									</c:forEach>
							</select> <!-- <input id="txtBranch" name="capsField" class="leftAligned"
								type="text" style="width: 65%;" value="" title="Branch Name"
								disabled /> --></td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 30%;"><input
								type="checkbox" id="chkBoxTP" name="chkBoxTP">12 plan</td>
							<td class="leftAligned"><input id="txt12Plan1"
								name="capsField" class="leftAligned" type="text"
								style="width: 25%;" value="" title="Crediting Branch" disabled />
								<input id="txt12Plan2" name="capsField" class="leftAligned"
								type="text" style="width: 65%;" value=""
								title="Crediting Branch" disabled /></td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 30%;"><input
								type="checkbox" id="chkBoxDealers" name="chkBoxDealers">Dealers</td>
							<td class="leftAligned"><select name="selDealers"
								id="selDealers" style="width: 65%;">
									<option value=""></option>
									<c:forEach var="intm" items="${ intmList }">
										<option>${intm.intmName}</option>
									</c:forEach>
							</select> <input id="txtDealers" name="capsField" class="leftAligned"
								type="text" style="width: 30%;" value="" title="Dealers No"
								disabled /></td>
						</tr>
					</table>
				</div>

				<!-- dateRange Div -->
				<div class="sectionDiv" id="dateTypeDiv"
					style="width: 25%; height: 100px; margin-left: 25%; margin-top: 9px; margin-bottom: 20px; float: left; border-color: white;">
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
														name="fmDate" id="txtFromDate" readonly="readonly" /> <img
														id="imgFromDate" alt="imgFromDate" style="height: 18px;"
														class="hover"
														src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
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
														name="toDate" id="txtToDate" readonly="readonly" /> <img
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

				<!-- report type div -->
				<div class="sectionDiv" id="reportTypeDiv"
					style="width: 25%; height: 100px; margin-left: 5%; margin-top: 9px; margin-bottom: 20px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 30%;">Report Type</td>
						</tr>
						<tr>
							<td><input type="radio" id="rdoPosting"
								name="dateType" value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoPosting" style="margin-top: 3px;">Posting Date</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio"
								id="rdoAccounting" name="dateType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoAccounting"
								style="margin-top: 3px;">Accounting Entry Date</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio" id="rdoIncept"
								name="dateType" value="3"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoIncept" style="margin-top: 3px;">Incept Date</label></td>
						</tr>
					</table>
				</div>


				<br /> <br /> <br />
				<div class="sectionDiv" id="printDiv"
					style="width: 97%; margin-left: 20px; margin-top: 9px; float: left; border-color: white;">
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
	var reportName = 'CONFIRM_POL_REPORT';
	var line = '';
	var branch = '';
	var dealers = '';
	var dateType = '';
	makeInputFieldUpperCase();
	$("rdoPosting").checked = true;
	
	//checkbox TP
	var toggleTP = 1;
	$('chkBoxTP').observe('click', function(e) {
		toggleChkBoxTP();
    });
	
	function toggleChkBoxTP(){
		resetValues();
		toggleDealers = 1;
		if (toggleTP == 1){
			$('chkBoxTP').checked = true;
			$("txt12Plan1").value = 'TP';
			$("txt12Plan2").value = '12 Plan';
			toggleTP = 2;
		}else{
			$('chkBoxTP').checked = false;
			toggleTP = 1;
		}
	}
	
	//checkbox Dealers
	var toggleDealers = 1;
	$('chkBoxDealers').observe('click', function(e) {
		toggleChkBoxDealers();
    });
	
	function toggleChkBoxDealers(){
		resetValues();
		toggleTP = 1;
		if (toggleDealers == 1){
			$('chkBoxDealers').checked = true;
			$("selLine").value = 'MC';
			//$("txtLineName").value = 'MOTOR CAR';
			toggleDealers = 2;
		}else{
			$('chkBoxDealers').checked = false;
			toggleDealers = 1;
		}
	}
	
	
	//reset function
	function resetValues(){
		$("selLine").value = '';
		$("selBranch").value = '';
		//$("txtLineName").value = '';
		//$("txtBranch").value = '';
		$("txtDealers").value = '';
		$("selDealers").value = '';
		$("txt12Plan1").value = '';
		$("txt12Plan2").value = '';
		
		$('chkBoxTP').checked = false;
		$('chkBoxDealers').checked = false;
	}

	//date type rdo
	$$("input[name='dateType']").each(function(radio) {
		radio.observe("click", function() {
			toggleDateType(radio.value);
		});
	});
	
	function toggleDateType(option){
		if(option == 1){
			dateType = 1;
		}
		if(option == 2){
			dateType = 1;
		}
		if(option == 3){
			dateType = 3;
		}
	}
	
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});

	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	
	//print function
	$("btnPrint")
			.observe(
					"click",
					function() {
						if (validateInput()) {
							var lineCd = $F("selLine");
							var branchCd = $F("selBranch");
							var tpCd = $F("txt12Plan1");
							var fromDate = $F("txtFromDate");
							var toDate = $F("txtToDate");
							var dealersCd = $F("txtDealers");
							var userId = $F("userId");
							if(dateType == 1){
								
							}
							
							new Ajax.Request(
									//"mainContents",
									contextPath + "/ConfirmedPolicyController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printConfirmedPolicy",
											reportName : reportName,
											lineCd : lineCd,
											branchCd : branchCd,
											tpCd : tpCd,
											fromDatePSD : $("rdoPosting").checked ? fromDate : "",
											toDatePSD : $("rdoPosting").checked ? toDate : "",
											fromDateAED : $("rdoAccounting").checked ? fromDate : "",
											toDateAED :  $("rdoAccounting").checked ? toDate : "",
											fromDateID : $("rdoIncept").checked ? fromDate : "",
											toDateID :  $("rdoIncept").checked ? toDate : "",
											dealersCd : dealersCd,
											userId : userId
										},
										onCreate : showNotice("Generating report. Please wait..."),
										onComplete : function(response) {
											//printOutputXls();
											$("hiddenDiv").update(response.responseText);
										}
									});
						}
					});
	
	function validateInput() {
		var isOk = false;
		if (checkBlankNull($F("txtFromDate"))
				|| checkBlankNull($F("txtToDate"))) {
			showMessageBox("Please input required fields", "I");
			isOk = false;
		} else if (compareDate($F("txtFromDate"), $F("txtToDate"))) {
			showMessageBox("\"From Date\" must be earlier from \"To Date\".",
					"E");
			isOk = false;
		}else
			isOk = true;
		return isOk;
	}


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
	
	$("selDealers").observe("change", function(){
		var selected = $("selDealers").getValue();
		getDealersName(selected.trim(),"txtDealers");
	});
	
	function getDealersName(selected,txtDealers){
		var intmNo = [
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
		var iNo = '';
		for (var i = 0; i < intmName.length; i++) {
		if (selected == intmName[i].trim()) {
			iNo = intmNo[i];
		}
		}
		$(txtDealers).value = iNo;
		}
	
	/* $("selBranch").observe("change", function(){
		var selected = $("selBranch").getValue();
		getBranchName(selected,"txtBranch");
	}); */
	
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
		for (var i = 0; i < branchCd.length; i++) {
		if (selected == branchCd[i]) {
			bName = branchName[i];
			branch = branchCd[i];
		}
		}
		$(txtBranchName).value = bName;
		}
	
	/* $("selLine").observe("change", function(){
		var selected = $("selLine").getValue();
		getLineName(selected,"txtLineName");
	}); */
	
	function getLineName(selected,txtLineName){
		var lineCd = [
		                 <c:forEach var="line" items="${lineList}" varStatus="loop">
		                   "${line.lineCd}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var lineName = [
		                 <c:forEach var="line" items="${lineList}" varStatus="loop">
		                   "${line.lineName}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var sName = '';
		var subCd = '';
		for (var i = 0; i < lineCd.length; i++) {
		if (selected == lineCd[i]) {
			sName = lineName[i];
			subCd = lineCd[i];
		}
		}
		line = subCd;
		$(txtLineName).value = sName;
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
