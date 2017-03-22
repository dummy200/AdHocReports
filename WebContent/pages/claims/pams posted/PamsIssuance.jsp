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
<div id="hiddenDiv">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="reportTitle" name="reportTitle" value="${reportTitle}">
<input type="hidden" id="reportUrl" name="reportUrl" value="${reportUrl}">
<input type="hidden" id="selDestination" name="selDestination" value="screen">
</div>
<input type="hidden" id="notedBySign" value=""> 
<input type="hidden" id="BranchName" value=""> 
<input type="hidden" id="adhocUser" name="adhocUser" value="${adhocUser}">
<input type="hidden" id="UserId" value="">
<!--   -->

<br />
<br />
<div id ="outerDiv" name="outerDiv">
	<div id ="innerDiv" name="outerDiv">
		<label id="pageTitle">Issued Policies and Created Assured</label>
	</div>
</div>



<div class="sectionDiv" style="margin-bottom: 10px;">
<br>
<div class="sectionDiv" style="margin: 10px; margin-left: 60px; display: block; margin-top: 2px; float: left; width: 450px;">	
	<br>
			<label>&nbsp;&nbsp;&nbsp;Based on Posting Date</label>	
			<table style="margin-top: 10px; width: 100%;">
			<tr>	
						<td class="rightAligned" style="width: 25%;">From</td>
						<td class="leftAligned" style="width: 42%;">
							<div
								style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
								<input type="text"
									style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
									name="fmDate" id="txtFromDate" readonly="readonly" /> <img id="imgFromDate" alt="goPolicyNo"
									style="height: 18px;" class="hover"
									src="${pageContext.request.contextPath}/images/misc/but_calendar.gif"/>
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
									name="toDate" id="txtToDate" readonly="readonly"/> <img id="imgToDate" alt="goPolicyNo"
									style="height: 18px;" class="hover"
									src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
							</div>
						</td>
						
			</tr>
			</table>
			<br>
			</div>
			
<div class="sectionDiv" style="margin: 10px; margin-left: 60px; display: block; margin-top: 0px; float: left; width: 450px;">
	<table style="margin-top: 10px; width: 100%;">
				<tr>	
					<td class="rightAligned" style="width: 25%;">
						Branch
					</td>
					<td class="leftAligned">
							<select name="selBranch"
								id="selBranch" style="width: 200px;">
									<option value=""></option>
									<c:forEach var="branch" items="${branches}">
										<option value="${branch.issCd}">${branch.issName}</option>
									</c:forEach>
							</select>
							
						<!-- <input id="BranchDesc" class="leftAligned" type="text" name="BranchDesc" 
						style="width: 200px; height: 12px;" title="Branch Description" disabled/>	 -->		
					</td>
				</tr>
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
	<br>			
</div>	
		
<div class="sectionDiv" style="margin: 10px; margin-left: 60px; display: block; margin-top: 0px; float: left; width: 450px;">
			<table style="margin-top: 10px; width: 100%;">
			<tr>	
				<td class="rightAligned" style="width: 25%;">
					Check by 
				</td>
				<td class="leftAligned">
						<select name="selNotedBy"
							id="selNotedBy" style="width: 250px;">
								<option value=""></option>
								<c:forEach var="sign" items="${signatoryList}">
									<option>${sign.signatory}</option>
								</c:forEach>
						</select>			
				</td>
			</tr>
			<tr>
				<td class="rightAligned" style="width: 25%;">
				Designation
				</td>
					<td class="leftAligned"><input id="notedByDesig" class="leftAligned" type="text" name="notedByDesig" 
						style="width: 243px;" title="Designation" disabled/>
				  </td>	
			</tr>
			<tr>
				   <td class="leftAligned"></td>
				   <td class="leftAligned">
				   		<input type="radio" class="leftAligned" id="rdPams1" name="rdPams" value="rdSummary" checked >SUMMARY ISSUED POLICIES
				   </td>
			</tr>	
			<tr>   
			       <td class="leftAligned"></td>
				   <td class="leftAligned">				       
 				       <input type="radio" class="leftAligned" id="rdPams1" name="rdPams" value="rdPerAssued">SUMMARY CREATED ASSURED
				   </td>
			</tr>
			<tr>	   
				   <td class="leftAligned"></td>
				   <td class="leftAligned">				       
				      <input type="radio" class="leftAligned" id="rdPams1" name="rdPams" value="rdPerSpoilage">PER SPOILAGE REASON
				   </td>
			</tr>	
			</table>
			<br>
			
			<div id="otherBondButtonsDiv" align="center">
				<input type="button" class="button" style="width: 90px;" id="btnCancel" value="Cancel">
				<input type="button" class="button" style="width: 90px;" id="btnPrintReport" value="Print">
			</div>
			<br>
	</div>		
    </div>
