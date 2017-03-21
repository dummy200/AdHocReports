<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" id="errorMsg2" name="errorMsg2"
	value="${errorMsg}">
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="policyId" name="policyId" value="${policyId}">
<table style="margin-top: 10px; width: 100%;">
	<c:choose>
		<c:when test='${errorMsg == "" }'>
				<tr>
					<td class="rightAligned" style="width: 25%;">Assured Names</td>
					<td class="leftAligned"><input id="txtAssuredName"
						name="capsField" class="leftAligned" type="text"
						style="width: 71%;" value="${assuredName}"
						title="Assured Name" disabled /></td>
				</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td class="rightAligned" style="width: 25%;">Assured Name</td>
				<td class="leftAligned"><input id="txtAssuredName"
					name="capsField" class="leftAligned" type="text"
					style="width: 71%;" value="" title="Assured Name" disabled /></td>
			</tr>
		</c:otherwise>
	</c:choose>
</table>
<script>
	var errorMsg2 = $F("errorMsg2");
	if (!checkBlankNull(errorMsg2)) {
		if (errorMsg2 == 'Error: executeQueryForObject returned too many results.') {
			showMessageBox("Error. Search returned more than one results.", "E");
		} else {
			showMessageBox(errorMsg2, "E");
		}
		$("btnPrint").disable();
	} else
		$("btnPrint").enable();

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>