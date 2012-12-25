
$(document).ready(function(event) {
	
	var modal = $("div.participation-modal");
	var overlay = $("div.participation-overlay");
	var overlayClose = $("div.participation-overlay button.close");
	var iframe = $("div.participation-overlay iframe");

	overlayClose.click(function() { modal.fadeOut(); overlay.fadeOut(); iframe.attr("src", ""); });
	
	modal.click(function(event) { modal.fadeOut(); overlay.fadeOut(); iframe.attr("src", ""); });
	
	$("div.follow").click(function(event) {
	
		modal.show();
		overlay.fadeIn();
		var id = $(this).attr("id").split("-");
		var clicked = $("iframe#v-" + id[1]);
		var vid = clicked.attr("src");		
		iframe.attr("src", vid);
		
	});

});
