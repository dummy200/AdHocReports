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
<input type="hidden" id="UserId" value=""> 
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
<input type="hidden" id="approvedBy" name="approvedBy" value="">
<input type="hidden" id="checkedBy" name="checkedBy" value="">
<%-- <input type="text" id="letterType" name= "letterType" value = "${letterType}"> --%>
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Journal Voucher Entry Per User</label>
	</div>
</div>
<div id="jvPerUserDetailsDiv">
	<div id="jvPerUserSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="jvPerUserMainDiv"
			style="width: 90%; height: 430px; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">

				<!-- dateRange Div -->
				<div class="sectionDiv" id="dateTypeDiv"
					style="width: 35%; height: 100px; margin-left: 10%; margin-top: 9px; float: left; border-color: white;">
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
				<!-- report type input div -->
				<div class="sectionDiv" id="reportTypeDiv"
					style="width: 30%; height: 75px; margin-left: 2%; margin-top: 9px; float: left; border-color: white;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 30%;">Date Type:</td>
						</tr>
						<tr>
							<td><input type="radio" id="rdoDetailed"
								name="reportType" value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoDetailed"
								style="margin-top: 3px;">Detailed</label></td>
						</tr>
						<tr>

							<td class="rightAligned"><input type="radio"
								id="rdoSummary" name="reportType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoSummary"
								style="margin-top: 3px;">Summary</label></td>
						</tr>
						
						
					</table>
				</div>
				
				<!-- report type input div -->
				<div class="sectionDiv" id="reportTypeDiv"
					style="width: 30%; height: 75px; margin-left: 2%; margin-top: 9px; float: left; border-color: white;">
				<table style="margin-top: 10px; width: 100%;">
				<tr>	
								<td class="rightAligned" style="width: 25%;">
									User
								</td>
								<td class="leftAligned">
										<select name="selUsers"
											id="selUsers" style="width: 100px;">
												<option value=""></option>
												<c:forEach var="users" items="${users}">
													<option>${users.userId}</option>
												</c:forEach>
										</select>
											
									<input id="UserNames" class="leftAligned" type="text" name="UserNames" 
						              style="width: 200px; height: 12px;" title="Username" disabled/>					
										
								</td>
				</tr>
				</table>
				</div>
				
				<!-- misc div -->
				<div class="sectionDiv" id="miscDiv"
					style="width: 100%; margin-top: 9px; float: left; border-color: white;">
					<table style="width: 100%;">
						<tr>
							<td>
								<div class="sectionDiv" id="preparedByDiv"
									style="width: 90%; margin-left: 8px; margin-top: 5px; margin-bottom: 5px; float: left; border-color: white;">
									<table style="margin-top: 10px; width: 100%;">
										<tr>
											<td class="rightAligned" style="width: 25%;">Checked By</td>
											<td class="leftAligned"><select name="selCheckedBy"
												id="selCheckedBy" style="width: 90%;">
													<option value=""></option>
													<c:forEach var="sign" items="${ signatoryList }">
														<option>${sign.signatory}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td class="rightAligned" style="width: 25%;"></td>
											<td class="leftAligned"><input id="txtDesignation2"
												name="capsField" class="leftAligned" type="text"
												style="width: 90%;" value="" title="Designation" disabled /></td>
										</tr>
									</table>
								</div>
							</td>
							<%-- <td>
								<div class="sectionDiv" id="approvedByDiv"
									style="width: 90%; margin-left: 8px; margin-left: 2%; margin-top: 5px; margin-bottom: 5px; float: left; border-color: white;">
									<table style="margin-top: 10px; width: 100%;">
										<tr>
											<td class="rightAligned" style="width: 25%;">Approved By</td>
											<td class="leftAligned"><select name="selApprovedBy"
												id="selApprovedBy" style="width: 90%;">
													<option value=""></option>
													<c:forEach var="sign" items="${ signatoryList }">
														<option>${sign.signatory}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td class="rightAligned" style="width: 25%;"></td>
											<td class="leftAligned"><input id="txtDesignation1"
												name="capsField" class="leftAligned" type="text"
												style="width: 90%;" value="" title="Designation" disabled /></td>
										</tr>
									</table>
								</div>
							</td> --%>
						</tr>
						
					</table>
				</div>

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
	makeInputFieldUpperCase();
	
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});

	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	
	$$("input[name='reportType']").each(function(radio) {
		radio.observe("click", function() {
			toogleDataOption(radio.value);
			paramType = radio.value;
		});
	});
	
	var page = $F("page");
	var reportName = 'REP_JV_REGISTER';
	function toogleDataOption(option){
		if(option == 1){
			reportName = 'REP_JV_REGISTER_DET';
		}
		if(option == 2){
			reportName = 'REP_JV_REGISTER';
		}
	}
	
	/* $("selApprovedBy").observe("change", function(){
		var selected = $("selApprovedBy").getValue();
		getNotedBy(selected,"approvedBy","txtDesignation1");
	}); */
	
	$("selCheckedBy").observe("change", function(){
		var selected = $("selCheckedBy").getValue();
		getNotedBy(selected,"checkedBy","txtDesignation2");
	});
	
	function getNotedBy(selected,txtSign,txtDesig){
		var signatoryId = [
		                 <c:forEach var="sign" items="${signatoryList}" varStatus="loop">
		                   "${sign.signatoryId}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var signatory = [
		                 <c:forEach var="sign" items="${signatoryList}" varStatus="loop">
		                   "${sign.signatory}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var designation = [
		             <c:forEach var="sign" items="${signatoryList}" varStatus="loop">
		               "${sign.designation}"
		               <c:if test="${!loop.last}">,</c:if>
		             </c:forEach>
		           ];
		var sign = ''; //to reset value
		var desig = '';
		for (var i = 0; i < signatoryId.length; i++) {
		if (selected == signatory[i]) {
			sign = signatory[i];
			desig = designation[i];
		}
		}
		$(txtSign).writeAttribute("value",sign);
		$(txtDesig).writeAttribute("value",desig);
		}

	
	$("selUsers").observe("change", function(){
		var selected = $("selUsers").getValue();
		getUsers(selected,"UserId","UserNames");
	});
	
	function getUsers(selected,txtUserId,txtUserName){
		var content = '';
		var userGrp = [
		                 <c:forEach var="user" items="${users}" varStatus="loop">
		                   "${user.userGrp}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var userId = [
		                 <c:forEach var="user" items="${users}" varStatus="loop">
		                   "${user.userId}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var userName = [
		             <c:forEach var="user" items="${users}" varStatus="loop">
		               "${user.userName}"
		               <c:if test="${!loop.last}">,</c:if>
		             </c:forEach>
		           ];
		
		var userid = '';
		var username = '';
		
		for (var i = 0; i < userGrp.length; i++) {
		if (selected == userId[i]) {
			userid = userId[i];
			username = userName[i];
		}
		}
		$(txtUserId).writeAttribute("value",userid);
		$(txtUserName).writeAttribute("value",username);
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
		}else if((checkBlankNull($F("selCheckedBy")))/*  || checkBlankNull($F("selApprovedBy")) */){
	 		showMessageBox("Please input checked by fields", "I");
	 		isOk = false;
		}else
			isOk = true;
		return isOk;
	}
	
	
