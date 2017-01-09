<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- datepicker -->

<!--  -->
<script>
</script>

<div id="printOfferLetterMenu">
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
<%-- <input type="hidden" id="reportTitle" name="reportTitle"
	value="${reportTitle}">
<input type="hidden" id="reportName" name="reportName"
	value="${reportName}"> --%>
<input type="hidden" id="reportTitle" name="reportTitle"
	value="FCLTOTOFFR">
<input type="hidden" id="reportName" name="reportName"
	value="FCLTOTOFFR">
<input type="hidden" id="reportUrl" name="reportUrl"
	value="${reportUrl}">
<input type="hidden" id="reportXls" name="reportXls"
	value="${reportXls}">
<input type="hidden" id="selDestination" name="selDestination"
	value="screen">
<input type="hidden" id="signatory" name="signatory" value="">
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Motor Car - Offer Letter (Total
			Loss/Carnap)</label>
		<!--  <span class="refreshers"
			style="margin-top: 0;"> <label id="reloadForm"
			name="reloadForm" title="Reload Form">Reload Form</label>
		</span> -->
	</div>
</div>
<div id="offerLetterDetailsDiv">
	<div id="offerLetterSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="offerLetterMainDiv"
			style="width: 90%; margin-top: 40px; margin-left: 45px; margin-bottom: 50px;">
			<!-- individual -->
			<div class="sectionDiv" id="individualDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Claim No.</td>
						<td class="leftAligned"><input id="txtLineCd"
							class="leftAligned required upper" type="text" name="capsField"
							style="width: 8%;" value="MC" title="Line Code" disabled /> <input
							id="txtSublineCd" class="leftAligned upper" type="text"
							name="capsField" style="width: 15%;" value=""
							title="Subline Code" maxlength="7" /> <input id="txtIssCd"
							class="leftAligned upper" type="text" name="capsField"
							style="width: 8%;" value="" title="Issue Source Code"
							maxlength="2" /> <input id="txtClaimYy"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
							type="text" name="intField" style="width: 8%;" value=""
							title="Year" maxlength="2" /> <input id="txtClaimSeqNo"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
							type="text" name="intField" style="width: 15%;" value=""
							title="Policy Sequence Number" maxlength="7" /> <span> <img
								src="${pageContext.request.contextPath}/images/misc/searchIcon.png"
								id="searchForPolicy" name="searchForPolicy" alt="Go"
								style="margin-top: 2px;" title="Search Policy" /></span></td>
					</tr>
				</table>
				<!-- returns -->
				<div id="infoDiv" name="infoDiv"
					style="width: 100%; text-align: center;">
					<%-- <jsp:include page="/pages/policy issuance/mc renewal cover/infoDiv.jsp"></jsp:include> --%>
					<table style="margin-top: 10px; width: 100%;">
						<tr>
						<td class="rightAligned" style="width: 25%;">Claim No.</td>
						<td class="leftAligned"><input id="txtClaimNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Claim No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Assured No.</td>
						<td class="leftAligned"><input id="txtAssdNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Assured No." disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Assured Name</td>
						<td class="leftAligned"><input id="txtAssdName"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Assured Name" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Address</td>
						<td class="leftAligned"><input id="txtAddress"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Address" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Motor No.</td>
						<td class="leftAligned"><input id="txtMotorNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Motor No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Plate No.</td>
						<td class="leftAligned"><input id="txtPlateNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Plate No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Serial No.</td>
						<td class="leftAligned"><input id="txtSerialNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Serial No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Insured Unit</td>
						<td class="leftAligned"><input id="txtInsuredUnit"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Insured Unit" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Loss Amount</td>
						<td class="leftAligned"><input id="txtLossAmt"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Loss Amount" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Deductible Amount</td>
						<td class="leftAligned"><input id="txtDedAmt"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Deductible Amount" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Net Payable</td>
						<td class="leftAligned"><input id="txtNetTotal"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Net Payable" disabled /></td>
					</tr>
					</table>
				</div>
			</div>

			<!-- requirements div -->
			<div class="sectionDiv" id="requirementsDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Requirements</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox1"
							name="chkBox1"> Original Copy of MV/LTO Registration
							Certificate</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox2"
							name="chkBox2"> Original Copy of MV/LTO Official
							Certificate</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox3"
							name="chkBox3"> Original Copy of Policy / Official
							Receipt</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox4"
							name="chkBox4"> Photocopy of Tax Identification Number
							(TIN ID)</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox5"
							name="chkBox5"> Original and Duplicate Keys</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox6"
							name="chkBox6"> Plate Number</td>
					</tr>
					<tr>
						<td colspan="2"><input type="checkbox" id="chkBoxFront"
							name="chkBoxFront" style="margin-left: 250px;" disabled>
							Front</td>
					</tr>
					<tr>
						<td colspan="2"><input type="checkbox" id="chkBoxBack"
							name="chkBoxBack" style="margin-left: 250px;" disabled>
							Back</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox7"
							name="chkBox7"> Original Board Resolution/Secretary's
							Certificate duly
					</tr>
					<tr>
						<td class="rightAligned" style="width: 24%"></td>
						<td class="leftAligned" style="text-indent: 25px;">notorized
							authorizing the sale/disposal of the unit</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 24%"></td>
						<td class="leftAligned" style="text-indent: 25px;">and
							authorized signatory(ies)/corporation</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox8"
							name="chkBox8"> Original Bank Certification that they
							have the original</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 24%"></td>
						<td class="leftAligned" style="text-indent: 25px;">copy of
							Certificate of Registration and Official Receipt</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox9"
							name="chkBox9"> Authorization to Pull-out</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox10"
							name="chkBox10"> Insured Unit (Total loss Salvage Unit)
						</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox11"
							name="chkBox11"> Original Duplicate Copy of Promissory
							Note with</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 24%"></td>
						<td class="leftAligned" style="text-indent: 25px;">Chattel
							Mortgage</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox12"
							name="chkBox12"> Original Release of Chattel Mortgage
							duly signed and authorized</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox13"
							name="chkBox13"> Original Deed of Sale from</td>
					</tr>
					<tr>
						<td colspan="1"></td>
						<td style="float: right; margin-right: 71%;">
							<div
								style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
								<input type="text"
									style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
									name="txtFromDate" id="txtFromDate" readonly="readonly" /> <img
									id="imgFromDate" alt="imgFromDate" style="height: 18px;"
									class="hover"
									src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="1"></td>
						<td style="float: right; margin-right: 71%;">
							<div
								style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
								<input type="text"
									style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
									name="txtToDate" id="txtToDate" readonly="readonly" /> <img
									id="imgToDate" alt="imgToDate" style="height: 18px;"
									class="hover"
									src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
							</div>
						</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox14"
							name="chkBox14"> Original Authorization Letter,
							Authorizing Charter Ping An Insurance Corporation</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 24%"></td>
						<td class="leftAligned" style="text-indent: 25px;">to get the
							original O.R. & C.R. from</td>
					</tr>
					<tr>
						<td colspan="1"></td>
						<td style="float: right; margin-right: 71%;">
							<div
								style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
								<input type="text"
									style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
									name="txtFromDate2" id="txtFromDate2" readonly="readonly" /> <img
									id="imgFromDate2" alt="imgFromDate2" style="height: 18px;"
									class="hover"
									src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
							</div>
						</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox15"
							name="chkBox15"> Valid I.D. of the insured/authorized
							signatories (Government Issued ID)</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox16"
							name="chkBox16"> Manual of Unit</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox17"
							name="chkBox17"> Valid ID of the corporate secretary</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned"><input type="checkbox" id="chkBox18"
							name="chkBox18"> Others</td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;"></td>
						<td class="leftAligned">
							 <input id="txtOthers" name="txtOthers" class="leftAligned" type="text" style="width: 58%; margin-left: 40px;" value="" disabled />
							<!--<textarea rows="2" cols="50" wrap="hard" id="txtOthers" name="txtOthers" class="leftAligned" style="width: 58%; margin-left: 40px;" disabled></textarea> -->
						</td>
					</tr>
				</table>
			</div>

			<div class="sectionDiv" id="miscDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
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
				<div id="printofferLetterButtonsDiv" align="center">
					<input type="button" class="button" style="width: 90px;"
						id="btnCancel" value="Cancel"> <input type="button"
						class="button" style="width: 90px;" id="btnPrint" value="Print">
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	makeInputFieldUpperCase();
	$("txtSublineCd").focus();
	$("btnPrint").disable();
	
	$("txtFromDate").disable();
	$("imgFromDate").hide();
	$("txtFromDate").setStyle('width : 102px');
	$("txtToDate").disable();
	$("imgToDate").hide();
	$("txtToDate").setStyle('width : 102px');
	$("txtFromDate2").disable();
	$("imgFromDate2").hide();
	$("txtFromDate2").setStyle('width : 102px');
	
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});
	
	var asOfCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	
	var fromCalendar2 = new dhtmlXCalendarObject({
		input : "txtFromDate2",
		button : "imgFromDate2"
	});
	
	//toggle for chkBox14 from date
	var toggle14 = 1;
	$('chkBox14').observe('click', function(e) {
        toggleChkBox14();
    });
	
	function toggleChkBox14(){
		$("txtFromDate2").value = "";
		if(toggle14 == 1){
			$("txtFromDate2").enable();
			$("imgFromDate2").show();
			$("txtFromDate2").setStyle('width : 80px');
			toggle14 = 2;
		}else{
			$("txtFromDate2").disable();
			$("imgFromDate2").hide();
			$("txtFromDate2").setStyle('width : 102px');
			toggle14 = 1;
		}
	}
	
	//toggle for chkBox13 from to date
	var toggle13 = 1;
	$('chkBox13').observe('click', function(e) {
        toggleChkBox13();
    });
	
	function toggleChkBox13(){
		$("txtFromDate").value = "";
		$("txtToDate").value = "";
		if(toggle13 == 1){
			$("txtFromDate").enable();
			$("imgFromDate").show();
			$("txtFromDate").setStyle('width : 80px');
			
			$("txtToDate").enable();
			$("imgToDate").show();
			$("txtToDate").setStyle('width : 80px');
			toggle13 = 2;
		}else{
			$("txtFromDate").disable();
			$("imgFromDate").hide();
			$("txtFromDate").setStyle('width : 102px');
			
			$("txtToDate").disable();
			$("imgToDate").hide();
			$("txtToDate").setStyle('width : 102px');
			toggle13 = 1;
		}
	}
	
	//toggle for plate number checkbox
	var toggle6 = 1;
	$('chkBox6').observe('click', function(e) {
        toggleChkBox6();
    });
	
	function toggleChkBox6(){
		$("chkBoxFront").checked = false;
		$("chkBoxBack").checked = false;
		if(toggle6 == 1) {
			$("chkBoxFront").enable();
			$("chkBoxBack").enable();
			toggle6 = 2;
		}else{
			$("chkBoxFront").disable();
			$("chkBoxBack").disable();
			toggle6 = 1;
		}
	}
	
	//toggle for others checkbox
	var toggle18 = 1;
	$('chkBox18').observe('click',function(e){
		toggletxtOthers();
	});
	
	function toggletxtOthers(){
		$("txtOthers").value = "";
		if(toggle18 == 1) {
			$("txtOthers").enable()
			toggle18 = 2;
		}else{
			$("txtOthers").disable()
			toggle18 = 1;
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
	
	function resetInfoDivFields(){
		$("txtClaimNo").value = '';
		$("txtAssdNo").value = '';
		$("txtAssdName").value = '';
		$("txtAddress").value = '';
		$("txtMotorNo").value = '';
		$("txtPlateNo").value = '';
		$("txtSerialNo").value = '';
		$("txtInsuredUnit").value = '';
		$("txtLossAmt").value = '';
		$("txtDedAmt").value = '';
		$("txtNetTotal").value = '';
		$("chkBox1").checked = false;
		$("chkBox2").checked = false;
		$("chkBox3").checked = false;
		$("chkBox4").checked = false;
		$("chkBox5").checked = false;
		$("chkBox6").checked = false;
		$("chkBoxFront").checked = false;
		$("chkBoxBack").checked = false;
		$("chkBox7").checked = false;
		$("chkBox8").checked = false;
		$("chkBox9").checked = false;
		$("chkBox10").checked = false;
		$("chkBox11").checked = false;
		$("chkBox12").checked = false;
		$("chkBox13").checked = false;
		$("chkBox14").checked = false;
		$("txtFromDate").disable();
		$("txtToDate").disable();
		$("txtFromDate2").disable();
		$("txtFromDate").value = '';
		$("txtToDate").value = '';
		$("txtFromDate2").value = '';
		$("chkBox15").checked = false;
		$("chkBox16").checked = false;
		$("chkBox17").checked = false;
		$("chkBox18").checked = false;
		$("txtOthers").disable();
		$("txtOthers").value = '';
		/* $("signatory").value = '';
		$("txtDesignation").value = ''; */
		$("btnPrint").disable();
	}
	
	$("searchForPolicy")
	.observe(
			"click",
			function() {
				if (isPolicyNoFieldsOk()) {
					var userInput = "93 " +$F("txtLineCd") + " " + $F("txtIssCd").trim().toUpperCase();
					if(!checkUserAccess(userInput,userAccessObj, userAccessObjLength)){
						showMessageBox("User has no access.", "E");
						resetInfoDivFields();
					}else if(!/^[a-zA-Z]*$/g.test($F("txtIssCd").trim())){
						showMessageBox("Please input valid characters", "I");
					}else if(!/^\d+$/.test($F("txtClaimYy").trim())){
						showMessageBox("Invalid Input. Claim Year must be number", "E");
						resetInfoDivFields();
					}else if(!/^\d+$/.test($F("txtClaimSeqNo").trim())){
						showMessageBox("Invalid Input. Claim Seq No must be number", "E");
						resetInfoDivFields();
					}else{
						resetInfoDivFields();
						$("btnPrint").enable();
					new Ajax.Updater(
							'infoDiv',
							contextPath + '/OfferLetterController',
							{
								evalScripts : true,
								method : "POST",
								parameters : {
									action : "checkClaimNo",
									redirectPage : "/pages/claims/Offer Letter/infoDiv.jsp",
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
					resetInfoDivFields();
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
			function() {
			 	if (!isPolicyNoFieldsOk()) {
					showMessageBox("Please input required fields", "I");
			 	}else if((checkBlankNull($F("selSign")))){
			 		showMessageBox("Please input signatory fields", "I");
				} else {
					if (compareDate($F("txtFromDate"),$F("txtToDate"))){
						showMessageBox("\"From Date\" must be earlier from \"To Date\".", "E");
					}else{
						new Ajax.Updater(
							"mainContents",
							contextPath + "/OfferLetterController",
							{
								evalScripts : true,
								method : "POST",
								parameters : {
									action : "printOfferLetter",
									lineCd : $F("txtLineCd"),
									sublineCd : $F("sublineCd"),
									issCd : $F("issCd"),
									clmYy : $F("clmYy"),
									clmSeqNo : $F("clmSeqNo"),
									userId : $F("userId"),
									chkBox1 :  $("chkBox1").checked ? "Y" : "N",
									chkBox2 :  $("chkBox2").checked ? "Y" : "N",
									chkBox3 :  $("chkBox3").checked ? "Y" : "N",
									chkBox4 :  $("chkBox4").checked ? "Y" : "N",
									chkBox5 :  $("chkBox5").checked ? "Y" : "N",
									chkBox6 :  $("chkBox6").checked ? "Y" : "N",
									chkBoxFront :  $("chkBoxFront").checked ? "Y" : "N",
									chkBoxBack :  $("chkBoxBack").checked ? "Y" : "N",
									chkBox7 :  $("chkBox7").checked ? "Y" : "N",
									chkBox8 :  $("chkBox8").checked ? "Y" : "N",
									chkBox9 :  $("chkBox9").checked ? "Y" : "N",
									chkBox10 :  $("chkBox10").checked ? "Y" : "N",
									chkBox11 :  $("chkBox11").checked ? "Y" : "N",
									chkBox12 :  $("chkBox12").checked ? "Y" : "N",	
									chkBox13 : $("chkBox13").checked ? "Y" : "N",
									chkBox13a : $("chkBox13").checked ? $F("txtFromDate") : "",
									chkBox13b : $("chkBox13").checked ? $F("txtToDate") : "",
									chkBox14 : $("chkBox14").checked ? "Y" : "N",
									chkBox14a : $("chkBox14").checked ? $F("txtFromDate2") : "",
									chkBox15 : $("chkBox15").checked ? "Y" : "N",
									chkBox16 : $("chkBox16").checked ? "Y" : "N",
									chkBox17 : $("chkBox17").checked ? "Y" : "N",			
									chkBox18 : $("chkBox18").checked ? "Y" :  "N",
									txtOthers : $("chkBox18").checked ? $F("txtOthers") :  "",
									signatory : $F("signatory"),
									designation : $F("txtDesignation")
								},
								onCreate : showNotice("Generating report. Please wait..."),
								onComplete : function(response) {
									printOutputPdf();
									}
								});
							}
				}
			});
	
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
					window.open('pages/report.jsp', '',
							'location=0, toolbar=0, menubar=0, fullscreen=1');
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
	var claimYy = $F("txtClaimYy");
	var claimSeqNo = $F("txtClaimSeqNo");
	if (checkBlankNull(lineCd) || checkBlankNull(sublineCd)
			|| checkBlankNull(issCd) || checkBlankNull(claimYy)
			|| checkBlankNull(claimSeqNo)) {
		return false;
	} else
		return true;
	}
	
	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
