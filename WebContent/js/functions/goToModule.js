function goToModule(div,url,loadingMsg,title){
	new Ajax.Updater(div,url,{
		method:"POST",
		evalScripts:true,
		asynchronous: true,
		onCreate: showNotice(loadingMsg),
		onComplete: function () {
			//if going to main page, refresh, bec. of js error
			if(url.match(/main/g) == 'main'){
				location.reload();
			}
			hideNotice("");
			//$("underwritingMainMenu").hide();
			//$("parMenu").hide();
			//$("parListingMenu").show();
			//initializeMenu();
			Effect.Appear($(div).down("div", 0), {
				duration: .001
			});
			setDocumentTitle(title);
		}
	});
}