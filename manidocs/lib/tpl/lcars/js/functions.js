$(document).ready(function (){
	$('#bar__topleft .button').each(function(){
	    $(this).hide().after('<span class="button">').next('span.button').text($(this).val()).click(function(){
	        $(this).prev('input.button').click();
	    });
	});
	$('#dw__search span.button').text("Go");
	$('.secedit input.button').each(function(){
	    $(this).hide().after('<span class="button">').next('span.button').text($(this).val()).click(function(){
	        $(this).prev('input.button').click();
	    });
	});
});