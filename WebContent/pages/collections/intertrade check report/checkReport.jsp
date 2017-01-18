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
<div id="hiddenDiv">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="reportTitle" name="reportTitle"
	value="${reportTitle}">
<input type="hidden" id="reportName" name="reportName"
	value="${reportName}">
<input type="hidden" id="reportUrl" name="reportUrl"
	value="${reportUrl}">
<input type="hidden" id="reportPdf" name="reportXls"
	value="${reportPdf}">
<input type="hidden" id="selDestination" name="selDestination"
	value="screen">
</div>
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<input type="hidden" id="BranchName" value="">

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Intertrade Check Report</label>
	</div>
</div>
<div class="sectionDiv" style="margin-bottom: 10px;">
	<div class="sectionDiv"
		style="margin: 10px; margin-left: 250px; display: block; margin-top: 15px; float: left; width: 450px;">
		<br>
		<label>&nbsp;&nbsp;&nbsp;Data Parameter</label>	
		<table style="margin-top: 10px; width: 100%;">
				<tr>
					<td class="rightAligned" style="width: 25%;">Branch</td>
					<td class="leftAligned">
						<select name="selBranch"
							id="selBranch" style="width: 80%;">
								<option value=""></option>
								<c:forEach var="branch" items="${branches}">
									<option value = "${branch.issCd}">${branch.issName}</option>
								</c:forEach>
						</select></td>
				</tr>
		</table>
		<br>
	</div>

	<div class="sectionDiv"
		style="margin: 10px; margin-left: 250px; display: block; margin-top: 2px; float: left; width: 450px;">
		<br> <label>&nbsp;&nbsp;&nbsp;Based on Accounting Entry</label>
		<table style="margin-top: 10px; width: 100%;">
			<tr>
				<td class="leftAligned" style="width: 25%;"><input type="radio"
					class="leftAligned" id="rdPOrix1" name="rdPOrix" value=1>By
					Period</td>
				<td class="rightAligned" style="width: 25%;">From</td>
				<td class="leftAligned" style="width: 42%;">
					<div
						style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
						<input type="text"
							style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
							name="fmDate" id="txtFromDate" readonly="readonly" /> <img
							id="imgFromDate" alt="goPolicyNo" style="height: 18px;"
							class="hover"
							src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
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
							name="toDate" id="txtToDate" readonly="readonly" /> <img
							id="imgToDate" alt="goPolicyNo" style="height: 18px;"
							class="hover"
							src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
					</div>
				</td>

			</tr>
			<%-- <tr>
				<td class="leftAligned" style="width: 25%;"><input type="radio"
					class="leftAligned" id="rdPOrix2" name="rdPOrix" value=2 checked>As
					of</td>
				<td class="rightAligned" style="width: 25%;">Date As of</td>
				<td class="leftAligned"><select name="selDate" id="selDate"
					style="width: 109px;">
						<option value=""></option>
						<c:forEach var="accounting" items="${accountingEntry}">
							<option>${accounting.entryDate}</option>
						</c:forEach>
				</select></td>
			</tr> --%>
			<tr>
			<td class="leftAligned" style="width: 25%;"><input type="radio"
					class="leftAligned" id="rdPOrix2" name="rdPOrix" value=2 checked>As
					of</td>
				<td class="rightAligned" style="width: 25%;">Date As of</td>
				<td class="leftAligned">
					<div
						style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
						<input type="text"
							style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
							name="toDate" id="txtAsOfDate" readonly="readonly" /> <img
							id="imgAsOfDate" alt="goPolicyNo" style="height: 18px;"
							class="hover"
							src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
					</div>
				</td>
			</tr>
		</table>

		<br> <br>
		<div class="sectionDiv" id="printDiv"
			style="width: 97%; margin-left: 20px; margin-top: 9px; float: left; border-color: white;">
			<div id="printofferLetterButtonsDiv" align="center">
				<input type="button" class="button" style="width: 90px;"
					id="btnCancel" value="Cancel"> <input type="button"
					class="button" style="width: 90px;" id="btnPrint" value="Print">
			</div>
		</div>
		<br> <br>
	</div>
</div>

<script type="text/javascript">
	$("rdPOrix1").checked = true;
	//$("selDate").disable();
	$("txtAsOfDate").disable();
	$("imgAsOfDate").hide();
	$("txtAsOfDate").setStyle('width : 102px');
	
	var reportType = 1;
	
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});
	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	var asOfCalendar = new dhtmlXCalendarObject({
		input : "txtAsOfDate",
		button : "imgAsOfDate"
	});


	//report type rdo
	$$("input[name='rdPOrix']").each(function(radio) {
		radio.observe("click", function() {
			toogleDataOption(radio.value);
			paramType = radio.value;
		});
	});
	
	var page = $F("page");
	var reportName = 'INTERTRADE_CHECK_REP_FROM_TO';
	function toogleDataOption(option){
		if(option == 1){
			//$("selDate").disable();
			//$("selDate").value = "";
			$("txtAsOfDate").disable();
			$("txtAsOfDate").value="";
			$("imgAsOfDate").hide();
			$("txtAsOfDate").setStyle('width : 80px');
			
			$("txtFromDate").enable();
			$("txtToDate").enable();
			$("txtFromDate").setStyle('width : 80px');
			$("txtToDate").setStyle('width : 80px');
			$("imgFromDate").show();
			$("imgToDate").show();
			reportName = 'INTERTRADE_CHECK_REP_FROM_TO';
			reportType = 1;
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
			
			//$("selDate").enable();
			$("txtAsOfDate").enable();
			$("imgAsOfDate").show();
			$("txtAsOfDate").setStyle('width : 80px');
			reportName = 'INTERTRADE_CHECK_REP_AS_OF';
			reportType = 2;
		}
	}
	
	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
	
	//print function
	$("btnPrint")
			.observe(
					"click",
					function() {
						if (validateInput()) {
							var userId = $F("userId");
							new Ajax.Request(
									//"mainContents",
									contextPath + "/IntertradeCheckReportController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printReport",
											reportName : reportName,
											fromDate : $F("txtFromDate"),
											toDate : $F("txtToDate"),
											asofDate : $F("txtAsOfDate"),
											branch : $F("selBranch"),
											userId : userId
										},
										onCreate : showNotice("Generating report. Please wait..."),
										onComplete : function(response) {
											//$("imgToDate").click();
											//printOutputPdf();
											$("hiddenDiv").update(response.responseText);
										}
									});
						}
					});
	
	function validateInput() {
		var isOk = false;
		if (reportType == 1){
			 if (checkBlankNull($F("txtFromDate"))
						|| checkBlankNull($F("txtToDate"))) {
					//showMessageBox("Please input required fields", "I");
					showMessageBox("Please input From and To Date fields", "I");
					isOk = false;
			 }else if (compareDate($F("txtFromDate"), $F("txtToDate"))) {
					showMessageBox("\"From Date\" must be earlier from \"To Date\".",
					"E");
					isOk = false;
			 }else
				 isOk = true;
		}else if(reportType == 2){
			var val = $F("txtAsOfDate");
			if(checkBlankNull(val)){
				showMessageBox("Please input date as of", "I");
				isOk = false;
			}else
				isOk = true;
		}
		return isOk; 
	}

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
	
	
	function compareDate(fromDate, toDate) {
		var date1 = new Date(fromDate);
		var date2 = new Date(toDate);
		if (date1.getTime() > date2.getTime()) {
			return true
		}else
			return false;
	}

	
</script>
