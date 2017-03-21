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
<div id="hiddenDiv">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="reportTitle" name="reportTitle" value="${reportTitle}">
<input type="hidden" id="reportUrl" name="reportUrl" value="${reportUrl}">
<input type="hidden" id="selDestination" name="selDestination" value="screen">
</div>
<!--  -->

<br />
<br />
<div id ="outerDiv" name="outerDiv">
	<div id ="innerDiv" name="outerDiv">
		<label id="pageTitle">Ps Bank Posted Policy</label>
		<span class="refreshers" style="margin-top: 0;">
			<label id="reloadForm" name="reloadForm" title="Reload Form">Reload Form</label>
		</span>
	</div>
</div>

<div class="sectionDiv" style="margin-bottom: 10px;">
<div class="sectionDiv" style="margin: 10px; margin-left: 60px; display: block; margin-top: 15px; float: left; width: 450px;">
<br>
<label>&nbsp;&nbsp;&nbsp;Data Parameter</label>	
			<table style="margin-top: 10px; width: 100%;">
			<tr>
				<td class="rightAligned" style="width: 25%;">
					Source
				</td>
				<td class="leftAligned">
						<input id="txtSource" 	 class="leftAligned required" type="text" name="capsField" style="width: 8%;" value="PS" title="Source" maxlength="2" disabled="disabled"/>
						
				</td>		
			</tr>
			<tr>	
				<td class="rightAligned" style="width: 25%;">
					Line
				</td>
				<!-- <td class="leftAligned">
						<select name="SelLinecd"
							id="SelLinecd" style="width: 250px;">
							    <option value="">ALL LINES</option>
								<option value="FI">FI - FIRE</option>
								<option value="MC">MC - Motor Car</option>
								<option value="SU">SU - Surety Bonds</option>
								<option value="EN">EN - Engineering</option>
								<option value="OC">OC - Other Casualty</option>
								<option value="PA">PA - Personal Accident</option>
								<option value="MH">MH - Marine Hull</option>
								<option value="MN">MN - Marine Cargo</option>
						</select>	
				</td> -->
				<td class="leftAligned"><select name="selLine" id="selLine"
								style="width: 250px;">
									<option value=""></option>
									<c:forEach var="line" items="${ lineList }">
										<option value="${line.lineCd}">${line.lineName}</option>
									</c:forEach>
							</select>
				</td>
			</tr>
			<tr>	
				<td class="rightAligned" style="width: 25%;">
					To
				</td>
				<td class="leftAligned">
						<input id="txtTo" class="leftAligned" type="text" name="capsField" style="width: 35%;" title="To" >			
				</td>
			</tr>
			<tr>	
				<td class="rightAligned" style="width: 25%;">
					From
				</td>
				<td class="leftAligned">
						<input id="txtFrom" class="leftAligned" type="text" name="capsField" style="width: 35%;" title="From" >			
				</td>
			</tr>
			<tr>	
				<td class="rightAligned" style="width: 25%;">
					Address
				</td>
				<td class="leftAligned">
						<input id="txtAddress1" class="leftAligned" type="text" name="capsField" style="width: 35%;" title="Address" >			
				</td>
			</tr>
			<tr>	
				<td class="rightAligned" style="width: 25%;">
				</td>
				<td class="leftAligned">
						<input id="txtAddress2" class="leftAligned" type="text" name="capsField" style="width: 35%;" title="Address" >			
				</td>
			</tr>
			<tr>	
				<td class="rightAligned" style="width: 25%;">
				Re
				</td>
				<td class="leftAligned">
						<input id="txtRe" class="leftAligned" type="text" name="capsField" style="width: 35%;" title="Re" >			
				</td>
			</tr>
			</table>
			<br>
	</div>		
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
			<br>
			<div id="otherBondButtonsDiv" align="center">
				<input type="button" class="button" style="width: 90px;" id="btnCancel" value="Cancel">
				<input type="button" class="button" style="width: 90px;" id="btnPrintReport" value="Print">
			</div>
			<br>
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
		var fromtext = $F("txtFrom");
		var totext   = $F("txtTo");
		var address1 = $F("txtAddress1");
		var re       = $F("txtRe");
		if (CheckInput(dateFrom)&&CheckInput(dateTo)&&CheckInput(fromtext)
				&&CheckInput(totext)&&CheckInput(address1)&&CheckInput(re)){
			return false;
		}else{
				return true;
			}
	    }
	
	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
	var reportName = "REP_PS_POSTED";
	var path = "policyissuance/reports/";
	$("btnPrintReport").observe("click", function() {
	if(compareDate($F("txtFromDate"),$F("txtToDate")))
	{
		showMessageBox("\"From Date\" must be earlier from \"To Date\".","E");
	}else if (ifNotEmpty()){
		showMessageBox("Some fields are empty.","I");
	}else
		{
			new Ajax.Request(
					//"mainContents",
					contextPath
							+ "/PsBankController",
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "printBondsReport",
							redirectPage : "/pages/policy issuance/ps bank posted/PsBank.jsp",
							reportName : reportName,
							dateFrom : $F("txtFromDate"),
							dateTo :$F("txtToDate"),
							fromtext :$F("txtFrom"),
							totext : $F("txtTo"),
							address1 :$F("txtAddress1"),
							address2 :$F("txtAddress2"),
							lineCd : $F("selLine"),
							re : $F("txtRe"),
							userId : $F("userId")
							
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
	
	function CheckInput(input){
		if(input==''||input==null)
			return false;
			return true;
	}	
	
	/* goToPage("btnExit","/pages/main.jsp","Please wait.....", "Home");
	goToPage("btnCancel","/pages/main.jsp","Please wait.....", "Home"); */
	
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
