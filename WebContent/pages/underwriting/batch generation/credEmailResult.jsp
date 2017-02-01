<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	
<div id="credEmailResultDiv">
<input type="text" id="credEmailList" name="credEmailList" value="${credEmailList}">
<input type="text" id="branchCode" name="branchCode" value="${branchCode}">
<input type="text" id="credEmailCount" name="credEmailCount" value="${credEmailCount}">
<c:forEach var='email' items='${credEmailList}' varStatus='loop'>
<input type='text' id='txtEmail' value='${email.emailAdd}' style='width:100%;'>
<input type='checkbox' id='chkEmail' value='${email.primarySw}' style='width:100%;' <c:if test="${email.primarySw eq 1}">checked</c:if>>

</c:forEach>
</div>
<script>
var emailList = $F("credEmailList");
var branchCd = $F("branchCode");
var credEmailCount = $F("credEmailCount");
var oldTxtVal = '';
var oldChkVal = '';
showCreditingBranchModal($F("branchCode"));

//custom messagebox
function showCreditingBranchModal(branchCode){
	//alert($F("credEmailCount"));
	var message = "";
   /* var message = "<table style='width:250px; margin-left:20px'>"+
					"<tr>"+
						"<th>"+
							"Email Address"+
						"</th>"+
						"<th>"+
							"P"+
						"</th>"+
					"</tr>"+
					"<c:forEach var='email' items='${credEmailList}' varStatus='loop'>"+
					"<tr>"+
						"<td>"+
							"<input type='hidden' id='${loop.index}' value='${loop.index}'>"+
							"<input type='text' id='txtEmail' value='${email.emailAdd}' style='width:100%;'>"+
						"</td>"+
						"<td>"+
							"<input type='checkbox' id='chkEmail' name='chkPdfSw' style='width:100%;'"+
							"<c:if test='${email.primarySw eq 1}'>checked</c:if>"+
							">"+
						"</td>"+
					"</tr>"+
					"</c:forEach>"+
					"<tr id='extraTr'>"+
						"<td>"+
							"<input type='text' id='extraEmail' style='width:100%;'>"+
						"</td>"+
						"<td>"+
							"<input type='checkbox' name='chkPdfSw' id='extraChkPdfSw'>"+
						"</td>"+
					"</tr>"+
				"</table>"; */
		var oldEmail = ''
		var oldChk = '';
		if(emailList != '[]'){
			message = "<table style='width:250px; margin-left:20px'>"+
			"<tr>"+
				"<th>"+
					"Email Address"+
				"</th>"+
				"<th>"+
					"P"+
				"</th>"+
			"</tr>"+
			"<c:forEach var='email' items='${credEmailList}' varStatus='loop'>"+
			"<tr>"+
				"<td>"+
					"<input type='hidden' id='${loop.index}' value='${loop.index}'>"+
					"<input type='text' id='txtEmail' value='${email.emailAdd}' style='width:100%;'>"+
				"</td>"+
				"<td>"+
					"<input type='checkbox' id='chkEmail' name='chkPdfSw' style='width:100%;'"+
					"<c:if test='${email.primarySw eq 1}'>checked</c:if>"+
					">"+
				"</td>"+
			"</tr>"+
			"</c:forEach>"+
		"</table>";
			oldEmail = $F("txtEmail");
			if($F("chkEmail") == '1'){
				oldChk = 'on';	
			}
		}else{
			message = "<table style='width:250px; margin-left:20px'>"+
			"<tr>"+
				"<th>"+
					"Email Address"+
				"</th>"+
				"<th>"+
					"P"+
				"</th>"+
			"</tr>"+
			"<tr id='extraTr'>"+
				"<td>"+
					"<input type='text' id='extraEmail' style='width:100%;'>"+
				"</td>"+
				"<td>"+
					"<input type='checkbox' name='chkPdfSw' id='extraChkPdfSw' style='width:100%;'>"+
				"</td>"+
			"</tr>"+
		"</table>"; 
		}
		Dialog.alert("<div style='margin-top: 5px; float: left; width: 100%'>" +
		 	   "<span style='float: left; padding: 5px 8px 8px 8px; width: 10%; height: 50px;'>"+
	     		message+
	    		 "</div>", {
		title: "Crediting Branch Email",
		okLabel: "Return",
		onOk: function () {
			if(emailList != '[]'){
				var email = $F("chkEmail");
				if(email == null){
					email = '';
				}
				if(oldEmail != $F("txtEmail") || oldChk != $F("chkEmail")){
					if(!checkBlankNull($F("txtEmail")))
						updateEmailValues(branchCd,$F("txtEmail"),$F("chkEmail"),oldEmail);
				}
				
				/* if(!checkBlankNull($F("extraEmail"))){
					insertEmailValues(branchCd,$F("extraEmail"),$F("extraChkPdfSw"));
				} */
			}else{
				if(!checkBlankNull($F("extraEmail"))){
					insertEmailValues(branchCd,$F("extraEmail"),$F("extraChkPdfSw"));
				}
			}
			showMBox = "N";
			showNoticeSw = "Y"; 
			$$("div[name='notice']").invoke("hide");
			Dialog.closeInfo();
		},
		className: "alphacube", /*options: "",*/
		width: 320,
		buttonClass: "button",
		draggable: true,
		onShow:	function(){$("btnMsgBoxOk").focus();} // andrew - 10.21.2011 - to set focus on button after showing message 
		});
	}
	
	function updateEmailValues(branchCd,newTxt,newChkEmail,oldEmail){
			new Ajax.Request(
					//"mainContents",
					contextPath + "/BatchGenerationController",
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "updateCreditingEmail",
							credBranchCd : branchCd,
							emailAdd : newTxt,
							primarySw : newChkEmail,
							oldEmail : oldEmail
						},
						onCreate : showNotice("Updating data. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
						}
					});
	}
	
	function insertEmailValues(branchCd,extraEmail,extraChkPdfSw){
		new Ajax.Request(
				//"mainContents",
				contextPath + "/BatchGenerationController",
				{
					evalScripts : true,
					method : "POST",
					parameters : {
						action : "insertCreditingEmail",
						credBranchCd : branchCd,
						extraEmail : extraEmail,
						extraPrimarySw : extraChkPdfSw
					},
					onCreate : showNotice("Updating data. Please wait..."),
					onComplete : function(response) {
						hideNotice("");
					}
				});
}
	//fail: used to make checkbox function as radio button.
	/* $$("input[name='chkPdfSw']").each(function(chk) {
		chk.observe("click", function() {
			var id = chk.id;
			$$("input[name='chkPdfSw']").each(function(chk2) {
				chk2.writeAttribute("checked", false);
			});
			$(id).writeAttribute("checked", true);
		});
	}); */
</script>