<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" id="errorMsg2" name="errorMsg2" value="${errorMsg}">
<table style="margin-top: 10px; width: 100%;">
			<c:choose>
				<c:when test="${errorMsg == '' }">
				<c:forEach var="mcSworn" items="${mcSwornList}">
					<tr>
						<td class="rightAligned" style="width: 25%;">Policy No.</td>
						<td class="leftAligned"><input id="txtPolicyNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${mcSworn.policyNo}"
							title="Policy No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Insured Name</td>
						<td class="leftAligned"><input id="txtAssuredName"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${mcSworn.assuredName}"
							title="Assured Name" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Model Year</td>
						<td class="leftAligned"><input id="txtModelYear"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${mcSworn.modelyear}"
							title="Model Year" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Motor Type</td>
						<td class="leftAligned"><input id="txtMotorType"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${mcSworn.motorTypeDesc}"
							title="Motor Type" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Motor No.</td>
						<td class="leftAligned"><input id="txtMotorNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${mcSworn.motorNo}"
							title="Motor No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Serial No.</td>
						<td class="leftAligned"><input id="txtSerialNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${mcSworn.serialNo}"
							title="Serial No" disabled /></td>
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="rightAligned" style="width: 25%;">Policy No.</td>
						<td class="leftAligned"><input id="txtPolicyNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Policy No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Insured Name</td>
						<td class="leftAligned"><input id="txtAssuredName"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Assured Name" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Model Year</td>
						<td class="leftAligned"><input id="txtModelYear"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Model Year" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Motor Type</td>
						<td class="leftAligned"><input id="txtMotorType"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Motor Type" disabled /></td>
					</tr>
				</c:otherwise>
	</c:choose>
</table>
<script>
	 var errorMsg2 = $F("errorMsg2");
	if (!checkBlankNull(errorMsg2)) {
			if(errorMsg2 == 'Error: executeQueryForObject returned too many results.'){
				showMessageBox("Error. Search returned more than one results.", "E");
			}else{
				showMessageBox(errorMsg2, "E");
			}
		/* } */
		$("btnPrintMcSworn").disable();
	} else
		$("btnPrintMcSworn").enable();

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	} 
</script>