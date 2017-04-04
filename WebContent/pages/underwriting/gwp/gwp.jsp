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
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">GWP Report</label>
	</div>
</div>
<div id="gwpDetailsDiv">
	<div id="gwpDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="gwpMainDiv"
			style="width: 90%; height: 400px; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">

				<!-- dateRange Div -->
				<div class="sectionDiv" id="dateTypeDiv"
					style="width: 35%; height: 100px; margin-left: 40%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 30%;"><b>Current Date Range:</b></td>
						</tr>
						<tr>
							<td>
								<!--Current from to div -->
								<div id="fromToDiv">
									<table style="margin-top: 10px; width: 100%;">
										<tr>
											<td class="rightAligned" style="width: 5%;">From</td>
											<td class="leftAligned" style="width: 42%;">
												<div
													style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
													<input type="text" class="required"
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
													<input type="text" class="required"
														style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
														name="toDate" id="txtToDate" readonly="readonly" /> <img
														id="imgToDate" alt="imgToDate" style="height: 18px;"
														class="hover"
														src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
												</div>
											</td>
										</tr>
									</table>
							       <table style="margin-top: 10px; width: 100%;">
							          <tr>
							             <td style="width: 50%;"><b>Previous Date Range:</b></td>
							          </tr>
					               </table>
									<!-- Past from to div -->
									<table style="margin-top: 10px; width: 100%;">  
										<tr>
											<td class="rightAligned" style="width: 5%;">From</td>
											<td class="leftAligned" style="width: 42%;">
												<div
													style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
													<input type="text" disabled
														style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
														name="fmDate" id="txtFromDate2" readonly="readonly" /> <img
														id="imgFromDate2" alt="imgFromDate2" style="height: 18px;"
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
													<input type="text" disabled
														style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
														name="toDate" id="txtToDate2" readonly="readonly" /> <img
														id="imgToDate2" alt="imgToDate2" style="height: 18px;"
														class="hover"
														src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" 
														/>
												</div>
											</td>
										</tr>
									</table>
									<table style="margin-top: 10px; width: 100%;">
						                <tr>
						 	               <td><b>Prepared by:</b></td>
							            <td><input type="text" id="txtPreparedBy" readonly="readonly"
								                  name="txtPreparedBy" value="${adhocUser}"></td>
						                </tr>
					                </table>
								</div>
							</td>
						</tr>
					</table>
			       <div class="sectionDiv" id="printDiv"
					style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
					<div id="printofferLetterButtonsDiv" align="center">
						<input type="button" class="button" style="width: 90px;"
							id="btnCancel" value="Cancel"> <input type="button"
							class="button" style="width: 90px;" id="btnPrint" value="Print">
					</div>
				</div>
				</div>
				
				

				
<script type="text/javascript">
   var userId = $F("userId");
   var reportName = 'PCI_GWP_REPORT';
  $F("txtPreparedBy").value = userId ;
   console.log($F("errorMsg"));
   
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});

	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	
	/* var fromCalendar2 = new dhtmlXCalendarObject({
		input : "txtFromDate2",
		button : "imgFromDate2"
	});

	var toCalendar2 = new dhtmlXCalendarObject({
		input : "txtToDate2",
		button : "imgToDate2"
	});	 */
	
	fromCalendar.attachEvent("onClick", function(side,d){
		var strFromD = fromCalendar.getFormatedDate(null,d);
		var subtractedYear = +strFromD.substring(0, 4) - 1;
		var strFromD2 = subtractedYear.toString() + strFromD.substring(4,10);
		$("txtFromDate2").value = strFromD2;
	});
	
	toCalendar.attachEvent("onClick", function(side,d){
		var strToD = toCalendar.getFormatedDate(null,d);
		var subtractedYear = +strToD.substring(0, 4) - 1;
		var strToD2 = subtractedYear.toString() + strToD.substring(4,10);
		$("txtToDate2").value = strToD2;
	});
	
	
	
	
	//print function
	$("btnPrint")
			.observe(
					"click",
					function() {
						if (validateInput()) {
							new Ajax.Request(
									//"mainContents",
									contextPath + "/GwpReportController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printReport",
											reportName : reportName,
											fromDate : $F("txtFromDate"),
											toDate : $F("txtToDate"),
											fromDate2 : $F("txtFromDate2"),
											toDate2 : $F("txtToDate2"),
											user : $F("adhocUser")
										},
										onCreate : showNotice("Generating report. Please wait..."),
										onComplete : function(response) {
											$("hiddenDiv").update(response.responseText);
											printOutputPdf();
										}
									});
						}
					});
	
	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
	
	
	function compareDate(fromDate, toDate) {
		var date1 = new Date(fromDate);
		var date2 = new Date(toDate);
		if (date1.getTime() > date2.getTime()) {
			return true
		}else
			return false;
	}
	
	
	
	function validateInput() {
		var isOk = false;
		if (checkBlankNull($F("txtFromDate"))
				|| checkBlankNull($F("txtToDate"))) {
			showMessageBox("Please input required fields", "I");
			isOk = false;
		} else if (compareDate($F("txtFromDate"), $F("txtToDate"))) {
			showMessageBox("\"Current From Date\" must be earlier from \"Current  To Date\".",
					"E");
			isOk = false;
		} else if (compareDate($F("txtFromDate2"), $F("txtToDate2"))) {
			showMessageBox("\"Previous From Date\" must be earlier from \"Previous To Date\".",
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
	
</script>