<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>
<br>
<br>
<div align="center">
	<form action="print">
		<table>
			<tr>
				<td><a>REPORT NAME:</a></td>
				<td><input type="text" id="reportName" name="reportName"></td>
			</tr>
			<!-- <tr>
				<td><a>DIRECTORY: </a></td>
				<td><input type="text" id="directory" name="directory"></td>
			</tr> -->
			<tr>
				<td><a>SAMPLE TEXT: </a></td>
				<td><input type="text" id="paramTxt" name="paramTxt"></td>
			</tr>
		</table>
		<input type="button" id="printBtn" name="printBtn" value="PRINT" />
	</form>
</div>
<script type="text/javascript">

	var reportLink = "http://localhost:2010/GeniisysAdHocReports/";
	//var reportName =  $("reportName").val().trim();
	
	
	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
	$("printBtn").observe("click", function() {
		var reportName =$F("reportName");
		new Ajax.Updater("adHocReportsDiv", contextPath + "/print", {
			evalScripts : true,
			parameters : {
				reportName : $F("reportName"),
				/* directory : $F("directory"), */
				paramTxt : $F("paramTxt")
			},
			onComplete: function(response){
				//alert(response);
				/* window.open('C:\\Users\\geviray\\Desktop\\ralph\\reports\\gipi_polbasic.pdf','_blank'); */
				window.open(reportLink + reportName + '.pdf','_blank',strWindowFeatures);
			}
		});
	});
</script>