<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" id="checkReqIntmList" name="checkReqIntmList"
	value='${checkReqIntmList}'>
<input type="hidden" id="errorMsg" name="errorMsg" value='${errorMsg}'>
<table style="margin-top: 5px; width: 100%;">
	<tr>
		<td class="rightAligned" style="width: 25%;">Payee</td>
		<td class="leftAligned"><input id="txtLineCd"
			class="leftAligned  upper" type="text" name="capsField"
			style="width: 10%;" value="${paymentRequest.payeeClassCd}" disabled />
			<input id="txtLineCd" class="leftAligned  upper" type="text"
			name="capsField" style="width: 25%;"
			value="${paymentRequest.payeeCd}" disabled /> <input id="txtLineCd"
			class="leftAligned  upper" type="text" name="capsField"
			style="width: 40%;" value="${paymentRequest.payee}" disabled /></td>
	</tr>
	<tr>
		<td class="rightAligned" style="width: 25%;">Particulars</td>
		<%-- <td class="leftAligned"><input id="txtAssuredName"
			name="capsField" class="leftAligned" type="text" name="capsField"
			style="width: 79%;" value="${paymentRequest.particulars}" disabled />
		</td> --%>
		<td class="leftAligned">
			<textarea id="txtAreaParticulars" name="capsField" class="leftAligned" rows="3" cols="72" style="background-color: #e3e3e3;" readonly><c:out value="${paymentRequest.particulars }"></c:out>
			</textarea>
		</td>
	</tr>
</table>
<div class="sectionDiv"
	style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
	<div id="gridbox" style="width: 100%; height: 300px; overflow: hidden"
		align="center"></div>
</div>
<div id="btnUpdateDiv" align="center" style="margin-top: 10px;">
	<input type="button" class="button" style="width: 90px;" id="btnUpdate"
		name="btnUpdate" value="Save">
</div>



<script type="text/javascript">
	/* for dataGrid */
	var checkReqIntmList = $F("checkReqIntmList");
	var imgPath = contextPath + '/css/codebase/imgs/';
	var remarks = '';
	var premSeqNo = '';
	var issCd = '';
	var errorMsg = $F("errorMsg");
	showError();
	/* var errorMsg = $F("errorMsg");


	 if((errorMsg != '') || (errorMsg != null)){
	 $("btnUpdate").disable();
	 showMessageBox(errorMsg, "E");
	 } */

	function showError() {
		if (!checkBlankNull(errorMsg)) {
			$("btnUpdate").disable();
			showMessageBox(errorMsg, "E");
		}
	}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}

	var gridCheckIntm = new dhtmlXGridObject('gridbox');
	gridCheckIntm.setImagePath(imgPath);
	gridCheckIntm
			.setHeader("Intm No., Intm Type, Intermediary, Bill No.,, Remarks");
	gridCheckIntm.setInitWidths("100,100,200,50,100,*");
	gridCheckIntm.setColAlign("left,left,left,left,left,left");
	gridCheckIntm.setColTypes("ro,ro,ro,ro,ro,ed");
	gridCheckIntm.setColSorting("str,str,str,str,str,str");
	gridCheckIntm.init();
	gridCheckIntm.parse(checkReqIntmList, "json");

	function getParamsVal() {
		var remarks1 = "";
		var remarks2 = "";
		for (var i = 0; i < gridCheckIntm.getRowsNum(); i++) {
			console.log("REMARKS: " + remarks);
			remarks1 = gridCheckIntm.cellById(i + 1, 5).getValue();
			remarks2 = remarks1.replace(/[^a-zA-Z0-9 ]/g, ' '); // to solve remarks with special characters
			if (i == 0) {
				issCd = gridCheckIntm.cellById(i + 1, 3).getValue();
				premSeqNo = gridCheckIntm.cellById(i + 1, 4).getValue();
				remarks = remarks2;
			} else {
				issCd = issCd + ','
						+ gridCheckIntm.cellById(i + 1, 3).getValue();
				premSeqNo = premSeqNo + ','
						+ gridCheckIntm.cellById(i + 1, 4).getValue();
				remarks = remarks + ',' + remarks2;
			}
		}
		return remarks;
	}

	$("btnUpdate").observe("click", function() {
		getParamsVal();
		new Ajax.Request(contextPath + '/UpdateRefNameController', {
			method : "POST",
			parameters : {
				action : "saveRemarks",
				remarksArray : remarks.toUpperCase(),
				premSeqNoArray : premSeqNo,
				issCdArray : issCd.toUpperCase(),
			},
			onCreate : showNotice("Please wait..."),
			onComplete : function(response) {
				hideNotice("");
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


