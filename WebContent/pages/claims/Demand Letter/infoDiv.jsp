<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" id="errorMsg2" name="errorMsg2" value="${errorMsg}">
<input type="hidden" id="letterType" name="letterType" value="${letterType}">
<input type="hidden" id="claimId" name="claimId" value="${claimId}">
<input type="hidden" id="recoveryId" name="recoveryId" value="${recoveryId}">
<input type="hidden" id="reprintFirst" name="reprintFirst" value="${reprintFirst}">
<input type="hidden" id="reprintSecond" name="reprintSecond" value="${reprintSecond}">
<input type="hidden" id="testClaimId" name="testClaimId" value="${testClaimId}">
<input type="hidden" id="testRecoveryId" name="testRecoveryId" value="${testRecoveryId}">
<input type="hidden" id="testUserId" name="testUserId" value="${testUserId}">
<input type="hidden" id="testUserEmail" name="testUserEmail" value="${testUserEmail}">
<input type="hidden" id="page" name="page" value="${page}">
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="userId" name= "userId" value = "${adhocUser}">
<table style="margin-top: 10px; width: 100%;">
			<c:choose>
				<c:when test="${errorMsg == '' }">
				<c:forEach var="demandLetter" items="${demandLetterList}">
					<tr>
						<td class="rightAligned" style="width: 25%;">Claim No.</td>
						<td class="leftAligned"><input id="txtClaimNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${demandLetter.claimNo}"
							title="Claim No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Insured Name</td>
						<td class="leftAligned"><input id="txtAssuredName"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${demandLetter.assuredName}"
							title="Assured Name" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Model Year</td>
						<td class="leftAligned"><input id="txtModelYear"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${demandLetter.modelYear}"
							title="Model Year" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Car Company</td>
						<td class="leftAligned"><input id="txtCarCompany"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${demandLetter.carCompany}"
							title="Car Company" disabled /></td>
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
						<td class="rightAligned" style="width: 25%;">Car Company</td>
						<td class="leftAligned"><input id="txtCarCompany"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Car Company" disabled /></td>
					</tr>
				</c:otherwise>
	</c:choose>
</table>
<script>
	 var errorMsg2 = $F("errorMsg2");
	 var letterType = $F("letterType");
	 var reprintFirst = $F("reprintFirst");
	 var reprintSecond = $F("reprintSecond");
	if (!checkBlankNull(errorMsg2)) {
			if(errorMsg2 == 'Error: executeQueryForObject returned too many results.'){
				showMessageBox('Error. Search returned more than one results.', "E");
			}else{
				showMessageBox(errorMsg2, "E");
			}
		/* } */
		$("btnPrint").disable();
	} else
		$("btnPrint").enable();
	
	if(letterType=='2'){
		$("rdoSecond").enable();
	}else
		$("rdoSecond").disable();
	
	if($F("reprintFirst") == 'true' || $F("reprintSecond")== 'true' )
		$("btnReprint").enable();

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	} 
</script>