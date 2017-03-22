<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/* #selIntm option {
	width: 400px;
} */
#selAssd option {
	width: 340px;
}

#selMonth option {
	width: 100%;
}
</style>
<script>
var filterGridBy = "";
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

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Premium Production Report</label>
	</div>
</div>
<div id="premiumProductionDetailsDiv">
	<div id="premiumProductionSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="premiumProductionMainDiv"
			style="width: 90%; height: 600px; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">

				<!-- branch div -->
				<div class="sectionDiv" id="branchDiv"
					style="width: 55%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 25%;">Branch</td>
							<td class="leftAligned"><select name="selBranch"
								id="selBranch" style="width: 100%;">
									<option value=""></option>
									<c:forEach var="branch" items="${ branchList }">
										<option>${branch.issName}</option>
									</c:forEach>
							</select> <input id="txtBranchCd" name="capsField"
								class="leftAligned" type="hidden" /></td>
						</tr>
						<%-- <tr>
							<td class="rightAligned" style="width: 25%;">Line</td>
							<td class="leftAligned"><select name="selLine" id="selLine"
								style="width: 100%;">
									<option value=""></option>
									<c:forEach var="line" items="${ lineList }">
										<option>${line.lineName}</option>
									</c:forEach>
							</select>
							<input id="txtLineCd" name="capsField"
								class="leftAligned" type="hidden" /></td>
						</tr> --%>
						</table>
						<div id="lineOnlyDiv">
						<table style="width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 25%;">Line</td>
							<td class="leftAligned"><select name="selLineOnly" id="selLineOnly"
								style="width: 100%;">
									<option value=""></option>
									<c:forEach var="line" items="${ lineList }">
										<option value="${line.lineCd}">${line.lineName}</option>
									</c:forEach>
							</select>
							<input id="txtLineCd" name="capsField"
								class="leftAligned" type="hidden" /></td>
						</tr>
						</table>
						</div>
								<div id="lineDiv">
								<jsp:include page="/pages/underwriting/premium production/lineDiv.jsp"></jsp:include>
								</div>
						<table style="width: 100%;">
						<tr id="trIntmType">
							<td class="rightAligned" style="width: 25%;">Intm Type</td>
							<td class="leftAligned"><select name="selIntmType" id="selIntmType"
								style="width: 100%;">
									<option value=""></option>
									<c:forEach var="intm" items="${ intmTypeList }">
										<option value="${intm.intmType}">${intm.intmName}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 25%;">Intermediary</td>
							<td class="leftAligned"><input type="text" id="txtOrixIntm"
								value="OMLF INSURANCE AGENCY INC." style="width: 95%;" disabled>
								 <input id="txtIntmSearch" name="capsField"
								class="leftAligned" type="text" style="width: 85%;" value=""
								title="Search Intermediary"
								placeholder="TYPE INTERMEDIARY HERE.." /> <span> <img
									src="${pageContext.request.contextPath}/images/misc/searchIcon.png"
									id="searchForIntm" name="searchForIntm" alt="Go"
									style="margin-top: 2px;" title="Search Intermediary" />
							</span></td>
						</tr>
						
					</table>
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td>
								<div class="sectionDiv" id="intermediaryResultDiv"
									style="width: 500px; float: left; border-color: white;">
									<div id="gridIntermediaryResult"
										style="width: 500px; height: 200px; overflow: hidden"></div>
									<input type="hidden" id="txtIntermediaryNo">
								</div>
							</td>
						</tr>
					</table>
					<table style="margin-top: 10px; width: 100%;">
					</table>
				</div>

				<!-- report type div -->
				<div class="sectionDiv" id="reportTypeDiv"
					style="width: 40%; margin-left: 2%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 20%;">Report Type</td>
						</tr>
						<tr>
							<td style="width: 100%;"><input type="radio"
								id="rdoPremProd" name="reportType" value="1"
								style="margin-left: 10px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoPremProd" style="margin-top: 3px;">Premium
									Production Report</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio"
								id="rdoDailProd" name="reportType" value="2"
								style="margin-left: 10px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoDailProd" style="margin-top: 3px;">Daily
									Production Report</label></td>
						</tr>
						<tr>
							<td><input type="radio" id="rdoPeril" name="reportType"
								value="3"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoPeril" style="margin-top: 3px;">Production
									Per Peril - Dealers</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio" id="rdoIntm"
								name="reportType" value="4"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoIntm" style="margin-top: 3px;">Production
									Per Intermediary</label></td>
						</tr>
						<tr>
							<td><input type="radio" id="rdoOrix" name="reportType"
								value="5"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoOrix" style="margin-top: 3px;">Production
									Per Orix Branch</label></td>
						</tr>
					</table>
				</div>


				<!-- dateRange Div -->
				<div class="sectionDiv" id=dateRangeDiv
					style="width: 35%; margin-left: 11%; margin-top: 5px; float: left; border-color: white;">
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
													<input type="text" class="required"
														style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
														name="txtFromDate" id="txtFromDate" readonly="readonly" /> <img
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
								</div> <!-- comparative div -->
								<div id="comparativeDiv">
									<table style="margin-top: 10px; width: 100%;">
										<tr>
											<td></td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>vs</b></td>
										</tr>
										<tr>
											<td class="rightAligned" style="width: 5%;">From</td>
											<td class="leftAligned" style="width: 42%;">
												<div
													style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
													<input type="text"
														style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
														name="fmDate" id="txtFromDate2" readonly="readonly"/> <img
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
													<input type="text"
														style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
														name="toDate" id="txtToDate2" readonly="readonly" /> <img
														id="imgToDate2" alt="imgToDate2" style="height: 18px;"
														class="hover"
														src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
												</div>
											</td>
										</tr>
									</table>
								</div> <!-- booking div -->
								<div id="bookingDiv">
									<table style="margin-top: 10px; width: 100%;">
										<tr>
											<td class="rightAligned" style="width: 5%;">Month</td>
											<td class="leftAligned" style="width: 50%;"><select
												class="required" name="selMonth" id="selMonth"
												style="width: 50%;">
													<option value="JANUARY">JANUARY</option>
													<option value="FEBRUARY">FEBRUARY</option>
													<option value="MARCH">MARCH</option>
													<option value="APRIL">APRIL</option>
													<option value="MAY">MAY</option>
													<option value="JUNE">JUNE</option>
													<option value="JULY">JULY</option>
													<option value="AUGUST">AUGUST</option>
													<option value="SEPTEMBER">SEPTEMBER</option>
													<option value="OCTOBER">OCTOBER</option>
													<option value="NOVEMBER">NOVEMBER</option>
													<option value="DECEMBER">DECEMBER</option>
											</select></td>
										</tr>
										<tr>
											<td class="rightAligned" style="width: 5%;">Year</td>
											<td class="leftAligned" style="width: 42%;"><input
												class="required upper" type="text" id="txtBookingYear"
												name="txtBookingYear" style="width: 20%;" maxlength="4"
												pattern=".{4,}"   required title="4 characters minimum"></td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>

				<!-- report option -->
				<div class="sectionDiv" id="reportOptionDiv"
					style="width: 40%; margin-left: 11%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 20%;">Report Options</td>
						</tr>
						<tr>
							<td style="width: 100%;"><input type="radio" id="rdoRegular"
								name="reportOption" value="1"
								style="margin-left: 10px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoRegular" style="margin-top: 3px;">Regular</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio"
								id="rdoComparative" name="reportOption" value="2"
								style="margin-left: 10px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoComparative" id="lblComparative"
								style="margin-top: 3px;">Comparative</label></td>
						</tr>
					</table>
				</div>


				<!-- date type div -->
				<div class="sectionDiv" id="dateTypeDiv"
					style="width: 40%; height: 100px; margin-left: 11%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 20%;">Date Type</td>
						</tr>
						<tr>
							<td style="width: 100%;"><input type="radio" id="rdoAcct"
								name="dateType" value="1"
								style="margin-left: 10px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoAcct" style="margin-top: 3px;">Accounting
									Entry Date</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio" id="rdoBooking"
								name="dateType" value="2"
								style="margin-left: 10px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoBooking" id="lblBooking" style="margin-top: 3px;">Booking
									Date</label></td>
						</tr>
					</table>
				</div>

				<div class="sectionDiv" id="separatorDiv"
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
	var userId = $F("userId");
	makeAllInputFieldsUpperCase();
	var page = $F("page");
	reportName = 'PREMIUM_PROD_REP';
	var reportOption = 1;
	var dateType = 1;
	var branch = "";
	var line = "";
	var intmNo = "";
	var assuredNo = "";
	var outputType = 2;  //1 = pdf  2 = xls
	var isIntmRequired = false;
	var branchCode = "";
	var rdoReportTypeValue = 1;
	var lineCdVal = "";
	
	/*INTERMEDIARY*/
	var intermediaryNo = "";
	var gridIntm;
	var intmList = "";
	var data={ rows: []};
	emptyIntmGrid();
	
	function emptyIntmGrid(){
		$("txtIntmSearch").value = '';
		filterGridBy = "";
		gridIntm = new dhtmlXGridObject('gridIntermediaryResult');
		gridIntm.setImagePath(contextPath + '/css/codebase/imgs/');
		//gridIntm.setHeader("Intm No.,#combo_filter, Intermediary Name");
		if(reportName == 'DEALERS_PROD_REP'){
			gridIntm.setHeader("Intm No.,Intm Type, Intermediary Name");
		}else
			gridIntm.setHeader("Intm No.,#combo_filter, Intermediary Name");
		gridIntm.setInitWidths("60,60,*");
		gridIntm.setColAlign("left,left,left");
		gridIntm.setColTypes("ro,ro,ro");
		gridIntm.setColSorting("str,str,str");
		gridIntm.init();
		gridIntm.parse(data,"json");
		$("gridIntermediaryResult").hide();
	}
	
	$("searchForIntm").observe("click",function() {
		var parameter = $F("txtIntmSearch");
		intermediaryNo = '';
		if(!parameter == ''){
			new Ajax.Request(contextPath +'/PremProductionController',
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
							if(reportName == 'DEALERS_PROD_REP'){
								gridIntm.filterBy(1,filterGridBy);
							}
						}
					});
		}else{
			intermediaryNo = '';
			$("txtIntermediaryNo").value = "";
			emptyIntmGrid();
		}
	});

	/*END INTERMEDIARY*/
	
	//$("lineOnlyDiv").hide();
	$("lineDiv").hide();
	
	$("hiddenDiv").hide();
	
	$("txtOrixIntm").hide();
	$("rdoAcct").checked = true;
	$("rdoPremProd").checked = true;
	$("rdoRegular").checked = true;
	
	$("rdoPremProd").click();
	
	$("bookingDiv").hide();
	$("comparativeDiv").hide();
	$("rdoBooking").disable();
	$("rdoComparative").disable();
	
	$("lblComparative").hide();
	$("lblBooking").hide();
	$("rdoComparative").hide();
	$("rdoBooking").hide();
	
	makeInputFieldUpperCase();
	
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});

	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	
	var fromCalendar2 = new dhtmlXCalendarObject({
		input : "txtFromDate2",
		button : "imgFromDate2"
	});

	var toCalendar2 = new dhtmlXCalendarObject({
		input : "txtToDate2",
		button : "imgToDate2"
	});	
	
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
	
	//toggle report type
	$$("input[name='reportType']").each(function(radio) {
		radio.observe("click", function() {
			toggleReportType(radio.value);
			rdoReportTypeValue = radio.value;
			$("selSubline").value = "";
		});
	});
	
	function resetToggleReportType(){
		//reset
		toggleDateType(1);
		toggleReportOption(1);
		$("rdoAcct").checked = true;
		$("rdoRegular").checked = true;
		isIntmRequired = false;
		$("selSubline").value = "";
	}
	
	
	function toggleReportType(option){
		$("trIntmType").hide();
		$("selSubline").value = "";
		$("rdoComparative").disable();
		$("rdoComparative").hide();
		$("txtOrixIntm").hide();
		$("txtIntmSearch").show();
		$("searchForIntm").show();
		$("dateTypeDiv").hide();
		$("lblComparative").hide();
		$("lblBooking").hide();
		$("lineDiv").hide();
		intmNo = '';
		emptyIntmGrid();
		isIntmRequired = false;
		if(option == 1){
			reportName = 'PREMIUM_PROD_REP';
			toggleDateType(1);
			$("rdoAcct").checked = true;
			$("rdoAcct").enable();
			$("rdoBooking").disable();
			$("rdoBooking").hide();
			$("dateTypeDiv").show();
			$("lineOnlyDiv").show();
			$("trIntmType").show();
			outputType = 2;
		}
		if(option == 2){
			reportName = 'Daily_Report_Per_Month';
			toggleDateType(2);
			$("rdoBooking").checked = true;
			$("rdoBooking").enable();
			$("rdoBooking").show();
			$("lblBooking").show();
			$("rdoAcct").enable(); //1.16.2017 set to enable 
			$("dateTypeDiv").show();
			$("lineOnlyDiv").show();
			outputType = 1;
		}
		if(option == 3){
			resetToggleReportType();
			reportName = 'DEALERS_PROD_REP';
			outputType = 2;
			isIntmRequired = true;
			gridIntm.filterBy(1,"DL");
			filterGridBy = "DL";
			$("lineOnlyDiv").show();
		}
		if(option == 4){
			resetToggleReportType();
			reportName = 'PROD_REPORT_PER_INTM';
			$("rdoAcct").checked = true;
			$("rdoComparative").enable();
			$("rdoComparative").show();
			$("lblComparative").show();
			$("lineDiv").show();
			$("lineOnlyDiv").hide();
			$("trIntmType").show();
			outputType = 1;
		}
		if(option == 5){	
			resetToggleReportType();
			reportName = 'PROD_REPORT_ORIX';
			$("txtOrixIntm").show();
			intmNo = 800;
			outputType = 1;
			$("txtIntmSearch").hide();
			$("searchForIntm").hide();
			$("lineDiv").show();
			$("lineOnlyDiv").hide();
		}
	}
	
	//toggle report option
	$$("input[name='reportOption']").each(function(radio) {
		radio.observe("click", function() {
			toggleReportOption(radio.value);
		});
	});
	
	function toggleReportOption(option){
		$("txtBookingYear").value = "";
		$("txtFromDate2").value = "";
		$("txtToDate2").value = "";
		$("bookingDiv").hide();
		$("fromToDiv").show();
		if (option == 2){
			$("comparativeDiv").show();
			reportOption = 2;
			$("rdoAcct").checked = true;
			$("rdoAcct").disable();
			$("rdoBooking").disable();
			dateType = 1;
		}else if (option == 1){
			$("comparativeDiv").hide();
			reportOption = 1;
			$("rdoAcct").disable();
			$("rdoBooking").disable();
		}
	}
	
	//toggle date type
	$$("input[name='dateType']").each(function(radio) {
		radio.observe("click", function() {
			toggleDateType(radio.value);
		});
	});
	
	function toggleDateType(option){
		$("selMonth").value = "JANUARY";
		$("txtBookingYear").value = "";
		$("txtFromDate").value = "";
		$("txtToDate").value = "";
		$("comparativeDiv").hide();
		if (option == 2){
			$("fromToDiv").hide();
			$("bookingDiv").show();
			dateType = 2;
		}else if (option == 1){
			$("bookingDiv").hide();
			$("fromToDiv").show();
			dateType = 1;
		}
	}
	
	//print function
	$("btnPrint")
	.observe(
			"click",
			function() {
					if (validateInput()){
							intmNo = $F("txtIntermediaryNo");
						if(reportName == 'PROD_REPORT_ORIX'){
							intmNo = 800;
						}
						lineCdVal = $F("selLineOnly");
						 /* if(rdoReportTypeValue == 4 || rdoReportTypeValue == 5){
							lineCdVal = $("selLine");
						} */
						if(reportName == 'Daily_Report_Per_Month' || reportName == 'Daily_Report_Per_Acct_Ent_Date'){
							reportName = $("rdoAcct").checked ? 'Daily_Report_Per_Acct_Ent_Date': 'Daily_Report_Per_Month';
						}
							 new Ajax.Request(
									contextPath + "/PremProductionController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printReport",
											outputType : outputType,
											reportName :$("rdoComparative").checked ? 'PROD_REPORT_PER_INTM_VS': reportName,
											lineCd : lineCdVal,//$F("selLine"),
											sublineCd : $F("selSubline"),
											branchCd :  $F("txtBranchCd"),
											fromDate : $F("txtFromDate"),
											toDate : $F("txtToDate"),
											getVsDate : $("rdoComparative").checked ? true : false,
											fromDate2 : $("rdoComparative").checked ? $F("txtFromDate2") : '',
											toDate2 : $("rdoComparative").checked ? $F("txtToDate2") : '',
											bookingMonth : $("rdoBooking").checked ? $F("selMonth") : '',
											bookingYear : $("rdoBooking").checked ? $F("txtBookingYear") : 0,
											intmType : $F("selIntmType"),
											intmNo : intmNo,
											userId : $F("userId")//userId
										},
										onCreate : showNotice("Generating report. Please wait..."),
										onComplete : function(response) {
											$("hiddenDiv").update(response.responseText);
										}
									});
					}
			});
	
	function validateInput(){
		var isOk = true;
		if (dateType == 1){
		if(reportOption == 1){
			if (checkBlankNull($F("txtFromDate"))
					|| checkBlankNull($F("txtToDate"))) {
				showMessageBox("Please input required fields", "I");
				isOk = false;
			}else{
				if (compareDate($F("txtFromDate"), $F("txtToDate"))) {
					showMessageBox("\"From Date\" must be earlier from \"To Date\".","E");
					isOk = false;
				}
			}
		}else if(reportOption == 2){
			if (checkBlankNull($F("txtFromDate"))
					|| checkBlankNull($F("txtToDate"))) {
				showMessageBox("Please input required fields", "I");
				isOk = false;
			}else
				if (compareDate($F("txtFromDate"), $F("txtToDate"))) {
					showMessageBox("\"From Date\" must be earlier from \"To Date\".","E");
					isOk = false;
				} else {
					if (compareDate($F("txtFromDate2"), $F("txtToDate2"))) {
						showMessageBox("\"From Date\" must be earlier from \"To Date\".","E");
						isOk = false;
					}
				}	
		}
		if(isIntmRequired){
			intmNo = $F("txtIntermediaryNo");
			if(checkBlankNull(intmNo)){
				showMessageBox("Intermediary is required", "I");
				isOk = false;
			}
		}
		}else if(dateType == 2){
			var bookingYear = $F("txtBookingYear");
			if(checkBlankNull($F("txtBookingYear"))){
				showMessageBox("Please input required fields", "I");
				isOk = false;
			}else if(bookingYear.length < 4){
				showMessageBox("Invalid year.", "E");
				isOk = false;
			}else if(!/^\d+$/.test($F("txtBookingYear").trim())){
				showMessageBox("Invalid Input. Year must be number", "E");
				isOk = false;
			}
			if(isIntmRequired){
				intmNo = $F("txtIntermediaryNo");
				if(checkBlankNull(intmNo)){
					showMessageBox("Intermediary is required", "I");
					isOk = false;
				}
			}
		}
		
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
	
	//branch
	$("selBranch").observe("change", function(){
		var selected = $("selBranch").getValue();
		getBranchName(selected,"txtBranch");
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
		var bCd = '';
		for (var i = 0; i < branchName.length; i++) {
		if (selected == branchName[i]) {
			bCd = branchCd[i];
		}
		}
		$('txtBranchCd').writeAttribute("value",bCd);
		}
	
	//line
	$("selLineOnly").observe("change", function(){
		var selected = $("selLineOnly").getValue();
		$("selLine").value = selected;
	});
	
	//intmType
	$("selIntmType").observe("change", function(){
		var selected = $("selIntmType").getValue();
		filterGridBy = selected;
		$("searchForIntm").click();
		gridIntm.filterBy(1, selected);
	});
	
	/* $("selLine").observe("change", function(){
		var selected = $("selLine").getValue();
		getLineName(selected,"txtLineName");
	});
	
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
		var lCd = '';
		for (var i = 0; i < lineName.length; i++) {	
		if (selected == lineName[i]) {
			lCd = lineCd[i]
		}
		}
		$("txtLineCd").writeAttribute("value",lCd);
		} */

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
					if ($F("outputType") == 1){
						window.open('pages/report.jsp', '',
							'location=0, toolbar=0, menubar=0, fullscreen=1');
					}
					if ($F("outputType") == 2){
						window.open(contextPath + "/OutputController?action=showExcel&reportXls=" + reportXls);
					}
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
