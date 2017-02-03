<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- datepicker -->

<!--  -->
<script>
</script>

<div id="printMcSwornMenu">
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
<input type="hidden" id="testClaimId" name="testClaimId" value="${testClaimId}">
<input type="hidden" id="testRecoveryId" name="testRecoveryId" value="${testRecoveryId}">
<input type="hidden" id="testUserId" name="testUserId" value="${testUserId}">
<input type="hidden" id="testUserEmail" name="testUserEmail" value="${testUserEmail}">
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
</div>
<%-- <input type="text" id="letterType" name= "letterType" value = "${letterType}"> --%>
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Demand Letter</label>
		<!--  <span class="refreshers"
			style="margin-top: 0;"> <label id="reloadForm"
			name="reloadForm" title="Reload Form">Reload Form</label>
		</span> -->
	</div>
</div>
<div id="demandLetterDetailsDiv">
	<div id="demandLetterSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="demandLetterMainDiv"
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
						<td class="rightAligned" style="width: 25%;">Car Company</td>
						<td class="leftAligned"><input id="txtCarCompany"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Car Company" disabled /></td>
					</tr>
					</table>
				</div>
				
				<!-- letter type -->
				<div id="demandLetterTypeDiv" name="demandLetterTypeDiv"
					style="width: 100%; text-align: center;">
					<table style="margin-top: 10px; width: 100%;">
						<!-- <tr>
						<td><input type="radio" id="rdoFirst" name="demandLetterType"
							value="1"
							style="margin-left: 15px; float: left; margin-left: 50px;"
							checked="" /> <label for="rdoFirst" style="margin-top: 3px;">FIRST DEMAND LETTER</label>
						</td>
						</tr>
						<tr>
						<td><input type="radio" id="rdoSecond" name="demandLetterType"
							value="2"
							style="margin-left: 15px; float: left; margin-left: 50px;"
							checked="" /> <label for="rdoSecond" style="margin-top: 3px;">SECOND DEMAND LETTER</label>
						</td>
						</tr> -->
						
						<tr>
						<td class="rightAligned" style="width: 35%;"></td>
						<td class="rightAligned"><input type="radio" id="rdoFirst" name="demandLetterType"
							value="1"
							style="margin-left: 15px; float: left; margin-left: 50px;"
							checked="" /> <label for="rdoFirst" style="margin-top: 3px;">FIRST DEMAND LETTER</label>
						</td>
						</tr>
						<tr>
						<td class="rightAligned" style="width: 35%;"></td>
						<td class="rightAligned"><input type="radio" id="rdoSecond" name="demandLetterType"
							value="2"
							style="margin-left: 15px; float: left; margin-left: 50px;"
							checked="" /> <label for="rdoSecond" style="margin-top: 3px;">SECOND DEMAND LETTER</label>
						</td>
						</tr>
					</table>
					</div>
					<!-- end -->
			</div>
			
			<div class="sectionDiv" id="miscDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">User Id</td>
						<td class="leftAligned">
							<input id="txtUserId" name="capsField" class="leftAligned upper" type="text"
							style="width: 65%;" value="${adhocUser}"
							title="User Id" />
						</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">User Email</td>
						<td class="leftAligned">
							<input id="txtUserEmail" name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Email" />
						</td>
					</tr>
				</table>
			</div>

			<div class="sectionDiv" id="printDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
				<div id="printDemandLetterButtonsDiv" align="center">
					<input type="button" class="button" style="width: 90px;"
						id="btnCancel" value="Cancel">
					<input type="button" class="button" style="width: 90px;" id="btnPrint" value="Print">
					<input type="button" class="button" style="width: 90px;" id="btnReprint" value="Reprint">
				</div>
			</div>
			
			<div id="blankDiv">
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var lineCd = $F("lineCd");
	var page = $F("page");
	var reportName = 'GICLR025_PCI';
	var reprintName = 'GICLR025_PCI_REPRINT';
	//makeAllInputFieldsUpperCase();
	makeInputFieldUpperCase();
	$("txtSublineCd").focus();
	$("rdoFirst").checked = true;
	$("rdoSecond").disable();
	$("btnPrint").disable();
	$("btnReprint").disable();
	$("txtUserId").disable();
	
	$$("input[name='demandLetterType']").each(function(radio) {
		radio.observe("click", function() {
			toogleLetterTypeOption(radio.value);
			paramType = radio.value;
		});
	});
	
	function toogleLetterTypeOption(option){
		if(option == '1'){
			reportName = 'GICLR025_PCI';
			reprintName = 'GICLR025_PCI_REPRINT';
		}else if(option == '2'){
			reportName = 'GICLR025_B_PCI';
			reprintName = 'GICLR025_B_PCI_REPRINT';
		}
	}
	
	$("searchForPolicy")
			.observe(
					"click",
					function() {
						if (isPolicyNoFieldsOk()) {
							var userInput = "93 " +$F("txtLineCd") + " " + $F("txtIssCd").trim().toUpperCase();
							if(!checkUserAccess(userInput,userAccessObj, userAccessObjLength)){
								showMessageBox("User has no access", "E");
							}else if(!/^[a-zA-Z]*$/g.test($F("txtIssCd").trim())){
								showMessageBox("Please input valid characters", "I");
							}else if(!/^\d+$/.test($F("txtClaimYy").trim())){
								showMessageBox("Invalid Input. Claim Year must be number", "E");
							}else if(!/^\d+$/.test($F("txtClaimSeqNo").trim())){
								showMessageBox("Invalid Input. Claim Seq No must be number", "E");
							}else{
							new Ajax.Updater(
									'infoDiv',
									contextPath + '/DemandLetterController',
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "checkClaimNo",
											redirectPage : "/pages/claims/Demand Letter/infoDiv.jsp",
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
	$("btnPrint")
			.observe(
					"click",
					function() {
						var txtUserEmail = $F("txtUserEmail");
						var txtUserId = $F("txtUserId");
							if (checkBlankNull(txtUserEmail) || checkBlankNull(txtUserId)) {
								showMessageBox("Please input required fields", "I");
							} else {
								new Ajax.Request(
										//"mainContents",
										contextPath + "/DemandLetterController",
										{
											evalScripts : true,
											method : "POST",
											parameters : {
												action : "printDemandLetter",
												reportName : reportName,
												claimId : $F(claimId),
												recoveryId : $F(recoveryId),
												userId : $F("txtUserId"),
												userEmail : $F("txtUserEmail")
											},
											onCreate : showNotice("Generating report. Please wait..."),
											onComplete : function(response) {									
												$("hiddenDiv")
												.update(
														response.responseText);
												printOutputPdf();
												printConfirm2();
											}
										});
							}
					});
	
	$("btnReprint").observe("click",function(){
		var txtUserEmail = $F("txtUserEmail");
		var txtUserId = $F("txtUserId");
				if(!checkBlankNull($F("claimId"))){
				new Ajax.Request(
						//"mainContents",
						contextPath + "/DemandLetterController",
						{
							evalScripts : true,
							method : "POST",
							parameters : {
								action : "reprintDemand",
								reportName : reprintName,
								claimId : $F("claimId"),
								userId : $F("txtUserId"),
								userEmail : $F("txtUserEmail")
							},
							onCreate : showNotice("Generating report. Please wait..."),
							onComplete : function(response) {
								$("hiddenDiv")
								.update(
										response.responseText);
								printOutputPdf();
							}
						});
				}else
					showMessageBox("Please enter valid claim no.", "I");
			/*}*/
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

	function printConfirm(){
	    if (confirm("Successfully printed?") == true) {
	        new Ajax.Updater(
					'infoDiv',
					contextPath + '/DemandLetterController',
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "insertToTables",
							testClaimId : $F("testClaimId"),
							testRecoveryId : $F("testRecoveryId"),
							testUserId : $F("testUserId"),
							testUserEmail : $F("testUserEmail"),
							reportName : reportName
						},
						onCreate : showNotice("Updating tables. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
							/* $("hiddenDiv")
							.update(
									response.responseText); */
						}
					});
	    }
	}
	
	function printConfirm2(){
		showConfirmBox("Confirmation", "Successfully printed?", "Yes", "No",
				function(){
			new Ajax.Updater(
					'infoDiv',
					contextPath + '/DemandLetterController',
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "insertToTables",
							testClaimId : $F("testClaimId"),
							testRecoveryId : $F("testRecoveryId"),
							testUserId : $F("testUserId"),
							testUserEmail : $F("testUserEmail"),
							reportName : reportName
						},
						onCreate : showNotice("Updating tables. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
						}
					});
				},
				function(){
					
				},"1"
		);
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

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
