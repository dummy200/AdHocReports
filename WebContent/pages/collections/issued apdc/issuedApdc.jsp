<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="otherBondMenu">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="btnExit">Exit</a></li>
			</ul>
		</div>
	</div>
</div>

<!-- hidden fields -->
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="reportTitle" name="reportTitle"
	value="${reportTitle}">
<input type="hidden" id="reportUrl" name="reportUrl"
	value="${reportUrl}">
<input type="hidden" id="selDestination" name="selDestination"
	value="screen">
<input type="hidden" id="notedBySign1" value="">
<input type="hidden" id="notedBySign2" value="">
<input type="hidden" id="notedBySign3" value="">
<input type="hidden" id="notedBySign4" value="">
<input type="hidden" id="BranchName" value="">
<!-- <input type="hidden" id="UserId" value=""> -->
<!--  -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Issued Acknowledgement Receipt for
			Post-Dated Checks</label>
	</div>
</div>



<div class="sectionDiv" style="margin-bottom: 10px;">
	<br>
	<div class="sectionDiv"
		style="margin: 10px; margin-left: 60px; display: block; margin-top: 2px; float: left; width: 700px;">
		<br> <label>&nbsp;&nbsp;&nbsp;Date Parameter</label>
		<table style="margin-top: 10px; width: 100%;">
			<tr>
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
		</table>
		<br>
	</div>

	<div class="sectionDiv"
		style="margin: 10px; margin-left: 60px; display: block; margin-top: 0px; float: left; width: 700px;">
		<br>
		<div class="sectionDiv"
			style="margin: 10px; margin-left: 10px; display: block; margin-top: 0px; float: left; width: 150px; height: 130px">
			<br> <label>&nbsp;&nbsp;&nbsp;Print Tag</label>
			<table style="margin-top: 10px; width: 100%;">
				<tr>
					<td class="leftAligned"></td>
					<td class="leftAligned"><input type="radio"
						class="leftAligned" id="rdPrintTag" name="rdPrintTag1"
						value="rdUnPrinted">UNPRINTED</td>
				</tr>
				<tr>
					<td class="leftAligned"></td>
					<td class="leftAligned"><input type="radio"
						class="leftAligned" id="rdPrintTag" name="rdPrintTag1"
						value="rdPrinted">PRINTED</td>
				</tr>
				<tr>
					<td class="leftAligned"></td>
					<td class="leftAligned"><input type="radio"
						class="leftAligned" id="rdPrintTag" name="rdPrintTag1"
						value="rdAll" checked>ALL</td>
				</tr>
			</table>
			<br>
		</div>

		<div class="sectionDiv"
			style="margin: 10px; margin-left: 2px; display: block; margin-top: 0px; float: left; width: 150px;">
			<br> <label>&nbsp;&nbsp;&nbsp;User Group</label>
			<table style="margin-top: 10px; width: 100%;">
				<tr>
					<td class="leftAligned"></td>
					<td class="leftAligned"><input type="radio"
						class="leftAligned" id="rdUserGrp" name="rdUserGrp1" value="rdClg">CLG
					</td>
				</tr>
				<tr>
					<td class="leftAligned"></td>
					<td class="leftAligned"><input type="radio"
						class="leftAligned" id="rdUserGrp" name="rdUserGrp1" value="rdPs">PS
						BANK</td>
				</tr>
				<tr>
					<td class="leftAligned"></td>
					<td class="leftAligned"><input type="radio"
						class="leftAligned" id="rdUserGrp" name="rdUserGrp1" value="rdHo">COLLECTION
						HO</td>
				</tr>
				<tr>
					<td class="leftAligned"></td>
					<td class="leftAligned"><input type="radio"
						class="leftAligned" id="rdUserGrp" name="rdUserGrp1"
						value="rdOther" checked>OTHER BRANCH</td>
				</tr>
			</table>
			<br>
		</div>

		<div class="sectionDiv"
			style="margin: 10px; margin-left: 1px; display: block; margin-top: 0px; float: left; width: 350px; height: 130px;">
			<table style="margin-top: 40px; width: 100%;">
				<tr>
					<td class="rightAligned" style="width: 25%;">Branch</td>
					<td class="leftAligned"><select name="selBranch"
						id="selBranch" style="width: 200px;">
							<option value=""></option>
							<c:forEach var="branch" items="${branches}">
								<option value = "${branch.issCd}">${branch.issName}</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
		</div>
		<br>
	</div>

	<div class="sectionDiv"
		style="margin: 10px; margin-left: 60px; display: block; margin-top: 0px; float: left; width: 700px;">
		<br> <label>&nbsp;&nbsp;&nbsp;Report Signatory</label>
		<table style="margin-top: 10px; width: 100%;">
			<tr>
				<td class="rightAligned" style="width: 30%;">Printed by</td>
				<td class="leftAligned"><select name="selNotedBy1"
					id="selNotedBy1" style="width: 250px;">
						<option value=""></option>
						<c:forEach var="sign" items="${signatoryList}">
							<option>${sign.signatory}</option>
						</c:forEach>
				</select></td>

				<td class="rightAligned" style="width: 30%;">Noted by</td>
				<td class="leftAligned"><select name="selNotedBy2"
					id="selNotedBy2" style="width: 250px;">
						<option value=""></option>
						<c:forEach var="sign" items="${signatoryList}">
							<option>${sign.signatory}</option>
						</c:forEach>
				</select></td>

				<td class="rightAligned" style="width: 5%;"></td>

			</tr>
			<tr>
				<td class="rightAligned" style="width: 30%;">Checked by</td>
				<td class="leftAligned"><select name="selNotedBy3"
					id="selNotedBy3" style="width: 250px;">
						<option value=""></option>
						<c:forEach var="sign" items="${signatoryList}">
							<option>${sign.signatory}</option>
						</c:forEach>
				</select></td>

				<td class="rightAligned" style="width: 30%;">Received by</td>
				<td class="leftAligned"><select name="selNotedBy4"
					id="selNotedBy4" style="width: 250px;">
						<option value=""></option>
						<c:forEach var="sign" items="${signatoryList}">
							<option>${sign.signatory}</option>
						</c:forEach>
				</select></td>

				<td class="rightAligned" style="width: 5%;"></td>

			</tr>
			<tr>
				<td class="rightAligned" style="width: 25%;"></td>
				<td class="leftAligned"><input id="notedByDesig"
					class="leftAligned" type="hidden" name="notedByDesig"
					style="width: 200px;" title="Designation" disabled /></td>
			</tr>
		</table>

		<br>
		<div id="otherBondButtonsDiv" align="center">
			<input type="button" class="button" style="width: 90px;"
				id="btnCancel" value="Cancel"> <input type="button"
				class="button" style="width: 90px;" id="btnPrintReport"
				value="Print">
		</div>
		<br>

	</div>
