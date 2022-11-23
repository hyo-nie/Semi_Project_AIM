// Javascript Document
$(document).ready(function(){  
	var height = $('.rollings li').height();
	var length = $('.rollings li').length;
	
	$('.rollings').css('height',height*length);
	
	setInterval(function(){	
		$('.rollings').animate({top:-height},2000,function(){
			$('.rollings li').eq(0).appendTo('.rollings');
			$('.rollings').css('top',0);	
		})
	},4000)	
});