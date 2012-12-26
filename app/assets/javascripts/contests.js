
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
		iframe.attr("id", "i-" + id[1]);
		iframe.attr("src", vid);
		$("div.rating-panel").attr("title", "Endorse this entry.");
		
		if($(this).attr("data-voted") == "true")
		{
			$("div.rating-panel").addClass("rated").attr("title", "You have already endorsed this entry.");
		}
		
	});
	
	$("div.rating-panel").click(function(event) {
	
		var contest_participation = iframe.attr("id").split("-")[1].split("_");
		var con = contest_participation[0];
		var par = contest_participation[1];
		
		$.post("/contests/" + con + "/ratings?video=" + par, {}, function() {}, "json");
		
		$("div.rating-panel").addClass("rated").attr("title", "You have already endorsed this entry.");
	
	});

});
