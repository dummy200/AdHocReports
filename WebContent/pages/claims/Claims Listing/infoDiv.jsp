<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" id="errorMsg2" name="errorMsg2" value="${fetchPolicyIdErrorMsg}">
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="policyId" name="policyId" value="${policyId}">
<table style="margin-top: 10px; width: 100%;">
	<%-- <c:if test="${errorMsg != null}">
				<tr>
					<td class="rightAligned" style="width: 25%;">Assured Name</td>
					<td class="leftAligned"><input id="txtAssuredName"
						name="capsField" class="leftAligned" type="text"
						style="width: 71%;" value="" title="Assured Name" disabled /></td>
				</tr>
				<tr>
					<td class="rightAligned" style="width: 25%;">Item Title</td>
					<td class="leftAligned"><input id="txtItemTitle2"
						name="capsField" class="leftAligned" type="text"
						style="width: 50%;" value="" title="Assured Name" disabled /></td>
				</tr>
	</c:if> --%>
	<%--ok 
	<c:forEach var="assured" items="${assuredGipiPolbasic}">
					<tr>
						<td class="rightAligned" style="width: 25%;">Assured Name</td>
						<td class="leftAligned"><input id="txtAssuredName"
							name="capsField" class="leftAligned" type="text"
							style="width: 71%;" value="${assured.assdName}"
							title="Assured Name" disabled /></td>
					</tr>
				</c:forEach>
				<c:forEach var="item" items="${item}">
					<tr>
						<td class="rightAligned" style="width: 25%;">Item Title</td>
						<td class="leftAligned"><input id="txtItemTitle"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.itemTitle}" title="Item Title"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Color</td>
						<td class="leftAligned"><input id="txtItemColor"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.color}" title="Item Color"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Motor No</td>
						<td class="leftAligned"><input id="txtItemMotorNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.motorNo}" title="Motor No"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Serial No</td>
						<td class="leftAligned"><input id="txtItemSerialNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.serialNo}" title="Serial No"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Plate No</td>
						<td class="leftAligned"><input id="txtItemPlateNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.plateNo}" title="Plate No"
							disabled /></td>
					</tr>
				</c:forEach>--%>
	<c:choose>
		<c:when test='${lineCd eq "MC" }'>
			<c:choose>
				<c:when test="${fetchPolicyIdErrorMsg == null }">
				<c:forEach var="assured" items="${assuredGipiPolbasic}">
					<tr>
						<td class="rightAligned" style="width: 25%;">Assured Name</td>
						<td class="leftAligned"><input id="txtAssuredName"
							name="capsField" class="leftAligned" type="text"
							style="width: 71%;" value="${assured.assdName}"
							title="Assured Name" disabled /></td>
					</tr>
				</c:forEach>
				<c:forEach var="item" items="${item}">
					<tr>
						<td class="rightAligned" style="width: 25%;">Item Title</td>
						<td class="leftAligned"><input id="txtItemTitle"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.itemTitle}" title="Item Title"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Color</td>
						<td class="leftAligned"><input id="txtItemColor"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.color}" title="Item Color"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Motor No</td>
						<td class="leftAligned"><input id="txtItemMotorNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.motorNo}" title="Motor No"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Serial No</td>
						<td class="leftAligned"><input id="txtItemSerialNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.serialNo}" title="Serial No"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Plate No</td>
						<td class="leftAligned"><input id="txtItemPlateNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.plateNo}" title="Plate No"
							disabled /></td>
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
					<td class="rightAligned" style="width: 25%;">Assured Name</td>
					<td class="leftAligned"><input id="txtAssuredName"
						name="capsField" class="leftAligned" type="text"
						style="width: 71%;" value="" title="Assured Name" disabled /></td>
				</tr>
				<tr>
					<td class="rightAligned" style="width: 25%;">Item Title</td>
					<td class="leftAligned"><input id="txtItemTitle"
						name="capsField" class="leftAligned" type="text"
						style="width: 50%;" value="" title="Item Title" disabled /></td>
				</tr>
				<tr>
						<td class="rightAligned" style="width: 25%;">Color</td>
						<td class="leftAligned"><input id="txtItemColor"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="" title="Item Color"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Motor No</td>
						<td class="leftAligned"><input id="txtItemMotorNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="" title="Motor No"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Serial No</td>
						<td class="leftAligned"><input id="txtItemSerialNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="" title="Serial No"
							disabled /></td>
					</tr>
					<tr>
						<td class="rightAligned" style="width: 25%;">Plate No</td>
						<td class="leftAligned"><input id="txtItemPlateNo"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="" title="Plate No"
							disabled /></td>
					</tr>
				</c:otherwise>
				</c:choose>
		</c:when>
		<c:when test="${lineCd eq 'OC' }">
			<c:choose>
				<c:when test="${errorMsg == null }">
				<c:forEach var="assured" items="${assuredGipiPolbasic}">
					<tr>
						<td class="rightAligned" style="width: 25%;">Assured Name</td>
						<td class="leftAligned"><input id="txtAssuredName"
							name="capsField" class="leftAligned" type="text"
							style="width: 71%;" value="${assured.assdName}"
							title="Assured Name" disabled /></td>
					</tr>
				</c:forEach>
				<c:forEach var="item" items="${item}">
					<tr>
						<td class="rightAligned" style="width: 25%;">Item Title</td>
						<td class="leftAligned"><input id="txtItemTitle"
							name="capsField" class="leftAligned" type="text"
							style="width: 50%;" value="${item.itemTitle}" title="Item Title"
							disabled /></td>
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
					<td class="rightAligned" style="width: 25%;">Assured Name</td>
					<td class="leftAligned"><input id="txtAssuredName"
						name="capsField" class="leftAligned" type="text"
						style="width: 71%;" value="" title="Assured Name" disabled /></td>
				</tr>
				<tr>
					<td class="rightAligned" style="width: 25%;">Item Title</td>
					<td class="leftAligned"><input id="txtItemTitle"
						name="capsField" class="leftAligned" type="text"
						style="width: 50%;" value="" title="Item Title" disabled /></td>
				</tr>
				</c:otherwise>
				</c:choose>
		</c:when>
		<c:otherwise>
			<c:forEach var="assured" items="${assuredGipiPolbasic}">
				<tr>
					<td class="rightAligned" style="width: 25%;">Assured Name</td>
					<td class="leftAligned"><input id="txtAssuredName"
						name="capsField" class="leftAligned" type="text"
						style="width: 71%;" value="${assured.assdName}"
						title="Assured Name" disabled /></td>
				</tr>
			</c:forEach>
			<c:forEach var="item" items="${item}">
				<tr>
					<td class="rightAligned" style="width: 25%;">Item Title</td>
					<td class="leftAligned"><input id="txtItemTitle"
						name="capsField" class="leftAligned" type="text"
						style="width: 50%;" value="${item.itemTitle}" title="Assured Name"
						disabled /></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<script>
	 var errorMsg2 = $F("errorMsg2");
	if (!checkBlankNull(errorMsg2)) {
			if(errorMsg2 == 'Error: executeQueryForObject returned too many results.'){
				showMessageBox('Error. Search returned more than one results.', "E");
			}else{
				showMessageBox(errorMsg, "E");
			}
		/* } */
		$("btnPrintOnePager").disable();
	} else
		$("btnPrintOnePager").enable();

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	} 
</script>