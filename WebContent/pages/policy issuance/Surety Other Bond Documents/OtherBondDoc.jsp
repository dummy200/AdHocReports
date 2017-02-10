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
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="reportTitle" name="reportTitle" value="${reportTitle}">
<input type="hidden" id="reportUrl" name="reportUrl" value="${reportUrl}">
<input type="hidden" id="selDestination" name="selDestination" value="screen">
<input type="hidden" id="notedBySign" value=""> 
<input type="hidden" id="notedByDesig" value="">
<input type="hidden" id="sign" value=""> 
<input type="hidden" id="desig" value="">
<input type="hidden" id="resign" value=""> 
<input type="hidden" id="redesig" value="">
<input type="hidden" id="autsign" value=""> 
<input type="hidden" id="autdesig" value="">
<input type="hidden" id="Cosign" value=""> 
<input type="hidden" id="Codesig" value="">
<!--  -->

<br />
<br />
<div id ="outerDiv" name="outerDiv">
	<div id ="innerDiv" name="outerDiv">
		<label id="pageTitle">Surety - Other Bond Documents</label>
		<span class="refreshers" style="margin-top: 0;">
			<label id="reloadForm" name="reloadForm" title="Reload Form">Reload Form</label>
		</span>
	</div>
</div>
<div id="otherBondDetailsDiv">
	<div id="otherBondSectionDiv" class="sectionDiv" style="margin-bottom: 10px;">
	
	<table style="margin-top: 10px; width: 100%;">
		<tr>
			<td class="rightAligned" style="width: 25%;">
				Policy No.
			</td>
			<td class="leftAligned">
					<input id="txtLineCd" 	 class="leftAligned required" type="text" name="capsField" style="width: 8%;" value="SU" title="Line Code" maxlength="2" disabled="disabled"/>
					<input id="txtSublineCd" class="leftAligned" type="text" name="capsField" style="width: 15%;"  title="Subline Code"maxlength="7"/>
					<input id="txtIssCd" 	 class="leftAligned" type="text" name="capsField" style="width: 8%;"   title="Issue Source Code"maxlength="2"/>
					<input id="txtIssueYy"   class="leftAligned integerNoNegativeUnformattedNoComma" type="text" name="intField"  style="width: 8%;"   title="Year" maxlength="2"/>
					<input id="txtPolSeqNo"  class="leftAligned integerNoNegativeUnformattedNoComma" type="text" name="intField"  style="width: 15%;"  title="Policy Sequence Number" maxlength="7"/>
					<input id="txtRenewNo"   class="leftAligned integerNoNegativeUnformattedNoComma" type="text" name="intField"  style="width: 8%;"   title="Renew Number" maxlength="2"/>
				    <span>
						<img src="${pageContext.request.contextPath}/images/misc/searchIcon.png" id="searchForPolicy" name="searchForPolicy" alt="Go" style="margin-top: 2px;" title="Search Policy"/>
					</span>
			</td>
		</tr>
		</table>
	
		
	<div id="infoOtherBondDoc" name="infoOtherBondDoc" style="width: 100%; text-align: center;">
		<jsp:include page="/pages/policy issuance/Surety Other Bond Documents/infoOtherBondDoc.jsp"></jsp:include>
	</div>	

<div id ="outerDiv" name="outerDiv">
	<div id ="innerDiv" name="outerDiv">
		<label id="pageTitle">Miscellaneous</label>
	</div>
</div>

