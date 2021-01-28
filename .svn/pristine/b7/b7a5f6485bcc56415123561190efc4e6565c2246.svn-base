var modalWindowRTF = {
	parent:"body",
	windowId:null,
	content:null,
	width:null,
	height:null,
	close:function()
	{
		$(".modal-window").remove();
		$(".modal-overlay").remove();
	},
	open:function()
	{
		var modal = "";
		modal += "<div class=\"modal-overlay\"></div>";
		modal += "<div id=\"" + this.windowId + "\" class=\"modal-window\" style=\"width:" + this.width + "px; height:" + this.height + "px; margin-top:-" + (this.height / 2) + "px; margin-left:-" + (this.width / 2) + "px;\"><table align=\"center\" width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td colspan=\"3\" align=\"left\"><p>This is to avoid coping HTML content and take the content as plain text, You can format the text once you get back to the actual form. Please paste inside the following box using the keyboard (Ctrl/Cmd+V) and hit Paste.</p></td></tr><tr><td colspan=\"3\" height=\"8\"></td></tr><tr><td colspan=\"3\" align=\"left\"><textarea id=\"teradescrtf\" name=\"teradescrtf\" rows=\"4\" cols=\"30\" ></textarea></td></tr><tr><td colspan=\"3\" height=\"8\"></td></tr><tr><td colspan=\"3\" align=\"right\" style=\"padding-right:20px;\"> <input type=\"button\" value=\"Paste\" id=\"pastebuttonRTF\" name=\"pastebuttonRTF\" class=\"window-paste\"  /><span style=\" padding-left:10px;\"><input type=\"button\" value=\"Cancel\" id=\"cancelbuttonRTF\" name=\"cancelbuttonRTF\" class=\"window-cancel\" /></span></td></tr></table>";	
		
		modal += "</div>";	

		$(this.parent).append(modal);
		
		$(".RT_PlainText").append(modal);
		
	$(".close-window").click(function(){modalWindowRTF.close();});
	$(".modal-overlay").click(function(){modalWindowRTF.close();});
	$(".window-paste").click(function(){

nicE = new nicEditors.findEditor('long_desc');
if(nicE.getContent()=='&nbsp;'){
nicE.setContent($('#teradescrtf').val().replace(/\n/g,"<br />"));
modalWindowRTF.close();
}
else{
nicE.setContent(nicE.getContent()+'<br />'+ $('#teradescrtf').val().replace(/\n/g,"<br />"));
modalWindowRTF.close();
}
	});
$(".window-cancel").click(function(){modalWindowRTF.close();});
		// TO RESTRICT CLOSE WHEN CLICKED ON BLURED AREA
	}

};