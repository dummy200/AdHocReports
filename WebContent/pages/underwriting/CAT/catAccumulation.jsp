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
<input type="hidden" id="approvedBy" name="approvedBy" value="">
<input type="hidden" id="checkedBy" name="checkedBy" value="">
<input type="hidden" id="notedBy" name="notedBy" value="">
<%-- <input type="text" id="letterType" name= "letterType" value = "${letterType}"> --%>
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">CAT Accumulation</label>
	</div>
</div>
<div id="catAccumulationDetailsDiv">
	<div id="catAccumulationSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="catAccumulationMainDiv"
			style="width: 90%; height: 430px; margin-top: 40px; margin-left: 45px; margin-bottom: 10px;">
			<div id="parametersDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">

				<!-- calamity type input div -->
				<div class="sectionDiv" id="calamityTypeDiv"
					style="width: 30%; height: 75px; margin-left: 2%; margin-top: 9px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>

							<td><input type="radio" id="rdoTyphoon" name="calamityType"
								value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoTyphoon" style="margin-top: 3px;">Typhoon</label></td>
						</tr>
						<tr>

							<td class="rightAligned"><input type="radio"
								id="rdoEarthquake" name="calamityType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoEarthquake"
								style="margin-top: 3px;">Earthquake</label></td>
						</tr>
						<tr>

							<td class="rightAligned"><input type="radio" id="rdoFlood"
								name="calamityType" value="3"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoFlood" style="margin-top: 3px;">Flood</label></td>
						</tr>
					</table>
				</div>

				<!-- report type input div -->
				<div class="sectionDiv" id="reportTypeDiv"
					style="width: 30%; height: 75px; margin-left: 2%; margin-top: 9px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>

							<td><input type="radio" id="rdoNetRetention"
								name="reportType" value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoNetRetention"
								style="margin-top: 3px;">Net Retention</label></td>
						</tr>
						<tr>

							<td class="rightAligned"><input type="radio"
								id="rdoFacultative" name="reportType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoFacultative"
								style="margin-top: 3px;">Facultative</label></td>
						</tr>
						<tr>

							<td class="rightAligned"><input type="radio" id="rdoTreaty"
								name="reportType" value="3"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoTreaty" style="margin-top: 3px;">Treaty</label></td>
						</tr>
					</table>
				</div>

				<!-- report layout type div -->
				<div class="sectionDiv" id="reportLayoutDiv"
					style="width: 30%; height: 75px; margin-left: 2%; margin-top: 9px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 30%;">Report Layout</td>
						</tr>
						<tr>
							<td><input type="radio" id="rdoSummary"
								name="reportLayoutType" value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoSummary" style="margin-top: 3px;">Summary</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio"
								id="rdoDetailed" name="reportLayoutType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoDetailed" style="margin-top: 3px;">Detailed</label></td>
						</tr>
					</table>
				</div>

				<br />

				<!-- sortBy Div -->
				<div class="sectionDiv" id="sortByDiv"
					style="width: 30%; height: 100px; margin-left: 10%; margin-top: 9px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 30%;">Sort By:</td>
						</tr>
						<tr>
							<td><input type="radio" id="rdoExpiry" name="sortByType"
								value="1"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoExpiry" style="margin-top: 3px;">Policy
									Expiry Date</label></td>
						</tr>
						<tr>
							<td class="rightAligned"><input type="radio"
								id="rdoEffectivity" name="sortByType" value="2"
								style="margin-left: 15px; float: left; margin-left: 50px;"
								checked="" /> <label for="rdoEffectivity"
								style="margin-top: 3px;">Policy Effectivity Date</label></td>
						</tr>
					</table>
				</div>

				<!-- dateRange Div -->
				<div class="sectionDiv" id="dateTypeDiv"
					style="width: 35%; height: 100px; margin-left: 10%; margin-top: 9px; float: left;">
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td style="width: 30%;">Date Range:</td>
						</tr>
						<tr>
							<td>
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
														name="fmDate" id="txtFromDate" readonly="readonly" /> <img
														id="imgFromDate" alt="imgFromDate" style="height: 18px;"
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
														name="toDate" id="txtToDate" readonly="readonly" /> <img
														id="imgToDate" alt="imgToDate" style="height: 18px;"
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

				<!-- misc div -->
				<div class="sectionDiv" id="miscDiv"
					style="width: 100%; margin-top: 9px; float: left;">
					<table style="width: 100%;">
						<tr>
							<td>
								<div class="sectionDiv" id="preparedByDiv"
									style="width: 90%; margin-left: 8px; margin-top: 5px; margin-bottom: 5px; float: left;">
									<table style="margin-top: 10px; width: 100%;">
										<tr>
											<td class="rightAligned" style="width: 25%;">Prepared By</td>
											<td class="leftAligned"><input id="txtUserName"
												name="capsField" class="leftAligned" type="text"
												style="width: 90%;" value="${userName}" title="User Name" /></td>
										</tr>
										<tr>
											<td class="rightAligned" style="width: 25%;"></td>
											<td class="leftAligned"><input id="txtDesignation"
												name="capsField" class="leftAligned" type="text"
												style="width: 90%;" value="" title="Designation" disabled /></td>
										</tr>
									</table>
								</div>
							</td>
							<td>
								<div class="sectionDiv" id="approvedByDiv"
									style="width: 90%; margin-left: 8px; margin-left: 2%; margin-top: 5px; margin-bottom: 5px; float: left;">
									<table style="margin-top: 10px; width: 100%;">
										<tr>
											<td class="rightAligned" style="width: 25%;">Approved By</td>
											<td class="leftAligned"><select name="selApprovedBy"
												id="selApprovedBy" style="width: 90%;">
													<option value=""></option>
													<c:forEach var="sign" items="${ signatoryList }">
														<option>${sign.signatory}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td class="rightAligned" style="width: 25%;"></td>
											<td class="leftAligned"><input id="txtDesignation1"
												name="capsField" class="leftAligned" type="text"
												style="width: 90%;" value="" title="Designation" disabled /></td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr></tr>
						<tr>
							<td>
								<div class="sectionDiv" id="checkedByDiv"
									style="width: 90%; margin-left: 8px; margin-left: 2%; margin-top: 5px; margin-bottom: 5px; float: left;">
									<table style="margin-top: 10px; width: 100%;">
										<tr>
											<td class="rightAligned" style="width: 25%;">Checked By</td>
											<td class="leftAligned"><select name="selCheckedBy"
												id="selCheckedBy" style="width: 90%;">
													<option value=""></option>
													<c:forEach var="sign" items="${ signatoryList }">
														<option>${sign.signatory}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td class="rightAligned" style="width: 25%;"></td>
											<td class="leftAligned"><input id="txtDesignation2"
												name="capsField" class="leftAligned" type="text"
												style="width: 90%;" value="" title="Designation" disabled /></td>
										</tr>
									</table>
								</div>
							</td>
							<td>
								<div class="sectionDiv" id="notedByDiv"
									style="width: 90%; margin-left: 8px; margin-left: 2%; margin-top: 5px; margin-bottom: 5px; float: left;">
									<table style="margin-top: 10px; width: 100%;">
										<tr>
											<td class="rightAligned" style="width: 25%;">Noted By</td>
											<td class="leftAligned"><select name="selNotedBy"
												id="selNotedBy" style="width: 90%;">
													<option value=""></option>
													<c:forEach var="sign" items="${ signatoryList }">
														<option>${sign.signatory}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td class="rightAligned" style="width: 25%;"></td>
											<td class="leftAligned"><input id="txtDesignation3"
												name="capsField" class="leftAligned" type="text"
												style="width: 90%;" value="" title="Designation" disabled /></td>
										</tr>
									</table>
								</div>
							</td>
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
		<div id="blankDiv"></div>
	</div>
</div>

<script type="text/javascript">
	var page = $F("page");
	var reportName = 'GICLR025_PCI';
	makeInputFieldUpperCase();
	$("rdoTyphoon").checked = true;
	$("rdoNetRetention").checked = true;
	$("rdoSummary").checked = true;
	$("rdoExpiry").checked = true;
	
	var fromCalendar = new dhtmlXCalendarObject({
		input : "txtFromDate",
		button : "imgFromDate"
	});

	var toCalendar = new dhtmlXCalendarObject({
		input : "txtToDate",
		button : "imgToDate"
	});
	
	$("selApprovedBy").observe("change", function(){
		var selected = $("selApprovedBy").getValue();
		getNotedBy(selected,"approvedBy","txtDesignation1");
	});
	
	$("selCheckedBy").observe("change", function(){
		var selected = $("selCheckedBy").getValue();
		getNotedBy(selected,"checkedBy","txtDesignation2");
	});
	
	$("selNotedBy").observe("change", function(){
		var selected = $("selNotedBy").getValue();
		getNotedBy(selected,"notedBy","txtDesignation3");
	});
	
	function getNotedBy(selected,txtSign,txtDesig){
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
							//'location=0, toolbar=0, menubar=0, fullscreen=1');
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
