
<!-- hidden fields -->
<input type="hidden" id="page" name="page" value="${page}">
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
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

<script type="text/javascript">
	printOutputPdf();

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
					window.open('pages/report.jsp', '',
							'location=0, toolbar=0, menubar=0, fullscreen=1');
					hideNotice("");
				}
			});
		}
	}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
