<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>

<style>
textarea[id=txtAreaBondDetails] {
    resize: none;
}
</style>


<div id="printMcSwornMenu">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="checkReqExit">Exit</a></li>
			</ul>
		</div>
	</div>
</div>

<!-- hidden fields -->
<input type="hidden" id="page" name="page" value="${page}">
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
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
<input type="hidden" id="sign" value="">
<input type="hidden" id="desig" value="">
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Bond Details Maintenance</label>
		<!--  <span class="refreshers"
			style="margin-top: 0;"> <label id="reloadForm"
			name="reloadForm" title="Reload Form">Reload Form</label>
		</span> -->
	</div>
</div>
<div id="mcSwornSectionDiv" class="sectionDiv"
	style="margin-bottom: 10px;">
	<div class="sectionDiv" id="mcSwornMainDiv"
		style="width: 90%; height: 550px; margin-top: 40px; margin-left: 45px; margin-bottom: 50px;">
		<div class="sectionDiv" id="individualDiv"
			style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
			<table style="margin-top: 10px; width: 100%;">
				<tr>
					<td class="rightAligned" style="width: 25%;">Policy No.</td>
						<td class="leftAligned"><input id="txtLineCd"
							class="leftAligned required upper" type="text" name="capsField"
							style="width: 8%;" value="SU" title="Line Code" disabled/> <input
							id="txtSublineCd" class="leftAligned upper" type="text"
							name="capsField" style="width: 15%;" value=""
							title="Subline Code" maxlength="7" /> <input id="txtIssCd"
							class="leftAligned upper" type="text" name="capsField"
							style="width: 8%;" value="" title="Issue Source Code"
							maxlength="2" /> <input id="txtIssueYy"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
							type="text" name="intField" style="width: 8%;" value=""
							title="Year" maxlength="2" /> <input id="txtPolSeqNo"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
							type="text" name="intField" style="width: 15%;" value=""
							title="Policy Sequence Number" maxlength="7" /> <input
							id="txtRenewNo"
							class="leftAligned integerNoNegativeUnformattedNoComma upper"
							type="text" name="intField" style="width: 8%;" value=""
							title="Renew Number" maxlength="2" /> <span> <img
								src="${pageContext.request.contextPath}/images/misc/searchIcon.png"
								id="searchForPolicy" name="searchForPolicy" alt="Go"
								style="margin-top: 2px;" title="Search Policy" />
						</span></td>
				</tr>
			</table>
		</div>
		<div class="sectionDiv" id="bondDetailsDiv"
			style="width: 97%; margin-left: 8px; float: left; border-color: white;">
			<table style="margin-top: 5px; width: 100%;">
				<tr>
					<td class="rightAligned" style="width: 25%;">Bond Details</td>
					<td class="leftAligned">
						<textarea id="txtAreaBondDetails" name="capsField" class="leftAligned" rows="3" cols="72" style="background-color: #e3e3e3;" readonly>
						</textarea>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	$("txtSublineCd").focus();
	makeAllInputFieldsUpperCase();

	$("txtLineCd").observe("keyup", function() {
		if (!/^[a-zA-Z]*$/g.test($F("txtLineCd").trim())) {
			showMessageBox("Please input valid characters", "I");
			$("txtLineCd").value = "";
		}
	});
	
	/* $("txtSublineCd").observe("keyup", function() {
		if (!/^[a-zA-Z]*$/g.test($F("txtSublineCd").trim())) {
			showMessageBox("Please input valid characters", "I");
			$("txtSublineCd").value = "";
		}
	}); */

	$("txtIssCd").observe("keyup", function() {
		if (!/^[a-zA-Z]*$/g.test($F("txtIssCd").trim())) {
			showMessageBox("Please input valid characters", "I");
			$("txtIssCd").value = "";
		}
	});

	$("txtIssueYy").observe("keyup", function() {
		if (/[^0-9]/g.test($F("txtIssueYy").trim())) {
			showMessageBox("Please input valid numbers", "I");
			$("txtIssueYy").value = "";
		}
	});

	$("txtPolSeqNo").observe("keyup", function() {
		if (/[^0-9]/g.test($F("txtPolSeqNo").trim())) {
			showMessageBox("Please input valid numbers", "I");
			$("txtPolSeqNo").value = "";
		}
	});

	$("txtRenewNo").observe("keyup", function() {
		if (/[^0-9]/g.test($F("txtRenewNo").trim())) {
			showMessageBox("Please input valid numbers", "I");
			$("txtDocSeqNo").value = "";
		}
	});

	$("checkReqExit").observe(
			"click",
			function() {
				goToModule(divToUpdate, contextPath + "/pages/main.jsp",
						"Please wait.....", "Home");
			});

	function isReqNoFieldsOk() {
		var lineCd = $F("txtLineCd");
		var sublineCd = $F("txtSublineCd");
		var issCd = $F("txtIssCd");
		var issueYy = $F("txtIssueYy");
		var polSeqNo = $F("txtPolSeqNo");
		var renewNo = $F("txtRenewNo");

		if (checkBlankNull(lineCd) || checkBlankNull(sublineCd)
				|| checkBlankNull(issCd) || checkBlankNull(issueYy)
				|| checkBlankNull(polSeqNo) || checkBlankNull(renewNo)) {
			showMessageBox("Please input required fields", "I");
			return false;
		} else
			return true;
	}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}

	$("searchForPolicy").observe("click", function() {
		if (isReqNoFieldsOk()) {
			new Ajax.Request(contextPath + '/BondDetailsController', {
				method : "POST",
				parameters : {
					action : "populateBondDetails",
					lineCd : $F("txtLineCd").trim().toUpperCase(),
					sublineCd : $F("txtSublineCd").trim().toUpperCase(),
					issCd : $F("txtIssCd").trim().toUpperCase(),
					issueYY : $F("txtIssueYy").trim(),
					polSeqNo : $F("txtPolSeqNo").trim(),
					renewNo : $F("txtRenewNo").trim(),
				},
				onCreate : showNotice("Fetching Details. Please wait..."),
				onComplete : function(response) {
					hideNotice("");
					$("bondDetailsDiv").update(response.responseText);
				}
			});
		}
	});
</script>