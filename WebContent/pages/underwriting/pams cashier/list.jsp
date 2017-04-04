<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id = "userDiv">
   <table style="margin-top: 10px; width: 100%;">
      <tr>
        <td class="rightAligned">Branch</td>
              <!-- <td class="leftAligned">
              	<input id="txtLineCd" class="leftAligned upper" type="text" name="capsField" style="width: 80%;" value="" title="Line Code" />
              </td> -->
              <td class="leftAligned"><select name="txtBranchCd" id="txtBranchCd"
              	style="width: 80%;">
              		<option value=""></option>
                      <c:forEach var="branch" items="${ cashierBranchList }">
              			<option value="${branch.issCd}">${branch.issCd} - ${branch.issName}</option>
                   </c:forEach>
              </select>
         </td>
        </tr>
     </table>
</div>

 