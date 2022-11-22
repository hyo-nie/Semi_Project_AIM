$(function(){
	//chkTermAll();
	inputDeleteBtn();
	selectPrintCinema();
	//fn_youngjalalquizHor();// 영잘알 퀴즈 가로
	fn_quizlistSel(); // 영잘알 퀴즈 리스트 선택
	fn_moveinvolved(); // 영잘알 퀴즈 참여하기 
	// swiper_quiz(); // 영잘알 퀴즈 슬라이드 : plugin_swiper.js 로 이동
})

// 약관동의 전체선택 : 2021.05.24
function chkTermAll(){
	var $toTalCheck_regist = $('#chkTermAgreeAll, #agree_all');
	$toTalCheck_regist.change(function () {
		var checked = $(this).prop('checked'); // checked 문자열 참조(true, false)
		$('input[name="lpointTerm"], input[name="agreeMarketing"]').prop('checked', checked);
	});
	var boxes_regist = $('input[name="lpointTerm"]');
	var boxes_market = $('input[name="agreeMarketing"]');
	boxes_regist.change(function () {
		var boxLength_regist = boxes_regist.length;
		// 체크된 체크박스 갯수를 확인하기 위해 :checked 필터를 사용하여 체크박스만 선택한 후 length 프로퍼티를 확인
		var checkedLength_regist = $('input[name="lpointTerm"]:checked').length;
		var selectAll_regist = (boxLength_regist == checkedLength_regist);
		$toTalCheck_regist.prop('checked', selectAll_regist);
	});
	boxes_market.change(function () {
		var boxLength_market = boxes_market.length;
		// 체크된 체크박스 갯수를 확인하기 위해 :checked 필터를 사용하여 체크박스만 선택한 후 length 프로퍼티를 확인
		var checkedLength_marketing = $('input[name="agreeMarketing"]:checked').length;
		var selectAll_market = (boxLength_market == checkedLength_marketing);
		$toTalCheck_regist.prop('checked', selectAll_market);
	});
}

//accodian_menu : 2021.05.24
function toggleAccdian(obj) {
	var $item = $(obj).parent('.acc_item');
	$item.siblings('.acc_item').removeClass('active').children('.acc_cont').stop().slideUp(500);
	$item.toggleClass('active');
	if (!$item.hasClass('active')) {
		$item.children('.acc_cont').stop().slideUp(500)
	} else {
		$item.children('.acc_cont').stop().slideDown(500)
	}
}

function inputDeleteBtn(){
	// 주소검색 input 삭제버튼: 2021.05.24
	var $input_has_delete = $('.has-delete-btn input[name="address-search"]');
	var $input_delete_btn = $('.has-delete-btn input[name="address-search"] + .delete');
	$input_has_delete.keydown(function () {
		$(this).addClass('is-focus');
	});
	$input_delete_btn.click(function () {
		$(this).siblings('input[name="address-search"]').removeClass('is-focus').val('');
	})
}

//포토카드 출력선택영화관
//마이페이지 : MY영화관설정
function selectPrintCinema(){
	$(".layer_select_print_cinema .depth1 > a").off().on("click", function(e){
		e.preventDefault();
		$(this).attr("title", "선택됨").siblings(".depth2").show();
		$(this).parent(".depth1").addClass("active").siblings("li").removeClass("active").find(".depth2").hide();
		$(this).parent(".depth1").siblings("li").find("> a").removeAttr("title");
	});
	$(".layer_select_print_cinema .depth2 li a").off().on("click", function(){
			$(this).parent("li").addClass("active").siblings().removeClass("active");
	});
}

// 영잘알 퀴즈 가로
function fn_youngjalalquizHor() {
	var $barmovleft = $('.barmove.left'),
		$barmovright = $('.barmove.right'),
		$bubblemovleft = $('.progresscircle.left'),
		$bubblemovright = $('.progresscircle.right'),
		$barmovleft30 = $('.s30 .barmove.left'),
		$barmovright30 = $('.s30 .barmove.right'),
		$bubblemovleft30 = $('.s30 .progresscircle.left'),
		$bubblemovright30 = $('.s30 .progresscircle.right'),
		$barmovleft60 = $('.s60 .barmove.left'),
		$barmovright60 = $('.s60 .barmove.right'),
		$bubblemovleft60 = $('.s60 .progresscircle.left'),
		$bubblemovright60 = $('.s60 .progresscircle.right'),
		$barmovleft90 = $('.s90 .barmove.left'),
		$barmovright90 = $('.s90 .barmove.right'),
		$bubblemovleft90 = $('.s90 .progresscircle.left'),
		$bubblemovright90 = $('.s90 .progresscircle.right'),
		$targetTri = $('.quizstepwrap');

	$barmovleft.animate({left:'0%'}, 1000);
	$barmovright.animate({right:'0%'}, 1000);
	$bubblemovleft.animate({left:'0%'}, 1000);
	$bubblemovright.animate({right:'0%'}, 1000);
	$barmovleft30.animate({left:'30%'}, 1000);
	$barmovright30.animate({right:'30%'}, 1000);
	$bubblemovleft30.animate({left:'30%'}, 1000);
	$bubblemovright30.animate({right:'30%'}, 1000);
	$barmovleft60.animate({left:'60%'}, 1000);
	$barmovright60.animate({right:'60%'}, 1000);
	$bubblemovleft60.animate({left:'60%'}, 1000);
	$bubblemovright60.animate({right:'60%'}, 1000);
	$barmovleft90.animate({left:'90%'}, 1000);
	$barmovright90.animate({right:'90%'}, 1000);
	$bubblemovleft90.animate({left:'90%'}, 1000);
	$bubblemovright90.animate({right:'90%'}, 1000);

	// middle 삼각형 서서히 나타남
	if($targetTri.hasClass('s60') || $targetTri.hasClass('s90')){
		$targetTri.find('.middlearrow .rightarrow_color').fadeOut(3000); // 오른쪽 화살표
		$targetTri.find('.middlearrow .leftarrow_color').fadeOut(3000); // 왼쪽 화살표
		$targetTri.find('.middlearrow .downarrow_color').fadeOut(3000); // 아래쪽 화살표
	}
	// 2단계 middle 삼각형 서서히 나타남
	if($targetTri.hasClass('step2') && $targetTri.hasClass('s30')){
		$targetTri.find('.middlearrow .downarrow_color').fadeOut(2000); // 아래쪽 화살표
	}
}
// 영잘알 퀴즈 리스트 선택
function fn_quizlistSel () {
	var $target = $('.quizstart_head .qinfo_list li');
	$target.on('click', function(e){
		// 리스트 선택후 선택 안됨
		if($target.hasClass('active')){
			e.preventDefault();
		} else {
			$(this).addClass('active').siblings('li').removeClass('active');
		}
	})
}
// 영잘알 퀴즈 참여하기 
function fn_moveinvolved () {
	var $target = $('.quizstepwrap .btnmoveinvolved');

	$target.on('click', function(){
		$('.quizstart_head').addClass('active');
		$(this).hide();
	})
}
// 영잘알 퀴즈 슬라이드 : plugin_swiper.js 로 이동
// function swiper_quiz() {
//	var swiper = new Swiper(".swiper-container.yjaquiz_swiper", {
//		observer: true,
//		observeParents: true,
//		autoHeight: true,
//		allowTouchMove: false,
//		pagination: {
//			el: ".swiper-pagination",
//			type: "fraction",
//		},
//		navigation: {
//			nextEl: ".swiper-button-next",
//			prevEl: ".swiper-button-prev",
//		},
//	});
//}