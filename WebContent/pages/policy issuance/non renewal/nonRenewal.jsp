<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- datepicker -->

<!--  -->

<div id="printRenewalNoticeMenu">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="nonRenewalExit">Exit</a></li>
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
<input type="hidden" id="notedBySign" value=""> 
<input type="hidden" id="notedByDesig" value="">
<input type="hidden"id="sign" value=""> 
<input type="hidden" id="desig" value="">
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Non Renewal Notice</label>
		<!--  <span class="refreshers"
			style="margin-top: 0;"> <label id="reloadForm"
			name="reloadForm" title="Reload Form">Reload Form</label>
		</span> -->
	</div>
</div>
<div id="renewalNoticeDetailsDiv">
	<div id="renewalReportSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="renewalReportMainDiv"
			style="width: 90%; height: 550px; margin-top: 40px; margin-left: 45px; margin-bottom: 50px;">
			<!-- individual -->
			<div class="sectionDiv" id="individualDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Policy No.</td>
						<td class="leftAligned"><input id="txtLineCd"
							class="leftAligned required upper" type="text" name="capsField"
							style="width: 8%;" value="" title="Line Code" /> <input
							id="txtSublineCd" class="leftAligned upper" type="text"
							name="capsField" style="width: 15%;" value=""
							title="Subline Code" maxlength="7" /> <input id="txtIssCd"
							class="leftAligned upper" type="text" name="capsField"
							style="width: 8%;" value="" title="Issue Source Code"
							maxlength="2" /> <input id="txtIssueYy"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
							type="text" name="intField" style="width: 8%;" value=""
							title="Year" maxlength="2" /> <input id="txtPolSeqNo"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
							type="text" name="intField" style="width: 15%;" value=""
							title="Policy Sequence Number" maxlength="7" /> <input
							id="txtRenewNo"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
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
					<table style="margin-top: 10px; width: 100%;">
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
					</table>
				</div>
			</div>
			
			<!-- SIGN -->
			<div class="sectionDiv" id="notedByDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Noted By:</td>
						<td class="leftAligned"><select name="selNotedBy"
							id="selNotedBy" style="width: 250px;">
								<option value=""></option>
								<c:forEach var="sign" items="${ signatoryList }">
									<option value="${sign.signatoryId}">${sign.signatory}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Signatory:</td>
						<td class="leftAligned"><select name="selSignatory"
							id="selSignatory" style="width: 250px;">
								<option value=""></option>
								<c:forEach var="sign" items="${ signatoryList }">
									<option value="${sign.signatoryId}">${sign.signatory}</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>
			</div>
			<div id="hiddedNotedByDiv">
				
			</div>
			<!-- END SIGN -->
			
			<div class="sectionDiv" id="reasonsDiv" style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Reasons:</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" name="reasons" id="reason1"> Unfavorable Loss Experience</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" name="reasons" id="reason2"> Risk insured is categorized as a Prohibited Risk</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Others:</td>
						<td class="leftAligned"><input type="checkbox" name="reasons" id="otherReason">  <input type="text" style="width: 250px;" id="txtOtherReasons"></td>
					</tr>
				</table>
			</div>
			<!--  -->

			<div class="sectionDiv" id="printDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
				<div id="printRenewalNoticeButtonsDiv" align="center">
					<input type="button" class="button" style="width: 90px;"
						id="btnCancelNonRenewal" value="Cancel">
					<input type="button" class="button" style="width: 90px;" id="btnPrintNonRenewal" value="Print">
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	var lineCd = $F("lineCd");
	var page = $F("page");

	//makeAllInputFieldsUpperCase();
	makeInputFieldUpperCase();
	$("txtLineCd").focus();
	
	$("selNotedBy").observe("change", function(){
		var selected = $("selNotedBy").getValue();
		getNotedBy(selected,"notedBySign","notedByDesig");
	});
	
	$("selSignatory").observe("change", function(){
		var selected = $("selSignatory").getValue();
		getNotedBy(selected,"sign","desig");
	});
	
	$("txtOtherReasons").disable();
	$("otherReason").observe("click",function(){
		var checkBoxState = $F("otherReason");
		if (checkBoxState == 'on'){
		$("txtOtherReasons").enable();
		$("txtOtherReasons").focus();
		}else
			//$("txtOtherReasons").writeAttribute("value","");
			$("txtOtherReasons").disable();
		$("txtOtherReasons").clear();
	});
	
	//to save on js functions
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
	var sign ='';
	var desig = '';
	for (var i = 0; i < signatoryId.length; i++) {
	if (selected == signatoryId[i]) {
		sign = signatory[i];
		desig = designation[i];
	}
	}
	$(txtSign).writeAttribute("value",sign);
	$(txtDesig).writeAttribute("value",desig);
	}

	$("searchForPolicy")
			.observe(
					"click",
					function() {
						if (isPolicyNoFieldsOk()) {
							var userInput = "95 " +$F("txtLineCd") + " " + $F("txtIssCd").trim().toUpperCase();
							if(!checkUserAccess(userInput,userAccessObj, userAccessObjLength)){
								showMessageBox("User has no access.", "E");
							}else if(!/^\d+$/.test($F("txtIssueYy").trim())){
								showMessageBox("Invalid Input. Issue Year must be number", "E");
							}else if(!/^\d+$/.test($F("txtPolSeqNo").trim())){
								showMessageBox("Invalid Input. Policy Sequence No must be number", "E");
							}else if(!/^\d+$/.test($F("txtRenewNo").trim())){
								showMessageBox("Invalid Input. Renew No must be number", "E");
							}else{
							new Ajax.Updater(
									'infoDiv',
									contextPath + '/NonRenewalController',
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "checkPolicyId",
											//moduleId : "onePager",
											redirectPage : "/pages/policy issuance/non renew/infoDiv.jsp",
											lineCd : $F("txtLineCd").trim().toUpperCase(),
											sublineCd : $F("txtSublineCd").trim().toUpperCase(),
											issCd : $F("txtIssCd").trim().toUpperCase(),
											issueYY : $F("txtIssueYy").trim(),
											polSeqNo : $F("txtPolSeqNo").trim(),
											renewNo : $F("txtRenewNo").trim(),
											userId : $F("userId")
										},
										onCreate : showNotice("Fetching Details. Please wait..."),
										onComplete : function(response) {
											hideNotice("");
											var errorMsg2 = $F("errorMsg2");
											if($F("txtLineCd").trim().toUpperCase()=='FI' && checkBlankNull(errorMsg2)){
												//getNotedBy(selected,"notedBySign","notedByDesig");
												$("selNotedBy").value = '17';
												getNotedBy($("selNotedBy").getValue(),"notedBySign","notedByDesig");
												$("selSignatory").value = '80';
												getNotedBy($("selSignatory").getValue(),"sign","desig");
												$("selNotedBy").disable();
												$("selSignatory").disable();
											}else{
												$("selNotedBy").enable();
												$("selSignatory").enable();
												$("selNotedBy").value = '';
												$("selSignatory").value = '';
											}
										}
									});
							}
						} else {
							showMessageBox("Please input required fields", "I");
						}
						$("txtSublineCd").focus();
					});

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

	//var reportLink = "http://localhost:2010/GeniisysAdHocReports/";
	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
	//var reportName = $F("reportName");
	$("btnPrintNonRenewal")
			.observe(
					"click",
					function() {
							if (!isPolicyNoFieldsOk()) {
								showMessageBox("Please input required fields", "I");
							} else {
								var reason1 = $F("reason1");
								var reason2 = $F("reason2");
								var reason3 = $F("otherReason");
								if (reason1 == 'on'){
									reason1 = "on";
								}else
									reason1 = '';
								if (reason2 == 'on'){
									reason2 = "on";
								}else
									reason2 = '';
								if (reason3 == 'on'){
									reason3 = $F("txtOtherReasons");
								}else
									reason3 = '';
								new Ajax.Request(
										//"mainContents",
										contextPath + "/NonRenewalController",
										{
											evalScripts : true,
											method : "POST",
											parameters : {
												action : "printNonRenew",
												reportName : reportName,
												policyId : $F("policyId"),
												lineCd : $F("txtLineCd"),
												sublineCd : $F("txtSublineCd"),
												issCd : $F("txtIssCd"),
												issueYY : $F("txtIssueYy"),
												polSeqNo : $F("txtPolSeqNo"),
												renewNo : $F("txtRenewNo"),
												reason1 : reason1,
												reason2 : reason2,
												reason3 : reason3,
												notedBySign : $F("notedBySign"),
												notedByDesig : $F("notedByDesig"),
												sign : $F("sign"),
												desig : $F("desig")
											},
											onCreate : showNotice("Generating report. Please wait..."),
											onComplete : function(response) {
												//printOutputPdf();
												$("hiddenDiv").update(response.responseText);
											}
										});
							}
					});

	$("nonRenewalExit").observe(
			"click",
			function() {
				goToModule(divToUpdate, contextPath + "/pages/main.jsp",
						"Please wait.....", "Home");
			});

	$("btnCancelNonRenewal").observe(
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

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
