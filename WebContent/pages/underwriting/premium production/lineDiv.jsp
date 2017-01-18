<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<div id="lineDiv">
<input type="hidden" id="selectedLineCd" name="selectedLineCd" value="${lineCd}">
<input type="hidden" id="sublineList" name="sublineList"
	value='${sublineList}'>

<input type="hidden" id="lineCdList" name="lineCdList"
	value='${lineList}'>

<table style="width: 100%;">
<tr>
							<td class="rightAligned" style="width: 25%;">Line</td>
							<td class="leftAligned"><select name="selLine" id="selLine"
								style="width: 100%;">
									<option value=""></option>
									<c:forEach var="line" items="${ lineList }">
										<option value="${line.lineCd}">${line.lineName}</option>
									</c:forEach>
							</select>
							<!-- <input id="txtLineCd" name="capsField"
								class="leftAligned" type="hidden" /> --></td>
						</tr>
<tr>
<tr>
							<td class="rightAligned" style="width: 25%;">Subline</td>
							<td class="leftAligned"><select name="selSubline" id="selSubline"
								style="width: 100%;">
									<option value=""></option>
									<c:forEach var="subline" items="${ sublineList }">
										<option value="${subline.sublineCd}">${subline.sublineName}</option>
									</c:forEach>
							</select>
							<input id="txtLineCd" name="capsField"
								class="leftAligned" type="hidden" /></td>
						</tr>
<tr>
</table>
</div>
<script>
$("selLine").observe("change", function(){
	var selected = $("selLine").getValue();
	getSublineList(selected);
});

$("selLineOnly").observe("change", function(){
	var selected = $("selLineOnly").getValue();
	getSublineList2(selected);
});

function getSublineList(val){
	new Ajax.Updater(
			"lineDiv",
			contextPath + "/PremProductionController",
			{
				evalScripts : true,
				method : "POST",
				parameters : {
					action : "getSublineList",
					lineCd : val,
					tranCd : '98',
					userId : userId
				},
				onComplete : function(response) {
					hideNotice("");
					$("selLine").value = val;
					$("selLineOnly").value = val;
				}
			}); 
}

function getSublineList2(val){
	new Ajax.Updater(
			"lineDiv",
			contextPath + "/PremProductionController",
			{
				evalScripts : true,
				method : "POST",
				parameters : {
					action : "getSublineList",
					lineCd : val,
					tranCd : '98',
					userId : userId
				},
				onComplete : function(response) {
					hideNotice("");
					$("selLine").value = val;
				}
			}); 
}
</script>