/*	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
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
					window.open(contextPath + "/OutputController?action=showExcel&reportXls=" + reportXls);
					hideNotice("");
				}
			});
		}
	}*/
	
	
	$$("input[name='reportType']").each(function(radio) {
		radio.observe("click", function() {
			toogleDataType(radio.value);
			paramType = radio.value;
		});
	});
	
	var outputType = 2;
	function toogleDataType(option){
		if(option == 1){
			outputType = 1;
		}
		if(option == 2){
			outputType = 2;
		}
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
					if (outputType == 1){
						window.open(contextPath + "/OutputController?action=showExcel&reportXls=" + reportXls);
					}
					if (outputType == 2){
						window.open('pages/report.jsp', '',strWindowFeatures);
							//'location=0, toolbar=0, menubar=0, fullscreen=1');
					}
					hideNotice("");
				}
			});
		}
	}

	$("btnPrint")
			.observe(
					"click",
					function() {
						if (validateInput()) {
							
							new Ajax.Updater(
									"mainContents",
									contextPath + "/JvPerUserController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printReport",
											reportName : reportName,
											redirectPage : "/pages/collections/journal voucher/jvPerUser.jsp",
											fromDate : $F("txtFromDate"),
											toDate : $F("txtToDate"),
											UserId : $F("UserId"), 
											outputType : outputType,
											checkBy : $F("checkedBy"),
											checkDesig : $F("txtDesignation2")
										},
										onCreate : showNotice("Generating report. Please wait..."),
										onComplete : function(response) {
											hideNotice("");
											printOutputPdf();
											
										}
									});
						}
					});
	
	
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
