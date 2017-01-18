<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- datepicker -->

<!--  -->

<div id="printMcSwornMenu">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="mcSwornExit">Exit</a></li>
			</ul>
		</div>
	</div>
</div>

<!-- hidden fields -->
<input type="hidden" id="page" name="page" value="${page}">
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="userId" name= "userId" value = "${adhocUser}">
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
<input type="hidden" id="notedBySign" value=""> 
<input type="hidden" id="notedByDesig" value="">
<input type="hidden"id="sign" value=""> 
<input type="hidden" id="desig" value="">
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Motor Car - Sworn Statement in Proof of Loss</label>
		<!--  <span class="refreshers"
			style="margin-top: 0;"> <label id="reloadForm"
			name="reloadForm" title="Reload Form">Reload Form</label>
		</span> -->
	</div>
</div>
<div id="mcSwornDetailsDiv">
	<div id="mcSwornSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="mcSwornMainDiv"
			style="width: 90%; height: 550px; margin-top: 40px; margin-left: 45px; margin-bottom: 50px;">
			<!-- individual -->
			<div class="sectionDiv" id="individualDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Claim No.</td>
						<td class="leftAligned">
							<input id="txtLineCd" class="leftAligned required upper" type="text" name="capsField" style="width: 8%;" value="MC" title="Line Code" disabled/>
							<input id="txtSublineCd" class="leftAligned upper" type="text" name="capsField" style="width: 15%;" value="" title="Subline Code" maxlength="7" />
							<input id="txtIssCd" class="leftAligned upper" type="text" name="capsField" style="width: 8%;" value="" title="Issue Source Code" maxlength="2" />
							<input id="txtClaimYy" class="leftAligned integerNoNegativeUnformattedNoComma upper" type="text" name="intField" style="width: 8%;" value="" title="Year" maxlength="2" />
							<input id="txtClaimSeqNo" class="leftAligned integerNoNegativeUnformattedNoComma upper" type="text" name="intField" style="width: 15%;" value="" title="Policy Sequence Number" maxlength="7" />
						 	<span> <img src="${pageContext.request.contextPath}/images/misc/searchIcon.png" id="searchForPolicy" name="searchForPolicy" alt="Go" style="margin-top: 2px;" title="Search Policy" /></span></td>
					</tr>
				</table>
				<!-- returns -->
				<div id="infoDiv" name="infoDiv"
					style="width: 100%; text-align: center;">
					<%-- <jsp:include page="/pages/policy issuance/mc renewal cover/infoDiv.jsp"></jsp:include> --%>
					<table style="margin-top: 10px; width: 100%;">
						<tr>
						<td class="rightAligned" style="width: 25%;">Policy No.</td>
						<td class="leftAligned"><input id="txtPolicyNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Policy No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Insured Name</td>
						<td class="leftAligned"><input id="txtAssuredName"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Assured Name" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Model Year</td>
						<td class="leftAligned"><input id="txtModelYear"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Model Year" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Motor Type</td>
						<td class="leftAligned"><input id="txtMotorType"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Motor Type" disabled /></td>
					</tr>
					</table>
				</div>
				<table style="margin-top: 10px; width: 100%;">
						<tr>
						<td class="rightAligned" style="width: 10%;"></td>
						<td class="leftAligned"><input type="radio" id="rdoPartialLoss" name="lossType"
							value="1"
							style="margin-left: 15px; float: left; margin-left: 50px;"
							checked="" /> <label for="rdoPartialLosst" style="margin-top: 3px;">Partial Loss</label>
						</td>
						<td  style="width: 50%"><input type="radio" id="rdoTotalLoss" name="lossType"
							value="0"
							style="margin-left: 15px; float: left; margin-left: 50px;"
							checked="" /> <label for="rdoTotalLoss" style="margin-top: 3px;">Total Loss</label>
						</td>
					</tr>
					</table>
			</div>
			<div class="sectionDiv" id="miscDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Witness</td>
						<td class="leftAligned">
							<input id="txtWitness" name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Witness" />
						</td>
					</tr>
				</table>
			</div>

			<div class="sectionDiv" id="printDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
				<div id="printMcSwornButtonsDiv" align="center">
					<input type="button" class="button" style="width: 90px;"
						id="btnCancelMcSworn" value="Cancel">
					<input type="button" class="button" style="width: 90px;" id="btnPrintMcSworn" value="Print">
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
	$("txtSublineCd").focus();
	$("rdoPartialLoss").checked = true;
	$("rdoPartialLoss").click();
	
	var lossType = '1';
	$$("input[name='lossType']").each(function(radio) {
		radio.observe("click", function() {
			//toogleDateOption(radio.value);
			//paramType = radio.value;
			lossType = radio.value;
			});
	});
	
	$("searchForPolicy")
			.observe(
					"click",
					function() {
						if (isPolicyNoFieldsOk()) {
							var userInput = "93 " +$F("txtLineCd") + " " + $F("txtIssCd").trim().toUpperCase();
							if(!checkUserAccess(userInput,userAccessObj, userAccessObjLength)){
								//alert("User has no access.");
								showMessageBox("User has no access.", "E");
							}else if(!/^\d+$/.test($F("txtClaimYy").trim())){
								showMessageBox("Invalid Input. Claim Year must be number", "E");
							}else if(!/^\d+$/.test($F("txtClaimSeqNo").trim())){
								showMessageBox("Invalid Input. Claim Seq No must be number", "E");
							}else{
							new Ajax.Updater(
									'infoDiv',
									contextPath + '/McSwornController',
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "checkClaimNo",
											//moduleId : "onePager",
											redirectPage : "/pages/claims/MC Sworn/infoDiv.jsp",
											lineCd : $F("txtLineCd").trim().toUpperCase(),
											sublineCd : $F("txtSublineCd").trim().toUpperCase(),
											issCd : $F("txtIssCd").trim().toUpperCase(),
											clmYy : $F("txtClaimYy").trim(),
											clmSeqNo : $F("txtClaimSeqNo").trim()
										},
										onCreate : showNotice("Fetching Details. Please wait..."),
										onComplete : function(response) {
											hideNotice("");
										}
									});
							}
						} else {
							//alert("Please input required fields");
							showMessageBox("Please input required fields", "I");
						}
						$("txtSublineCd").focus();
					});

	function isPolicyNoFieldsOk() {
		var lineCd = $F("txtLineCd");
		var sublineCd = $F("txtSublineCd");
		var issCd = $F("txtIssCd");
		var claimYy = $F("txtClaimYy");
		var claimSeqNo = $F("txtClaimSeqNo");
		if (checkBlankNull(lineCd) || checkBlankNull(sublineCd)
				|| checkBlankNull(issCd) || checkBlankNull(claimYy)
				|| checkBlankNull(claimSeqNo)) {
			return false;
		} else
			return true;
	}

	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
	$("btnPrintMcSworn")
			.observe(
					"click",
					function() {
							if (!isPolicyNoFieldsOk()) {
								//alert("Please input required fields");
								showMessageBox("Please input required fields", "I");
							} else {
								new Ajax.Updater(
										"mainContents",
										contextPath + "/McSwornController",
										{
											evalScripts : true,
											method : "POST",
											parameters : {
												action : "printMcSworn",
												lineCd : $F("txtLineCd"),
												sublineCd : $F("txtSublineCd"),
												issCd : $F("txtIssCd"),
												clmYy : $F("txtClaimYy"),
												clmSeqNo : $F("txtClaimSeqNo"),
												userId : $F("userId"),
												witness : $F("txtWitness"),
												lossType : lossType
											},
											onCreate : showNotice("Generating report. Please wait..."),
											onComplete : function(response) {
												printOutputPdf();
											}
										});
							}
					});

	$("mcSwornExit").observe(
			"click",
			function() {
				goToModule(divToUpdate, contextPath + "/pages/main.jsp",
						"Please wait.....", "Home");
			});

	$("btnCancelMcSworn").observe(
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

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