</div>
<script type="text/javascript">
	makeAllInputFieldsUpperCase();
	//$("btnPrintReport").enable();
	
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});
	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	
	function compareDate(fromDate, toDate) {
		var date1 = new Date(fromDate);
		var date2 = new Date(toDate);
		if (date1.getTime() > date2.getTime()) {
			return true
		}else
			return false;
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
	
	
	
	function CheckInput(input){
		if(input==''||input==null)
			return false;
			return true;
	}	
	

	$("selNotedBy1").observe("change", function(){
		var selected = $("selNotedBy1").getValue();
		getNotedBy1(selected,"notedBySign1");
	});

	function getNotedBy1(selected,txtSign1){
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
		
		var sign = '';
		var desig = '';
		
		for (var i = 0; i < signatoryId.length; i++) {
		if (selected == signatory[i]) {
			 sign = signatory[i];
			 desig = designation[i];
		}
		}
		$(txtSign1).writeAttribute("value",sign);
		}
	
	$("selNotedBy2").observe("change", function(){
		var selected = $("selNotedBy2").getValue();
		getNotedBy2(selected,"notedBySign2");
	});
	
	function getNotedBy2(selected,txtSign2){
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
		
		var sign = '';
		var desig = '';
		
		for (var i = 0; i < signatoryId.length; i++) {
		if (selected == signatory[i]) {
			 sign = signatory[i];
			 desig = designation[i];
		}
		}
		$(txtSign2).writeAttribute("value",sign);
		}
	
	
	$("selNotedBy3").observe("change", function(){
		var selected = $("selNotedBy3").getValue();
		getNotedBy3(selected,"notedBySign3");
	});
	
	function getNotedBy3(selected,txtSign3){
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
		
		var sign = '';
		var desig = '';
		
		for (var i = 0; i < signatoryId.length; i++) {
		if (selected == signatory[i]) {
			 sign = signatory[i];
			 desig = designation[i];
		}
		}
		$(txtSign3).writeAttribute("value",sign);
		}
	
	$("selNotedBy4").observe("change", function(){
		var selected = $("selNotedBy4").getValue();
		getNotedBy4(selected,"notedBySign4");
	});
	
	function getNotedBy4(selected,txtSign4){
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
		
		var sign = '';
		var desig = '';
		
		for (var i = 0; i < signatoryId.length; i++) {
		if (selected == signatory[i]) {
			 sign = signatory[i];
			 desig = designation[i];
		}
		}
		$(txtSign4).writeAttribute("value",sign);
		}
	
	$$("input[name='rdPrintTag1']").each(function(radio) {
		radio.observe("click", function() {
			toogleDataPrintTag(radio.value);
			paramType = radio.value;
		});
	});
	
	var datatag  = '';
	function toogleDataPrintTag(option){
		if (option == 'rdPrinted'){
			datatag = 'P';
		}else if (option == 'rdUnPrinted'){
			datatag = 'N';
		}else{
			datatag = '';
		}
		//alert(datatag);
	}
	
	$$("input[name='rdUserGrp1']").each(function(radio) {
		radio.observe("click", function() {
			toogleDataGroup(radio.value);
			paramType = radio.value;
		});
	});
	
	var datagroup  = '';
	function toogleDataGroup(option){
		if (option == 'rdClg'){
			datagroup = 153;
		}else if (option == 'rdPs'){
			datagroup = 145;
		}else if(option == 'rdHo'){
			datagroup = 10;
		}else{
			datagroup = '';
		}
		//alert(datagroup);
	}
	
	
	$("btnPrintReport").observe("click", function() {
	if(compareDate($F("txtFromDate"),$F("txtToDate")))
	{
		showMessageBox("\"From Date\" must be earlier from \"To Date\".",
		"E");
	}else if (ifNotEmpty()){
		showMessageBox("\"From Date\" and \"To Date\" is required.",
		"E");
	}else if((checkBlankNull($F("selNotedBy1"))) || (checkBlankNull($F("selNotedBy2"))) 
			|| (checkBlankNull($F("selNotedBy3"))) || (checkBlankNull($F("selNotedBy4")))){
 		showMessageBox("Please input signatory fields", "I");
	}else
		{
			new Ajax.Updater(
					"mainContents",
					contextPath
							+ "/IssuedApdcController",
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "printBondsReport",
							datagroup : datagroup,
							datatag  : datatag,
							dateFrom : $F("txtFromDate"),
							dateTo :$F("txtToDate"),
							branch : $F("selBranch"),
							checkby1 :$F("notedBySign1"),
							checkby2 :$F("notedBySign2"),
							checkby3 :$F("notedBySign3"),
							checkby4 :$F("notedBySign4"),
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
	
	
	
</script>
