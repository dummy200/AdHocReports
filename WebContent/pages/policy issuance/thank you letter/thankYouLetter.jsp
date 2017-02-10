<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="printthankYouLetterMenu">
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
<%-- <input type="hidden" id="reportTitle" name="reportTitle"
	value="${reportTitle}">
<input type="hidden" id="reportName" name="reportName"
	value="${reportName}"> --%>
<input type="hidden" id="reportTitle" name="reportTitle"
	value="">
<input type="hidden" id="reportName" name="reportName"
	value="">
<input type="hidden" id="reportUrl" name="reportUrl"
	value="${reportUrl}">
<input type="hidden" id="reportXls" name="reportXls"
	value="${reportXls}">
<input type="hidden" id="selDestination" name="selDestination"
	value="screen">
</div>
<input type="hidden" id="signatory" name="signatory" value="">
<input type="hidden" id="branchCd" name="branchCd" value="">
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Thank You Letter</label>
	</div>
</div>
<div id="thankYouLetterDetailsDiv">
	<div id="thankYouLetterSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="thankYouLetterMainDiv"
			style="width: 90%; margin-top: 40px; margin-left: 45px; margin-bottom: 50px;">
			<!-- individual -->
			<div class="sectionDiv" id="individualDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; padding-bottom: 10px;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td><input type="radio" id="rdoByIndividual"
							name="printOption" value="I"
							style="margin-left: 15px; float: left; margin-left: 50px;"
							checked="" /> <label for="rdoByIndividual"
							style="margin-top: 3px;">Individual</label></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Policy No.</td>
						<td class="leftAligned"><input id="txtLineCd"
							class="leftAligned required" type="text" name="capsField"
							style="width: 8%;" value="MC" title="Line Code" disabled />

									<input id="txtSublineCd" class="leftAligned upper" type="text"
										name="capsField" style="width: 15%;" value=""
										title="Subline Code" maxlength="7" />
									<input id="txtIssCd" class="leftAligned upper" type="text"
										name="capsField" style="width: 8%;" value=""
										title="Issue Source Code" maxlength="2" />
					 		<input id="txtIssueYy"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
							type="text" name="intField" style="width: 8%;" value=""
							title="Year" maxlength="2" /> <input id="txtPolSeqNo"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
							type="text" name="intField" style="width: 15%;" value=""
							title="Policy Sequence Number" maxlength="7" /> <input
							id="txtRenewNo"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
							type="text" name="intField" style="width: 8%;" value="00"
							title="Renew Number" maxlength="2" disabled/> <span> <img
								src="${pageContext.request.contextPath}/images/misc/searchIcon.png"
								id="searchForPolicy" name="searchForPolicy" alt="Go"
								style="margin-top: 2px;" title="Search Policy" />
						</span></td>
					</tr>
				</table>
				<!-- returns -->
				<div id="infoDiv" name="infoDiv"
					style="width: 100%; text-align: center; padding-bottom: 10px;">
					<%-- <jsp:include page="/pages/policy issuance/mc renewal cover/infoDiv.jsp"></jsp:include> --%>
					<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Assured Name</td>
						<td class="leftAligned"><input id="txtAssdName"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Assured Name" disabled /></td>
					</tr>
					</table>
				</div>
			</div>
			
			<div class="sectionDiv" id="batchDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td><input type="radio" id="rdoByBatch" name="printOption"
							value="B"
							style="margin-left: 15px; float: left; margin-left: 50px;"
							checked="" /> <label for="rdoByBatch" style="margin-top: 3px;">Batch</label>
						</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 5%;">From</td>
						<td class="leftAligned" style="width: 42%;">
							<div
								style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
								<input type="text"
									style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
									name="fmDate" id="txtFromDate" readonly="readonly"
									disabled="disabled" /> <img id="imgFromDate" alt="goPolicyNo"
									style="height: 18px;" class="hover"
									src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
							</div>
						</td>
					</tr>
					<tr></tr>
					<tr>
						<td class="rightAligned" style="width: 5%;">To</td>
						<td class="leftAligned" style="width: 42%;">
							<div
								style="border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
								<input type="text"
									style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
									name="toDate" id="txtToDate" readonly="readonly"
									disabled="disabled" /> <img id="imgToDate" alt="goPolicyNo"
									style="height: 18px;" class="hover"
									src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
							</div>
						</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Cred. Branch</td>
						<td class="leftAligned"><select name="selBranch" id="selBranch"
							style="width: 50%;">
								<option value=""></option>
								<c:forEach var="branch" items="${ branchList }">
									<option value="${branch.issCd}">${branch.issName}</option>
								</c:forEach>
						</select><!--&nbsp;
						 <input id="txtBranchName"
							name="capsField" class="leftAligned" type="text"
							style="width: 30%;" value="" title="Branch Name" disabled/> -->
						</td>
					</tr>
				</table>
				<div id="infoDiv" name="infoDiv"
					style="width: 100%; text-align: center;">
					<%-- <jsp:include page="/pages/policy issuance/one pager/infoDiv.jsp"></jsp:include> --%>
				</div>
			</div>
			
			<div class="sectionDiv" id="letterTypeDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; padding-bottom: 10px;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
						<td class="rightAligned" style="width: 35%;"></td>
						<td class="rightAligned"><input type="radio" id="rdoAgent" name="letterType"
							value="1"
							style="margin-left: 15px; float: left; margin-left: 50px;"
							checked="" /> <label for="rdoFirst" style="margin-top: 3px;">Agent</label>
						</td>
						</tr>
						<tr>
						<td class="rightAligned" style="width: 35%;"></td>
						<td class="rightAligned"><input type="radio" id="rdoCustomer" name="letterType"
							value="2"
							style="margin-left: 15px; float: left; margin-left: 50px;"
							checked="" /> <label for="rdoSecond" style="margin-top: 3px;">Customer Service</label>
						</td>
						</tr>
					</table>
					</div>

			<div class="sectionDiv" id="miscDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; padding-bottom: 10px;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Signatory</td>
						<td class="leftAligned"><select name="selSign" id="selSign"
							style="width: 65%;">
								<option value=""></option>
								<c:forEach var="sign" items="${ signatoryList }">
									<option>${sign.signatory}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Designation</td>
						<td class="leftAligned"><input id="txtDesignation"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="" title="Designation" disabled/></td>
					</tr>
				</table>
			</div>

			<div class="sectionDiv" id="printDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
				<div id="printthankYouLetterButtonsDiv" align="center">
					<input type="button" class="button" style="width: 90px;"
						id="btnCancel" value="Cancel"> <input type="button"
						class="button" style="width: 90px;" id="btnPrint" value="Print">
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("hiddenDiv").hide();
	makeInputFieldUpperCase();
	var reportName = 'THANK_YOU_LETTER_AG';
	var branchCd = '';
	$("txtSublineCd").focus();
	$("btnPrint").disable();
	$("rdoByIndividual").checked = true;
	$("rdoByIndividual").click();
	togglePrintOption('I');
	$("rdoAgent").checked = true;
	var policyId = '';
	var reportType = 'I';
	
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});
	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	
	$$("input[name='letterType']").each(function(radio) {
		radio.observe("click", function() {
			toggleReportName(radio.value);
		});
	});
	
	function toggleReportName(option){
		if(option == 1){
			reportName = 'THANK_YOU_LETTER_AG';
		}else
			reportName = 'THANK_YOU_LETTER_CS';
	}
	
	$$("input[name='printOption']").each(function(radio) {
		radio.observe("click", function() {
			togglePrintOption(radio.value);
		});
	});
	
	function togglePrintOption(option){
		if (option == 'I'){
			$("btnPrint").disable();
			$("txtSublineCd").enable();
			$("txtIssCd").enable();
			$("txtIssueYy").enable();
			$("txtPolSeqNo").enable();
			$("txtFromDate").setStyle('width : 102px');
			$("txtToDate").setStyle('width : 102px');
			$("imgFromDate").hide();
			$("imgToDate").hide();
			$("txtFromDate").disable();
			$("txtToDate").disable();
			$("selBranch").disable();
			clearTxtField("txtFromDate");
			clearTxtField("txtToDate");
			clearTxtField("selBranch");
			//clearTxtField("txtBranchName");
			branchCd = '';
			reportType = option;
		}else if(option == 'B'){
			$("btnPrint").enable();
			$("txtSublineCd").disable();
			$("txtIssCd").disable();
			$("txtIssueYy").disable();
			$("txtPolSeqNo").disable();
			$("txtFromDate").enable();
			$("txtToDate").enable();
			$("txtFromDate").setStyle('width : 80px');
			$("txtToDate").setStyle('width : 80px');
			$("imgFromDate").show();
			$("imgToDate").show();
			$("selBranch").enable();
			clearTxtField("txtSublineCd");
			clearTxtField("txtIssCd");
			clearTxtField("txtIssueYy");
			clearTxtField("txtPolSeqNo");
			reportType = option;
		}
	}
	
	$("selSign").observe("change", function(){
		var selected = $("selSign").getValue();
		getNotedBy(selected,"signatory","txtDesignation");
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
	
	
	function getNotedBy(selected,txtSign,txtDesig){
		var content = '';
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
	
	/* $("selBranch").observe("change", function(){
		var selected = $("selBranch").getValue();
		getBranchName(selected,"txtBranchName");
	}); */
	
	function getBranchName(selected,txtBranch){
		var issCdArray = [
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
		branchCd = '';
		var issName = '';
		for (var i = 0; i < issCdArray.length; i++) {
		if (selected == issCdArray[i]) {
			branchCd = issCdArray[i];
			issName = branchName[i];	
		}
		}
		$(txtBranch).writeAttribute("value",issName);
		}
	
	$("searchForPolicy")
	.observe(
			"click",
			function() {
				if (isPolicyNoFieldsOk()) {
					//check user access. 95 = TRAN_CD of policy issuance
					var userInput = "95 " + $F("txtLineCd") + " "
							+ $F("txtIssCd").trim().toUpperCase();
					if (!checkUserAccess(userInput, userAccessObj,
							userAccessObjLength)) {
						showMessageBox("User has no access.", "E");
					} else if (!/^\d+$/.test($F("txtIssueYy").trim())) {
						showMessageBox(
								"Invalid Input. Issue Year must be number",
								"E");
					} else if (!/^\d+$/.test($F("txtPolSeqNo").trim())) {
						showMessageBox(
								"Invalid Input. Policy Sequence No must be number",
								"E");
					} else {
							new Ajax.Updater(
									'infoDiv',
									contextPath
											+ '/ThankYouLetterController',
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "checkPolicyId",
											redirectPage : "/pages/policy issuance/thank you letter/infoDiv.jsp",
											lineCd : $F("txtLineCd")
													.trim()
													.toUpperCase(),
											sublineCd : $F(
													"txtSublineCd")
													.trim()
													.toUpperCase(),
											issCd : $F("txtIssCd")
													.trim()
													.toUpperCase(),
											issueYY : $F("txtIssueYy")
													.trim(),
											polSeqNo : $F("txtPolSeqNo")
													.trim(),
											renewNo : $F("txtRenewNo")
													.trim()
										},
										onCreate : showNotice("Fetching Details. Please wait..."),
										onComplete : function(response) {
											hideNotice("");
											policyId = $F("policyId");
										}
									});
					}
				} else {
					showMessageBox("Please input required fields", "I");
				}
				$("txtSublineCd").focus();
			});
	
	function compareDate(fromDate, toDate) {
		var date1 = new Date(fromDate);
		var date2 = new Date(toDate);
		if (date1.getTime() > date2.getTime()) {
			return true
		}else
			return false;
	}
	
	$("btnPrint")
	.observe(
			"click",
			function() {/* 
			 	if (!isPolicyNoFieldsOk()) {
					showMessageBox("Please input required fields", "I");
				} else {
					if (compareDate($F("txtFromDate"),$F("txtToDate"))){
						showMessageBox("\"From Date\" must be earlier from \"To Date\".", "E");
					}else{
						new Ajax.Updater(
							"mainContents",
							contextPath + "/ThankYouLetterController",
							{
								evalScripts : true,
								method : "POST",
								parameters : {
									action : "printThankYouLetter",
									signatory : $F("signatory"),
									designation : $F("txtDesignation")
								},
								onCreate : showNotice("Generating report. Please wait..."),
								onComplete : function(response) {
									printOutputPdf();
									}
								});
							}
				} */
				//check reportType
				//if I check policyId,signatory if null error else print report
				//else if B check dates,cred branch,signatory if null error else print report
				var sign = $F("signatory");
				var desig = $F("txtDesignation");
				if(reportType == 'I'){
					if(checkBlankNull(policyId)){
						showMessageBox("Please input policy number fields", "I");
					}else if(checkBlankNull(sign)){
						showMessageBox("Please input signatory fields", "I");
					}else{
						printLetter();
					}
				}else if(reportType == 'B'){
					var fromDate = $F("txtFromDate");
					var toDate = $F("txtToDate");
					var credBranch = branchCd;
					if(checkBlankNull(fromDate) && checkBlankNull(toDate)){
						showMessageBox("Please input date fields", "I");
					}else if (compareDate($F("txtFromDate"),$F("txtToDate"))){
						showMessageBox("\"From Date\" must be earlier from \"To Date\".", "E");
					}else if(checkBlankNull(sign)){
						showMessageBox("Please input signatory fields", "I");
					}else{
						printLetter();
					}
				}
			});
	
	function printLetter(){
		var sign = $F("signatory");
		var desig = $F("txtDesignation");
		var fromDate = $F("txtFromDate");
		var toDate = $F("txtToDate");
		branchCd = $F("selBranch");
		var userId = $F("userId");
		new Ajax.Request(
				//"mainContents",
				contextPath + "/ThankYouLetterController",
				{
					evalScripts : true,
					method : "POST",
					parameters : {
						action : "printThankYouLetter",
						policyId : policyId,
						fromDate : fromDate,
						branchCd : branchCd,
						toDate : toDate,
						signatory : sign,
						designation : desig,
						reportName : reportName,
						userId : userId
					},
					onCreate : showNotice("Generating report. Please wait..."),
					onComplete : function(response) {
						//printOutputPdf();
						$("hiddenDiv").update(response.responseText);
						}
					});
	}
	
	function printOutputPdf() {
		var reportUrl = $F("reportUrl");
		var reportTitle = $F("reportTitle");
		var reportXls = $F("reportXls");
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
					//show excel try
					//window.open(contextPath + "/OutputController?action=showExcel&reportXls=" + reportXls);
					hideNotice("");
				}
			});	
		}
	}

	function isPolicyNoFieldsOk() {
		var lineCd = $F("txtLineCd");
		var sublineCd = $F("txtSublineCd");
		var issCd = $F("txtIssCd");
		var issueYY = $F("txtIssueYy");
		var polSeqNo = $F("txtPolSeqNo");
		var renewNo = $F("txtRenewNo");
		if (checkBlankNull(lineCd) || checkBlankNull(sublineCd)
				|| checkBlankNull(issCd) || checkBlankNull(issueYY)
				|| checkBlankNull(polSeqNo) || checkBlankNull(renewNo)) {
			return false;
		} else
			return true;
	}
	
	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
	
	function clearTxtField(txtField){
		$(txtField).value = '';
	}
</script>
