function checkUserAccess(userInput, obj, objLength) {
	var isExists = false;
	for (var i = 0, l = objLength; i < l; i++) {
		var userAcc = obj.userAccess[i].tranCd + " " + obj.userAccess[i].lineCd + " " + obj.userAccess[i].issCd;
		if (userInput == userAcc) {
			isExists = true;
		}
	}
	return isExists;
}

function checkUserAccess2(id, length, obj,menu,func,title){
	var isExists = false;
	for (var i = 0, l = length; i < l; i++) {
		var userAcc = obj.userModuleId[i];
		if (id == userAcc) {
			isExists = true;
			enableMenu(menu);
			if(menu=='checkRequest'){
				$(menu).observe("click", function() {
				new Ajax.Request(//"blankDiv1",
						contextPath + func,{
					method:"GET",
					evalScripts:true,
					asynchronous: true,
					onCreate: showNotice("Please wait....."),
					onComplete: function (response) {
						hideNotice("");
						$("blankDiv1").update(response.responseText);
					}
				});
				});
			}else
				goToPage(menu,func,"Please wait.....",title);
		}	
	}
	if(!isExists){
		disableMenu(menu);
	}
}

/*function checkUserAccess3(id, length, obj,menu,func,title){
	var isExists = false;
	for (var i = 0, l = length; i < l; i++) {
		var userAcc = obj.userModuleId[i];
		if (id.includes(userAcc + " ")) {
			isExists = true;
		}	
	}
	if(!isExists){
		disableMenu(menu);
	}else{
		enableMenu(menu);
		goToPage(menu,func,"Please wait.....",title);
	}
}*/

function checkUserTranCd(tranCd, objLength, tranCdObj) {
	var isExists = false;
	for (var i = 0, l = objLength; i < l; i++) {
		var userAcc = tranCdObj.userTranCd[i];
		if (tranCd == userAcc) {
			isExists = true;
		}
	}
	return isExists;
}

function checkUserLineCd(lineCd, objLength, lineCdObj) {
	var isExists = false;
	for (var i = 0, l = objLength; i < l; i++) {
		var userAcc = lineCdObj.userLineCd[i];
		if (lineCd == userAcc) {
			isExists = true;
			break;
		}
	}
	return isExists;
}

function checkUserIssCd(issCd, objLength, issCdObj) {
	var isExists = false;
	for (var i = 0, l = objLength; i < l; i++) {
		var userAcc = issCdObj.userIssCd[i];
		if (issCd == userAcc) {
			isExists = true;
		}
	}
	return isExists;
}

function checkUserModule(moduleId, moduleLength, moduleObj){
	var isExists = false;
	for (var i = 0, l = moduleLength; i < l; i++) {
		var userAcc = moduleObj.userModuleId[i];
		if (moduleId == userAcc) {
			isExists = true;
		}
	}
	return isExists;
}