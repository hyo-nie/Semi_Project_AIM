
/* ==============================
ver : 1.00
============================== */



/***********************************************
	* onloadPlugin
	* 온로드 실행 함수
	* common.js 에서 onload 함수에서 실행
************************************************/



function onloadPlugin(){
	//owl - 영화상세-스틸컷 (owl 함수보다 먼저 실행 되야함)
	slideHashStillcut();

	//owl ==================================================
	//메인_비쥬얼
	if ($('.slide_main_visual').length > 0){
		owlSlide('slide_main_visual');
	};
	
	//메인_영화목록
	if ($('.slide_main_movie').length > 0){
		owlSlide('slide_main_movie');
	};
	
	//이벤트_홈_비쥬얼
	if ($('.slide_event_visual').length > 0){
		owlSlide('slide_event_visual');
	};

	//스토어_상세_함께본상품
	if ($('.slide_store_product').length > 0){
		owlSlide('slide_store_product');
	};
	
	//마이페이지_공통상단_배너
	if ($('.slide_mypage_top_banner').length > 0){
		owlSlide('slide_mypage_top_banner');
	};

	//마이페이지_클럽_배너
	if ($('.slide_mypage_club_banner').length > 0){
		owlSlide('slide_mypage_club_banner');
	};
	
	//마이페이지_my영화관리_영화목록
	if ($('.slide_mypage_manage_mymovie').length > 0){
		owlSlide('slide_mypage_manage_mymovie');
	};

	//영화_상세_비쥬얼
	if ($('.slide_movie_detail_visual').length > 0){
		owlSlide('slide_movie_detail_visual');
	};

	//영화_상세_트레일러
	if ($('.slide_movie_detail_trailer').length > 0){
		owlSlide('slide_movie_detail_trailer');
	};

	//영화_상세_스틸컷_썸네일
	if ($('.slide_stealcut_top_ctrl').length > 0){
		owlSlide('slide_stealcut_top_ctrl');
	};

	//영화_상세_스틸컷_포스터
	if ($('.slide_stealcut_btm_thm').length > 0){
		owlSlide('slide_stealcut_btm_thm');
	};

	//영화_상세_스틸컷(thm)
	if ($('.slide_stillcut_thm').length > 0){
		owlSlide('slide_stillcut_thm');
	};

	//영화_상세_스틸컷(view)
	if ($('.slide_stillcut_view').length > 0){
		owlSlide('slide_stillcut_view');
	};
	
	//영화_홈_visual
	if ($('.slide_visual_movie_home').length > 0){
		owlSlide('slide_visual_movie_home');
	};

	//영화_홈_영화제
	if ($('.slide_movie_home_festival').length > 0){
		owlSlide('slide_movie_home_festival');
	};
	
	//영화_오페라
	if ($('.slide_movie_festival_opera').length > 0){
		owlSlide('slide_movie_festival_opera');
	};

	//영화_바스키아
	if ($('.slide_movie_festival_baskia').length > 0) {
		owlSlide('slide_movie_festival_baskia');
	};

	//영화_가장 가까운 국립극장
	if ($('.slide_movie_nationaltheater').length > 0) {
		//owlSlide('slide_movie_nationaltheater');
	};

	//영화관_홈_비쥬얼
	if ($('.slide_cinema_home_visual').length > 0){
		owlSlide('slide_cinema_home_visual');
	};

	//날짜선택1
	if ($('.slide_reserve_date').length > 0){
		owlSlide('slide_reserve_date');
	};

	//날짜선택2
	if ($('.slide_reserve_date_wide').length > 0){
		owlSlide('slide_reserve_date_wide');
	};
}

