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
<div id="hiddenDiv">
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
</div>
<%-- <input type="text" id="letterType" name= "letterType" value = "${letterType}"> --%>
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Paid Losses per Motorshop</label>
	</div>
</div>
<div id="lossesPaidDetailsDiv">
	<div id="lossesPaidSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="lossesPaidMainDiv"
			style="width: 90%; height: 220px; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">

				<!-- date type input div -->
				<div class="sectionDiv" id="dateTypeDiv"
					style="width: 40%; height: 75px; margin-left: 37%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
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
										<tr></tr>
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
					<br /> <br /> <br />
					<div class="sectionDiv" id="printDiv"
						style="width: 97%; margin-top: 9px; border-color: white;">
						<div id="printlossesPaidButtonsDiv" style="margin-left: 8%;">
							<input type="button" class="button" style="width: 90px;"
								id="btnSummary" value="Summary"> <input type="button"
								class="button" style="width: 90px; margin-left: 2%"
								id="btnDetailed" value="Detailed"> <br />
							<br /> <input type="button" class="button"
								style="width: 90px; margin-left: 15%;" id="btnCancel"
								value="Cancel">
						</div>
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
	var reportName = 'GICLR025_PCI';
	makeInputFieldUpperCase();

	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});

	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});

	$("btnSummary")
			.observe(
					"click",
					function() {
						var fromDate = $F("txtFromDate");
						var toDate = $F("txtToDate");
						if (checkBlankNull(fromDate)
								 || checkBlankNull(toDate)) {
							showMessageBox("Please input required fields", "I");
						} else {
							if (compareDate($F("txtFromDate"), $F("txtToDate"))) {
								showMessageBox(
										"\"From Date\" must be earlier from \"To Date\".",
										"E");
							} else {
								new Ajax.Request(
										//"mainContents",
										contextPath + "/LossesPaidController",
										{
											evalScripts : true,
											method : "POST",
											parameters : {
												action : "printLossesPaid",
												fromDate : $F("txtFromDate"),
												toDate : $F("txtToDate"),
												summary : "Y",
												detailed : "N",
												userId : $F("userId")
											},
											onCreate : showNotice("Generating report. Please wait..."),
											onComplete : function(response) {
												//printOutputPdf();
												$("hiddenDiv").update(response.responseText);
											}
										});
							}
						}
					});

	$("btnDetailed")
			.observe(
					"click",
					function() {
						if (checkBlankNull($F("txtFromDate"))
								|| checkBlankNull($F("txtToDate"))) {
							showMessageBox("Please input required fields", "I");
						} else {
							if (compareDate($F("txtFromDate"), $F("txtToDate"))) {
								showMessageBox(
										"\"From Date\" must be earlier from \"To Date\".",
										"E");
							} else {
								new Ajax.Request(
										//"mainContents",
										contextPath + "/LossesPaidController",
										{
											evalScripts : true,
											method : "POST",
											parameters : {
												action : "printLossesPaid",
												fromDate : $F("txtFromDate"),
												toDate : $F("txtToDate"),
												summary : "N",
												detailed : "Y",
												userId : $F("userId")
											},
											onCreate : showNotice("Generating report. Please wait..."),
											onComplete : function(response) {
												//printOutputPdf();
												$("hiddenDiv").update(response.responseText);
											}
										});
							}
						}
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
