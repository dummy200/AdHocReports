<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="printRenewalNoticeMenu">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="renewalNoticeExit">Exit</a></li>
			</ul>
		</div>
	</div>
</div>

<!-- hidden fields -->
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="userId" name="userId" value="${adhocUser}">

<input type="hidden" id="page" name="page" value="${page}">

<div id="hiddenDiv">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="reportTitle" name="reportTitle"
	value="${reportTitle}">
<input type="hidden" id="reportName" name="reportName"
	value="${reportName}">
<input type="hidden" id="reportBatch" name="reportBatch"
	value="${reportBatch}">
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
		<label id="pageTitle">${pageTitle}</label> <!-- <span class="refreshers"
			style="margin-top: 0;"> <label id="reloadForm"
			name="reloadForm" title="Reload Form">Reload Form</label>
		</span> -->
	</div>
</div>
<div id="renewalNoticeDetailsDiv">
	<div id="renewalReportSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="renewalReportMainDiv"
			style="width: 90%; margin-top: 40px; margin-left: 45px; margin-bottom: 50px;">
			<!-- individual -->
			<div class="sectionDiv" id="individualDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
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
							style="width: 8%;" value="${lineCd}" title="Line Code" disabled />
							<input id="txtSublineCd" class="leftAligned" type="text"
							name="capsField" style="width: 15%;" value=""
							title="Subline Code" maxlength="7" /> <input id="txtIssCd"
							class="leftAligned" type="text" name="capsField"
							style="width: 8%;" value="" title="Issue Source Code"
							maxlength="2" /> <input id="txtIssueYy"
							class="leftAligned integerNoNegativeUnformattedNoComma"
							type="text" name="intField" style="width: 8%;" value=""
							title="Year" maxlength="2" /> <input id="txtPolSeqNo"
							class="leftAligned integerNoNegativeUnformattedNoComma"
							type="text" name="intField" style="width: 15%;" value=""
							title="Policy Sequence Number" maxlength="7" /> <input
							id="txtRenewNo"
							class="leftAligned integerNoNegativeUnformattedNoComma"
							type="text" name="intField" style="width: 8%;" value=""
							title="Renew Number" maxlength="2" /> <span> <img
								src="${pageContext.request.contextPath}/images/misc/searchIcon.png"
								id="searchForPolicy" name="searchForPolicy" alt="Go"
								style="margin-top: 2px;" title="Search Policy" />
						</span></td>
					</tr>
				</table>
				
				<div id="infoDiv" name="infoDiv"
					style="width: 100%; text-align: center;">
					<%-- <jsp:include page="/pages/policy issuance/mc renewal cover/infoDiv.jsp"></jsp:include> --%>
					<%-- <table style="margin-top: 10px; width: 100%;">
						<c:if test="${lineCd eq 'MC'}">
							<tr>
								<td class="rightAligned" style="width: 25%;">Assured Name</td>
								<td class="leftAligned"><input id="txtAssuredName"
									name="capsField" class="leftAligned" type="text"
									style="width: 71%;" value="" title="Assured Name" disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">Item Title</td>
								<td class="leftAligned"><input id="txtItemTitle"
									name="capsField" class="leftAligned" type="text"
									style="width: 50%;" value="" title="Item Title" disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">Color</td>
								<td class="leftAligned"><input id="txtItemColor"
									name="capsField" class="leftAligned" type="text"
									style="width: 50%;" value="" title="Item Color" disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">Motor No</td>
								<td class="leftAligned"><input id="txtItemMotorNo"
									name="capsField" class="leftAligned" type="text"
									style="width: 50%;" value="" title="Motor No" disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">Serial No</td>
								<td class="leftAligned"><input id="txtItemSerialNo"
									name="capsField" class="leftAligned" type="text"
									style="width: 50%;" value="" title="Serial No" disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">Plate No</td>
								<td class="leftAligned"><input id="txtItemPlateNo"
									name="capsField" class="leftAligned" type="text"
									style="width: 50%;" value="" title="Plate No" disabled /></td>
							</tr>
						</c:if>
						<c:if test="${lineCd eq 'OC' }">
							<tr>
								<td class="rightAligned" style="width: 25%;">Assured Name</td>
								<td class="leftAligned"><input id="txtAssuredName"
									name="capsField" class="leftAligned" type="text"
									style="width: 71%;" value="" title="Assured Name" disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">Item Title</td>
								<td class="leftAligned"><input id="txtItemTitle"
									name="capsField" class="leftAligned" type="text"
									style="width: 50%;" value="" title="Item Title" disabled /></td>
							</tr>
						</c:if>
					</table> --%>
				</div>
			</div>
			<!--  -->

			<!-- batch -->
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
									src="${pageContext.request.contextPath}/images/misc/but_calendar.gif"/>
							</div>
						</td>
						</tr>
						<tr></tr>
						<tr>
						<td class="rightAligned" style="width: 7.5%;">To</td>
						<td class="leftAligned" style="width: 42%;">
							<div
								style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
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
						<td class="rightAligned" style="width: 25%;">Line</td>
						<td class="leftAligned" colspan="5"><input
							id="batchTxtLineCd" class="leftAligned required" type="text"
							name="capsField" style="width: 8%;" value="${lineCd}"
							title="Line Code" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Subline</td>
						<td class="leftAligned" colspan="5"><input
							id="batchTxtSublineCd" class="leftAligned" type="text"
							name="capsField" style="width: 15%;" value=""
							title="Subline Code" maxlength="7" /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Cred. Branch</td>
						<td class="leftAligned" colspan="5"><input id="batchTxtIssCd"
							class="leftAligned" type="text" name="capsField"
							style="width: 8%;" value="" title="Issue Source Code"
							maxlength="2" /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Extract User</td>
						<td class="leftAligned" colspan="5"><input id="batchTxtUser"
							class="leftAligned required" type="text" name="capsField"
							style="width: 13%;" value="${adhocUser}" title="Extract User" maxlength="10" />
						</td>
						<!-- <td class="leftAligned" colspan="5"><input id="batchTxtUser"
							class="leftAligned" type="text" name="capsField"
							style="width: 10%;" value="MISSNM" title="Extract User" maxlength="10" disabled/>
						</td> -->
					</tr>
				</table>
				<%-- <div id="infoDiv" name="infoDiv"
					style="width: 100%; text-align: center;">
					<jsp:include
						page="/pages/policy issuance/renewal notice/infoDiv.jsp"></jsp:include>
				</div> --%>
			</div>
			<div class="sectionDiv" id="others"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Sales Assistants
						</td>
						<td class="leftAligned" colspan="5"><input id="txtSales1"
							class="leftAligned" type="text" name="capsField"
							style="width: 50%;" value="" title="Sales Assistant 1"
							maxlength="20" /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned" colspan="5"><input id="txtSales2"
							class="leftAligned" type="text" name="capsField"
							style="width: 50%;" value="" title="Sales Assistant 2"
							maxlength="20" /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned" colspan="5"><input id="txtSales3"
							class="leftAligned" type="text" name="capsField"
							style="width: 50%;" value="" title="Sales Assistant 3"
							maxlength="20" /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Contact Numbers
						</td>
						<td class="leftAligned" colspan="5"><input id="txtContact1"
							class="leftAligned" type="text" name="capsField"
							style="width: 50%;" value="" title="Contact Number 1"
							maxlength="20" /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned" colspan="5"><input id="txtContact2"
							class="leftAligned" type="text" name="capsField"
							style="width: 50%;" value="" title="Contact Number 2"
							maxlength="20" /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned" colspan="5"><input id="txtContact3"
							class="leftAligned" type="text" name="capsField"
							style="width: 50%;" value="" title="Contact Number 3"
							maxlength="20" /></td>
					</tr>
					<tr>
						<td></td>
					<tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned" colspan="5">
						<input type="checkbox" id="chkPdfSw"
							name="chkPdfSw"> PDF Switch
						</td>
					</tr>
				</table>
			</div>
			<div class="sectionDiv" id="printDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
				<div id="printRenewalNoticeButtonsDiv" align="center">
					<input type="button" class="button" style="width: 90px;"
						id="btnCancelRenewal" value="Cancel"> <input type="button"
						class="button" style="width: 90px;" id="btnPrintRenewal"
						value="Print">
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

	$("hiddenDiv").hide();
	var lineCd = $F("lineCd");
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});
	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	
	function togglePrintOption(option) {
		/* var fromCalendar = new dhtmlXCalendarObject({
			input : "txtFromDate",
			button : "imgFromDate"
		});
		var toCalendar = new dhtmlXCalendarObject({
			input : "txtToDate",
			button : "imgToDate"
		}); */
		//reset fields
		//if mc
		/* if (lineCd == 'MC') {
			$("txtAssuredName").value = "";
			$("txtItemTitle").value = "";
			$("txtItemColor").value = "";
			$("txtItemMotorNo").value = "";
			$("txtItemSerialNo").value = "";
			$("txtItemPlateNo").value = "";
		}
		if (lineCd == 'OC') {
			$("txtAssuredName").value = "";
			$("txtItemTitle").value = "";
		} */
		$("errorMsg").value = '';
		if (option == "I") {
			//enable individual fields
			$("txtLineCd").addClassName("required");
			$("txtSublineCd").enable();
			$("txtIssCd").enable();
			$("txtIssueYy").enable();
			$("txtPolSeqNo").enable();
			$("txtRenewNo").enable();
			//disable batch fields
			$("batchTxtLineCd").removeClassName("required");
			$("batchTxtSublineCd").disable();
			$("batchTxtIssCd").disable();
			$("txtFromDate").disable();
			$("txtToDate").disable();
			//$("batchTxtUser").disable();
			$("imgFromDate").hide();
			$("imgToDate").hide();
			$("txtFromDate").setStyle('width : 102px');
			$("txtToDate").setStyle('width : 102px');
			//other props
			$("txtSublineCd").focus();
			$("searchForPolicy").show();
			printOptionVal = "I";
			$("btnPrintRenewal").disable();
			$("batchTxtSublineCd").value = "";
			$("batchTxtIssCd").value = "";
			$("batchTxtSublineCd").value = "";
			$("txtFromDate").value = "";
			$("txtToDate").value = "";
		} else if (option == "B") {
			//enable batch fields
			$("batchTxtLineCd").addClassName("required");
			$("batchTxtSublineCd").enable();
			$("batchTxtIssCd").enable();
			$("txtFromDate").enable();
			$("txtToDate").enable();
			//$("batchTxtUser").enable();
			$("imgFromDate").show();
			$("imgToDate").show();
			//disable individual fields
			$("txtLineCd").removeClassName("required");
			$("txtSublineCd").disable();
			$("txtIssCd").disable();
			$("txtIssueYy").disable();
			$("txtPolSeqNo").disable();
			$("txtRenewNo").disable();
			$("txtFromDate").setStyle('width : 80px');
			$("txtToDate").setStyle('width : 80px');
			//other props
			$("txtFromDate").focus();
			$("searchForPolicy").hide();
			printOptionVal = "B";
			$("btnPrintRenewal").enable();
			$("txtSublineCd").value = "";
			$("txtIssCd").value = "";
			$("txtIssueYy").value = "";
			$("txtPolSeqNo").value = "";
			$("txtRenewNo").value = "";
		}
	}

	$$("input[name='printOption']").each(function(radio) {
		radio.observe("click", function() {
			togglePrintOption(radio.value);
			paramType = radio.value;
		});
	});

	makeAllInputFieldsUpperCase();
	$("rdoByIndividual").checked = true;
	$("rdoByIndividual").click();
	//$("txtSublineCd").focus();
	$("btnPrintRenewal").disable();
	var printOptionVal = "I";

	$("searchForPolicy").observe("click", function() {
		if (isPolicyNoFieldsOk()) {
			var userInput = "95 " +$F("txtLineCd") + " " + $F("txtIssCd").trim().toUpperCase();
			if(!checkUserAccess(userInput,userAccessObj, userAccessObjLength)){
				showMessageBox("User has no access.", "I");
			}else if(!/^\d+$/.test($F("txtIssueYy").trim())){
				showMessageBox("Invalid Input. Issue Year must be number", "E");
			}else if(!/^\d+$/.test($F("txtPolSeqNo").trim())){
				showMessageBox("Invalid Input. Policy Sequence No must be number", "E");
			}else if(!/^\d+$/.test($F("txtRenewNo").trim())){
				showMessageBox("Invalid Input. Renew No must be number", "E");
			}else{
				var userId = $F("userId").trim();
			new Ajax.Updater('infoDiv', contextPath + '/RenewalNoticeController', {
				evalScripts : true,
				method : "POST",
				parameters : {
					action : "checkPolicyId",
					/* moduleId : "renewalNotice", */
					redirectPage : "/pages/policy issuance/renewal notice/infoDiv.jsp",
					lineCd : $F("txtLineCd").trim().toUpperCase(),
					sublineCd : $F("txtSublineCd").trim().toUpperCase(),
					issCd : $F("txtIssCd").trim().toUpperCase(),
					issueYY : $F("txtIssueYy").trim(),
					polSeqNo : $F("txtPolSeqNo").trim(),
					renewNo : $F("txtRenewNo").trim(),
					userId : userId
				},
				onCreate : showNotice("Fetching Details. Please wait..."),
				onComplete : function(response) {
					hideNotice("");
				}
			});
			}
		} else {
			//showMessageBox("Please input required fields", "I");
			//$("txtSublineCd").focus();
		}
	});
	
	function getContacts(txt1,txt2,txt3){
		var txtSales = "";
		if(txt3 == "" || txt3 == null){
			if(txt2 == "" || txt2 == null){
				if(txt1 == null || txt1 ==  ""){
					txtSales = "";
				}else
					txtSales = txt1;
			}else
				if(txt1 == null || txt1 ==  ""){
					txtSales = txt2;
				}else
					txtSales = txt1 + ", " + txt2;
		}else{
			if(txt2 == "" || txt2 == null){
				if(txt1 == null || txt1 ==  ""){
					txtSales = txt3;
				}else
					txtSales = txt1 + ", " + txt3;
			}else
				if(txt1 == null || txt1 ==  ""){
					txtSales = txt2 + ", " + txt3;
				}else
					txtSales = txt1 + ", " + txt2 + ", " + txt3;
		}
		return txtSales;
		}

	function isPolicyNoFieldsOk() {
		var lineCd = $F("txtLineCd");
		var sublineCd = $F("txtSublineCd");
		var issCd = $F("txtIssCd");
		var issueYY = $F("txtIssueYy");
		var polSeqNo = $F("txtPolSeqNo");
		var renewNo = $F("txtRenewNo");
		var isOk = true;
		
		if (checkBlankNull(lineCd) || checkBlankNull(sublineCd)
				|| checkBlankNull(issCd) || checkBlankNull(issueYY)
				|| checkBlankNull(polSeqNo) || checkBlankNull(renewNo)) {
			isOk = false;
			showMessageBox("Please input required fields", "I");
			$("txtSublineCd").focus();
			//return false;
		}/*  else
			isOk = true; */
		/* if(renewNo == 0){
			isOk = false;
			showMessageBox("Invalid Renew No", "E");
			$("txtRenewNo").focus();
		} */
		
		return isOk;
	}

	function isBatchFieldsOk() {
		var userId = $F("batchTxtUser");
		var fromDate = $F("txtFromDate");
		var toDate = $F("txtToDate");
		var batchLineCd = $F("batchTxtLineCd");
		var batchIssCd = $F("batchTxtIssCd");
		if (checkBlankNull(userId) || checkBlankNull(fromDate)
				|| checkBlankNull(toDate) || checkBlankNull(batchLineCd)) {
			return false;
		} else
			return true;
	}

	function compareDate(fromDate, toDate) {
		var date1 = new Date(fromDate);
		var date2 = new Date(toDate);
		
		if (date1.getTime() > date2.getTime()) {
			return true
		}else
			return false;
	}

	var reportLink = "http://localhost:2010/GeniisysAdHocReports/";
	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
	//var reportName = "POLICY_DOCUMENT_MTR_ONEPAGER";
	var reportName = $F("reportName");
	$("btnPrintRenewal")
			.observe(
					"click",
					function() {
						var pdfSw = $("chkPdfSw").checked ? "Y" : "N";
						//get contacts
						var txtSales1 = $F("txtSales1").trim();
						var txtSales2 = $F("txtSales2").trim();
						var txtSales3 = $F("txtSales3").trim();
						var txtContact1 = $F("txtContact1").trim();
						var txtContact2 = $F("txtContact2").trim();
						var txtContact3 = $F("txtContact3").trim();
						
						
						if (printOptionVal == "I") {
							if (!isPolicyNoFieldsOk()) {
								showMessageBox("Please input required fields", "I");
							} else {
								new Ajax.Request(
										//"mainContents",
										contextPath
												+ "/RenewalNoticeController",
										{
											evalScripts : true,
											method : "POST",
											parameters : {
												action : "printRenewalNotice",
												page : $F("page"),
												policyId : $F("policyId"),
												sales : getContacts(txtSales1,txtSales2,txtSales3),
												contacts : getContacts(txtContact1,txtContact2,txtContact3),
												reportName : reportName,
												lineCd : $F("txtLineCd"),
												sublineCd : $F("txtSublineCd").trim().toUpperCase(),
												issCd : $F("txtIssCd").trim().toUpperCase(),
												issueYY : $F("txtIssueYy").trim(),
												polSeqNo : $F("txtPolSeqNo").trim(),
												renewNo : $F("txtRenewNo").trim(),
												pdfSw : pdfSw
											},
											onCreate : showNotice("Generating report. Please wait..."),
											onComplete : function(response) {
												//printOutputPdf();
												$("hiddenDiv").update(response.responseText);
											}
										});
							}
						} else if (printOptionVal == "B") {
							if (compareDate($F("txtFromDate"),
									$F("txtToDate"))){
								showMessageBox("\"From Date\" should be earlier from \"To Date\".", "E");
							}else{
							if (!isBatchFieldsOk()) {
								showMessageBox("Please input required fields", "I");
							} else {
								$("errorMsg").value = "";
								new Ajax.Request(
										//"mainContents",
										contextPath
												+ "/RenewalNoticeController",
										{
											evalScripts : true,
											method : "POST",
											parameters : {
												action : "printBatch",
												page : $F("page"),
												reportName : $F("reportBatch"),
												sales : getContacts(txtSales1,txtSales2,txtSales3),
												contacts : getContacts(txtContact1,txtContact2,txtContact3),
												fromDate : $F("txtFromDate"),
												toDate : $F("txtToDate"),
												lineCd : $F("batchTxtLineCd").trim().toUpperCase(),
												sublineCd : $F("batchTxtSublineCd").trim().toUpperCase(),
												issCd : $F("batchTxtIssCd").trim().toUpperCase(),
												userId : $F("batchTxtUser").trim().toUpperCase(),
												pdfSw : pdfSw
											},
											onCreate : showNotice("Generating report. Please wait..."),
											onComplete : function(response) {
												//printOutputPdf();
												$("hiddenDiv").update(response.responseText);
											}
										});
							}
						}
						}
					});
	
	goToPage("renewalNoticeExit","/pages/main.jsp","Please wait.....", "Home");
	goToPage("btnCancelRenewal","/pages/main.jsp","Please wait.....", "Home");

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

	/* function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	} */
</script>
