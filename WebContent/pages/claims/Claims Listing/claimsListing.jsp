<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- datepicker -->

<!--  -->
<script>
	
</script>

<div id="menuDiv">
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
<input type="hidden" id="testClaimId" name="testClaimId"
	value="${testClaimId}">
<input type="hidden" id="testRecoveryId" name="testRecoveryId"
	value="${testRecoveryId}">
<input type="hidden" id="testUserId" name="testUserId"
	value="${testUserId}">
<input type="hidden" id="testUserEmail" name="testUserEmail"
	value="${testUserEmail}">
<input type="hidden" id="page" name="page" value="${page}">
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<input type="hidden" id="reportTitle" name="reportTitle"
	value="${reportTitle}">
<input type="hidden" id="reportName" name="reportName"
	value="${reportName}">
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
		<label id="pageTitle">Claims Listing/Aging per Processor</label>
	</div>
</div>
<div id="claimsListingDetailsDiv">
	<div id="claimsListingSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="claimsListingMainDiv"
			style="width: 90%; height: 400px; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				
				<!-- date type rdo div -->
				<div class="sectionDiv" id="dateParameterDiv"
					style="width: 30%; height: 75px; margin-left: 150px; margin-top: 9px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td class="rightAligned" style="width: 25%;">Date</td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 25%;"></td>
							<td><input type="radio" id="rdoAsOf" name="dateType"
								value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoAsOf" style="margin-top: 3px;">As of</label></td>
						</tr>
						<tr>
							<td class="rightAligned" style="width: 25%;"></td>
							<td class="rightAligned"><input type="radio"
								id="rdoByPeriod" name="dateType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoByPeriod" id="lblByPeriod" style="margin-top: 3px;">By Period</label></td>
						</tr>
					</table>
				</div>
				
				<!-- date type input div -->
				<div class="sectionDiv" id="dateTypeDiv"
					style="width: 40%; height: 75px; margin-top: 9px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
						<td>
					<!-- as of div -->
					<div id="asOfDiv">
						<table style="margin-top: 10px; width: 100%;">
							<tr>
								<td class="rightAligned" style="width: 5%;">As Of</td>
								<td class="leftAligned" style="width: 42%;">
									<div
										style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
										<input type="text"
											style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
											name="asOfDate" id="txtAsOfDate" readonly="readonly"/>
										<img id="imgAsOfDate" alt="asOfDate" style="height: 18px;"
											class="hover"
											src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
									</div>
								</td>
							</tr>
						</table>
					</div>
					
					<!-- from to div -->
					<div id="fromToDiv">
						<table style="margin-top: 10px; width: 100%;">
							<tr>
								<td class="rightAligned" style="width: 5%;">From</td>
								<td class="leftAligned" style="width: 42%;">
									<div
										style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
										<input type="text"
											style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
											name="fmDate" id="txtFromDate" readonly="readonly"/>
										<img id="imgFromDate" alt="imgFromDate" style="height: 18px;"
											class="hover"
											src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 5%;">To</td>
								<td class="leftAligned" style="width: 42%;">
									<div
										style="float: left; border: solid 1px gray; width: 108px; height: 20px; margin-right: 3px;">
										<input type="text"
											style="float: left; margin-top: 0px; margin-right: 3px; width: 74%; border: none;"
											name="toDate" id="txtToDate" readonly="readonly"/>
										<img id="imgToDate" alt="imgToDate" style="height: 18px;"
											class="hover"
											src="${pageContext.request.contextPath}/images/misc/but_calendar.gif" />
									</div>
								</td>
							</tr>
						</table>
					</div>
					</td>
					</tr>
					</table>
				</div>
				
				<!-- search by div -->
				<div class="sectionDiv" id="searchByDiv"
					style="width: 30%; height: 120px; margin-left: 150px; margin-top: 1px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td class="leftAligned" style="width: 42%;">Search by</td>
						</tr>
						<tr>
							<td class="rightAligned">Line</td>
							<!-- <td class="leftAligned">
								<input id="txtLineCd" class="leftAligned upper" type="text" name="capsField" style="width: 80%;" value="" title="Line Code" />
							</td> -->
							<td class="leftAligned"><select name="selLine" id="selLine"
								style="width: 80%;">
									<option value=""></option>
									<c:forEach var="line" items="${ lineList }">
										<option value="${line.lineCd}">${line.lineName}</option>
									</c:forEach>
							</select>
							</td>
						</tr>
						<tr>
							<td class="rightAligned">Branch</td>
							<!-- <td class="leftAligned">
								<input id="txtBranchCd" class="leftAligned upper" type="text" name="capsField" style="width: 28%;" value="" title="Line Code" />
							</td> -->
							<td class="leftAligned"><select name="selBranch"
								id="selBranch" style="width: 80%;">
									<option value=""></option>
									<c:forEach var="branch" items="${ branchList }">
										<option value="${branch.issCd}">${branch.issName}</option>
									</c:forEach>
							</select>
						</tr>
						<tr>
							<td class="rightAligned">Processor</td>
							<td class="leftAligned">
								<input id="txtUserId" class="leftAligned upper" type="text" name="capsField" style="width: 50%;" value="" title="Line Code" />
							</td>
						</tr>
					</table>
				</div>
				
				<!-- report type 1 -->
				<div class="sectionDiv" id="reportType1Div"
					style="width: 40%; height: 120px; margin-left: 1px; margin-top: 1px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="margin-left: 50px;">Report Type</td>
						</tr>
						<tr>
							<td colspan="2"><input type="radio" id="rdoClaimListing" name="reportType1" value="1"
								style="float: left; margin-left: 50px;" checked="" />
								<label for="rdoClaimListing" style="margin-top: 3px;">Claim Listing Per Processor</label></td>
						</tr>
						<tr>
							<td colspan="2"><input type="radio" id="rdoClaimAging" name="reportType1" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;" checked="" />
								<label for="rdoClaimAging" style="margin-top: 3px;">Claim Aging Per Processor</label></td>
						</tr>
						<tr>
							<td colspan="2"><input type="radio" id="rdoBordereaux" name="reportType1" value="3" style="margin-left: 15px; float: left; margin-left: 50px;" checked="" />
								<label for="rdoBordereaux" style="margin-top: 3px;">Aging of Outstanding Bordereaux</label></td>
						</tr>
					</table>
				</div>
				
				<!-- report type 2 -->
				<div class="sectionDiv" id="reportType2Div"
					style="width: 30%; height: 150px; margin-left: 150px; margin-top: 1px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="margin-left: 50px;">Report Type</td>
						</tr>
						<tr>
							<td colspan="2"><input type="radio" id="rdoDetailed" name="reportType2" value="1"
								style="float: left; margin-left: 50px;" checked="" />
								<label for="rdoDetailed" id="lblDetailed" style="margin-top: 3px;">Detailed Report</label></td>
						</tr>
						<tr>
							<td colspan="2"><input type="radio" id="rdoSummary" name="reportType2" value="2"
								style="float: left; margin-left: 50px;" checked="" />
								<label for="rdoSummary" id="lblSummary" style="margin-top: 3px;">Summary Report</label></td>
						</tr>
					</table>
				</div>
				
				<!-- based on div -->
				<div class="sectionDiv" id="basedOnDiv"
					style="width: 40%; height: 150px; margin-left: 1px; margin-top: 1px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="margin-left: 50px;">Based On</td>
						</tr>
						<tr>
							<td colspan="2"><input type="radio" id="rdoLossDate" name="basedOnType" value="1"
								style="float: left; margin-left: 50px;" checked="" />
								<label for="rdoLossDate" id="lblLossDate" style="margin-top: 3px;">Loss Date</label></td>
						</tr>
						<tr>
							<td colspan="2"><input type="radio" id="rdoEntryDate" name="basedOnType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;" checked="" />
								<label for="rdoEntryDate" id="lblEntryDate" style="margin-top: 3px;">Entry Date</label></td>
						</tr>
						<tr>
							<td colspan="2"><input type="radio" id="rdoFileDate" name="basedOnType" value="3" style="margin-left: 15px; float: left; margin-left: 50px;" checked="" />
								<label for="rdoFileDate" id="lblFileDate" style="margin-top: 3px;">File Date</label></td>
						</tr>
						<!-- <tr>
							<td colspan="2">
							<input type="checkbox" id="checkBoxInclude" name="checkBoxInclude" value="True"
							style="margin-left: 50px; float: left;"> Include Closed Claim
							</td>
						</tr> -->
						<tr>
							<td colspan="1"><input type="radio" id="rdoLoss" name="lossExpenseType" value="1"
								style="float: left; margin-left: 50px;" checked="" disabled />
								<label for="rdoLoss" id="lblLoss" style="margin-top: 3px;">Loss</label></td>
							<td colspan="1"><input type="radio" id="rdoExpense" name="lossExpenseType" value="2"
								style="float: left; margin-left: 50px;" checked="" disabled />
								<label for="rdoExpense" id="lblExpense" style="margin-top: 3px;">Expense</label></td>
						</tr>
					</table>
				</div>
				
			</div>
		</div>


		<div class="sectionDiv" id="printDiv"
			style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
			<div id="printclaimsListingButtonsDiv" align="center">
				<input type="button" class="button" style="width: 90px;"
					id="btnCancel" value="Cancel"> <input type="button"
					class="button" style="width: 90px;" id="btnPrint" value="Print">
			</div>
		</div>

		<div id="blankDiv"></div>
	</div>
