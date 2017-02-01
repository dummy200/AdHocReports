<jsp:useBean id="today" class="java.util.Date" />
<%
	response.setHeader("Cache-control", "No-Cache");
	response.setHeader("Pragma", "No-Cache");
%>
<script language="Javascript">
	var contextPath = "${pageContext.request.contextPath}";
	var calendarImg = contextPath+"/images/misc/but_calendar.gif";
	var userId = "${PARAMETERS['USER'].userId}"; // andrew - 09.30.2011
	var imgMessage = new Object();
	imgMessage.ERROR = "error";
	imgMessage.WARNING = "warning";
	imgMessage.INFO = "info";
	imgMessage.SUCCESS = "success";
	var changeTag = 0;
	var changeTagFunc = "";
	var mainContainerWidth = 921;
	var oldFormContent = "";
	var newFormContent = "";
	var passwordExpiry = "";
	//var userId = "";
	var newUserTag = 0;
	var daysBeforePasswordExpires = 0;
	var resultMessageDelimiter = "-*|@geniisys@|*-";
	var modules = null;
	var strWindowFeatures = "directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,resizable=yes,fullscreen=yes";
</script>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/misc/geniisys.ico" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>

<!-- JS Files -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/scriptaculous.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/builder.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/controls.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/dragdrop.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/effects.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/slider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/sound.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/unittest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/modalbox.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/deployJava.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/dialog.js"></script>

<!-- mtg test -->
<!-- <script type="text/javascript" src="scripts/lib/prototype.js"></script> -->
<!--<script type="text/javascript" src="scripts/lib/scriptaculous.js"></script>-->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/my_ui/myui/myui.js"></script> --%>
<%-- <link type="text/css" href="${pageContext.request.contextPath}/css/my_ui/main.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/css/my_ui/myui/myui.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/css/my_ui/myui/TextField.css" rel="stylesheet">	
<link type="text/css" href="${pageContext.request.contextPath}/css/my_ui/myui/DatePicker.css" rel="stylesheet">	
<link type="text/css" href="${pageContext.request.contextPath}/css/my_ui/myui/ToolTip.css" rel="stylesheet">	
<link type="text/css" href="${pageContext.request.contextPath}/css/my_ui/myui/Autocompleter.css" rel="stylesheet">	
<link type="text/css" href="${pageContext.request.contextPath}/css/my_ui/myui/ToolTip.css" rel="stylesheet">	
<link type="text/css" href="${pageContext.request.contextPath}/css/my_ui/myui/DatePicker.css" rel="stylesheet">	
<link type="text/css" href="${pageContext.request.contextPath}/css/my_ui/myui/tablegrid.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/my_ui/myui/TableGrid.js"></script> --%>

 <!-- LIGHTBOX by whofeih -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/lightwindow.js"></script> --%>
<!-- PWC by Whofeih -->
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/window.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/window_effects.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/windowCalls.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/window.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/window_effects.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/windowCalls.js"></script>
<%-- <!--CALENDAR-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/calendar.js"></script> --%>
<!-- dropdowncontent -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/dropdowncontent.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/dateFormat.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/fieldValidator.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/ddsmoothmenu.js"></script>
<link id="menuCss" name="menuCss" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/color_theme/ddsmoothmenu-blue.css" />
<!-- date js sources -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/date.js"></script>
<!-- json js sources -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/passwordMeter.js"></script>
<!-- passwordMeter js sources -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/json.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/ajaxtags.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/mtg/mytablegrid.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/mtg/tablegrid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/mtg/calendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/mtg/controls.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/mtg/format.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/mtg/keytable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/mtg/textfield.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/overlay.js"></script> --%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/setDocumentTitle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/initializeTabs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/initializeAll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/initializeMenu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/makeAllInputFieldsUpperCase.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/makeInputFieldUpperCase.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/disableMenu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/enableMenu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/showNotice.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/hideNotice.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/showMessageBox.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/getIcon.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/observeGoToModule.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/observeAccessibleModule.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/getServerDateAndTime.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/runtimeDate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/runTimer.js"></script>
<script type="text/javascript">
	jQuery.noConflict();
</script>
<link type="text/css" href="${pageContext.request.contextPath}/css/mtg/mytablegrid.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/css/mtg/calendar.css" rel="stylesheet">

<!-- ralph -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/goToModule.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/checkBlankNull.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/goToPage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/outputToPDF.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/getUserAccess.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/getDBName.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/checkUserAccess.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/checkUserAccess3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/getUserName.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/nvl.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/showConfirmBox.js"></script>

<%-- <!-- datatabletest -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/third_party/jquery-1.12.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/third_party/jquery.dataTables.min.js"></script>
<link href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" /> --%>

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/functions/getNotedBy.js"></script> --%>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  <%-- <link href="${pageContext.request.contextPath}/css/jqueryUI/jquery-ui.css"
	rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/jqueryUI/jquery-ui.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/jqueryUI/jquery-ui.min.js"></script> --%>
  
<!-- policy issuance -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/policy_issuance/policyIssuance.js"></script> --%>

<!-- datepicker -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/codebase/dhtmlxcalendar.js"></script>
<link href="${pageContext.request.contextPath}/css/codebase/dhtmlxcalendar.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/codebase/fonts/font_roboto/roboto.css"
	rel="stylesheet" type="text/css" />
	
<!-- datagrid -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/codebase/dhtmlxgrid.js"></script>
<link href="${pageContext.request.contextPath}/css/codebase/dhtmlxgrid.css"
	rel="stylesheet" type="text/css" />
	
<!-- combobox -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/codebase/dhtmlxcombo.js"></script>
<link href="${pageContext.request.contextPath}/css/codebase/dhtmlxcombo.css"
	rel="stylesheet" type="text/css" />	

<script type="text/javascript" src="${pageContext.request.contextPath}/js/third_party/lightwindow.js"></script>
<link href="${pageContext.request.contextPath}/css/lightwindow.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${pageContext.request.contextPath}/css/themes/default.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/themes/darkX.css" rel="stylesheet" type="text/css" />	
<link href="${pageContext.request.contextPath}/css/themes/lighting.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/themes/mac_os_x.css" rel="stylesheet" type="text/css" />
<link id="alphacube" name="alphacube" href="${pageContext.request.contextPath}/css/themes/alphacube-darkblue.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modalbox.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" type="text/css" media="screen" />
	