function owlSlide(obj){
	var owl = $('.' + obj).find('.owl-carousel');

	$(window).on('resize', function(){
		slideVisualNavPos();
	})
	
	//상단비쥬얼 nav위치값
	function slideVisualNavPos(){
		var winWdh = $(window).outerWidth();
		if (owl.parents('.visual_top').children('.inner').length > 0 && owl.find('.owl-nav').length > 0){
			owl.find('.owl-nav ').css({'width' : winWdh, 'margin-left' : -winWdh / 2});
		}
	};

	//play버튼위치값설정
	function ctrlPosSet(){
		if (owl.find('.owl-dots').length > 0 && owl.siblings('.bx_ctrl').length > 0) {

			if (!owl.find('.owl-dots .owl-dot:last-child').position()) {
				;
			} else {
				var dotLftPos = owl.find('.owl-dots .owl-dot:last-child').position().left;
				owl.siblings('.bx_ctrl').css({'left' : dotLftPos + 30});
			}
		}
	}

	//play,stop
	if (owl.autoplay = true){
		owl.parent().find('.bx_ctrl .play').addClass('active');
	} else {
		owl.parent().find('.bx_ctrl .stop').addClass('active');
	}
	owl.parent().find('.bx_ctrl .play').off().on('click', function (){
		owl.trigger('play.owl.autoplay', [1000]);
		$(this).addClass('active').siblings().removeClass('active');
	});
	owl.parent().find('.bx_ctrl .stop').off().on('click', function (){
		owl.trigger('stop.owl.autoplay');
		$(this).addClass('active').siblings().removeClass('active');
	});

	//메인_비쥬얼
	if (obj == 'slide_main_visual'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				dotsEach: true,
				autoplay: true,
				autoplayTimeout: 5000,
				autoplayHoverPause: true,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				dotsEach: true,
				autoplay: true,
				autoplayTimeout: 5000,
				autoplayHoverPause: true,
			});
		}
		ctrlPosSet();
		slideVisualNavPos();
	};

	//메인_영화목록
	if (obj == 'slide_main_movie'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 5,
				margin: 15,
				loop: false,
				nav: true,
				dots: false,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 5,
				margin: 15,
				loop: false,
				nav: true,
				dots: false,
			});
		}
	};

	//이벤트_홈_비쥬얼
	if (obj == 'slide_event_visual'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				dotsEach: true,
				autoplay: true,
				autoplayTimeout: 5000,
				autoplayHoverPause: true,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				dotsEach: true,
				autoplay: true,
				autoplayTimeout: 5000,
				autoplayHoverPause: true,
			});
		}
		ctrlPosSet();
		slideVisualNavPos();
	};

	//스토어_상세_함께본상품
	if (obj == 'slide_store_product'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 3,
				loop: false,
				nav: true,
				dots: false,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 3,
				loop: false,
				nav: true,
				dots: false,
			});
		}
	};

	//마이페이지_공통상단_배너
	if (obj == 'slide_mypage_top_banner'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: false,
				nav: false,
				dots: true,
				dotsEach: true,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: false,
				nav: false,
				dots: true,
				dotsEach: true,
			});
		}
	};

	//마이페이지_클럽_배너
	if (obj == 'slide_mypage_club_banner'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 3,
				margin: 20,
				loop: true,
				nav: true,
				dots: false,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 3,
				margin: 20,
				loop: true,
				nav: true,
				dots: false,
			});
		}
	};

	//마이페이지_my영화관리_영화목록
	if (obj == 'slide_mypage_manage_mymovie'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 4,
				margin: 15,
				loop: false,
				nav: true,
				dots: false,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 4,
				margin: 15,
				loop: false,
				nav: true,
				dots: false,
			});
		}
	};

	//영화_상세_비쥬얼
	if (obj == 'slide_movie_detail_visual'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				dotsEach: true,
				autoplay: true,
				autoplayTimeout: 5000,
				autoplayHoverPause: true,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				dotsEach: true,
				autoplay: true,
				autoplayTimeout: 5000,
				autoplayHoverPause: true,
			});
		}
		ctrlPosSet();
		slideVisualNavPos();
	};

	//영화_상세_트레일러
	if (obj == 'slide_movie_detail_trailer'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 3,
				margin: 20,
				loop: false,
				nav: true,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 3,
				margin: 20,
				loop: false,
				nav: true,
				dots: false
			});
		}
	};

	//영화_상세_스틸컷(thm)
	if (obj == 'slide_stillcut_thm'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
                margin: 0,
                URLhashListener: false,
                startPosition: 0,
                autoWidth: true,
                nav: true,
                dots: false,
                rewind: false,
                mouseDrag: false,
                touchDrag: false,
                pullDrag: false,
                freeDrag: false,
                mergeFit: false,
                onInitialized: function () {
                    $("." + obj).find(".owl-nav").removeClass("disabled");
                },
                onChange: function () {
                    $("." + obj).find(".owl-nav").removeClass("disabled");
                },
                onTranslated: function () {
                    $("." + obj).find(".owl-nav").removeClass("disabled");
                }
            });
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				margin: 0,
                URLhashListener: false,
				startPosition: 0,
				autoWidth:true,
				nav: true,
                dots: false,
                rewind: false,
                mouseDrag: false,
                touchDrag: false,
                pullDrag: false,
                freeDrag: false,
                mergeFit: false,
                onInitialized: function () {
                    $("." + obj).find(".owl-nav").removeClass("disabled");
                },
                onChange: function () {
                    $("." + obj).find(".owl-nav").removeClass("disabled");
                },
                onTranslated: function () {
                    $("." + obj).find(".owl-nav").removeClass("disabled");
                }
			});
        }

       
	};

	//영화_상세_스틸컷(view)
	if (obj == 'slide_stillcut_view'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				margin: 10,
				center: true,
				URLhashListener: true,
				nav: true,
				autoHeight:false,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				margin: 10,
				center: true,
				URLhashListener: true,
				nav: true,
				autoHeight:false,
			});
		}
	};

	//영화_홈_비쥬얼
	if (obj == 'slide_visual_movie_home'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dotsEach: true,
				autoplay: true,
				autoplayTimeout: 5000,
				autoplayHoverPause: true,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dotsEach: true,
				autoplay: true,
				autoplayTimeout: 5000,
				autoplayHoverPause: true,
			});
		}
		ctrlPosSet();
		slideVisualNavPos();
	};

	//영화_홈_영화제
	if (obj == 'slide_movie_home_festival'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: false,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: false,
			});
		}
	};

	//영화_영화제_오페라
	if (obj == 'slide_movie_festival_opera'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
			});
		}
	};

	//영화_영화제_바스키아
	if (obj == 'slide_movie_festival_baskia') {
		if ($('body').hasClass('IE9')) {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
			});
		}
	};

	//영화_영화제_가까운국립극장
	if (obj == 'slide_movie_nationaltheater') {
		if ($('body').hasClass('IE9')) {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
			});
		}
	};

	//영화관_홈_비쥬얼
	if (obj == 'slide_cinema_home_visual'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				dotsEach: true,
				autoplay: true,
				autoplayTimeout: 5000,
				autoplayHoverPause: true,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: true,
				dots: true,
				dotsEach: true,
				autoplay: true,
				autoplayTimeout: 5000,
				autoplayHoverPause: true,
			});
		}	
		ctrlPosSet();
		slideVisualNavPos();
	};

	//영화관_스페셜관_슈퍼플렉스
	if (obj == 'slide_special_superplex'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: false,
				dots: false,
				autoplay: true,
				autoplayTimeout: 5000,
				animateOut: 'fadeOut',
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: false,
				dots: false,
				autoplay: true,
				autoplayTimeout: 5000,
				animateOut: 'fadeOut',
			});
		}
	};

	//영화관_스페셜관_씨네컴포트 or 씨네살롱 or 씨네패밀리
	if (obj == 'slide_special_cinecomfort' || obj == 'slide_special_cinesalon' || obj == 'slide_special_cinefamily') {
		if ($('body').hasClass('IE9')) {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: false,
				dots: false,
				autoplay: true,
				autoplayTimeout: 5000,
				animateIn: 'fadeIn',
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 1,
				loop: true,
				nav: false,
				dots: false,
				autoplay: true,
				autoplayTimeout: 5000,
				animateIn: 'fadeIn',
			});
		}
	};

	//날짜선택1
	if (obj == 'slide_reserve_date'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 8,
				slideBy: 8,
				nav: true,
				navSpeed: 100,
				dots: false,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 8,
				slideBy: 8,
				nav: true,
				navSpeed: 100,
				dots: false,
			});
		}
	};

	//날짜선택wide - 영화관홈/상영시간표, 예매/상영시간표
	if (obj == 'slide_reserve_date_wide'){
		if ($('body').hasClass('IE9')){
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 14,
				slideBy: 14,
				nav: true,
				navSpeed: 100,
				dots: false,
				mouseDrag: false,
			});
		} else {
			owl.trigger('destroy.owl.carousel');
			owl.owlCarousel({
				items: 14,
				slideBy: 14,
				nav: true,
				navSpeed: 100,
				dots: false,
			});
		}
	};
}

