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
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="reportTitle" name="reportTitle" value="${reportTitle}">
<input type="hidden" id="reportName" name="reportName" value="${reportName}">
<input type="hidden" id="reportUrl" name="reportUrl" value="${reportUrl}">
<input type="hidden" id="reportXls" name="reportXls" value="${reportXls}">
<input type="hidden" id="selDestination" name="selDestination" value="screen">
<input type="hidden" id="BranchName" value=""> 	

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Oustanding APDC</label>
	</div>
</div>
<br>
<div class="sectionDiv" style="margin-bottom: 10px;">
	<div class="sectionDiv" style="margin: 10px; margin-left: 250px; display: block; margin-top: 20px; float: left; width: 450px;">
	<br>
	<label>&nbsp;&nbsp;&nbsp;Date Parameter</label>	
	<br>
			<table style="margin-top: 10px; width: 100%;">
			<tr>	
						<td class="leftAligned" style="width: 25%;">
							 <input type="radio" class="leftAligned" id="rdOsApdc1" name="rdOsApdc" value=1>By Period
						</td>
						<td class="rightAligned" style="width: 25%;">From</td>
						<td class="leftAligned" style="width: 42%;">
							<div
								style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
								<input type="text"
									style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
									name="fmDate" id="txtFromDate" readonly="readonly" /> <img id="imgFromDate" alt="goPolicyNo"
									style="height: 18px;" class="hover"
									src="${pageContext.request.contextPath}/images/misc/but_calendar.gif"/>
							</div>
						</td>
			</tr>
			<tr>
			<td class="leftAligned" style="width: 25%;"></td>
			<td class="rightAligned" style="width: 25%;">To</td>
						<td class="leftAligned" style="width: 42%;">
							<div
								style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
								<input type="text"
									style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
									name="toDate" id="txtToDate" readonly="readonly"/> <img id="imgToDate" alt="goPolicyNo"
									style="height: 18px;" class="hover"
									src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
							</div>
						</td>
						
			</tr>
			<tr>	
				<td class="leftAligned" style="width: 25%;">
					<input type="radio" class="leftAligned" id="rdOsApd2" name="rdOsApdc" value=2 checked>As of
				</td>	
					<td class="rightAligned" style="width: 25%;">
						Date As of
					</td>
					<td class="leftAligned">
							<select name="selDate" 
								id="selDate" style="width: 109px;">
									<option value=""></option>
									<c:forEach var="accounting" items="${accountingEntry}">
										<option>${accounting.entryDate}</option>
									</c:forEach>
							</select>		
					</td>
			</tr>
			</table>
			<br>
			</div>
			
			<div class="sectionDiv" style="margin: 10px; margin-left: 250px; display: block; margin-top: 5px; float: left; width: 450px;">
			<br>
			<label>&nbsp;&nbsp;&nbsp;Branch</label>	
						<table style="margin-top: 10px; width: 100%;">
							<tr>	
								<td class="rightAligned" style="width: 25%;">
									Branch
								</td>
								<td class="leftAligned">
										<select name="selBranch"
											id="selBranch" style="width: 250px;">
												<option value=""></option>
												<c:forEach var="branch" items="${branches}">
													<option value="${branch.issCd}">${branch.issName}</option>
												</c:forEach>
										</select>
										
									<!-- <input id="BranchDesc" class="leftAligned" type="text" name="BranchDesc" 
									style="width: 200px; height: 12px;" title="Branch Description" disabled/> -->			
								</td>
							</tr>
						</table>
						<br>
						
					<div class="sectionDiv" id="printDiv"
					style="width: 97%; margin-left: 20px; margin-top: 0px; float: left; border-color: white;">
					<div id="printofferLetterButtonsDiv" align="center">
						<input type="button" class="button" style="width: 90px;"
							id="btnCancel" value="Cancel"> 
						<input type="button"
							class="button" style="width: 90px;" id="btnPrint" value="Print">

				</div>
					<br>			
				</div>	
		</div>
		</div>

<script type="text/javascript">
	var reportType = 1;
	$("rdOsApdc1").checked = true;
	$("selDate").disable();

	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});
	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});


	//report type rdo
	$$("input[name='rdOsApdc']").each(function(radio) {
		radio.observe("click", function() {
			toogleDataOption(radio.value);
			paramType = radio.value;
		});
	});
	
	var page = $F("page");
	var reportName = 'OUTSTANDING_APDC_FROM_TO_REP';
	function toogleDataOption(option){
		if(option == 1){
			$("selDate").disable();
			$("selDate").value = "";
			
			$("txtFromDate").enable();
			$("txtToDate").enable();
			$("txtFromDate").setStyle('width : 80px');
			$("txtToDate").setStyle('width : 80px');
			$("imgFromDate").show();
			$("imgToDate").show();
			reportType = 1;
			
			reportName = 'OUTSTANDING_APDC_FROM_TO_REP';
		}
		if(option == 2){
			$("txtFromDate").disable();
			$("txtToDate").disable();
			$("txtFromDate").value = "";
			$("txtToDate").value = "";
			$("txtFromDate").setStyle('width : 102px');
			$("txtToDate").setStyle('width : 102px');
			$("imgFromDate").hide();
			$("imgToDate").hide();
			
			$("selDate").enable();
			reportType = 2;
			
			reportName = 'OUTSTANDING_APDC_ASOF_REP';
		}
	}
	
	
	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
	$("btnPrint").observe("click", function() {
	/* if(compareDate($F("txtFromDate"),$F("txtToDate")))
	{
		alert("Invalid Date.");
	}else if (!ifNotEmpty()){
		alert("Date is required.");
	}else */
	if (validateInput())
		{
			new Ajax.Updater(
					"mainContents",
					contextPath
							+ "/OsApdcController",
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "printBondsReport",
							redirectPage : "/pages/collections/os apdc/OsApdc.jsp",
							reportName : reportName,
							dateFrom : $F("txtFromDate"),
							dateTo :$F("txtToDate"),
							asofDate :$F("selDate"),
							branch : $F("selBranch"),
							userId : $F("userId")
						},
						onCreate : showNotice("Generating report. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
							//outputToPDF($F("reportUrl"), $F("reportTitle"), $F("errorMsg"));
							printOutputPdf();
						}
					});
	    }
	}
);
	
	function validateInput(){
		var isOk = false;
		if (reportType == 1){
			 if (checkBlankNull($F("txtFromDate"))
						|| checkBlankNull($F("txtToDate"))) {
					showMessageBox("Please input From and To Date fields", "I");
					isOk = false;
			 }else if (compareDate($F("txtFromDate"), $F("txtToDate"))) {
					showMessageBox("\"From Date\" must be earlier from \"To Date\".",
					"E");
					isOk = false;
			 }else
				 isOk = true;
		}else if(reportType == 2){
			var val = $F("selDate");
			if(checkBlankNull(val)){
				showMessageBox("Please input date as of", "I");
				isOk = false;
			}else
				isOk = true;
		}
		return isOk; 
	}
	
	
	function ifNotEmpty(){
		var dateFrom = $F("txtFromDate");
		var dateTo   = $F("txtToDate");
		if (CheckInput(dateFrom)&&CheckInput(dateTo)){
			return false;
		}else{
				return true;
			}
	    }

	
	function CheckInput(str) {
		if (str == '' || str == null)
			return true;
		return false;
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
			//alert(errorMsg);
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
		}else
			return false;
	}
	
</script>
