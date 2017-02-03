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
<input type="hidden" id="reportXls" name="reportXls"
	value="${reportXls}">
<input type="hidden" id="selDestination" name="selDestination"
	value="screen">
<%-- <input type="text" id="letterType" name= "letterType" value = "${letterType}"> --%>
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Issued Bonds</label>
	</div>
</div>
<div id="toyotaDealersDetailsDiv">
	<div id="toyotaDealersSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="toyotaDealersMainDiv"
			style="width: 90%; height: 400px; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">

				<div class="sectionDiv" id="miscDiv"
					style="width: 50%; margin-left: 22%; margin-top: 9px; margin-bottom: 10px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 25%;">Subline</td>
							<td class="leftAligned"><select name="selSubline"
								id="selSubline" style="width: 100%;">
									<option value=""></option>
									<c:forEach var="subline" items="${ sublineList }">
										<option value="${subline.sublineCd}">${subline.sublineName}</option>
									</c:forEach>
							</select> <!-- <input id="txtSublineName" name="capsField" class="leftAligned"
								type="text" style="width: 65%;" value="" title="Subline Name"
								disabled /> --></td>
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
							<td><input type="radio" id="rdoExposure"
								name="reportLayoutType" value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoExposure" style="margin-top: 3px;">Exposure</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio"
								id="rdoProduction" name="reportLayoutType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoProduction"
								style="margin-top: 3px;">Production</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio" id="rdoIssued"
								name="reportLayoutType" value="3"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoIssued" style="margin-top: 3px;">Issued
									Bonds</label></td>
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
	var page = $F("page");
	var reportName = 'REP_BONDS_EXPOSURE';
	var subline = '';
	makeInputFieldUpperCase();
	$("rdoExposure").checked = true;

	//report type rdo
	$$("input[name='reportLayoutType']").each(function(radio) {
		radio.observe("click", function() {
			toggleReportType(radio.value);
		});
	});
	
	function toggleReportType(option){
		if(option == 1){
			reportName = 'REP_BONDS_EXPOSURE';
		}
		if(option == 2){
			reportName = 'REP_BONDS_PROD';
		}
		if(option == 3){
			reportName = 'REP_BONDS_ISSUED';
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
						subline = $F("selSubline");
						var userId = $F("userId");
						if (validateInput()) {
							new Ajax.Updater(
									"mainContents",
									contextPath + "/IssuedBondsController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printReport",
											reportName : reportName,
											fromDate : $F("txtFromDate"),
											toDate : $F("txtToDate"),
											sublineCd : subline,
											userId : userId
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
	
	/* $("selSubline").observe("change", function(){
		var selected = $("selSubline").getValue();
		getSublineName(selected,"txtSublineName");
	}); */
	
	function getSublineName(selected,txtSublineName){
		var sublineCd = [
		                 <c:forEach var="subline" items="${sublineList}" varStatus="loop">
		                   "${subline.sublineCd}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var sublineName = [
		                 <c:forEach var="subline" items="${sublineList}" varStatus="loop">
		                   "${subline.sublineName}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var sName = '';
		var subCd = '';
		for (var i = 0; i < sublineCd.length; i++) {
		if (selected == sublineCd[i]) {
			sName = sublineName[i];
			subCd = sublineCd[i];
		}
		}
		subline = subCd;
		$(txtSublineName).writeAttribute("value",sName);
		}

	function printOutputPdf() {
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