</div>

<script type="text/javascript">
	$("hiddenDiv").hide();
	var page = $F("page");
	var reportName = 'CLM_ASOF_LD_PER_PROCESSOR_DET';
	var reportType = 1;
	var reportType2 = 1;
	var dateType = 1;
	var basedOn = 1;
	var lossExpenseType = 1;
	var user = $F("userId");
	$("rdoLoss").hide();
	$("rdoExpense").hide();
	$("lblLoss").hide();
	$("lblExpense").hide();
	
	makeInputFieldUpperCase();
	$("rdoAsOf").checked = true;
	$("rdoClaimListing").checked = true;
	$("rdoDetailed").checked = true;
	$("rdoLossDate").checked = true;
	$("rdoLoss").checked = true;
	$("rdoLoss").click();
	$("rdoDetailed").click();
	$("rdoAsOf").click();
	$("fromToDiv").hide();
	
	var asOfCalendar = new dhtmlXCalendarObject({
		input : "txtAsOfDate",
		button : "imgAsOfDate"
	});
	
	$$("input[name='basedOnType']").each(function(radio){
		radio.observe("click",function(){
			toggleBasedOn(radio.value);
		})
	});
	
	function toggleBasedOn(option){
		if(option == 1){
			basedOn = 1;
		}else if(option == 2){
			basedOn = 2;
		}else if(option == 3){
			basedOn = 3;
		}
	}
	
	$$("input[name='lossExpenseType']").each(function(radio){
		radio.observe("click",function(){
			toggleLossExpenseType(radio.value);
		});
	});
	
	function toggleLossExpenseType(option){
		if(option == 1){
			lossExpenseType = 1;
		}else
			lossExpenseType = 2;
	}
	
	function toggleReportName(option){
		/* if(option == 1){								//lossDate
			if(dateType == 1){								//asOf
				if(reportType == 1){						//per processor
					if(reportType2 == 1){
						reportName = 'CLM_ASOF_LD_PER_PROCESSOR_DET';
					}else
						reportName = "CLM_ASOF_LD_PER_PROCESSOR_SUM";
				}
			}else if(dateType == 2){						//byPeriod
				if(reportType == 1){						//per processor
					if(reportType2 == 1){
						reportName = 'CLM_FROM_TO_LD_PER_PROCESSOR_DET';
					}else
						reportName = "CLM_FROM_TO_LD_PER_PROCESSOR_SUM";
				}
			}
		} */
		
		if(reportType == 1){					//Claim Listing Per Processor
			if(option == 1){
				if(dateType == 1){
					if(reportType2 == 1){
						reportName = 'CLM_ASOF_LD_PER_PROCESSOR_DET';
					}else
						reportName = "CLM_ASOF_LD_PER_PROCESSOR_SUM";
				}else if(dateType == 2){
					if(reportType2 == 1){
						reportName = 'CLM_FROM_TO_LD_PER_PROCESSOR_DET';
					}else
						reportName = "CLM_FROM_TO_LD_PER_PROCESSOR_SUM";
				}
			}else if(option == 2){
				if(dateType == 1){
					if(reportType2 == 1){
						reportName = 'CLM_ASOF_ED_PER_PROCESSOR_DET';
					}else
						reportName = "CLM_ASOF_ED_PER_PROCESSOR_SUM";
				}else if(dateType == 2){
					if(reportType2 == 1){
						reportName = 'CLM_FROM_TO_ED_PER_PROCESSOR_DET';
					}else
						reportName = "CLM_FROM_TO_ED_PER_PROCESSOR_SUM";
				}
			}else if(option == 3){
				if(dateType == 1){
					if(reportType2 == 1){
						reportName = 'CLM_ASOF_FD_PER_PROCESSOR_DET';
					}else
						reportName = "CLM_ASOF_FD_PER_PROCESSOR_SUM";
				}else if(dateType == 2){
					if(reportType2 == 1){
						reportName = 'CLM_FROM_TO_FD_PER_PROCESSOR_DET';
					}else
						reportName = "CLM_FROM_TO_FD_PER_PROCESSOR_SUM";
				}
			}
		}else if(reportType == 2){ 				//Claim Aging Per Processor
			if(option == 1){					//loss date
				if(dateType == 1){				//asOf
					reportName = 'CLM_ASOF_LD_PER_AGING';
				}else
					reportName = 'CLM_FROM_TO_LD_PER_AGING';
			}else if(option == 2){				//entry date
				if(dateType == 1){				//asOf
					reportName = 'CLM_ASOF_ED_PER_AGING';
				}else
					reportName = 'CLM_FROM_TO_ED_PER_AGING';
			}else if(option == 3){				//file date
				if(dateType == 1){				//asOf
					reportName = 'CLM_ASOF_FD_PER_AGING';
				}else
					reportName = 'CLM_FROM_TO_FD_PER_AGING';
			}
		}else if(reportType == 3){				//Aging of Outstanding Bordereaux
			if(reportType2 == 1){					//detailed
				if(lossExpenseType == 1){				//loss
					reportName = 'CLM_ASOF_PER_OUTSTANDING_LOSS_DET';
				}else									//expense
					reportName = 'CLM_ASOF_PER_OUTSTANDING_EXP_DET';
			}else if(reportType2 == 2){				//summary
				if(lossExpenseType == 1){				//loss
					reportName = 'CLM_ASOF_PER_OUTSTANDING_LOSS_SUM';
				}else									//expense
					reportName = 'CLM_ASOF_PER_OUTSTANDING_EXP_SUM';
			}
		//alert(reportType + ' ' + reportType2 + ' ' + lossExpenseType);
		} 			
	}
	
	 $$("input[name='reportType2']").each(function(radio) {
		radio.observe("click", function() {
			toggleReportType2(radio.value);
			//toggleCheckBoxStatus(radio.value);
		});
	});
	 
	 function toggleReportType2(option){
		 if (option == 2){
			 reportType2 = 2;
			}else if (option == 1){
				reportType2 = 1;
			}
	 }
	 
	 /*function toggleCheckBoxStatus(option){
		if (option == 2){
			$("checkBoxStatus").enable();
		}else if (option == 1){
			$("checkBoxStatus").disable();
			checkBoxStatus = 1;
			$("checkBoxStatus").checked = false;
		}
	} */


	$$("input[name='dateType']").each(function(radio) {
		radio.observe("click", function() {
			toogleDateTypeOption(radio.value);
			paramType = radio.value;
		});
	});

	function toogleDateTypeOption(option) {
		if (option == '1') {
			$("asOfDiv").show();
			$("fromToDiv").hide();
			dateType = 1;
		} else if (option == '2') {
			$("asOfDiv").hide();
			$("fromToDiv").show();
			dateType = 2;
			var fromCalendar = new dhtmlXCalendarObject({
				input : "txtFromDate",
				button : "imgFromDate"
			});
			
			var toCalendar = new dhtmlXCalendarObject({
				input : "txtToDate",
				button : "imgToDate"
			});
		}
		//reset date input fields
		$("txtAsOfDate").value = "";
		$("txtFromDate").value = "";
		$("txtToDate").value = "";
	}
	
	$$("input[name='reportType1']").each(function(radio) {
		radio.observe("click", function() {
			toggleReportType1(radio.value);
			paramType = radio.value;
		});
	});
	
	function toggleReportType1(option){
		//toggleReportName(basedOn);
		$("rdoByPeriod").enable();
		if (option == '1') {
			//$("checkBoxInclude").enable();
			//showhide
			$("rdoLoss").hide();
			$("rdoExpense").hide();
			$("lblLoss").hide();
			$("lblExpense").hide();
			$("rdoLossDate").show();
			$("rdoEntryDate").show();
			$("rdoFileDate").show();
			$("lblLossDate").show();
			$("lblEntryDate").show();
			$("lblFileDate").show();
			$("rdoDetailed").show();
			$("rdoSummary").show();
			$("lblDetailed").show();
			$("lblSummary").show();
			$("lblByPeriod").show();
			$("rdoByPeriod").show();
			
			$("rdoLoss").disable();
			$("rdoExpense").disable();
			$("rdoDetailed").enable();
			$("rdoSummary").enable();
			//$("checkBoxStatus").disable();
			$("rdoLossDate").enable();
			$("rdoEntryDate").enable();
			$("rdoFileDate").enable();
			reportType = 1;

			$("txtUserId").value = '';
			$("txtUserId").enable();
			if(dateType == 1){
				reportName = 'CLM_ASOF_LD_PER_PROCESSOR_DET';
			}else if(dateType == 2){
				reportName = 'CLM_FROM_TO_LD_PER_PROCESSOR_DET';
			}
		} else if (option == '2') {
			$("rdoLoss").hide();
			$("rdoExpense").hide();
			$("lblLoss").hide();
			$("lblExpense").hide();
			$("rdoLossDate").show();
			$("rdoEntryDate").show();
			$("rdoFileDate").show();
			$("lblLossDate").show();
			$("lblEntryDate").show();
			$("lblFileDate").show();
			$("rdoDetailed").hide();
			$("rdoSummary").hide();
			$("lblDetailed").hide();
			$("lblSummary").hide();
			$("lblByPeriod").show();
			$("rdoByPeriod").show();
			
			$("rdoDetailed").disable();
			$("rdoSummary").disable();
			//$("checkBoxStatus").disable();
			//$("checkBoxInclude").disable();
			$("rdoLoss").disable();
			$("rdoExpense").disable();
			$("rdoLossDate").enable();
			$("rdoEntryDate").enable();
			$("rdoFileDate").enable();
			reportType = 2;

			$("txtUserId").value = '';
			$("txtUserId").enable();
			//reportName = "CLM_ASOF_LD_PER_AGING";
			if(dateType == 1){
				reportName = 'CLM_ASOF_LD_PER_AGING';
			}else if(dateType == 2){
				reportName = 'CLM_FROM_TO_LD_PER_AGING';
			}
		}else if (option == '3') {
			//$("checkBoxInclude").disable();
			$("rdoLoss").show();
			$("rdoExpense").show();
			$("lblLoss").show();
			$("lblExpense").show();
			$("rdoLossDate").hide();
			$("rdoEntryDate").hide();
			$("rdoFileDate").hide();
			$("lblLossDate").hide();
			$("lblEntryDate").hide();
			$("lblFileDate").hide();
			$("rdoDetailed").show();
			$("rdoSummary").show();
			$("lblDetailed").show();
			$("lblSummary").show();
			$("lblByPeriod").hide();
			$("rdoByPeriod").hide();
			
			toogleDateTypeOption('1');
			
			
			$("rdoLoss").enable();
			$("rdoExpense").enable();
			$("rdoDetailed").enable();
			$("rdoSummary").enable();
			//$("checkBoxStatus").disable();
			$("rdoLossDate").disable();
			$("rdoEntryDate").disable();
			$("rdoFileDate").disable();
			//$("rdoAsOf").click();
			dateType = 1;
			$("rdoAsOf").checked = true;
			$("rdoByPeriod").disable();
			reportType = 3;

			$("txtUserId").value = user;
			$("txtUserId").disable();
			reportName = "CLM_ASOF_PER_OUTSTANDING_LOSS_DET";
			$("rdoAsOf").click();
		}
		$("rdoLossDate").checked = true;
		$("rdoDetailed").checked = true;
		$("rdoLoss").checked = true;
		//$("checkBoxStatus").checked = false;
		//$("checkBoxInclude").checked = false;
	}

	$("btnPrint")
			.observe(
					"click",
					function() {
						var txtAsOfDate = $F("txtAsOfDate");
						var txtFromDate = $F("txtFromDate");
						var txtToDate = $F("txtToDate");
						var txtLineCd = $F("selLine");//$F("txtLineCd");
						var txtBranchCd = $F("selBranch");//$F("txtBranchCd");
						var txtUserId = $F("txtUserId");
						toggleReportName(basedOn);
						if(checkDate(txtFromDate,txtToDate,txtAsOfDate)){
							new Ajax.Request(
									//"mainContents",
									contextPath + "/ClaimsListingController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printclaimsListing",
											reportName : reportName,
											asOfDate : txtAsOfDate,
											fromDate : txtFromDate,
											toDate : txtToDate,
											lineCd : txtLineCd,
											branchCd : txtBranchCd,
											userId : $F("userId"),
											processor : txtUserId//'CLRBR'
										},
										onCreate : showNotice("Generating report. Please wait..."),
										onComplete : function(response) {
											//printOutputPdf();
											$("hiddenDiv").update(response.responseText);
										}
									});
						}/* else
							showMessageBox(
									"\"From Date\" must be earlier from \"To Date\".",
									"E"); */
					});
	
	function checkDate(fromDate,toDate,asOfDate) {
		var date1 = new Date(fromDate);
		var date2 = new Date(toDate);
		var isValid = false;
		//alert(dateType);
		if(dateType == 2){
			if(checkBlankNull(fromDate)){
				showMessageBox("\"From Date\" is required.","E");
				isValid = false;
			}else if(checkBlankNull(toDate)){
				showMessageBox(
						"\"To Date\" is required.",
						"E");
				isValid = false;
			}else if (date1.getTime() > date2.getTime()) {
				showMessageBox(
						"\"From Date\" must be earlier from \"To Date\".",
						"E");
				isValid = false;
			}else
				isValid = true;
		}else{
			if(checkBlankNull(asOfDate)){
				showMessageBox(
						"\"As from Date\" is required.","E");
				isValid = false;
			}else
				isValid = true;
		}
		
		return isValid;
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
							/* 'location=0, toolbar=0, menubar=0, fullscreen=1'); */
					hideNotice("");
				}
			});
		}
	}
	
	function compareDate(fromDate, toDate) {
		var date1 = new Date(fromDate);
		var date2 = new Date(toDate);
		if (date1.getTime() > date2.getTime()) {
			return true
		}else
			return false;
	}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
