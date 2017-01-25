<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<script>
var gridSubline;
</script>

<div id="menuDiv">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="btnExit">Exit</a></li>
			</ul>
		</div>
	</div>
</div>


<!-- hidden fields -->
<input type="hidden" id="page" name="page" value="${page}">
<input type="hidden" id="lineCd" name="lineCd" value="${lineCd}">
<input type="hidden" id="errorMsg" name="errorMsg" value="${errorMsg}">
<input type="hidden" id="userId" name="userId" value="${adhocUser}">
<input type="hidden" id="reportTitle" name="reportTitle"
	value="${reportTitle}">
<input type="hidden" id="reportName" name="reportName"
	value="${reportName}">
<input type="hidden" id="reportUrl" name="reportUrl"
	value="${reportUrl}">
<input type="hidden" id="selDestination" name="selDestination"
	value="screen">
<input type="hidden" id="branchList" name="branchList"
	value='${branchList}'>
<input type="hidden" id="lineCdList" name="lineCdList"
	value='${lineCdList}'>
<input type="hidden" id="tariffList" name="tariffList"
	value='${tariffList}'>

<%-- <input type="text" id="letterType" name= "letterType" value = "${letterType}"> --%>
<!-- end hidden fields -->

<br />
<br />
<div id="outerDiv" name="outerDiv">
	<div id="innerDiv" name="outerDiv">
		<label id="pageTitle">Batch Generation of Policy through PDF Maintenance</label>
	</div>
</div>
<div id="batchGenDetailsDiv">
	<div id="batchGenSectionDiv" class="sectionDiv"
		style="margin-bottom: 10px;">
	<table>
		<tr>
			<td>
				<!-- <div id="sublineDiv" style="width: 450px; height: 270px; overflow:hidden"></div> -->
				<jsp:include page="/pages/underwriting/batch generation/sublineDiv.jsp"></jsp:include>
			</td>
			<td rowspan="2">
				<div id="gridbox2" style="width: 450px; height: 595px; overflow:hidden"></div>
			</td>
		</tr>
		<tr>
			<td>
			<div id="gridbox3" style="width: 450px; height: 270px; overflow:hidden"></div>
			</td>
		</tr>
		<!-- <tr>
			<td>
				<div id="gridbox4" style="width:100%; height:400px; background-color:white;overflow:hidden"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div id="recinfoArea"></div>
			</td>
		</tr> -->
	</table>
	
	<!-- <input type="button" class="button" style="width: 90px;" id="btnCheckAllIntm" value="CheckAll">
	<input type="button" class="button" style="width: 90px;" id="btnUncheckAllIntm" value="UncheckAll"> -->
	<div id="bottomCheckBox">
		<table>
			<tr>
				<td style="float: right; margin-left: 300px;">
					All Issue Source: <input type="checkbox" id="checkIntm" name="checkIntm" value="">
				</td>
				<td rowspan="2">
					All Tariff: <input type="checkbox" id="checkTariff" name="checkTariff" value="">
				</td>
			</tr>
			<tr>
				<td style="float: right; margin-left: 300px;">
					All Crediting Branch: <input type="checkbox" id="checkCred" name="checkCred" value="">
				</td>
			</tr>
		</table>
	</div>
	
	<br />
				<div class="sectionDiv" id="printDiv"
					style="width: 97%; margin-left: 8px; margin-top: 9px; float: left; border-color: white;">
					<div id="printofferLetterButtonsDiv" align="center">
						<input type="button" class="button" style="width: 90px;"
							id="btnCancel" value="Cancel"> <input type="button"
							class="button" style="width: 90px;" id="btnSave" value="Save">
					</div>
				</div>
	</div>
</div>

<script type="text/javascript">

