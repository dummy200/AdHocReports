<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>

<input type="hidden" id="policyId" name="policyId"
	value='${policyId}'>
<input type="hidden" id="bondDtl" name="bondDtl"
	value='${bondDtl}'>
<input type="hidden" id="errorMsg" name="errorMsg" value='${errorMsg}'>
<table style="margin-top: 5px; width: 100%;">
				<tr>
					<td class="rightAligned" style="width: 25%;">Bond Details</td>
					<td class="leftAligned">
						<textarea id="txtAreaBondDetails" name="capsField" class="leftAligned" rows="3" cols="72"><c:out value="${bondDtl}"></c:out></textarea>
					</td>
				</tr>
</table>
<div id="btnUpdateDiv" align="center" style="margin-top: 10px;">
	<input type="button" class="button" style="width: 90px;" id="btnSave"
		name="btnSave" value="Save">
</div>



<script type="text/javascript">
	/* for dataGrid */
	var policyId = $F("policyId");
	var imgPath = contextPath + '/css/codebase/imgs/';
	var remarks = '';
	var premSeqNo = '';
	var issCd = '';
	showError();

	function showError() {
		var errorMsg = $F("errorMsg");
		if (!checkBlankNull(errorMsg)) {
			$("btnSave").disable();
			showMessageBox(errorMsg, "E");
			$("txtAreaBondDetails").setStyle('background-color: #e3e3e3');
			$("txtAreaBondDetails").readOnly = true;
		}
	}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
	
	$("btnSave").observe("click", function() {
		var policyId = $F("policyId");
		var bondDtl = $F("txtAreaBondDetails").trim();
		new Ajax.Request(contextPath + '/BondDetailsController', {
			method : "POST",
			parameters : {
				action : "updateBondDetails",
				policyId : policyId,
				bondDtl : bondDtl
			},
			onCreate : showNotice("Please wait..."),
			onComplete : function(response) {
				hideNotice("");
				var errorMsg = $F("errorMsg");
				if (checkBlankNull(errorMsg)) {
					showMessageBox("Update Success", "I");
				} else {
					showMessageBox(errorMsg, "E");
				}
				$("searchForPolicy").click();
			}
		});

	});
</script>


