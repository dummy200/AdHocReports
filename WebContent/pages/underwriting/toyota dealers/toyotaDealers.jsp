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
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<input type="hidden" id="reportTitle" name="reportTitle"
	value="${reportTitle}">
<input type="hidden" id="reportName" name="reportName"
	value="${reportName}">
<input type="hidden" id="reportUrl" name="reportUrl"
	value="${reportUrl}">
<input type="hidden" id="selDestination" name="selDestination"
	value="screen">
<%-- <input type="text" id="letterType" name= "letterType" value = "${letterType}"> --%>
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Toyota Premium Production and Claim
			Report</label>
	</div>
</div>
<div id="toyotaDealersDetailsDiv">
	<div id="toyotaDealersSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="toyotaDealersMainDiv"
			style="width: 90%; height: 400px; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">

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

				<!-- Report Type Div -->
				<div class="sectionDiv" id="reportTypeDiv"
					style="width: 20%; height: 100px; margin-left: 30%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 30%;">Report Type:</td>
						</tr>
						<tr>
							<td><input type="radio" id="rdoProduction" name="reportType"
								value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoProduction"
								style="margin-top: 3px;">Production</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio" id="rdoClaims"
								name="reportType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoClaims" style="margin-top: 3px;">Claims</label></td>
						</tr>
						<!-- <tr>
							<td class="rightAligned"><input type="radio"
								id="rdoBoth" name="reportType" value="3"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoBoth"
								style="margin-top: 3px;">Both</label></td>
						</tr> -->
					</table>
				</div>

				<!-- View Type Div -->
				<div class="sectionDiv" id="viewTypeDiv"
					style="width: 30%; height: 100px; margin-left: 1%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 30%;">View Type:</td>
						</tr>
						<tr>
							<td><input type="radio" id="rdoSummary" name="viewType"
								value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoSummary" style="margin-top: 3px;">Summary</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio" id="rdoDetails"
								name="viewType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoDetails" style="margin-top: 3px;">Details</label></td>
						</tr>
					</table>
				</div>

				<div class="sectionDiv" id="miscDiv"
					style="width: 65%; margin-left: 20%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td>Prepared by:</td>
							<td><input type="text" id="txtPreparedBy"
								name="txtPreparedBy" value="${adhocUser}"></td>
							<td>Noted by:</td>
							<td><select name="selNotedBy" id="selNotedBy"
								style="width: 90%;">
									<option value=""></option>
									<c:forEach var="sign" items="${ signatoryList }">
										<option value="${sign.signatory}">${sign.signatory}</option>
									</c:forEach>
							</select></td>
						</tr>
					</table>
				</div>
				<br />
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
	var page = $F("page");
	var reportName = 'TOYOTA_PREM_SUM';
	var reportType = 1;
	var viewType = 1;
	makeInputFieldUpperCase();
	$("rdoProduction").checked = true;
	$("rdoSummary").checked = true;

	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});

	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	
	//report type rdo
	$$("input[name='reportType']").each(function(radio) {
		radio.observe("click", function() {
			toggleReportType(radio.value);
		});
	});
	
	
	function toggleReportType(option){
		$("rdoSummary").checked = true;
		$("rdoSummary").click();
		viewType = 1;
		if(option == 1){
			reportName = 'TOYOTA_PREM_SUM';
			reportType = 1;
		}
		if(option == 2){
			reportName = 'TOYOTA_PREM_CLM_SUM';
			reportType = 2;
		}
	}
	
	//view type rdo
	$$("input[name='viewType']").each(function(radio) {
		radio.observe("click", function() {
			toggleViewType(radio.value);
		});
	});
	
	function toggleViewType(option){
		if(option == 1){
			if (reportType == 1){
				reportName = 'TOYOTA_PREM_SUM';
			}
			if(reportType == 2){
				reportName = 'TOYOTA_PREM_CLM_SUM';
			}
		}
		if(option == 2){
			if (reportType == 1){
				reportName = 'TOYOTA_PREM_DET';
			}
			if(reportType == 2){
				reportName = 'TOYOTA_PREM_CLM_DET';
			}
		}
	}

	//print function
	$("btnPrint")
			.observe(
					"click",
					function() {
						if (validateInput()) {
							new Ajax.Updater(
									"mainContents",
									contextPath + "/ToyotaDealersController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printReport",
											reportName : reportName,
											fromDate : $F("txtFromDate"),
											toDate : $F("txtToDate"),
											user : $F("adhocUser"),
											notedBy : $F("selNotedBy")
										},
										onCreate : showNotice("Generating report. Please wait..."),
										onComplete : function(response) {
											printOutputPdf();
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

	function printOutputPdf() {
		var reportUrl = $F("reportUrl");
		var reportTitle = $F("reportTitle");
		var errorMsg = $F("errorMsg");
		if (!checkBlankNull(errorMsg)) {
			hideNotice("");
			showMessageBox(errorMsg, "E");
		} else {
			var content = contextPath
					+ "/OutputController?action=showPdf&reportUrl=" + reportUrl;
			new Ajax.Request(contextPath + "/GIISUserController", {
				action : "POST",
				asynchronous : false,
				parameters : {
					action : "setReportParamsToSession",
					reportUrl : content,
					reportTitle : $F("reportTitle")
				},
				onComplete : function(response) {
					window.open('pages/report.jsp', '',strWindowFeatures);
							//'location=0, toolbar=0, menubar=0, fullscreen=1');
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
		} else
			return false;
	}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
