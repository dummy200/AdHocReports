<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<input type="hidden" id="errorMsg2" name="errorMsg2" value="${fetchPolicyIdErrorMsg}">

<table style="margin-top: 0px; width: 100%;">
<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;">Endt No.</td>
		<td class="leftAligned"><input id="txtEndtNo" class="leftAligned" type="text" name="capsField" 
			style="width: 20%;" title="Endt No" disabled/>
	</c:if>
	<c:if test="${Gipi_Polbasic eq null}">
		Ref Bond No.&nbsp;<input id="txtRefBondNo" class="leftAligned" type="text" name="capsField" 
			style="width: 20%;" title="Ref Bond No" disabled/>
	</c:if>
	<c:if test="${Gipi_Polbasic eq null}">
		<input id="txtRefBondNo1" class="leftAligned" type="text" name="capsField" 
			style="width: 6%;" title="Ref Bond No1" disabled/></td>
	</c:if>
</tr>
<tr>
	<c:if test="${assured eq null}">
		<td class="rightAligned" style="width: 25%;">Assured</td>
		<td class="leftAligned"><input id="txtAssured" class="leftAligned" type="text" name="capsField" 
			style="width: 89%;" title="Assured" disabled/></td>
	</c:if>
</tr>
<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;">Incept Date</td>
		<td class="leftAligned"><input id="txtInceptDate" class="leftAligned" type="text" name="intField"  
			style="width: 10%;" title="Incept Date" disabled/>
	</c:if>
	<c:if test="${Gipi_Polbasic eq null}">
		Expiry Date&nbsp;<input id="txtExpiryDate" class="leftAligned" type="text" name="capsField" 
			style="width: 10%;" title="Expiry Date" disabled/>
	</c:if>
	<c:if test="${Gipi_Polbasic eq null}">
		Issue Date&nbsp;<input id="txtIssueDate" class="leftAligned" type="text" name="capsField" 
			style="width: 10%;" title="Issue Date" disabled/>
	</c:if>
	<c:if test="${gipi_Invoices eq null}">
		Bill No.&nbsp;<input id="txtBillNo1" class="leftAligned" type="text" name="capsField" 
			style="width: 7%;" title="Bill No1" disabled/>
	</c:if>
	<c:if test="${gipi_Invoices eq null}">
		<input id="txtBillNo2" class="leftAligned" type="text" name="capsField" 
			style="width: 18%;" title="Bill No2" disabled/></td>
	</c:if>
</tr>
<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;">Address</td>
		<td class="leftAligned"><input id="txtAddress" class="leftAligned" type="text" name="capsField"  
			style="width: 89%;" title="Address" disabled/></td>
	</c:if>
</tr>
<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;"></td>
		<td class="leftAligned"><input id="txtAddress2" class="leftAligned" type="text" name="capsField"  
			style="width: 89%;" title="Address2" disabled/></td>
	</c:if>
</tr>
<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;"></td>
		<td class="leftAligned"><input id="txtAddress3" class="leftAligned" type="text" name="capsField"  
			style="width: 89%;" title="Address3" disabled/></td>
	</c:if>
</tr>
<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;">Sum Insured</td>
		<td class="leftAligned"><input id="txtSumInsured" class="leftAligned" type="text" name="intField" 
			style="width: 17%;" title="Sum Insured" disabled/>
	</c:if>
	<c:if test="${Gipi_Polbasic eq null}">
		<input id="txtSumInsured" class="leftAligned" type="text" name="intField" 
			style="width: 70%;" title="Sum Insured" disabled/></td>
	</c:if>
</tr>	

<tr>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Endt No.</td>
		<td class="leftAligned"><input id="txtEndtNo" class="leftAligned" type="text" name="capsField" 
			style="width: 7%;" value="${Gipi_Polbasic.endtNo}" title="Endt No" disabled/>
	</c:forEach>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		Ref Bond No.&nbsp;<input id="txtRefBondNo" class="leftAligned" type="text" name="capsField" 
			style="width: 20%;" value="${Gipi_Polbasic.refPolNo}" title="Ref Bond No" disabled/>
	</c:forEach>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<input id="txtRefBondNo1" class="leftAligned" type="text" name="capsField" 
			style="width: 6%;" value="${Gipi_Polbasic.refNo}" title="Ref Bond No1" disabled/></td>
	</c:forEach>
</tr>
<tr>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Assured</td>
		<td class="leftAligned"><input id="txtAssured" class="leftAligned" type="text" name="capsField" 
			style="width: 89%;" value="${Gipi_Polbasic.assdNo}" title="Assured" disabled/></td>
	</c:forEach>
</tr>
<tr>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Incept Date&nbsp;</td>
		<td class="leftAligned"><input id="txtInceptDate" class="leftAligned" type="text" name="intField"  
			style="width: 10%;"  value="${Gipi_Polbasic.inceptDate}" title="Incept Date" disabled/>
	</c:forEach>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		Expiry Date&nbsp;<input id="txtExpiryDate" class="leftAligned" type="text" name="capsField" 
			style="width: 10%;" value="${Gipi_Polbasic.expiryDate}" title="Expiry Date" disabled/>
	</c:forEach>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		Issue Date&nbsp;<input id="txtIssueDate" class="leftAligned" type="text" name="capsField" 
			style="width: 10%;" value="${Gipi_Polbasic.issueDate}" title="Issue Date" disabled/>
	</c:forEach>
	<c:forEach var="gipi_Invoices" items="${gipi_Invoices}">
		Bill No.&nbsp;<input id="txtBillNo1" class="leftAligned" type="text" name="capsField" 
			style="width: 7%;" value="${gipi_Invoices.issCd}" title="Bill No1" disabled/>
	</c:forEach>
	<c:forEach var="gipi_Invoices" items="${gipi_Invoices}">
		<input id="txtBillNo2" class="leftAligned" type="text" name="capsField" 
			style="width: 18%;" value="${gipi_Invoices.premSeqNo}" title="Bill No2" disabled/></td>
	</c:forEach>