//영화상세-스틸컷
function slideHashStillcut(){
	$('.slide_stillcut_thm .owl-carousel').on('initialize.owl.carousel', function(event){
        $('.slide_stillcut_thm .item').each(function (i) {
			$(this).attr("data-hash", "hashGrStillcut_" + i);
			$(this).children("a").attr("href", "#hashGrStillcut_" + i)
		});
        $('.slide_stillcut_thm').find('.item').each(function () {
            var fixHgt = 133;
            var imgWdh = $(this).find('img').width();
            var imgHgt = $(this).find('img').height();
            var rate = imgHgt / fixHgt;
            //$(this).find('img').css({'width' :imgWdh/rate, 'height' : fixHgt});
            $(this).find('img').css({'height': fixHgt });
        });
	});

	$('.slide_stillcut_view .owl-carousel').on('initialize.owl.carousel', function(event){
		$('.slide_stillcut_view .item').each(function(j){
			$(this).attr("data-hash", "hashGrStillcut_" + j);
		});
		$('.slide_stillcut_view').find('.item').each(function(){
			var fixHgt = 510;
			var imgWdh = $(this).find('img').width();
			var imgHgt = $(this).find('img').height();
			var rate = imgHgt / fixHgt;
			
			//$(this).find('img').css({'width' : imgWdh/rate, 'height' : fixHgt});

		});
	});
};