var gridBranch, gridTariff;
var linCdList = $F("lineCdList");
var sublineCdList = $F("sublineCdList");
var branchList = $F("branchList");
var tariffList = $F("tariffList");
/* var data={ rows: [
	          { id:1, data: ["HO", "John Grisham",false,true]},
	          { id:2, data: ["HO", "Stephen King",false,true]},
	          { id:3, data: ["HO", "John Grisham",false,true]},
	          { id:4, data: ["HO", "Stephen King",false,true]},
	          { id:5, data: ["HO", "John Grisham",false,true]},
	          { id:6, data: ["HO", "Stephen King",false,true]},
	          { id:7, data: ["HO", "John Grisham",false,true]},
	          { id:8, data: ["HO", "Stephen King",false,true]},
	          { id:9, data: ["HO", "John Grisham",false,true]},
	          { id:10, data: ["HO", "Stephen King",false,true]},
	          { id:11, data: ["HO", "John Grisham",false,true]}
	      ]
	  };  */
	  
	var imgPath = contextPath + '/css/codebase/imgs/';
	gridBranch = new dhtmlXGridObject('gridbox3');
	gridBranch.setImagePath(imgPath);
	gridBranch.setHeader("Branch code, Branch Name,I,C");
	gridBranch.setInitWidths("100,*,25,25");
	gridBranch.setColAlign("left,left,left,left");
	gridBranch.setColTypes("ro,ro,ch,ch");
	gridBranch.setColSorting("str,str,str,str");
	gridBranch.init();
	gridBranch.parse(branchList,"json");
	//
	gridTariff = new dhtmlXGridObject('gridbox2');
	gridTariff.setImagePath(imgPath);
	gridTariff.setHeader("Tariff Code, Tariff Name, PDF");
	gridTariff.setInitWidths("100,*,30");
	gridTariff.setColAlign("left,left,left");
	gridTariff.setColTypes("ro,ro,ch");
	gridTariff.setColSorting("str,str,str");
	gridTariff.init();
	gridTariff.parse(tariffList,"json");
	