</tr>
<tr>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Address</td>
		<td class="leftAligned"><input id="txtAddress" class="leftAligned" type="text" name="capsField"  
			style="width: 89%;"  value="${Gipi_Polbasic.address1}" title="Address" disabled/></td>
	</c:forEach>
</tr>
<tr>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;"></td>
		<td class="leftAligned"><input id="txtAddress2" class="leftAligned" type="text" name="capsField"  
			style="width: 89%;"  value="${Gipi_Polbasic.address2}" title="Address2" disabled/></td>
	</c:forEach>
</tr>
<tr>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;"></td>
		<td class="leftAligned"><input id="txtAddress3" class="leftAligned" type="text" name="capsField"  
			style="width: 89%;"  value="${Gipi_Polbasic.address3}" title="Address3" disabled/></td>
	</c:forEach>
</tr>
<tr>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Sum Insured</td>
		<td class="leftAligned"><input id="txtSumInsured" class="leftAligned" type="text" name="intField" 
			style="width: 17%;" value="${Gipi_Polbasic.tsiAmt}" title="Sum Insured" disabled/>
	</c:forEach>
	<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<input id="txtSumInsured" class="leftAligned" type="text" name="intField" 
			style="width: 70%;" value="${Gipi_Polbasic.wordsAmt}" title="Sum Insured" disabled/></td>
	</c:forEach>
</tr>
<tr>
		<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Obligee</td>
		<td class="leftAligned"><input id="txtObligee" class="leftAligned" type="text" name="capsField" 
			style="width: 89%;" value="${Gipi_Polbasic.obligee}" title="Obligee" disabled/></td>
	    </c:forEach>

</tr>	
</table>

<div id ="outerDiv" name="outerDiv">
	<div id ="innerDiv" name="outerDiv">
		<label id="pageTitle">Notary</label>
	</div>
</div>

<div class="sectionDiv" style="margin-bottom: 10px;">
<table style="margin-top: 0px; width: 100%;">
<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;">Notary Name</td>
		<td class="leftAligned"><input id="txtNotary" class="leftAligned" type="text" name="intField" 
			style="width: 50%;" title="Notary Name" disabled/>
	</c:if>
</tr>	

<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;">Issue Place</td>
		<td class="leftAligned"><input id="txtPlaceIssue" class="leftAligned" type="text" name="intField" 
			style="width: 50%;" title="Place Issue" disabled/>
	</c:if>
</tr>	

<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;">PTR Number</td>
		<td class="leftAligned"><input id="txtPtrNo" class="leftAligned" type="text" name="intField" 
			style="width: 50%;" title="PTR Number" disabled/>
	</c:if>
</tr>	

<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;">Notary Expiry Date</td>
		<td class="leftAligned"><input id="txtNoExpiry" class="leftAligned" type="text" name="intField" 
			style="width: 50%;" title="Notary Expiry Date" disabled/>
	</c:if>
</tr>	

<tr>
	<c:if test="${Gipi_Polbasic eq null}">
		<td class="rightAligned" style="width: 25%;">Notary Issue Date</td>
		<td class="leftAligned"><input id="txtNoIssue" class="leftAligned" type="text" name="intField" 
			style="width: 50%;" title="Notary Issue Date" disabled/>
	</c:if>
</tr>	

<tr>
		<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Notary Name</td>
		<td class="leftAligned"><input id="txtNotary" class="leftAligned" type="text" name="capsField" 
			style="width: 50%;" value="${Gipi_Polbasic.notary}" title="Notary Name" disabled/></td>
	    </c:forEach>

</tr>	

<tr>
		<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Place Issue</td>
		<td class="leftAligned"><input id="txtPlaceIssue" class="leftAligned" type="text" name="capsField" 
			style="width: 50%;" value="${Gipi_Polbasic.notary_place}" title="Place Issue" disabled/></td>
	    </c:forEach>

</tr>	

<tr>
		<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">PTR Number</td>
		<td class="leftAligned"><input id="txtPtrNo" class="leftAligned" type="text" name="capsField" 
			style="width: 50%;" value="${Gipi_Polbasic.notary_no}" title="PTR Number" disabled/></td>
	    </c:forEach>
</tr>	

<tr>
		<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Expiry Date</td>
		<td class="leftAligned"><input id="txtNoExpiry" class="leftAligned" type="text" name="capsField" 
			style="width: 50%;" value="${Gipi_Polbasic.notary_expiry}" title="Notary Expiry" disabled/></td>
	    </c:forEach>
</tr>

<tr>
		<c:forEach var="Gipi_Polbasic" items="${Gipi_Polbasic}">
		<td class="rightAligned" style="width: 25%;">Issue Date</td>
		<td class="leftAligned"><input id="txtNoIssue" class="leftAligned" type="text" name="capsField" 
			style="width: 50%;" value="${Gipi_Polbasic.notary_issue}" title="Notary Issue Date" disabled/></td>
	    </c:forEach>

</tr>		
</table>
</div>

<script type="text/javascript">
var errorMsg2 = $F("errorMsg2");
if (!checkBlankNull(errorMsg2)) {
	if (checkBlankNull(errorMsg)){
		showMessageBox(errorMsg,'E');
	}else
		showMessageBox(errorMsg2,'E');
	$("btnPrintReport").disable();
} else
	$("btnPrintReport").enable();
</script>