//datapicker
//function setDatepicker(obj){
//	$.datepicker.setDefaults({
//		dateFormat: 'yy-mm-dd',
//		showMonthAfterYear: true,
//		changeYear: false,
//		changeMonth: false,
//		showOn: "both",
//		buttonText: "날짜선택",
//		yearSuffix: '.',
//		monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
//		monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
//		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
//		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
//		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
//	});
//	$("#" + obj + "").datepicker();
//} 

//datapicker : 웹접근성
function setDatepicker(obj) {
	$.datepicker.setDefaults({
		dateFormat: "yy-mm-dd", // 날짜표기 형식 : yy년mm월dd일
		yearSuffix: "년",
		changeYear: true, // 콤보박스에서 년 선택 가능
		changeMonth: true, // 콤보박스에서 월 선택 가능 
		nextText: '다음 달',
		prevText: '이전 달',
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		showMonthAfterYear: true,// 상단 년, 월 설정
		minDate: '-0d',// 이전 날짜들은 선택막기 
		altField: "#" + obj + "",
		duration: "fast", // 달력 나타나는 속도, "slow", "normal", "fast"
		// 하단 설정
		showButtonPanel: true, // 비활성화
		currentText: '오늘 날짜',
		closeText: '닫기',
		// 버튼 설정
		showOn: "button",	// both, button, textField
		buttonImage: "/NLCHS/Content/images/icon/calendar.png",
		buttonImageOnly: false,
		buttonText: '날짜 선택',
		onClose: function (selectedDate) {
			$("#" + obj + "").attr('value', selectedDate);
			$('.ui-datepicker-trigger').focus();
		}
	});
	$("#" + obj + "").datepicker().on('focus', function () {
		$('.ui-datepicker-year').attr('title', '년도 선택');
		$('.ui-datepicker-month').attr('title', '월 선택');
		$('.ui-datepicker').attr('tabindex', '0');
		$('.ui-datepicker').focus();
	});
}
