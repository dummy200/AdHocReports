function goToPage(button, url, msg, pageTitle) {
/*	if (button == 'checkRequest') {
		$(menu).observe("click", function() {
			new Ajax.Request(// "blankDiv1",
			contextPath + url, {
				method : "GET",
				evalScripts : true,
				asynchronous : true,
				onCreate : showNotice("Please wait....."),
				onComplete : function(response) {
					hideNotice("");
				}
			});
		});
	} else {*/
		$(button).observe("click", function() {
			goToModule(divToUpdate, contextPath + url, msg, pageTitle);
		});
	/*}*/
}