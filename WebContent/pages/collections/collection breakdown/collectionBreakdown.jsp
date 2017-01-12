<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<input type="hidden" id="reportXls" name="reportXls"
	value="${reportXls}">
<input type="hidden" id="selDestination" name="selDestination"
	value="screen">
<%-- <input type="hidden" id="branchList4" name="branchList4" value='${branchList4}'> --%>
<input type="hidden" id="assuredList2" name="assuredList2" value='${assuredList2}'>
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Collection Breakdown</label>
	</div>
</div>
<div id="pageDetailsDiv">
	<div id="pageSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="pageMainDiv"
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

				<div class="sectionDiv" id="miscDiv"
					style="width: 50%; margin-left: 22%; margin-top: 9px; margin-bottom: 20px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 50%;">Branch</td>
							<td class="leftAligned">
								<select name="selBranch"
									id="selBranch" style="width: 50%;">
										<option value=""></option>
										<c:forEach var="branch" items="${branchList}">
											<option value = "${branch.issCd}">${branch.issName}</option>
										</c:forEach>
								</select></td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 25%;">Payment Mode</td>
							<td class="leftAligned"><select name="selPayment"
								id="selPayment" style="width: 50%;">
									<option value="ALL">ALL</option>
									<option value="CA">CA</option>
									<option value="CC">CC</option>
									<option value="CHK">CHK</option>
									<option value="CM">CM</option>
									<option value="CMI">CMI</option>
									<option value="CW">CW</option>
									<option value="WT">WT</option>
							</select></td>
						</tr>
					</table>
				</div>
				<br /> <br /> <br />
				<div class="sectionDiv" id="printDiv"
					style="width: 97%; margin-left: 30px; margin-top: 9px; float: left; border-color: white;">
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
	var reportName = 'COLLECTION_BREAKDOWN_REP';
	var issCd = '';
	makeInputFieldUpperCase();
	
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
	
	$("btnPrint")
	.observe(
			"click",
			function() {
				var fromDate = $F("txtFromDate");
				var toDate = $F("txtToDate");
				var payMode = $F("selPayment");
				var userId = $F("userId");
				if(payMode == 'ALL'){
					payMode = '';
				}
				if(!checkBlankNull(fromDate) && !checkBlankNull(toDate)){
				if (!compareDate(fromDate, toDate)) {
					new Ajax.Updater(
							"mainContents",
							contextPath
									+ "/CollectionBreakdownController",
							{
								evalScripts : true,
								method : "POST",
								parameters : {
									action : "printReport",
									fromDate : fromDate,
									toDate : toDate,
									branchCd : $F("selBranch"),
									payMode : payMode,
									reportName : reportName,
									userId : userId
								},
								onCreate : showNotice("Generating report. Please wait..."),
								onComplete : function(response) {
									printOutputXls();
								}
							});
				} else {
					showMessageBox(
							"\"From Date\" must be earlier from \"To Date\".",
							"E");
				}
				}else{
					showMessageBox(
							"\"From Date\" & \"To Date\" must not be null.",
							"E");
				}
			});
	
	$("selBranch").observe("change", function(){
		 issCd = $("selBranch").getValue();
		console.log("issCd: " + issCd);
	});
	
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
			return true;
		}else
			return false;
	}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
