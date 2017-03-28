<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id= "hiddenDiv">
	<input type="hidden" id="reportList" name="reportList"  value='${reportList}'>
	<input type="hidden" id="dateList" name="dateList"  value='${dateList}'>
	<input type="hidden" id="userId" name="userId" value="${adhocUser}">
	<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
	<input type="hidden" id="reportXls" name="reportXls" value="${reportXls}">
</div>

<div id="menuDiv">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="btnExit">Exit</a></li>
			</ul>
		</div>
	</div>
</div>
	
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Month End Production Reports</label>
	</div>
</div>	
<div class="sectionDiv"
	style="width: 97%; margin-left: 8px; margin-top: 9px; float: left;">
	<div class="sectionDiv">
		<table style="margin-top: 10px; width: 100%;">
			<tr>
				<td class="rightAligned" style="width: 5%;">For The Month
					<select name="selDate" id="selDate" style="width: 109px;">
									<option value=""></option>
									<c:forEach var="accounting" items="${dateList}">
										<option>${accounting.entryDate}</option>
									</c:forEach>
					</select>	
				</td>
			</tr>
		</table>
	</div>
	<div id="gridbox" style="width: 100%; height: 300px; overflow: hidden"
		align="center"></div>
	<div id="bottomCheckBox">
		<table>
			<tr>
				<td style="width: 100px;"></td>
				<td colspan = "5" style="width:100px;">
				&nbsp;
				</td>
				<td>
					All Reports: <input type="checkbox" id="checkReport" name="checkReport" value="">
				</td>
			</tr>
		</table>
	</div>
	<div id="printofferLetterButtonsDiv" align="center">
					<input type="button" class="button" style="width: 90px;"
						id="btnCancel" value="Cancel"> <input type="button"
						class="button" style="width: 90px;" id="btnPrint" value="Print">
	</div>
</div>	

	<script>
	var gridReport;
	var reportNames = '';
	var reportCategories = '';
	var imgPath = contextPath + '/css/codebase/imgs/';
	var reportList = $F("reportList");
	var checked;
	var dateParam = '';
	setTableGrid();
	
	function setTableGrid(){
		gridReport = new dhtmlXGridObject('gridbox');
		gridReport.setImagePath(imgPath);
		gridReport.setHeader(" C,Report No.,Category,Report Name");
		gridReport.setInitWidths("30,100,300,*");
		gridReport.setColAlign("center,center,left,left");
		gridReport.setColTypes("ch,ro,ro,ro");
		gridReport.setColSorting("str,str,str,str");	
		gridReport.init();
		gridReport.parse(reportList,"json");
	}

	//code for check All Reports
	var isCheckReport = 1;
	$('checkReport').observe('click', function(e) {
		toggleReportCheck();
    });
	
	function toggleReportCheck(){
		if(isCheckReport == 1){
			for (var i=0; i<gridReport.getRowsNum(); i++){
				gridReport.cellById(i+1,0).setValue("1");
			}
			isCheckReport = 2;
		}else{
			for (var i=0; i<gridReport.getRowsNum(); i++){
				gridReport.cellById(i+1,0).setValue("0");
			}
			isCheckReport = 1;
		}
	}
	
	 
	
	function getReportNames(checked){
		var str_array = checked.split(',');
		for(var i = 0; i < str_array.length; i++) {
		   // Trim the excess whitespace.
		   str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
		   if(reportNames == ''){
			   reportNames = gridReport.cellById(str_array[i], 3).getValue();
			   reportCategories = gridReport.cellById(str_array[i], 2).getValue();
		   }else{
			   reportNames = reportNames + ',' + gridReport.cellById(str_array[i], 3).getValue();
			   reportCategories = reportCategories + ',' + gridReport.cellById(str_array[i], 2).getValue();
		   }
			
		}
		console.log(reportNames);
		console.log(reportCategories);
	}
	
		$("btnPrint")
		.observe(
				"click",
				function() {
					dateParam = $F("selDate");
					checked = gridReport.getCheckedRows(0);
					if(checkBlankNull(checked) || checkBlankNull(dateParam) ){
						showMessageBox("Please select at least one report to print or check if date has been selected.","E");
					}else{
						getReportNames(checked);
			    			new Ajax.Request(
									contextPath + "/MonthEndProdReportController",
									{
										evalScripts : true,
										method : "POST",
										parameters : {
											action : "printReport",
											reportNameArray : reportNames,
											reportCatArray : reportCategories,
											date : dateParam, 
											//userId : 'BADZ'
											userId : $F("userId")
										},
									    onCreate : showNotice("Generating report. Please wait..."), 
										onComplete : function(response) {
											if(checkBlankNull($F("errorMsg"))){
													$("hiddenDiv").update(response.responseText);	
													var reportXls = $F("reportXls");
													console.log('reportXls: ' + reportXls)
													showMessageBox("Reports has been generated successfully","I");
												}else{
													showMessageBox($F("errorMsg"),"E");	
												}
												reportNames = '';
												reportCategories = '';
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
		
		function checkBlankNull(str) {
			if (str == '' || str == null)
				return true;
			return false;
		} 
	</script>			
	