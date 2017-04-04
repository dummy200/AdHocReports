function runTimer(){
	if($("dateAndTime")){
		try {
			$("dateAndTime").update("Server Time: " + serverDate.format());
		} catch (e) {
		}
		serverDate.add(1).seconds();
		var t = setTimeout('runTimer()', 1000);
	}
}