<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>

<div id="Menu">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="btnExit">Exit</a></li>
			</ul>
		</div>
	</div>
</div>

<!-- hidden fields -->
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<input type="hidden" id="page" name="page" value="${page}">
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		 <label id="pageTitle">Inquiry - Metrobank Referror</label>
	</div>
</div>
<div id="inquiryMetrobankDetailsDiv">
	<div id="inquiryMetrobankSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
		<div class="sectionDiv" id="inquiryMetrobankMainDiv"
			style="width: 90%; margin-top: 40px; margin-left: 45px; margin-bottom: 50px;">
			<div class="sectionDiv" id="individualDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
				<table style="margin-top: 10px; width: 100%;">
					<tr>
						<td class="rightAligned" style="width: 25%;">Employee ID</td>
						<td class="leftAligned">
						<input id="txtEmpId1" class="leftAligned" type="text" name="capsField"
							style="width: 7%;" value="" title="Employee Id" maxlength="2" /> - 
						<input id="txtEmpId2" class="leftAligned" type="text" name="capsField"
								style="width: 20%;" value="" title="Employee Id"
								maxlength="5" />
						<span> <img
								src="${pageContext.request.contextPath}/images/misc/searchIcon.png"
								id="searchForEmployee" name="searchForEmployee" alt="Go"
								style="margin-top: 2px;" title="Search Employee" />
						</span>
						</td>
					</tr>
				</table>
				<div id="infoDiv" name="infoDiv"
					style="width: 100%; text-align: center;">
					<table style="margin-top: 10px; width: 100%;">
							<tr>
								<td class="rightAligned" style="width: 25%;">Last Name</td>
								<td colspan="3" class="leftAligned"> <input id="txtlastName"
									name="capsField" class="leftAligned" type="text"
									style="width: 35%;" value="" title="Last Name" disabled /> <input id="txtFistName"
									name="capsField" class="leftAligned" type="text"
									style="width: 28%;" value="" title="First Name" disabled /> <input id="txtMiddleName"
									name="capsField" class="leftAligned" type="text"
									style="width: 25%;" value="" title="Middle Name" disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">SSS No.</td>
								<td class="leftAligned"><input id="txtSSSNo"
									name="capsField" class="leftAligned" type="text"
									style="width: 80%;" value="" title="SSS No." disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">TIN</td>
								<td class="leftAligned"><input id="txtTIN"
									name="capsField" class="leftAligned" type="text"
									style="width: 80%;" value="" title="TIN No." disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">Employee Type</td>
								<td class="leftAligned"><input id="txtEmployeeType"
									name="capsField" class="leftAligned" type="text"
									style="width: 80%;" value="" title="Employee Type" disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">Employee Class</td>
								<td class="leftAligned"><input id="txtEmployeeClass"
									name="capsField" class="leftAligned" type="text"
									style="width: 80%;" value="" title="Employee Class" disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">Position</td>
								<td class="leftAligned"><input id="txtPosition"
									name="capsField" class="leftAligned" type="text"
									style="width: 80%;" value="" title="Position" disabled /></td>
							</tr>
							<tr>
								<td class="rightAligned" style="width: 25%;">Ref. Code</td>
								<td class="leftAligned"><input id="txtRefCode"
									name="capsField" class="leftAligned" type="text"
									style="width: 80%;" value="" title="Reference Code" disabled /></td>
							</tr>
					</table>
				</div>

			
			<div class="sectionDiv" id="printDiv"
				style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
				<div id="inquiryMetrobankButtonsDiv" align="center">
					<input type="button" class="button" style="width: 90px;"
						id="btnCancel" value="Exit">
				</div>
			</div>
		</div>
	</div>
</div>
</div>


<script type="text/javascript">
	makeAllInputFieldsUpperCase();
	
	$("searchForEmployee").observe("click",function(){
		var txtEmpId1 = $F("txtEmpId1").trim();
		var txtEmpId2 = $F("txtEmpId2").trim();
		
		if(validateInput(txtEmpId1,txtEmpId2)){
			new Ajax.Updater(
					'infoDiv',
					contextPath
							+ '/InquiryMetrobankController',
					{
						evalScripts : true,
						method : "POST",
						parameters : {
							action : "getEmployee",
							employeeId1 : txtEmpId1,
							employeeId2 : txtEmpId2
						},
						onCreate : showNotice("Fetching Details. Please wait..."),
						onComplete : function(response) {
							hideNotice("");
						}
					});
		}
	});
	
	$("btnExit").observe(
			"click",
			function() {
				goToModule(divToUpdate, contextPath + "/pages/main.jsp",
						"Please wait.....", "Home");
			});
	
	$("btnCancel").observe(
			"click",
			function() {
				goToModule(divToUpdate, contextPath + "/pages/main.jsp",
						"Please wait.....", "Home");
			});
	
	function validateInput(txtEmpId1,txtEmpId2){
		if (checkBlankNull(txtEmpId1) || checkBlankNull(txtEmpId2)){
			showMessageBox("Please input required fields", "I");
			return false;
		}else
			return true;
	}
	
	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}
</script>
