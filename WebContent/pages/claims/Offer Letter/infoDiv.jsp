<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="hidden" id="errorMsg2" name="errorMsg2" value="${errorMsg}">
<input type="hidden" id="lineCd" name="lineCd" value="${claimNo.lineCd}">
<input type="hidden" id="sublineCd" name="sublineCd" value="${claimNo.sublineCd}">
<input type="hidden" id="issCd" name="issCd" value="${claimNo.issCd}">
<input type="hidden" id="clmYy" name="clmYy" value="${claimNo.clmYy}">
<input type="hidden" id="clmSeqNo" name="clmSeqNo" value="${claimNo.clmSeqNo}">
<table style="margin-top: 10px; width: 100%;">
			<c:choose>
				<c:when test="${errorMsg == '' }">
				<c:forEach var="offerLetter" items="${offerLetter}">
					<tr>
						<td class="rightAligned" style="width: 25%;">Claim No.</td>
						<td class="leftAligned"><input id="txtClaimNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.claimNo}"
							title="Claim No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Assured No.</td>
						<td class="leftAligned"><input id="txtAssdNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.assdNo}"
							title="Assured No." disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Assured Name</td>
						<td class="leftAligned"><input id="txtAssdName"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.assdName}"
							title="Assured Name" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Address</td>
						<td class="leftAligned"><input id="txtAddress"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.assdAddress}"
							title="Address" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Motor No.</td>
						<td class="leftAligned"><input id="txtMotorNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.motorNo}"
							title="Motor No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Plate No.</td>
						<td class="leftAligned"><input id="txtPlateNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.plateNo}"
							title="Plate No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Serial No.</td>
						<td class="leftAligned"><input id="txtSerialNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.serialNo}"
							title="Serial No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Insured Unit</td>
						<td class="leftAligned"><input id="txtInsuredUnit"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.insuredUnit}"
							title="Insured Unit" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Loss Amount</td>
						<td class="leftAligned"><input id="txtLossAmt"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.lossAmt}"
							title="Loss Amount" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Policy Deductible</td>
						<td class="leftAligned"><input id="txtDedAmt"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.dedAmt}"
							title="Deductible Amount" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Net Payable</td>
						<td class="leftAligned"><input id="txtNetTotal"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value="${offerLetter.netTotal}"
							title="Net Payable" disabled />
							<input type = "hidden" id= checkVoucherVar value = "${offerLetter.checkVoucher}"></td>
						
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="rightAligned" style="width: 25%;">Claim No.</td>
						<td class="leftAligned"><input id="txtClaimNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Claim No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Assured No.</td>
						<td class="leftAligned"><input id="txtAssdNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Assured No." disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Assured Name</td>
						<td class="leftAligned"><input id="txtAssdName"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Assured Name" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Address</td>
						<td class="leftAligned"><input id="txtAddress"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Address" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Motor No.</td>
						<td class="leftAligned"><input id="txtMotorNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Motor No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Plate No.</td>
						<td class="leftAligned"><input id="txtPlateNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Plate No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Serial No.</td>
						<td class="leftAligned"><input id="txtSerialNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Serial No" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Insured Unit</td>
						<td class="leftAligned"><input id="txtInsuredUnit"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Insured Unit" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Loss Amount</td>
						<td class="leftAligned"><input id="txtLossAmt"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Loss Amount" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Policy Deductible</td>
						<td class="leftAligned"><input id="txtDedAmt"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Deductible Amount" disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Net Payable</td>
						<td class="leftAligned"><input id="txtNetTotal"
							name="capsField" class="leftAligned" type="text"
							style="width: 65%;" value=""
							title="Net Payable" disabled /></td>
					</tr>
				</c:otherwise>
	</c:choose>
</table>
<script>
     var checkVoucherVar = $F("checkVoucherVar");
     var errorMsg2 = $F("errorMsg2");
     checkErrorMsg(errorMsg2);
     getcheckVoucher(checkVoucherVar);
	
	 
	 function checkErrorMsg(errorMsg2){
		 if (!checkBlankNull(errorMsg2)) {
			 if(errorMsg2 == 'Error: executeQueryForObject returned too many results.'){
					showMessageBox('Error. Search returned more than one results.', "E");
				}else{
					showMessageBox(errorMsg2, "E");
				}
			$("btnPrint").disable();
		} else{
			$("btnPrint").enable();
			}
		}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
	
	function getcheckVoucher(checkVoucherVar){
		if(checkVoucherVar == ""){
			showMessageBox('Report cannot be generated because check number for this cliam does not exist.', "I");
			$("btnPrint").disable();
	}
	}
	
	
</script>