/* 	gridTariff = new dhtmlXGridObject('gridbox4');
	gridTariff.selMultiRows = true;
	gridTariff.setImagePath(imgPath);
	gridTariff.setHeader("Tariff Code, Tariff Name, PDF");
	gridTariff.setInitWidths("100,*,30");
	gridTariff.setColAlign("left,left,left");
	gridTariff.setColTypes("ro,ro,ch");
	gridTariff.setColSorting("str,str,str");
	
	gridTariff.enablePaging(true,10,3,"recinfoArea");
	gridTariff.setPagingSkin("toolbar");
	gridTariff.enableAutoWidth(true);
	gridTariff.enableAutoHeight(true);
	gridTariff.init();
	gridTariff.parse(tariffList,"json"); */

	var all = gridBranch.getAllItemIds();
	
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
	
	/* $("btnCheckAllIntm").observe("click",function(){
		for (var i=0; i<gridBranch.getRowsNum(); i++){
			gridBranch.cellById(i+1,2).setValue("1");
		}
	});
	
	$("btnUncheckAllIntm").observe("click",function(){
		for (var i=0; i<gridBranch.getRowsNum(); i++){
			gridBranch.cellById(i+1,2).setValue("0");
		}
	}); */
	
	//manage checkboxes
	var isCheckedIntm = 1;
	$('checkIntm').observe('click', function(e) {
		toggleIntm();
    });
	
	function toggleIntm(){
		if(isCheckedIntm == 1){
			for (var i=0; i<gridBranch.getRowsNum(); i++){
				gridBranch.cellById(i+1,2).setValue("1");
			}
			isCheckedIntm = 2;
		}else{
			for (var i=0; i<gridBranch.getRowsNum(); i++){
				gridBranch.cellById(i+1,2).setValue("0");
			}
			isCheckedIntm = 1;
		}
	}
	
	var isCheckedCred = 1;
	$('checkCred').observe('click', function(e) {
		toggleCred();
    });
	
	function toggleCred(){
		if(isCheckedCred == 1){
			for (var i=0; i<gridBranch.getRowsNum(); i++){
				gridBranch.cellById(i+1,3).setValue("1");
			}
			isCheckedCred = 2;
		}else{
			for (var i=0; i<gridBranch.getRowsNum(); i++){
				gridBranch.cellById(i+1,3).setValue("0");
			}
			isCheckedCred = 1;
		}
	}
	
	var isCheckedTariff = 1;
	$('checkTariff').observe('click', function(e) {
		toggleTariff();
    });
	
	function toggleTariff(){
		if(isCheckedTariff == 1){
			for (var i=0; i<gridTariff.getRowsNum(); i++){
				gridTariff.cellById(i+1,2).setValue("1");
			}
			isCheckedTariff = 2;
		}else{
			for (var i=0; i<gridTariff.getRowsNum(); i++){
				gridTariff.cellById(i+1,2).setValue("0");
			}
			isCheckedTariff = 1;
		}
	}
	
	
	$("btnSave").observe("click",function(){
		var issCdVal = '';
		var intmVal = '';
		var credVal = '';
		
		var tariffCd = '';
		var tariffPdfVal = '';
		
		var sublineCd = '';
		var sublinePdfVal = '';
		
		var lineCd = $F("seLLineCd");
		
		//fail: detects only changes on mouse click not event by button
		//var changedRowsId = gridBranch.getChangedRows();
		//var str_array = changedRowsId.split(',');
		
		//for(var i = 0; i < str_array.length; i++) {
		//	   str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
		//	   alert(str_array[i]);
		//	   issCdVal = issCdVal + ',' + gridBranch.cellById(str_array[i], 0).getValue();
		//	   intmVal = intmVal + ',' + gridBranch.cellById(str_array[i], 2).getValue(); 
		//	   credVal = credVal + ',' + gridBranch.cellById(str_array[i], 3).getValue();
		//	}
		
		
		//ok: detects both changes, from mouse click & using event by button
		//but selects all.... =.=
		for (var i=0; i<gridBranch.getRowsNum(); i++){
			issCdVal = issCdVal + ',' + gridBranch.cellById(i+1, 0).getValue();
		    intmVal = intmVal + ',' + gridBranch.cellById(i+1, 2).getValue(); //i-index of a column (zero-based numbering)
		    credVal = credVal + ',' + gridBranch.cellById(i+1, 3).getValue(); 
		}
		
		for (var i=0; i<gridTariff.getRowsNum(); i++){
			tariffCd = tariffCd + ',' + gridTariff.cellById(i+1, 0).getValue();
			tariffPdfVal = tariffPdfVal + ',' + gridTariff.cellById(i+1, 2).getValue(); 
		}
		
		for (var i=0; i<gridSubline.getRowsNum(); i++){
			sublineCd = sublineCd + ',' + gridSubline.cellById(i+1, 0).getValue();
			sublinePdfVal = sublinePdfVal + ',' + gridSubline.cellById(i+1, 2).getValue(); 
		}
		
		
		 new Ajax.Updater(
				"mainContents",
				contextPath + "/BatchGenerationController",
				{
					evalScripts : true,
					method : "POST",
					parameters : {
						action : "saveChanges",
						issCdArray : issCdVal.substring(1),
						intmValArray : intmVal.substring(1),
						credValArray : credVal.substring(1),
						tariffCdArray : tariffCd.substring(1),
						tariffPdfValArray : tariffPdfVal.substring(1),
						sublineCdArray : sublineCd.substring(1),
						sublinePdfValArray : sublinePdfVal.substring(1),
						lineCd : lineCd,
						userId : $F("userId")
					},
					onCreate : showNotice("Saving changes. Please wait..."),
					onComplete : function(response) {
						if(checkBlankNull($F("errorMsg"))){
						showMessageBox(
								"Saving changes successful!",
								"I");
						}else
							showMessageBox($F("errorMsg"),"E");
					}
				});  
				
		//alert(issCdVal.substring(1) + "\n" + intmVal.substring(1) + "\n"+ credVal.substring(1));
		
			//var issCdArray = splitString(issCdVal.substring(1),',');
			/* issCdArray.forEach(function(i) {
		   	 	alert(i);
			}); */
	});
	
	/* function splitString(stringToSplit, separator) {
		  var arrayOfStrings = stringToSplit.split(separator);
		  return arrayOfStrings;
		} */


	function printOutputPdf() {
		var reportUrl = $F("reportUrl");
		var reportTitle = $F("reportTitle");
		var errorMsg = $F("errorMsg");
		if (!checkBlankNull(errorMsg)) {
			hideNotice("");
			showMessageBox(errorMsg, "E");
		} else {
			var content = contextPath
					+ "/OutputController?action=showPdf&reportUrl=" + reportUrl;
			new Ajax.Request(contextPath + "/GIISUserController", {
				action : "POST",
				asynchronous : false,
				parameters : {
					action : "setReportParamsToSession",
					reportUrl : content,
					reportTitle : $F("reportTitle")
				},
				onComplete : function(response) {
					window.open('pages/report.jsp', '',strWindowFeatures);
							//'location=0, toolbar=0, menubar=0, fullscreen=1');
					hideNotice("");
				}
			});
		}
	}
	
	function compareDate(fromDate, toDate) {
		var date1 = new Date(fromDate);
		var date2 = new Date(toDate);
		if (date1.getTime() > date2.getTime()) {
			return true
		}else
			return false;
	}

	function checkBlankNull(str) {
		if (str == '' || str == null)
			return true;
		return false;
	}           
</script>