<script type="text/javascript">
	$("hiddenDiv").hide();
	makeAllInputFieldsUpperCase();
	$("btnPrintReport").enable();
	
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
	

	$("selNotedBy").observe("change", function(){
		var selected = $("selNotedBy").getValue();
		getNotedBy(selected,"notedBySign","notedByDesig");
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
		
		var sign = '';
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
		getBranch(selected,"BranchName","BranchDesc");
	}); */
	
	function getBranch(selected,txtBranchName,txtBranchDesc){
		var content = '';
		var issId = [
		                 <c:forEach var="branch" items="${branches}" varStatus="loop">
		                   "${branch.issId}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var issCd = [
		                 <c:forEach var="branch" items="${branches}" varStatus="loop">
		                   "${branch.issCd}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var issName = [
		             <c:forEach var="branch" items="${branches}" varStatus="loop">
		               "${branch.issName}"
		               <c:if test="${!loop.last}">,</c:if>
		             </c:forEach>
		           ];
		
		var branchName = '';
		var branchDesc = '';
		
		for (var i = 0; i < issId.length; i++) {
		if (selected == issCd[i]) {
			branchName = issCd[i];
			branchDesc = issName[i];
		}
		}
		$(txtBranchName).writeAttribute("value",branchName);
		$(txtBranchDesc).writeAttribute("value",branchDesc);
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
	
	$$("input[name='rdPams']").each(function(radio) {
		radio.observe("click", function() {
			toogleDataOption(radio.value);
			paramType = radio.value;
		});
	});
	
	var dataType   = 'rdSummary';
	function toogleDataOption(option){
		if(option == 'rdSummary'){
			dataType = 'rdSummary';
		}else if (option == 'rdPerSpoilage'){
			dataType = 'rdPerSpoilage';
		}else if (option == 'rdPerAssued'){
			dataType = 'rdPerAssued';
		}
	}
	
	
	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
	$("btnPrintReport").observe("click", function() {
	if(compareDate($F("txtFromDate"),$F("txtToDate")))
	{
		showMessageBox(
				"\"From Date\" must be earlier from \"To Date\".",
				"E");
	}else if (ifNotEmpty()){
		showMessageBox(
				"Date is required.",
				"I");
	}else
		{
			new Ajax.Request(
					//"mainContents",
					contextPath
							+ "/PamsIssuanceController",
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "printBondsReport",
							redirectPage : "/pages/claims/pams posted/PamsIssuance.jsp",
							rdbutton : dataType,
							dateFrom : $F("txtFromDate"),
							dateTo :$F("txtToDate"),
							branch : $F("selBranch"), //$F("BranchName"),
							user :$F("UserId"),
							checkby :$F("notedBySign"),
							checkdes : $F("notedByDesig"),
							userId : $F("adhocUser")
						},
						onCreate : showNotice("Generating report. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
							//outputToPDF($F("reportUrl"), $F("reportTitle"), $F("errorMsg"));
							$("hiddenDiv").update(response.responseText);
						}
					});
	    }
	}
);
	
	//goToPage("btnExit","/pages/main.jsp","Please wait.....", "Home");
	//goToPage("btnCancel","/pages/main.jsp","Please wait.....", "Home");
	
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