<div class="sectionDiv" style="margin-bottom: 10px;">
			<table style="margin-top: 10px; width: 100%;">
			<tr>
				<td class="rightAligned" style="width: 25%;">
					Doc Number
				</td>
				<td class="leftAligned">
						<input id="txtDoc1" class="leftAligned" type="text" name="capsField" style="width: 8%;" title="Doc Number" >
						<input id="txtDoc2" class="leftAligned" type="text" name="capsField" style="width: 8%;" title="Doc Number" >
						
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Witness
						<input id="txtWitness" class="leftAligned" type="text" name="capsField" style="width: 50%;" title="Witness" >
				</td>		
			</tr>
			<tr>	
				<td class="rightAligned" style="width: 25%;">
					Page Number
				</td>
				<td class="leftAligned">
						<input id="txtPage1" class="leftAligned" type="text" name="capsField" style="width: 8%;" title="Page Number" >
						<input id="txtPage2" class="leftAligned" type="text" name="capsField" style="width: 8%;" title="Page Number" >
						
						&nbsp;Designation
						<input id="txtDesignation" class="leftAligned" type="text" name="capsField" style="width: 50%;" title="Designation" >
				</td>
				
			</tr>
			<tr>	
				<td class="rightAligned" style="width: 25%;">
					Book Number.
				</td>
				<td class="leftAligned">
						<input id="txtBook1" class="leftAligned" type="text" name="capsField" style="width: 8%;" title="Book Number" >
						<input id="txtBook2" class="leftAligned" type="text" name="capsField" style="width: 8%;" title="Book Number" >
						
						&nbsp;&nbsp;&nbsp;Signatory&nbsp;
						<select name="selNotedBy"
							id="selNotedBy" style="width: 250px;">
								<option value=""></option>
								<c:forEach var="sign" items="${ signatoryList }">
									<option>${sign.signatory}</option>
								</c:forEach>
						</select>			
						
				</td>
				
			</tr>
			<tr>	
				<td class="rightAligned" style="width: 25%;">
					Series Of
				</td>
				<td class="leftAligned">
						<input id="txtSeries" class="leftAligned" type="text" name="capsField" style="width: 18%;" title="Seies Number" >


				      &nbsp;&nbsp;&nbsp;Signatory&nbsp;
				      <select name="selSignatory"
							id="selSignatory" style="width: 250px;">
								<option value=""></option>
								<c:forEach var="sign" items="${ signatoryList }">
									<option>${sign.signatory}</option>
								</c:forEach>
						</select>
				
						
				</td>
			</tr>
			<tr>
			<td class="rightAligned" style="width: 25%;">
					MBT/RTC Place
				</td>
				<td class="leftAligned">
						<input id="txtTrial" class="leftAligned" type="text" name="capsField" style="width: 18%;" title="Trial Place" >
				
					  CoSignatory
				      <select name="selCoSignatory"
							id="selCoSignatory" style="width: 250px;">
								<option value=""></option>
								<c:forEach var="Cosign" items="${CosignatoryList}">
									<option>${Cosign.signatory}</option>
								</c:forEach>
					  </select>	
				
				</td>
			</tr>
			</table>
			<table style="margin-top: 0px; width: 63%;">
			<tr>
				<td class="rightAligned" style="width: 25%;">
					Authenticity
				</td>
				<td class="leftAligned" style="width: 25%;">					
				      <select name="selAuth"
							id="selAuth" style="width: 250px;">
								<option value=""></option>
								<c:forEach var="autsign" items="${CosignatoryList}">
									<option>${autsign.signatory}</option>
								</c:forEach>
					  </select>		
				</td>	  
			</tr>
			<tr> 
				<td class="rightAligned" style="width: 25%;">
					Representative
				</td>
				<td class="leftAligned" style="width: 25%;">				
				      <select name="selRepresent"
							id="selRepresent" style="width: 250px;">
								<option value=""></option>
								<c:forEach var="resign" items="${ signatoryList }">
									<option>${resign.signatory}</option>
								</c:forEach>
						</select>
				</td>
			</tr>
			</table>

			<table style="margin-top: 0px; width: 100%;">
			    <tr >
			    	<th></th>
			    	<th></th>
			    	<th></th>
			    </tr>
				<tr>
				   <td class="leftAligned">
				       <input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdOther" checked>OTHER REPORTS
				   </td>
				   <td class="leftAligned">
						<input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdRep1">REPLEVIN CERTIFICATE
				   </td>
				   <td></td>
			     </tr>
			     <tr>
			   		<td class="leftAligned">
			    		<input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdAck1">ACKNOWLEDGEMENT
			   		</td>
			   	    <td class="leftAligned">
			   	   	  	<input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdRep5">CERTIFICATE OF AUTHENTICITY
			   	    </td>
				    <td></td>
			     </tr>
			   <tr>
				   <td class="leftAligned">
				       <input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdAck2">BOND RENEWAL CERTIFICATE
				   </td>
				   <td class="leftAligned">
				   		<input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdRep2">REPLEVIN ENDORSEMENT
				   </td>
				   <td></td>
			   </tr>
			   <tr>
				   <!-- <td class="leftAligned">
				   		<input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdCert">CERTIFICATION
				   </td> -->
				   <td class="leftAligned">
				   		<input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdIndm" >INDEMNITY AGREEMENT
				   </td>
				   <td class="leftAligned">
				   		<input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdRep3">AFFIDAVIT OF WAIVER
				   </td>
				   <td>
				   </td>
			   </tr>
			   <tr>
			   		 <!-- <td class="leftAligned">
				   		<input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdRep3">AFFIDAVIT OF WAIVER
				   </td> -->
				   <td class="leftAligned">				       
				       <input type="radio" class="leftAligned" id="rdSurety1" name="rdSurety" value="rdRep4">AFFIDAVIT OF JUSTIFICATION
				   </td>
				  <!--  <td class="leftAligned">
				   </td> -->
			   </tr>
			</table>	
			<br>
			<br>
			<div id="otherBondButtonsDiv" align="center">
				<input type="button" class="button" style="width: 90px;" id="btnCancel" value="Cancel">
				<input type="button" class="button" style="width: 90px;" id="btnPrintReport" value="Print">
			</div>
			    <br/>
				<br/>
		</div>
	</div> 
