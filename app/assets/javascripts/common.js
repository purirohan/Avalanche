

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
	
	delay(function() { $(".alert").slideUp(); $("[id$='flash_']").slideUp(); }, 6000);
		
});

function bg()
{
	
	var left = ($(window).width() - 940) / 2.0;
	$(".inner").css("left", left + "px");
	
	var offset = $("#top").height() + $(".main").height() + $("#footer").height() + 25;
	$("#bottom").css("top", offset + "px");
	
	if(offset > $(window).height())
	{
		$("#footer").addClass("shadow");
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