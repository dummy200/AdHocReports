<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="otherBondMenu">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="otherBondExit">Exit</a></li>
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
<!--  -->
</div>

<br />
<br />
<div id ="outerDiv" name="outerDiv">
	<div id ="innerDiv" name="outerDiv">
		<label id="pageTitle">Ri Binder</label>
	</div>
</div>
<div id="otherBondDetailsDiv">
	<div id="otherBondSectionDiv" class="sectionDiv" style="margin-bottom: 10px;">
		<%-- <jsp:include page="/pages/underwriting/reportsPrinting/policyCertificates/policyCertDetails.jsp"></jsp:include> --%>
	<!-- added from policyCertDetails.jsp  -->
	<br/>
	<br/>
	<table style="margin-top: 10px; width: 100%;">
		<tr>
			<td class="rightAligned" style="width: 25%;">
				Policy No.
			</td>
			<td class="leftAligned">
					<input id="txtLineCd" 	 class="leftAligned required" type="text" name="capsField" style="width: 8%;" value="" title="Line Code" maxlength="2" />
					<input id="txtSublineCd" class="leftAligned required" type="text" name="capsField" style="width: 15%;" value="" title="Subline Code"maxlength="7"/>
					<input id="txtIssCd" 	 class="leftAligned required" type="text" name="capsField" style="width: 8%;"  value="" title="Issue Source Code"maxlength="2"/>
					<input id="txtIssueYy"   class="leftAligned integerNoNegativeUnformattedNoComma required" type="text" name="intField"  style="width: 8%;"  value="" title="Year" maxlength="2"/>
					<input id="txtPolSeqNo"  class="leftAligned integerNoNegativeUnformattedNoComma required" type="text" name="intField"  style="width: 15%;" value="" title="Policy Sequence Number" maxlength="7"/>
					<input id="txtRenewNo"   class="leftAligned integerNoNegativeUnformattedNoComma required" type="text" name="intField"  style="width: 8%;"  value="" title="Renew Number" maxlength="2"/>
				    <span>
						<img src="${pageContext.request.contextPath}/images/misc/searchIcon.png" id="searchForPolicy" name="searchForPolicy" alt="Go" style="margin-top: 2px;" title="Search Policy"/>
					</span>
			</td>
		</tr>
		</table>
	<div id="infoOtherBondDoc" name="infoOtherBondDoc" style="width: 100%; text-align: center;">
		<jsp:include page="/pages/reinsurance/ri binder/infoOtherBondDoc.jsp"></jsp:include>
	</div>	
		<br/>
		<br/>
	</div> 
	
	<div id="otherBondButtonsDiv" align="center">
		<input type="button" class="button" style="width: 90px;" id="btnCancel" value="Cancel">
		<input type="button" class="button" style="width: 90px;" id="btnPrintReport" value="Print">
	</div>
</div>

<script type="text/javascript">
	$("hiddenDiv").hide();
	makeAllInputFieldsUpperCase();
	$("txtLineCd").focus();
	$("btnPrintReport").disable();
	$("searchForPolicy").observe("click", function(){
		if (isPolicyNoFieldsOk()){
			var userInput = "96 " + $F("txtLineCd").trim().toUpperCase() + " "
			+ $F("txtIssCd").trim().toUpperCase();
			if (!checkUserAccess(userInput, userAccessObj,
					userAccessObjLength)) {showMessageBox("User has no access.", "E");}else{
			new Ajax.Updater('infoOtherBondDoc', contextPath
					+ '/OutputController', {
				evalScripts : true,
				method: "POST",
				parameters : {
					action : "checkPolicyId",
					moduleId : "bondDocs",
					redirectPage : "/pages/reinsurance/ri binder/infoOtherBondDoc.jsp",
					lineCd : $F("txtLineCd"),
					sublineCd : $F("txtSublineCd"),
					issCd : $F("txtIssCd"),
					issueYY : $F("txtIssueYy"),
					polSeqNo : $F("txtPolSeqNo"),
					renewNo : $F("txtRenewNo")
				},onCreate: showNotice("Fetching Details. Please wait..."),
				onComplete : function(response){
					hideNotice("");
					var errorMsg2 = $F("errorMsg2");
					var assuredName = $F("txtAssuredName");
					if (checkBlankNull($F("errorMsg2"))){
						$("btnPrintReport").enable();
					}else
						showMessageBox("No data found.","E");
				}
				});
				}
		} else {
			showMessageBox("Please input required fields","I");
			$("txtSublineCd").focus();	
		}
	});
	
	function isPolicyNoFieldsOk(){
		var lineCd = $F("txtLineCd");
		var sublineCd = $F("txtSublineCd");
		var issCd = $F("txtIssCd");
		var issueYY = $F("txtIssueYy");
		var polSeqNo = $F("txtPolSeqNo");
		var renewNo = $F("txtRenewNo");
		if (checkBlankNull(lineCd) || checkBlankNull(sublineCd)
				|| checkBlankNull(issCd)
				|| checkBlankNull(issueYY)
				|| checkBlankNull(polSeqNo)
				|| checkBlankNull(renewNo)) {
			return false;
		}else
			return true;
	}
	
	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
	var reportName = "REP_WRITPOSS_BOND";
	var path = "policyissuance/reports/";
	$("btnPrintReport").observe("click", function() {
		if (!isPolicyNoFieldsOk()) {
			showMessageBox("Please input required fields","I");
		} else {
			new Ajax.Request(
					//"mainContents",
					contextPath
							+ "/RiBinderController",
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "printBondsReport",
							redirectPage : "/pages/reinsurance/ri binder/RiBinder.jsp",
							reportName : reportName,
							lineCd : $F("txtLineCd"),
							sublineCd : $F("txtSublineCd"),
							issCd : $F("txtIssCd"),
							issueYY : $F("txtIssueYy"),
							polSeqNo : $F("txtPolSeqNo"),
							renewNo : $F("txtRenewNo")
						},
						onCreate : showNotice("Generating report. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
							$("hiddenDiv").update(response.responseText);
							//outputToPDF($F("reportUrl"), $F("reportTitle"), $F("errorMsg"));
						}
					});
		}
	});
			
	goToPage("otherBondExit","/pages/main.jsp","Please wait.....", "Home");
	goToPage("btnCancel","/pages/main.jsp","Please wait.....", "Home");
	
</script>