</div>
<script type="text/javascript">
	makeAllInputFieldsUpperCase();
	
	$("txtSublineCd").focus();
	$("btnPrintReport").disable();
	var isSignatoryRequired = false;
	
	$("searchForPolicy").observe("click", function(){
		if (isPolicyNoFieldsOk()){
			new Ajax.Updater('infoOtherBondDoc', contextPath
					+ '/OutputController', {
				evalScripts : true,
				method: "POST",
				parameters : {
					action : "checkPolicyIdBonds",
					redirectPage : "/pages/policy issuance/Surety Other Bond Documents/infoOtherBondDoc.jsp",
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
						showMessageBox("No data found.", "E");
				}
				});
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
	
	$$("input[name='rdSurety']").each(function(radio) {
		radio.observe("click", function() {
			toogleDataOption(radio.value);
			paramType = radio.value;
		});
	});
	
	var dataType   = 'rdOther';
	function toogleDataOption(option){
		isSignatoryRequired = false;
		if(option == 'rdOther'){
			dataType = 'rdOther';
		}else if (option == 'rdAck1'){
			dataType = 'rdAck1';
		}else if (option == 'rdAck2'){
			dataType = 'rdAck2';
			isSignatoryRequired = true;
		}else if (option == 'rdIndm'){
			dataType = 'rdIndm';
		/* }else if (option == 'rdCert'){
			dataType = 'rdCert'; */
		}else if (option == 'rdRep1'){
			dataType = 'rdRep1';
			isSignatoryRequired = true;
		}else if (option == 'rdRep2'){
			dataType = 'rdRep2';
			isSignatoryRequired = true;
		}else if (option == 'rdRep3'){
			dataType = 'rdRep3';
		}else if (option == 'rdRep4'){
			dataType = 'rdRep4';
		}else if (option == 'rdRep5'){
			dataType = 'rdRep5';	
		}
	}
	
	$("selNotedBy").observe("change", function(){
		var selected = $("selNotedBy").getValue();
		getNotedBy(selected,"notedBySign","notedByDesig");
	});
	
	$("selSignatory").observe("change", function(){
		var selected = $("selSignatory").getValue();
		getNotedBy(selected,"sign","desig");
	});
	
	$("selRepresent").observe("change", function(){
		var selected = $("selRepresent").getValue();
		getNotedBy(selected,"resign","redesig");
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
		for (var i = 0; i < signatoryId.length; i++) {
		if (selected == signatory[i]) {
			var signatory = signatory[i];
			var designation = designation[i];
		}
		}
		$(txtSign).writeAttribute("value",signatory);
		$(txtDesig).writeAttribute("value",designation);
		}
	
	$("selCoSignatory").observe("change", function(){
		var selected = $("selCoSignatory").getValue();
		getCoNotedBy(selected,"Cosign","Codesig");
	});
	
	$("selAuth").observe("change", function(){
		var selected = $("selAuth").getValue();
		getCoNotedBy(selected,"autsign","autdesig");
	});
	
	function getCoNotedBy(selected,txtCoSign,txtCoDesig){
		var content = '';
		var prinId  = [
		                 <c:forEach var="Cosign" items="${CosignatoryList}" varStatus="loop">
		                   "${Cosign.prinId}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var signatory = [
		                 <c:forEach var="Cosign" items="${CosignatoryList}" varStatus="loop">
		                   "${Cosign.signatory}"
		                   <c:if test="${!loop.last}">,</c:if>
		                 </c:forEach>
		               ];
		var designation = [
		             <c:forEach var="Cosign" items="${CosignatoryList}" varStatus="loop">
		               "${Cosign.designation}"
		               <c:if test="${!loop.last}">,</c:if>
		             </c:forEach>
		           ];
		for (var i = 0; i < prinId.length; i++) {
		if (selected == signatory[i]) {
			var signatory = signatory[i];
			var designation = designation[i];
		}
		}
		$(txtCoSign).writeAttribute("value",signatory);
		$(txtCoDesig).writeAttribute("value",designation);
		}
	
	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
	var reportName = "REP_WRITPOSS_BOND";
	var path = "policyissuance/reports/";
	$("btnPrintReport").observe("click", function() {
		var userInput = "95 " +$F("txtLineCd").trim().toUpperCase() + " " + $F("txtIssCd").trim().toUpperCase();
		if(!checkUserAccess(userInput,userAccessObj, userAccessObjLength)){
			showMessageBox("User has no access.", "E");
		}else if (!isPolicyNoFieldsOk()) {
			showMessageBox("Please input required fields","I");
		}else {
			new Ajax.Updater(
					"mainContents",
					contextPath
							+ "/BondsReportController",
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "printBondsReport",
							redirectPage : "/pages/policy issuance/Surety Other Bond Documents/OtherBondDoc.jsp",
							reportName : reportName,
							rdButton : dataType,
							lineCd : $F("txtLineCd"),
							sublineCd : $F("txtSublineCd"),
							issCd : $F("txtIssCd"),
							issueYY : $F("txtIssueYy"),
							polSeqNo : $F("txtPolSeqNo"),
							renewNo : $F("txtRenewNo"),
							prinId : $F("autsign"),
							withNess : $F("txtWitness"),
							designation : $F("txtDesignation"),
							notedBySign : $F("notedBySign"),
							designation : $F("txtDesignation"),
							resign : $F("resign"),
							redesig : $F("redesig"),
							Cosign : $F("Cosign"),
							Codesig : $F("Codesig"),
							trial : $F("txtTrial"),
							sign : $F("sign"),
							desig : $F("desig"),
							doc1 : $F("txtDoc1"),
							doc2 : $F("txtDoc1"),
							page1 : $F("txtPage1"),
							page2 : $F("txtPage2"),
							book1 : $F("txtBook1"),
							book2 : $F("txtBook2"),
							series : $F("txtSeries")
						},
						onCreate : showNotice("Generating report. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
							outputToPDF($F("reportUrl"), $F("reportTitle"), $F("errorMsg"));
						}
					});
		}
	});
	
	//to add
	//check required fields...
	function checkOtherInfo(){
		if(isSignatoryRequired){
			var sign = $F("sign");
			if(checkBlankNull($F("sign"))){
				showMessageBox("Signatory is required", "I");
				return false;
			}else
				return true;
		}else
			return true;
	}
		
	
	goToPage("otherBondExit","/pages/main.jsp","Please wait.....", "Home");
	goToPage("btnCancel","/pages/main.jsp","Please wait.....", "Home");
	
</script>
