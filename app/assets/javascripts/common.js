

/**
 * Delay an event which fires repeatedly.
 */
var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

$(window).resize(function() {
		delay(function(){		
			bg();	
		}, 200);
	});

$(document).ready(function() {
	
	$("a.scroll").click(function() {
	
		var path = $(this).attr("id").split("_")[1];			
		scrolling(path);
	
	});
	
	bg();
	
	$(".alert").slideDown();
	$("[id$='flash_']").slideDown();
	$("div.error_messages").slideDown();
	
	delay(function() { $(".alert").slideUp(); $("[id$='flash_']").slideUp(); $("div.error_messages").slideUp(); }, 6000);
		
});

function bg()
{

	var margin = ($(window).width() - 940) / 2.0;	
	var rightnavwidth = 531; //$("#rightnav").width();
	$("#navback").css("width", (margin + rightnavwidth) + "px");
	
	if($("body").height() < $(window).height())
	{
		var offset = $(window).height() - $("body").height() + $("#footer").height();
		$("#footer").css("height", offset + "px");
	}
	
}


function limitText(limitField, limitCount, limitNum) {
	if (limitField.value.length > limitNum) {
		limitField.value = limitField.value.substring(0, limitNum);
	} else {
		limitCount.value = limitNum - limitField.value.length;
	}
}

function scrolling(id)
{
	$("html,body").animate({scrollTop: $("#" + id).offset().top - 60}, 1000);
}