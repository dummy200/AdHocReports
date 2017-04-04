<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>

<style>
textarea[id=txtAreaParticulars] {
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
<%-- <input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}"> --%>
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
		<label id="pageTitle">Update Referror Name</label>
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
					<td class="rightAligned" style="width: 25%;">Request No.</td>
					<td class="leftAligned"><input id="txtDocumentCd"
						class="leftAligned required upper" type="text" name="capsField"
						style="width: 10%;" required /> <input id="txtBranchCd"
						class="leftAligned required upper" type="text" name="capsField"
						style="width: 7%;" required /> <input id="txtDocYear"
						class="leftAligned required upper " type="text" maxlength="4"
						style="width: 10%;" required /> <input id="txtDocMm"
						class="leftAligned required  upper" type="text" style="width: 7%;"
						required /> <input id="txtDocSeqNo"
						class="leftAligned required upper" type="text" style="width: 25%;"
						required /> <span><img
							src="${pageContext.request.contextPath}/images/misc/searchIcon.png"
							id="searchForPolicy" name="searchForPolicy" alt="Go"
							style="margin-top: 2px;" title="Search Policy" /> </span>
				</tr>
			</table>
		</div>
		<div class="sectionDiv" id="paymentReqDetailDiv"
			style="width: 97%; margin-left: 8px; float: left; border-color: white;">
			<table style="margin-top: 5px; width: 100%;">
				<tr>
					<td class="rightAligned" style="width: 25%;">Payee</td>
					<td class="leftAligned"><input id="txtPayeeClassCd"
						class="leftAligned  upper" type="text" name="capsField"
						style="width: 10%;" disabled /> <input id="txtPayeeCd"
						class="leftAligned  upper" type="text" name="capsField"
						style="width: 25%;" disabled /> <input id="txtPayee"
						class="leftAligned  upper" type="text" name="capsField"
						style="width: 40%;" disabled /></td>
				</tr>
				<tr>
					<td class="rightAligned" style="width: 25%;">Particulars</td>
					<!-- <td class="leftAligned"><input id="txtParticulars"
						name="capsField" class="leftAligned" type="text"
						style="width: 79%;" disabled /></td> -->
					<td class="leftAligned">
						<textarea id="txtAreaParticulars" name="capsField" class="leftAligned" rows="3" cols="72" style="background-color: #e3e3e3;" readonly>
						</textarea>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("txtDocumentCd").focus();
	makeAllInputFieldsUpperCase();

	$("txtDocumentCd").observe("keyup", function() {
		if (!/^[a-zA-Z]*$/g.test($F("txtDocumentCd").trim())) {
			showMessageBox("Please input valid characters", "I");
			$("txtDocumentCd").value = "";
		}
	});

	$("txtBranchCd").observe("keyup", function() {
		if (!/^[a-zA-Z]*$/g.test($F("txtBranchCd").trim())) {
			showMessageBox("Please input valid characters", "I");
			$("txtBranchCd").value = "";
		}
	});

	$("txtDocYear").observe("keyup", function() {
		if (/[^0-9]/g.test($F("txtDocYear").trim())) {
			showMessageBox("Please input valid numbers", "I");
			$("txtDocYear").value = "";
		}
	});

	$("txtDocMm").observe("keyup", function() {
		if (/[^0-9]/g.test($F("txtDocMm").trim())) {
			showMessageBox("Please input valid numbers", "I");
			$("txtDocMm").value = "";
		}
	});

	$("txtDocSeqNo").observe("keyup", function() {
		if (/[^0-9]/g.test($F("txtDocSeqNo").trim())) {
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
		var docCd = $F("txtDocumentCd");
		var branchCd = $F("txtBranchCd");
		var docYr = $F("txtDocYear");
		var docMm = $F("txtDocMm");
		var docSeqNo = $F("txtDocSeqNo");

		if (checkBlankNull(docCd) || checkBlankNull(branchCd)
				|| checkBlankNull(docYr) || checkBlankNull(docMm)
				|| checkBlankNull(docSeqNo)) {
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
			new Ajax.Request(contextPath + '/UpdateRefNameController', {
				method : "POST",
				parameters : {
					action : "populateTables",
					documentCd : $F("txtDocumentCd").trim().toUpperCase(),
					branchCd : $F("txtBranchCd").trim().toUpperCase(),
					docYear : $F("txtDocYear").trim(),
					docMm : $F("txtDocMm").trim(),
					docSeqNo : $F("txtDocSeqNo").trim(),
				},
				onCreate : showNotice("Fetching Details. Please wait..."),
				onComplete : function(response) {
					hideNotice("");
					$("paymentReqDetailDiv").update(response.responseText);
				}
			});
		}
	});
</script>