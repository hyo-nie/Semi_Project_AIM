
/* ==============================
ver : 1.00
============================== */



/***********************************************
	* onload
	* 화면 로드 후 onload 함수 실행
************************************************/



$(function(){
	//개발단 화면 로드후 실행
	onload();
});



/***********************************************
	* 온로드 실행 함수
************************************************/
function onload(){
	
	BrowserAgent(); //onloadPlugin 함수보다 먼저 호출되야함
	onloadPlugin(); //plugin.js

	starRate();
	selectTheater();
	nav();
	tabOuter();
	tabOuterActionbar();
	tabMenu();
	tabLnk();
	tabLnkActionbar();
	tabMenuLnk();
	tooltip();
	cinemaSelect();
	viewList();
    btnCloseLayer();
    btnCloseLayer_new();
	reserveListItem();
	myCinemaReg();
	toggleWrap();
	headerFixed();
	reserveStep();
	gnbMenu();
	moviePosterHover();
	tooltipBox();
	accodianMenu();
	inputDel();
	inputFile();
	viewComment();
	voteClick();
	listOver();
	quickMenu();
	rolling();
	toggleBtn();
	scrollPopup();
	dimPopup();
	closePopup();
    mainSpecialLogo();
    paySimple();
    fn_addSelectprodClose();
    //fn_addProdinfo();
	// fn_membershipTopinBanner(); // 상단 광고 배너 닫을 때 : 멤버십 탭
	// fn_membershipTabinBanner(); // 멤버십 탭 : 상단 광고 배너 체크
	fn_vipcoupontypechk(); // vip 쿠폰 다운로드 영화 혜택 타입 선택
	//fn_counterAnima(); //영잘알 숫자 카운트
}



/***********************************************
	* style 공통
************************************************/

/***********************************************
	* style1
************************************************/


//헤더
function headerFixed() {
	$(window).on("scroll", function () {
		var scrTop = $(window).scrollTop();
		var gnbHgt = $(".gnb").outerHeight();
		var banHgt = gnbHgt + $("#main_top_of_top_banner").outerHeight();

		if ($('#main_top_of_top_banner').hasClass('banner_top_wrap')) {
			// 상단 배너 있을 경우
			if (scrTop > banHgt) {
				headerFixed_add();
			} else {
				headerFixed_remove();
			}
		} else {
			// 상단 배너 없을 경우
			if (scrTop > gnbHgt) {
				headerFixed_add();
			} else {
				headerFixed_remove();
			}
		}
	});
}
//헤더 : 고정
function headerFixed_add() {
	var scrTop = $(window).scrollTop();
	$(".header").addClass("fixed");
	if ($(".visual_top").length > 0) {
		$(".visual_top").not(".visual_main").stop().css({ "margin-top": "120px" });
	} else {
		if ($("#contents").hasClass("contents_mypage")) {
			$("#contents.contents_mypage").stop().css({ "padding-top": "170px" });
		} else {
			$("#contents").stop().css({ "margin-top": "120px" });
		}
	}
	if ($(".contents_mall_home .tab_wrap_lnk").length > 0) {
		var mallTabConOff = $(".contents_mall_home .tab_con_lnk").offset().top;
		if (scrTop > mallTabConOff - 160) {
			$(".contents_mall_home .tab_wrap_lnk").addClass("fixed");
		} else {
			$(".contents_mall_home .tab_wrap_lnk").removeClass("fixed");
		}
	}
}
//헤더 : 고정 해제
function headerFixed_remove() {
	$(".header").removeClass("fixed");
	if ($(".visual_top").length > 0) {
		$(".visual_top").stop().css({ "margin-top": "" });
	} else {
		if ($("#contents").hasClass("contents_mypage")) {
			$("#contents.contents_mypage").stop().css({ "padding-top": "50px" });
		} else {
			$("#contents").stop().css({ "margin-top": "" });
		}

	}
}
// function headerFixed(){
// 	$(window).on("scroll", function(){
// 		var scrTop = $(window).scrollTop();
// 		var gnbHgt = $(".gnb").outerHeight();

// 		if (scrTop > gnbHgt){
// 			$(".header").addClass("fixed");
// 			if ($(".visual_top").length > 0){
// 				$(".visual_top").not(".visual_main").stop().css({"margin-top" : "120px"});
// 			} else {
// 				if ($("#contents").hasClass("contents_mypage")){
// 					$("#contents.contents_mypage").stop().css({"padding-top" : "170px"});
// 				} else {
// 					$("#contents").stop().css({"margin-top" : "120px"});
// 				}
// 			}

// 			if ($(".contents_mall_home .tab_wrap_lnk").length > 0){
// 				// var mallTabTitHgt = $(".contents_mall_home .tab_wrap_lnk").outerHeight();
// 				var mallTabConOff = $(".contents_mall_home .tab_con_lnk").offset().top;

// 				if (scrTop > mallTabConOff - 120){
// 					$(".contents_mall_home .tab_wrap_lnk").addClass("fixed");
// 				} else {
// 					$(".contents_mall_home .tab_wrap_lnk").removeClass("fixed");
// 				}
// 			}
// 		} else {
// 			$(".header").removeClass("fixed");
// 			if ($(".visual_top").length > 0){
// 				$(".visual_top").stop().css({"margin-top" : ""});
// 			} else {
// 				if ($("#contents").hasClass("contents_mypage")){
// 					$("#contents.contents_mypage").stop().css({"padding-top" : "50px"});
// 				} else {
// 					$("#contents").stop().css({"margin-top" : ""});
// 				}

// 			}
// 		}
// 	});
// }

//영화관 선택
function selectTheater(){
	$(".theater_area_list > .depth1 > a").off().on("click", function(e){
		e.preventDefault();
		$(this).attr("title", "선택됨").siblings(".depth2").show();
		$(this).parent(".depth1").addClass("active").siblings("li").removeClass("active").find(".depth2").hide();
		$(this).parent(".depth1").siblings("li").find(">a").removeAttr("title");
	});
}

//nav
function nav(){
	var depth1 = $("#nav > ul > li");
	var depth2 = $("#nav > ul > li > div > ul > li");
	$(depth1).children("a").off().on("mouseenter focusin", function(){
		$(this).parent("li").addClass("ov").siblings("li").removeClass("ov");
		$(depth1).children("div").hide().children("ul").stop().animate({"opacity" : "0"});
		$(this).siblings("div").show().children("ul").stop().animate({"opacity" : "1"});
	});
	$(depth2).children("a").off().on("mouseenter focusin", function(){
		$(this).parent("li").addClass("ov").siblings("li").removeClass("ov");
		$(depth2).children("div").hide().children("ul").stop().animate({"opacity" : "0"});
		$(this).siblings("div").show().children("ul").stop().animate({"opacity" : "1"});
	});
	$("#nav > ul").off().on("mouseleave", function(){
		$("#nav li").removeClass("ov");
		$("#nav li > div").hide().children("ul").stop().animate({"opacity" : "0"});
		$("#nav > ul > li.active > div, #nav > ul > li > div > ul > li.active > div").show().children("ul").stop().animate({"opacity" : "1"});
	});
}

function tabOuter_movingbar() {
	// tab moving actionbar	
	var $target = $(".tab_wrap");
	$target.each(function (idx) {
		if ($(this).hasClass("actionmovingbar")) {
			if (!$(this).children("li").hasClass("wrap_nav_underline")) {
				$(this).children("li").last().after('<li class="wrap_nav_underline"><span class="nav_underline"></span></li>');
			}
		} else {
			return true;
		}
	});
}
//tab : tabOuter actionmovingbar position 
function tabOuterActionbar() {
	tabOuter_movingbar();
	$(".tab_wrap.outer.actionmovingbar").each(function () {
		var outLenBar = $(this).children("li").length - 1;
		var outSumPrev = 0;
		$(this).children("li").each(function (i) {
			//$(this).attr("idx", i);

			if ($(this).parent(".tab_wrap.outer.actionmovingbar").hasClass("full")) {
				var conWdh = parseInt($("#nav").css("width"));
				var outWdh = conWdh / outLenBar;
				var outPos = i * outWdh;
				var fullPos = -(conWdh / 2) + outPos;
				$(this).children(".tab_tit").css({ "width": outWdh + "px" });
				$(this).children(".tab_tit").css({ "left": "50%" });
				$(this).children(".tab_tit").css({ "margin-left": fullPos + "px" });
			} else if ($(this).parent(".tab_wrap.outer.actionmovingbar").hasClass("loginbar")) {
				// tab moving underbar : 로그인
				var conWdh = parseInt($("#nav").css("width"));
				var outWdh = conWdh / outLenBar;
				var outPos = i * outWdh;
				var fullPos = -(conWdh / 2) + outPos;
				$(this).children(".tab_tit").css({ "width": outWdh + "px" });
				$(this).children(".tab_tit").css({ "left": "50%" });
				$(this).children(".tab_tit").css({ "margin-left": fullPos + "px" });
			} else if ($(this).parent(".tab_wrap.outer.actionmovingbar").hasClass("customercenterbar")) {
				// tab moving underbar : 고객센터 탭
				var conWdh = parseInt($("#nav").css("width"));
				var outWdh = conWdh / outLenBar;
				var outPos = i * outWdh;
				var fullPos = -(conWdh / 2) + outPos;
				$(this).children(".tab_tit").css({ "width": outWdh + "px" });
				$(this).children(".tab_tit").css({ "left": "50%" });
				$(this).children(".tab_tit").css({ "margin-left": fullPos + "px" });
			} else if ($(this).parent(".tab_wrap.outer.actionmovingbar").hasClass("reservetimebar")) {
				// tab moving underbar : 상영시간
				var $target = $(".wrap_reserve .section_step_con .article.article_time > .inner .tab_wrap.outer.actionmovingbar");
				var conWdh = parseInt($target.css("width"));
				var outWdh = conWdh / outLenBar;
				var outPos = i * outWdh;
				var fullPos = -(conWdh / 2) + outPos;
				$(this).children(".tab_tit").css({ "width": outWdh + "px" });
				$(this).children(".tab_tit").css({ "left": "50%" });
				$(this).children(".tab_tit").css({ "margin-left": fullPos + "px" });
			} else if ($(this).parent(".tab_wrap.outer.actionmovingbar").hasClass("theaterselectbar")) {
				// tab moving underbar : 상영시간 - 영화관 선택	
				var conWdh = parseInt($(".wrap_reserve .section_step_con .article.article_cinema").css("width"));
				var outWdh = conWdh / outLenBar;
				var outPos = i * outWdh;
				var fullPos = -(conWdh / 2) + outPos;
				$(this).children(".tab_tit").css({ "width": outWdh + "px" });
				$(this).children(".tab_tit").css({ "left": "50%" });
				$(this).children(".tab_tit").css({ "margin-left": fullPos + "px" });
			} else if ($(this).parent(".tab_wrap.outer.actionmovingbar").hasClass("theaterdetailbar")) {
				// tab moving underbar : 영화관 상세
				var conWdh = parseInt($("#nav").css("width"));
				var outWdh = conWdh / outLenBar;
				var outPos = i * outWdh;
				var fullPos = -(conWdh / 2) + outPos;
				$(this).children(".tab_tit").css({ "width": outWdh + "px" });
				$(this).children(".tab_tit").css({ "left": "50%" });
				$(this).children(".tab_tit").css({ "margin-left": fullPos + "px" });
			} else if ($(this).parent(".tab_wrap.outer.actionmovingbar").hasClass("moviedetailbar")) {
				// tab moving underbar : 영화 상세
				var conWdh = parseInt($("#nav").css("width"));
				var outWdh = conWdh / outLenBar;
				var outPos = i * outWdh;
				var fullPos = -(conWdh / 2) + outPos;
				$(this).children(".tab_tit").css({ "width": outWdh + "px" });
				$(this).children(".tab_tit").css({ "left": "50%" });
				$(this).children(".tab_tit").css({ "margin-left": fullPos + "px" });
			} else if ($(this).parent(".tab_wrap.outer.actionmovingbar").hasClass("lft")) {
				var outWdh = $(this).children(".tab_tit").outerWidth();
				var outSumWdh = outSumPrev + $(this).prev("li").children(".tab_tit").outerWidth();
				outSumPrev = outSumWdh;
				$(this).children(".tab_tit").css({ "left": outSumPrev + "px", "width": outWdh });
			} else if ($(this).parent(".tab_wrap.outer.actionmovingbar").hasClass("rgt")) {
				var outWdh = $(this).children(".tab_tit").outerWidth();
				var outSumWdh = outSumPrev + $(this).prev("li").children(".tab_tit").outerWidth();
				outSumPrev = outSumWdh;
				$(this).children(".tab_tit").css({ "right": outSumPrev + "px", "width": outWdh });
			} else {
				var outWdh = 100 / outLenBar;
				var outPos = i * outWdh;
				$(this).children(".tab_tit").css({ "width": outWdh + "%" });
				$(this).children(".tab_tit").css({ "left": outPos + "%" });
			}

		});
	});
}

//tab : tabOuter position
function tabOuter(){
	$(".tab_wrap.outer").each(function(){
		var outLen = $(this).children("li").length;
		var outSumPrev = 0;
		$(this).children("li").each(function(i){
			//$(this).attr("idx", i);

			if ($(this).parent(".tab_wrap.outer").hasClass("full")){
				var conWdh = parseInt($("#nav").css("width"));
				var outWdh = conWdh / outLen;
				var outPos = i * outWdh;
				var fullPos = -(conWdh / 2) + outPos;
				$(this).children(".tab_tit").css({"width" : outWdh + "px"});
				$(this).children(".tab_tit").css({"left" : "50%"});
				$(this).children(".tab_tit").css({"margin-left" : fullPos + "px"});
			} else if ($(this).parent(".tab_wrap.outer").hasClass("lft")){
				var outWdh = $(this).children(".tab_tit").outerWidth();
				var outSumWdh = outSumPrev + $(this).prev("li").children(".tab_tit").outerWidth();
				outSumPrev = outSumWdh;
				$(this).children(".tab_tit").css({"left" : outSumPrev + "px", "width" : outWdh});
			} else if ($(this).parent(".tab_wrap.outer").hasClass("rgt")){
				var outWdh = $(this).children(".tab_tit").outerWidth();
				var outSumWdh = outSumPrev + $(this).prev("li").children(".tab_tit").outerWidth();
				outSumPrev = outSumWdh;
				$(this).children(".tab_tit").css({"right" : outSumPrev + "px", "width" : outWdh});
			} else {
				var outWdh = 100 / outLen;
				var outPos = i * outWdh;
				$(this).children(".tab_tit").css({"width" : outWdh + "%"});
				$(this).children(".tab_tit").css({"left" : outPos + "%"});
			}

			if ($(this).find(".tab_wrap.inner").length > 0){
				//tab : tabInner position
				$(".tab_wrap.inner").each(function(){
					var sumPrev = 0;
					$(this).children("li").each(function(j){
						//$(this).attr("idx", j);
						var wdh = sumPrev + $(this).prev("li").children(".tab_tit").outerWidth();
						sumPrev = wdh;
						$(this).children(".tab_tit").css({"left" : sumPrev + "px"});
					});
				});

				var outBtnPos = $(this).children(".tab_tit").position().left;
				var outTxtPos = $(this).children(".tab_tit").find("span").position().left;
				var inPos = outBtnPos + outTxtPos;

				var sumWdh = 0;
				$(this).find(".tab_wrap.inner").children("li").each(function(){
					var inWdh = sumWdh + $(this).children(".tab_tit").outerWidth();
					sumWdh = inWdh;
				});

				var tabWdh = $(".tab_wrap.outer").innerWidth();
				if ( inPos + sumWdh > tabWdh){
					$(this).find(".tab_wrap.inner").children("li").find(".tab_tit").css({"margin-left" : tabWdh - sumWdh});
				} else {
					$(this).find(".tab_wrap.inner").children("li").find(".tab_tit").css({"margin-left" : inPos});
				}
			}
		});
	});
}

function tabLnk_movingbar() {
	// tab moving actionbar	
	var $target = $(".tab_wrap_lnk");
	$target.each(function () {
		if ($(this).hasClass("actionmovingbar")) {
			if (!$(this).children("li").hasClass("wrap_nav_underline")) {
				$(this).children("li").last().after('<li class="wrap_nav_underline"><span class="nav_underline"></span></li>');
			}
		} else {
			return true;
		}
	});
}

//tab : tabOuter actionmovingbar position
function tabLnkActionbar() {
	tabLnk_movingbar();
	$(".tab_wrap_lnk.actionmovingbar").each(function () {
		var outLenBar = $(this).children("li").length - 1;
		$(this).children("li").each(function (i) {
			//$(this).attr("idx", i);
			if ($(this).parent(".tab_wrap_lnk.actionmovingbar").hasClass("full")) {

			} else if ($(this).parent(".tab_wrap_lnk.actionmovingbar").hasClass("mypagetabmenubar")) {
				var outWdh = 100 / outLenBar;
				var outPos = i * outWdh;
				$(this).children("a").css({ "width": outWdh + "%" });
				$(this).children("a").css({ "left": outPos + "%" });
			} else if ($(this).parent(".tab_wrap_lnk.actionmovingbar").hasClass("saleinfobar")) {
				var outWdh = 100 / outLenBar;
				var outPos = i * outWdh;
				$(this).children("a").css({ "width": outWdh + "%" });
				$(this).children("a").css({ "left": outPos + "%" });
			} else {
				var outWdh = 100 / outLenBar;
				var outPos = i * outWdh;
				$(this).children("a").css({ "width": outWdh + "%" });
				$(this).children("a").css({ "left": outPos + "%" });
			}

			if ($(this).find("ul").length > 0) {
				//tab : tabInner position
				$(this).find("ul").each(function () {
					var sumPrev = 0;
					$(this).children("li").each(function (j) {
						//$(this).attr("idx", j);
						var wdh = sumPrev + $(this).prev("li").children("a").outerWidth();
						sumPrev = wdh;
						$(this).children("a").css({ "left": sumPrev + "px" });
					});
				});

				var outBtnPos = $(this).children("a").position().left;
				var outTxtPos = $(this).children("a").find("span").position().left;
				var inPos = outBtnPos + outTxtPos;
				var sumWdh = 0;
				$(this).find("ul").children("li").each(function () {
					var inWdh = sumWdh + $(this).children("a").outerWidth();
					sumWdh = inWdh;
				});

				var tabWdh = $(".tab_wrap_lnk.actionmovingbar").innerWidth();
				if (inPos + sumWdh > tabWdh) {
					$(this).find("ul").children("li").find("a").css({ "margin-left": tabWdh - sumWdh });
				} else {
					$(this).find("ul").children("li").find("a").css({ "margin-left": inPos });
				}
			}
		});
	});
}

//tab : tabOuter position
function tabLnk(){
	$(".tab_wrap_lnk").each(function(){
		var outLen = $(this).children("li").length;
		$(this).children("li").each(function(i){
			//$(this).attr("idx", i);
			if ($(this).parent(".tab_wrap_lnk").hasClass("full")){

			} else {
				var outWdh = 100 / outLen;
				var outPos = i * outWdh;
				$(this).children("a").css({"width" : outWdh + "%"});
				$(this).children("a").css({"left" : outPos + "%"});
			}

			if ($(this).find("ul").length > 0){
				//tab : tabInner position
				$(this).find("ul").each(function(){
					var sumPrev = 0;
					$(this).children("li").each(function(j){
						//$(this).attr("idx", j);
						var wdh = sumPrev + $(this).prev("li").children("a").outerWidth();
						sumPrev = wdh;
						$(this).children("a").css({"left" : sumPrev + "px"});
					});
				});

				var outBtnPos = $(this).children("a").position().left;
				var outTxtPos = $(this).children("a").find("span").position().left;
				var inPos = outBtnPos + outTxtPos;

				var sumWdh = 0;
				$(this).find("ul").children("li").each(function(){
					var inWdh = sumWdh + $(this).children("a").outerWidth();
					sumWdh = inWdh;
				});

				var tabWdh = $(".tab_wrap_lnk").innerWidth();
				if ( inPos + sumWdh > tabWdh){
					$(this).find("ul").children("li").find("a").css({"margin-left" : tabWdh - sumWdh});
				} else {
					$(this).find("ul").children("li").find("a").css({"margin-left" : inPos});
				}
			}
		});
	});
}

//tab : event
function tabMenu(){
	$(".tab_wrap > li:not(.active) .tab_wrap.inner > li .tab_tit").attr("tabindex", "-1");
	$(".tab_wrap .tab_tit").off().on("click focusin", function(){
		$(this).parent("li").addClass("active").siblings("li").removeClass("active");
		if ($(this).siblings(".tab_con").find(".tab_wrap.inner").length > 0){
			$(this).parents(".tab_wrap").find(".tab_wrap.inner > li .tab_tit").attr("tabindex", "-1");
			$(this).siblings(".tab_con").find(".tab_wrap.inner > li .tab_tit").attr("tabindex", "0");
		}

		//탭클릭시 내부 스크롤 상단으로 이동
		//var scrollbar = $(this).next().find(".mCustomScrollbar");
		//if (scrollbar.length > 0) {
		//	scrollbar.mCustomScrollbar("scrollTo", "top", { scrollInertia: 0 });
		//}
	});
};

//tab : event
function tabMenuLnk(){
	$(".tab_wrap_lnk > li > a").off().on("mouseenter focusin", function(){
		$(this).parents(".tab_wrap_lnk").children(".active").addClass("current");
		$(this).parent("li").addClass("ov").siblings("li").removeClass("ov").removeClass("active");
	});
	$(".tab_wrap_lnk ").off().on("mouseleave focusout", function(){
		$(this).find(".current").addClass("active").removeClass("current");
		$(this).children("li").removeClass("ov");
	});
	$(".tab_wrap_lnk > li > ul > li > a").off().on("mouseenter focusin", function(){
		$(this).parents(".tab_wrap_lnk").children(".active").addClass("current");
		$(this).parents("ul").parent("li").addClass("ov").siblings("li").removeClass("ov").removeClass("active");
	});

	$(".tab_wrap_lnk.anchor > li > a").off().on("click", function (e) {
		e.preventDefault();

		var topFixedOff = $(".header").outerHeight() + $("#nav > ul > li > div").outerHeight() + $(".tab_wrap_lnk.anchor").outerHeight();
		if ($(".header").hasClass("fixed") == false){
			var topFixedOff = topFixedOff - 60;
		} else {
			var topFixedOff = topFixedOff - 30;
		};
		$(this).parent("li").addClass("current");
		$(this).parent("li").siblings("li").removeClass("active");
		$("html, body").animate({ scrollTop : $($(this).attr("href")).offset().top - topFixedOff}, 100);
	});

	if($('.tab_wrap_lnk.anchor').length > 0) {
		var $contents = $('.tab_con_lnk .lc_wrap');
		var $menu = $('.tab_wrap_lnk.anchor li');
		var topFixedOff = $(".header").outerHeight() + $("#nav > ul > li > div").outerHeight() + $(".tab_wrap_lnk.anchor").outerHeight();
		$(window).scroll(function(){
			var scltop = $(window).scrollTop();
			$.each($contents, function(idx, item){
				var $target= $contents.eq(idx),
					i = $target.index(),
					targetTop = $target.offset().top - topFixedOff;
				if (targetTop <= scltop) {
					$menu.removeClass('active');
					$menu.eq(idx).addClass('active');
				}
			});
			
		});
	}
};

//영화예매 : 영화관선택
function cinemaSelect(){
	$(".cinemaSelect .depth1 > a").off().on("click", function(e){
		e.preventDefault();
		$(this).attr("title", "선택됨").siblings(".depth2").show();
		$(this).parent(".depth1").addClass("active").siblings("li").removeClass("active").find(".depth2").hide();
		$(this).parent(".depth1").siblings("li").find("> a").removeAttr("title");
	});

	$(".cinemaSelect .depth2 li a").off().on("click", function(){
		$(".cinemaSelect .depth2 li").removeClass("active");
		$(this).parent("li").addClass("active");
	});
}

//영화예매 : 영화목록 보기 방식
function viewList(){
	$(".viewTxt").off().on("click", function(){
		if ($(this).hasClass("active") == false){
			$(this).addClass("active").parents(".list_filter").find(".viewThm").removeClass("active");
			$(this).parents(".list_filter").siblings(".movieSelect").removeClass("thm").addClass("list");
		}
	});
	$(".viewThm").off().on("click", function(){
		if ($(this).hasClass("active") == false){
			$(this).addClass("active").parents(".list_filter").find(".viewTxt").removeClass("active");
			$(this).parents(".list_filter").siblings(".movieSelect").removeClass("list").addClass("thm");
		}
	});
}

/*
//영화예매 : 영화선택
function movieSelect(){
	$(".movieSelect ul > li > a").off().on("click", function(){
		if ($(this).parent("li").hasClass("active") == true){
			$(this).parent("li").removeClass("active");
		} else {
			$(this).parent("li").addClass("active").siblings("li").removeClass("active");
		};
	});
}
//영화예매 : 시간선택
function timeSelect(){
	$(".timeSelect .list_time > li > a").off().on("click", function(){
		if ($(this).parent("li").hasClass("active") == true){
			$(this).parent("li").removeClass("active");
		} else {
			$(this).parent("li").addClass("active").siblings("li").removeClass("active");
		};
	});
}
function timeTooltip(){
	$(".time_select_wrap ul.list_time li > a").off().on("mouseenter focusin", function(){
		$(this).find(".tooltip").show();
	}).off().on("mouseleave focusout", function(){
		$(this).find(".tooltip").hide();
	});
}
*/
function getScrollbarWidth() {
	return window.innerWidth - document.documentElement.clientWidth;
}
function tooltip(){
	$(".showTooltip").on("mouseenter focusin", function(){
		$(this).parents(".tooltip_wrap").find(".bx_tooltip").show().off();
	}).on("mouseleave focusout", function(){
		$(this).parents(".tooltip_wrap").find(".bx_tooltip").hide().off();
	});
}

function createOverlay(obj) {
	if ($(".dim").length < 1){
		if (obj == "reserve"){
			$(".section_step_con.active").prepend("<div class='dim ty2'></div>");
		} else if (obj == "header"){
			$("body").css({ "margin-right": getScrollbarWidth()});
			$("body").css({"overflow" : "hidden"});
			$(".header").prepend("<div class='dim'></div>");
		} else {
			//$("body").css({"overflow" : "hidden"}).prepend("<div class='dim'></div>");
			$("body").css({ "margin-right": getScrollbarWidth() });
			$("body").css({"overflow" : "hidden"});
			$(".header").prepend("<div class='dim'></div>");
		}

		if ($(".header.ty3").length > 0){
			$(".header.ty3").css({"z-index" : "inherit"});
		}
		if ($(".header.fixed").length > 0){
			$(".header.fixed").css({"z-index" : "99"});
		}
	}
};

function createOverlay200(obj) {
	if ($(".dim200").length < 1) {
		if (obj == "reserve") {
			$(".section_step_con.active").before("<div class='dim200 ty2'></div>");
		} else if (obj == "header") {
			$("body").css({ "margin-right": getScrollbarWidth() });
			$("body").css({ "overflow": "hidden" });
			$(".header").before("<div class='dim200'></div>");
		} else {
			//$("body").css({"overflow" : "hidden"}).prepend("<div class='dim'></div>");
			$("body").css({ "margin-right": getScrollbarWidth() });
			$("body").css({ "overflow": "hidden" });
			$(".header").before("<div class='dim200'></div>");
		}

		if ($(".header.ty3").length > 0) {
			$(".header.ty3").css({ "z-index": "inherit" });
		}
		if ($(".header.fixed").length > 0) {
			$(".header.fixed").css({ "z-index": "99" });
		}
	}
};


function createOverlay_new(obj) {
    if ($(".dim3").length < 1) {
        if (obj == "reserve") {
            $(".section_step_con.active").prepend("<div class='dim3 ty2'></div>");
        } else if (obj == "header") {
            $("body").css({ "margin-right": getScrollbarWidth() });
            $("body").css({ "overflow": "hidden" });
            $(".header").prepend("<div class='dim3'></div>");
        } else {
            //$("body").css({"overflow" : "hidden"}).prepend("<div class='dim'></div>");
            $("body").css({ "margin-right": getScrollbarWidth() });
            $("body").css({ "overflow": "hidden" });
            $(".header").prepend("<div class='dim3'></div>");
        }

        if ($(".header.ty3").length > 0) {
            $(".header.ty3").css({ "z-index": "inherit" });
        }
        if ($(".header.fixed").length > 0) {
            $(".header.fixed").css({ "z-index": "100" });
        }
    }
};

function removeOverlay(){
	//$("body").css({"overflow" : "inherit"});
	$("body").removeAttr("style");
	$(".dim").remove();

	if ($(".header.ty3").length > 0){
		$(".header.ty3").css({"z-index" : ""});
	}
	if ($(".header.fixed").length > 0){
		$(".header.fixed").css({"z-index" : ""});
	}
};

function removeOverlay_new() {    
    $("body").css({"overflow" : "inherit"});
    $("body").removeAttr("style");
    $(".dim3").remove();

    if ($(".header.ty3").length > 0) {
        $(".header.ty3").css({ "z-index": "" });
    }
    if ($(".header.fixed").length > 0) {
        $(".header.fixed").css({ "z-index": "" });
    }
};

function removeOverlay200() {
	$("body").css({ "overflow": "inherit" });
	$("body").removeAttr("style");
	$(".dim200").remove();

	if ($(".header.ty3").length > 0) {
		$(".header.ty3").css({ "z-index": "" });
	}
	if ($(".header.fixed").length > 0) {
		$(".header.fixed").css({ "z-index": "" });
	}
};

function openLayer(obj, btn){
	// 이벤트 버블링 방지
	// event.stopPropagation();
	if (event) { (event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true; }
	createOverlay();
	$(obj).addClass("active").attr("tabindex", "0").focus();
	layerAccessiblillty(obj);
	//focus돌아올 임시클래스 생성
	$(btn).addClass("btnFocus");

	//tabIndex
	//<a href="#none" data-tab="0">  data-tab="0" 속성이면 tabIndex 패스
	if ($(obj).find("a")[0] != undefined && $(obj).find("a")[0].dataset != undefined && $(obj).find("a")[0].dataset.tab != "0") {
		$(obj).find("a").attr("tabIndex", "0");
	}
	$(obj).find(".txtTabIndex").attr("tabIndex", "0");

	//위치
	var objWdh = $(obj).outerWidth();
	var objHgt = $(obj).outerHeight();

	if ($(btn).hasClass("btn_menu_all")){
		//gnb전체메뉴
		if ($(".header").hasClass("fixed")){
			$(obj).css({"left" : "50%", "top" : "44px", "margin-left" : -objWdh / 2});
		} else {
			$(obj).css({"left" : "50%", "top" : "70px", "margin-left" : -objWdh / 2});
		}
	} else {
		$(obj).css({"left" : "50%", "top" : "50%", "margin-top" : -objHgt / 2, "margin-left" : -objWdh / 2});
	}
}

function openLayer200(obj, btn) {
	// 이벤트 버블링 방지
	// event.stopPropagation();
	if (event) { (event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true; }
	createOverlay200();
	$(obj).addClass("active").attr("tabindex", "0").focus();
	layerAccessiblillty(obj);
	//focus돌아올 임시클래스 생성
	$(btn).addClass("btnFocus");

	//tabIndex
	//<a href="#none" data-tab="0">  data-tab="0" 속성이면 tabIndex 패스
	if ($(obj).find("a")[0] != undefined && $(obj).find("a")[0].dataset != undefined && $(obj).find("a")[0].dataset.tab != "0") {
		$(obj).find("a").attr("tabIndex", "0");
	}
	$(obj).find(".txtTabIndex").attr("tabIndex", "0");

	//위치
	var objWdh = $(obj).outerWidth();
	var objHgt = $(obj).outerHeight();

	if ($(btn).hasClass("btn_menu_all")) {
		//gnb전체메뉴
		if ($(".header").hasClass("fixed")) {
			$(obj).css({ "left": "50%", "top": "44px", "margin-left": -objWdh / 2 });
		} else {
			$(obj).css({ "left": "50%", "top": "70px", "margin-left": -objWdh / 2 });
		}
	} else {
		$(obj).css({ "left": "50%", "top": "50%", "margin-top": -objHgt / 2, "margin-left": -objWdh / 2 });
	}
}

// 레이어팝업 멀티(개발에서 활용)
function openLayerMulti(obj, btn) {
	createOverlayMulti();
	$(obj).addClass("active").attr("tabindex", "0").focus();
	layerAccessiblillty(obj);
	//focus돌아올 임시클래스 생성
	$(btn).addClass("btnFocus");

	//위치
	var objWdh = $(obj).outerWidth();
	var objHgt = $(obj).outerHeight();

	if ($(btn).hasClass("btn_menu_all")) {
		//gnb전체메뉴
		if ($(".header").hasClass("fixed")) {
			$(obj).css({ "left": "50%", "top": "44px", "margin-left": -objWdh / 2 });
		} else {
			$(obj).css({ "left": "50%", "top": "70px", "margin-left": -objWdh / 2 });
		}
	} else {
		$(obj).css({ "left": "50%", "top": "50%", "margin-top": -objHgt / 2, "margin-left": -objWdh / 2 });
	}

	btnCloseLayerMulti();
}
function createOverlayMulti(obj) {
	if ($(".dimMulti").length < 1) {
		if (obj == "reserve") {
			$(".section_step_con.active").before("<div class='dimMulti ty2'></div>");
		} else if (obj == "header") {
			$("body").css({ "margin-right": getScrollbarWidth() });
			$("body").css({ "overflow": "hidden" });
			$(".header").before("<div class='dimMulti'></div>");
		} else {
			$("body").css({ "margin-right": getScrollbarWidth() });
			$("body").css({ "overflow": "hidden" });
			$(".header").before("<div class='dimMulti'></div>");
		}

		if ($(".header.ty3").length > 0) {
			$(".header.ty3").css({ "z-index": "inherit" });
		}
		if ($(".header.fixed").length > 0) {
			$(".header.fixed").css({ "z-index": "99" });
		}
	}
};
function removeOverlayMulti() {
	$("body").removeAttr("style");
	$(".dimMulti").remove();

	if ($(".header.ty3").length > 0) {
		$(".header.ty3").css({ "z-index": "" });
	}
	if ($(".header.fixed").length > 0) {
		$(".header.fixed").css({ "z-index": "" });
	}
};
function closeLayerMulti() {
	removeOverlayMulti();
	$(".layerMultiType.active").removeClass("active").removeAttr("tabindex");
	//focus돌아오고 임시 클래스 삭제
	$(".btnFocus").focus().removeClass("btnFocus");
}
function btnCloseLayerMulti() {
	$(".btnCloseLayerMulti").click(function () {
		if ($(".layerMultiType li").length <= 1) {
			if ($(this).parents("li").find("input[type='checkbox']").length > 0) {
				if (!$(this).parents("li").find("input[type='checkbox']").is(":checked")) {
					return;
				}
			}
			$(this).parents(".layerMultiType").removeClass("active").hide();
			closeLayerMulti();
		} else if ($(this).parents('.layerMultiType > li').is(':last-child')) {
			if ($(this).parents("li").find("input[type='checkbox']").length > 0) {
				if (!$(this).parents("li").find("input[type='checkbox']").is(":checked")) {
					return;
				}
			}
			$(this).parents(".layerMultiType").removeClass("active").hide();
			$(this).parents(".layerMultiType").removeAttr("style");
			$(this).parents(".layerMultiType > li").last().hide();
			$(this).parents(".layerMultiType").children('li').first("li").show();
			closeLayerMulti();
		} else {
			if ($(this).parents("li").find("input[type='checkbox']").length > 0) {
				if (!$(this).parents("li").find("input[type='checkbox']").is(":checked")) {
					return;
				}
			}
			$(this).parents(".layerMultiType > li").hide();
			$(this).parents(".layerMultiType > li li").show();
			$(this).parents(".layerMultiType > li").next("li").show();
		}
		$(".tempZindex").css({ "z-index": "inherit" }).removeClass("tempZindex");
		if ($(this).hasClass("CloseLayerSaving") == true) {
			$(".article_payment_fin > .inner").animate({ "margin-right": "0" }, "fast", function () {
				$(".article_payment_fin").removeClass("side");
			});
		}
	});

	$(".btnCloseLayerMultiCancel").click(function () {
		closeLayerMulti();
	});

}
// 발렌타인 무비타로 카드섞기 : 팝업창 지연
function openLayerdelay(obj, btn) {
	(event.stopPropagation) ? event.stopPropagation() : event.cancelBubble = true;
	setTimeout(function () {
		createOverlay();
		$(obj).addClass("active").attr("tabindex", "0").focus();
		layerAccessiblillty(obj);
		//focus돌아올 임시클래스 생성
		$(btn).addClass("btnFocus");
		//위치
		var objWdh = $(obj).outerWidth();
		var objHgt = $(obj).outerHeight();

		if ($(btn).hasClass("btn_menu_all")) {
			//gnb전체메뉴
			if ($(".header").hasClass("fixed")) {
				$(obj).css({ "left": "50%", "top": "44px", "margin-left": -objWdh / 2 });
			} else {
				$(obj).css({ "left": "50%", "top": "70px", "margin-left": -objWdh / 2 });
			}
		} else {
			$(obj).css({ "left": "50%", "top": "50%", "margin-top": -objHgt / 2, "margin-left": -objWdh / 2 });
		}
	}, 1000); // 팝업 뜨는 딜레이 시간
}
function openLayerReserve(obj, btn) {
	$(obj).addClass("active").attr("tabindex", "0").focus();
	layerAccessiblillty(obj);
	$(btn).addClass("btnFocus");
}
function openLayerReserve_new(obj, btn) {
	$(obj).addClass("active").attr("tabindex", "0").focus();
	layerAccessiblillty(obj);
	$(btn).addClass("btnFocus");
	createOverlay();
	//위치
	var objWdh = $(obj).outerWidth();
	var objHgt = $(obj).outerHeight();

	if ($(btn).hasClass("btn_menu_all")) {
		//gnb전체메뉴
		if ($(".header").hasClass("fixed")) {
			$(obj).css({ "left": "50%", "top": "44px", "margin-left": -objWdh / 2 });
		} else {
			$(obj).css({ "left": "50%", "top": "70px", "margin-left": -objWdh / 2 });
		}
	} else {
		$(obj).css({ "left": "50%", "top": "50%", "margin-top": -objHgt / 2, "margin-left": -objWdh / 2 });
	}

}

function openLayerReserve_new2(obj, btn) {
    $(obj).addClass("active").attr("tabindex", "0").focus();
    layerAccessiblillty(obj);
    $(btn).addClass("btnFocus");
    createOverlay_new();
    //위치
    var objWdh = $(obj).outerWidth();
    var objHgt = $(obj).outerHeight();

    if ($(btn).hasClass("btn_menu_all")) {
        //gnb전체메뉴
        if ($(".header").hasClass("fixed")) {
            $(obj).css({ "left": "50%", "top": "44px", "margin-left": -objWdh / 2 });
        } else {
            $(obj).css({ "left": "50%", "top": "70px", "margin-left": -objWdh / 2 });
        }
    } else {
        $(obj).css({ "left": "50%", "top": "50%", "margin-top": -objHgt / 2, "margin-left": -objWdh / 2 });
    }

}

function openLayerReserveDim(obj, btn, art){
	createOverlay("reserve");
	//결제페이지 안의 레이어팝업(.layer_wrap)의 z-index 값과 같아야 함
	$("."+art).addClass("tempZindex").css({"z-index" : "80"});
	openLayerReserve(obj, btn);
}
function closeLayer(obj){
	removeOverlay();
	$(".layer_wrap.active:not(.layerMultiType):not(.layer_wrap200)").removeClass("active").removeAttr("tabindex");
	//focus돌아오고 임시 클래스 삭제
	$(".btnFocus:not(.layerMultiType):not(.layer_wrap200)").focus().removeClass("btnFocus");

	if (obj != null && obj != undefined) {
		$(obj).find("a").attr("tabIndex", "-1");
		$(obj).find(".txtTabIndex").attr("tabIndex", "-1");
	}
}
function closeLayer200(obj) {
	removeOverlay200();
	$(".layer_wrap200.active:not(.layerMultiType)").removeClass("active").removeAttr("tabindex");
	//focus돌아오고 임시 클래스 삭제
	$(".btnFocus:not(.layerMultiType)").focus().removeClass("btnFocus");

	if (obj != null && obj != undefined) {
		$(obj).find("a").attr("tabIndex", "-1");
		$(obj).find(".txtTabIndex").attr("tabIndex", "-1");
	}
}
function closeLayer_obj(obj) {
	removeOverlay_new();
	$(obj).removeClass("active").removeAttr("tabindex");
	//focus돌아오고 임시 클래스 삭제
	$(".btnFocus").focus().removeClass("btnFocus");

	if (obj != null && obj != undefined) {
		$(obj).find("a").attr("tabIndex", "-1");
		$(obj).find(".txtTabIndex").attr("tabIndex", "-1");
	}
}
function btnCloseLayer(){
	$(".btnCloseLayer").off().on("click", function(){
		closeLayer();
		$(".tempZindex").css({"z-index" : "inherit"}).removeClass("tempZindex");
		if ($(this).hasClass("CloseLayerSaving") == true){
			$(".article_payment_fin > .inner").animate({"margin-right" : "0"}, "fast", function(){
				$(".article_payment_fin").removeClass("side");
			});
		}
	});
}

function closeLayer_new() {    
    removeOverlay_new();
    $(".layer_wrap.layer_Combi_Notice.active").removeClass("active").removeAttr("tabindex");
    //focus돌아오고 임시 클래스 삭제
    $(".btnFocus").focus().removeClass("btnFocus");
}

function btnCloseLayer_new() {
    $(".btnCloseLayer_new").off().on("click", function () {
        closeLayer_new();
        $(".tempZindex").css({ "z-index": "inherit" }).removeClass("tempZindex");
        if ($(this).hasClass("CloseLayerSaving") == true) {
            $(".article_payment_fin > .inner").animate({ "margin-right": "0" }, "fast", function () {
                $(".article_payment_fin").removeClass("side");
            });
        }
    });
}


function layerAccessiblillty(obj){
	// when layer popup open, focus roop
	document.onkeydown = function (e) {
		e = e || window.event;
		if (e.shiftKey && e.keyCode == 9){
			if (document.activeElement == obj) {
				$(obj).find(".txtTabIndex:last-child").attr("tabindex", "0").focus();
			}
			return;
		}
	}
	document.onkeyup = function(e){
		e = e || window.event;
		// esc
		if(e.keyCode == 27){
			closeLayer();
		}
		//focus roop : shitf+tab
		else if (e.shiftKey && e.keyCode == 9){
			if (document.activeElement == obj){
				$(obj).find(".txtTabIndex:last-child").attr("tabindex", "0").focus();
			}
			return;
		}
		//focus roop : tab
		else if (e.keyCode == 9){
			if ($(document.activeElement).is(".txtTabIndex:last-child")){
				$(obj).attr("tabindex", "0").focus();
			};
		}
	}
}

function reserveListItem(){
	$(".list_pay_item li button").off().on("click", function(){
		$(this).addClass("active").parent("li").siblings("li").children("button").removeClass("active");
	});
}

//마이페이지 : MY영화관설정
function myCinemaReg(){
	$(".my_cinema_reg .depth1 > a").off().on("click", function(e){
		e.preventDefault();
		$(this).attr("title", "선택됨").siblings(".depth2").show();
		$(this).parent(".depth1").addClass("active").siblings("li").removeClass("active").find(".depth2").hide();
		$(this).parent(".depth1").siblings("li").find("> a").removeAttr("title");
	});
	$(".my_cinema_reg .depth2 li a").off().on("click", function(){
		if ($(this).parent("li").hasClass("active") == false){
			$(this).parent("li").addClass("active");
		} else {
			$(this).parent("li").removeClass("active");
		}
	});
}

function toggleWrap(){
	$(".toggle_wrap .btn_toggle").off().on("click", function(){
		if ($(this).hasClass("active")){
			$(this).removeClass("active").text($(this).text().replace("닫기", "열기"));
			$(this).parents(".toggle_wrap").find(".toggle_con").removeClass("active");
		} else {
			$(this).addClass("active").text($(this).text().replace("열기", "닫기"));
			$(this).parents(".toggle_wrap").find(".toggle_con").addClass("active");
		}
	});
}

function reserveStep(){
    $(".section_step_tit li a").off().on("click", function () {
        if (!$(this).parents("li").hasClass("disabled")) {
            $(this).parents("li").addClass("active");
            $(this).parents("li").prevAll().removeClass("active").addClass("prev");
            $(this).parents("li").nextAll().removeClass();
        }
	});
}

function gnbMenu(){
	//전체메뉴
	/*
	$(".gnb .btn_menu_all").off().on("click", function(){
		createOverlay("header");
		$(".menu_all_wrap").addClass("active");
	});
	*/

	$(".menu_all_wrap .group_close .btn_close").off().on("click", function(){
		removeOverlay();
		$(".menu_all_wrap").removeClass("active");
	});
	//바로예매
	$(".gnb .btn_reserve").off().on("mouseenter focusin", function(){
		$(".menu_reserve_wrap").addClass("active");
	});
	$(".gnb .g_menu3 li:has(.btn_reserve)").off().on("mouseleave", function(){
		$(".menu_reserve_wrap").removeClass("active");
	});
	$(".gnb .menu_reserve_wrap li:last-child a").off().on("focusout", function(){
		$(".menu_reserve_wrap").removeClass("active");
	});
}



/***********************************************
	* style2
************************************************/
// 별점
function starRate(){
	var $starElm = $('.star_rate .star')
	var total = $('.star_rate .star').length
	var $currentCount = $('.star_num strong')
	var $totalCount = $('.star_num em')

	/*
	$starElm.click(function(){
		$(this).parent().children('.star').removeClass('on');
		$(this).addClass('on').prevAll('.star').addClass('on');
		return false;
	});
	*/


	$starElm.bind('click mouseenter focusin',function(){
		$(this).parent().children('.star').removeClass('on');
		$(this).addClass('on').prevAll('.star').addClass('on');
		return false;
	})


	$totalCount.text(total)
	$currentCount.text('1')

	$starElm.on('click',function(){
		var current = $(this).index()+1
		$currentCount.text(current)
	})
}

// 관람평 별점 5개 : 드래그 방식
function startRateHalfDrag() {
	var $starElm = $('.star_rate .star'),
		total = $('.star_rate .star').length,
		$currentCount = $('.score_info em'),
		$totalCount = $('.score_info em');

	$starElm.on('click mouseenter focusin', function () {
		$(this).parent().children('.star').removeClass('on');
		$(this).addClass('on').prevAll('.star').addClass('on');
		return false;
	})

	//$totalCount.text(total);
	//$currentCount.text('10');

	$starElm.on('click mouseenter focusin', function () {
		var current = $(this).index() + 1;
		$currentCount.text(current)
	})
}

//영화상세
/*
function pstHover() {
	var $pstElm = $('.poster_info')
	$pstElm.mouseover(function(){
		$(this).parents('ul').find('li').removeClass('active')
		if(!$(this).parents('li').hasClass('active'))	{
			$(this).parents('li').addClass('active')
			vtMid()
		}
	})
}
*/

//영화상세
function moviePosterHover(){
	$(".movie_list .poster_info, .main_movie_list .poster_info").parents('.movie_list, .main_movie_list').find('li, .item').on('mouseenter focusin', function(){
		//$(this).attr('tabindex', '0').focus();
		$(this).addClass('active');
		vtMid();
	}).on('mouseleave focusout',function(){
		$(this).parents('.movie_list, .main_movie_list').find('li, .item').removeClass('active');
	});
}
function vtMid() {
	$('.movie_list li .inner, .main_movie_list .item .inner').each(function(){
		var innerH = $(this).height();
		var mgt = innerH/2 * -1;
		$(this).css('margin-top',mgt);
	})
}



/***********************************************
	* style3
************************************************/
//마이페이지 티켓 열기
function ticketAccodian(){
	var $ticketTitle = $('.ticket_info li button');

	$ticketTitle.each(function(){
		$(this).off().on('click', function(){
			$ticket = $(this).parent().find('.ticket');
			$(this).attr({
				'aria-expanded' : true ,
				title: "닫기"
			}).parent().addClass('open');
			$ticket.stop().slideToggle('fast', function(){
				if(!$(this).is(':visible')){
					$(this).attr('title', '열기').attr('aria-expanded', false).parent().removeClass('open');
				}
			});
		})
	})
}

//tooltipBox
function tooltipBox(){
	$(".tooltip_box .ic_question").off().on("click", function(e){
		e.preventDefault();
		$(this).parents(".tooltip_box").addClass("open");
	});
	$(".tooltip_box .btn_close").off().on("click", function(e){
		e.preventDefault();
		$(this).parents(".tooltip_box").removeClass("open");
	});
}



/***********************************************
	* style4
************************************************/
//고객센터 FAQ - 테이블 아코디언
function tableAccodian(){
	var $accHead = $('.tb_acc_wrap .acc_head');
	var $accBody = $('.tb_acc_wrap .acc_body');
	$accBody.hide().find('td>div').hide();
	$accHead.each(function(){
		$(this).off().on('click', function() {
			var $this = $(this);
			// Reset
			$this.siblings('.acc_head').removeClass('active').attr('aria-expanded', false).find('a').attr('title', '열기');
			$this.siblings('.acc_body').removeClass('active').each(function(){
				$(this).find('td>div').stop().slideUp(500, function () {
					$(this).closest('.acc_body').hide();
				});
			})
			// Target Toggle
			var $body = $this.next('.acc_body');
			if($this.hasClass('active')){
				$this.removeClass('active').attr('aria-expanded', false).find('a').attr('title', '열기');
				$body.find('td>div').stop().slideUp(500, function(){
					$body.hide().removeClass('active')
				});
			}else{
				$this.addClass('active').attr('aria-expanded', true).find('a').attr('title', '닫기');
				$body.show().find('td>div').stop().slideDown(500, function(){
					$body.addClass('active')
				});
			}
		})
	})
}
// 우리동네영화관 - 아코디언메뉴
function accodianMenu(){
	var $tit = $('.ev_bn_wrap .bn_tit');

	$tit.each(function(){
		// 예외처리
		if($(this).hasClass('active')){
			$(this).next('.bn_cont').stop().slideDown(500)
		}
		$(this).off().on('click', function(){
			var $this = $(this)
			// Reset
			$this.parents('li').siblings('li').find('.bn_tit').removeClass('active').attr({ 'aria-expanded': false, 'title': '열기' });
			$this.parents('li').siblings('li').find('.bn_cont').stop().slideUp(500);
			// Target Toggle
			$this.toggleClass('active');
			if (!$this.hasClass('active')) {
				$this.attr({ 'aria-expanded': false, 'title': '열기' })
				$this.next('.bn_cont').stop().slideUp(500)
			} else {
				$this.attr({ 'aria-expanded': true, 'title': '닫기' })
				$this.next('.bn_cont').stop().slideDown(500)
			}
		})
	})
}
//form - input 삭제버튼
function inputDel(){
	var $btn = $('.bx_del .btn_del');
	$btn.each(function(){
		$(this).off().on('click',function(){
			$(this).siblings('input[type="text"]').val('');
		})
	})
}
//form - file
function inputFile() {
	var $fileBox = $('.bx_file');
	$.each($fileBox, function (idx) {
		var $this = $fileBox.eq(idx),
			$btnUpload = $this.find('[type="file"]'),
			$fileItem = $this.find('.file_item'),
			$btn = $this.find('label');

		$btnUpload.on('change', function () {
			var $target = $(this),
				fileName = $target.val();
			$fileItem.show().find('span').text(fileName);
		})

		$fileItem.find('.btn_del').off().on('click', function(){
			$fileItem.find('span').text('')
			$fileItem.hide();
		})
	})
}

// 버튼 클릭시, 해당 카테고리 Active
function viewComment() {
	var $bxCategory = $('.bx_category_slct');
	var $item = $bxCategory.find('button');
	$item.on("click", function () {
		var $this = $(this),
			$sibling = $this.siblings('button');

		if($sibling.hasClass('active')){ $sibling.removeClass('active') }
		$this.addClass('active');
	});
}
// 버튼 토글
function toggleBtn() {
	var $target = $('.btnToggle');
	$target.each(function () {
		$(this).off().on('click', function () {
			// 이벤트 버블링 방지
			event.stopPropagation();
			$(this).toggleClass('active')
		})
	});
}
// 시네마폴 투표
function voteClick(){
	var $vote = $('.vote_list_wrap li');
	var $itm = $vote.find('.vote_itm');
	$itm.on('click', function(){
		$(this).toggleClass('active')
	})
}
// 할인안내 마우스 오버시, 콘텐츠 show
function listOver(){
	var $itm = $('#card_list > li > a');
	/*
	$itm.mouseenter(function(){
		$(this).find('.itm_detail').show();
	});
	$itm.find('.itm_detail').mouseleave(function () {
		$(this).hide();
	})
	*/
	$itm.on("mouseenter focusin keyup", function () {
		$itm.trigger("blur");
		$(this).find('.itm_detail').addClass("active");
	})
	$itm.on("mouseleave focusout blur", function(){
		$(this).find('.itm_detail').removeClass("active");
	})
}

// 공지사항 롤링 배너
var setRolling = "";
function rolling() {
	var rHeight = $('.rolling_menu_wrap').height();
	var $rollWrap = $('.rolling_menu');
	var itmLen = $rollWrap.find('li').length;
	var max = rHeight * itmLen;
	var y = 0;
	if(itmLen<=1){
		return;
    } else {
        if (setRolling == "") {
            setRolling = setInterval(function () {
                y += rHeight;
                $rollWrap.animate({
                    "top": -y
                }, 500, function () {
                    if (y >= max) {
                        $(this).css("top", 0);
                        y = 0;
                    }
                })
            }, 3000);
        }

		$rollWrap.append($rollWrap.children('li:first-child').clone());
	}
}

// 팝업 고정스크롤
function fixScroll(tScroll, target) {
	var wScroll, hHeight, isFix;
	tScroll = target.offset().top

	//예외처리
	if (target.length < 1) { return; }
	// 스크롤시 quick 메뉴 고정
	$(window).scroll(function () {
		// header fix height
		hHeight = $('.header.fixed').height();
		if ($('#nav').find('li').hasClass('active')) {
			hHeight += $('#nav').find('li.active').find('div').height();
		}


		wScroll = $(window).scrollTop();
		isFix = (wScroll + hHeight - tScroll) > 0 ? true : false;

		// // 퀵메뉴 상단 고정
		if (isFix) { target.addClass('fixed').css({'top': hHeight + 10}); }
		// // 퀵메뉴 기존위치
		else { target.removeClass('fixed').css({'top': tScroll - wScroll}) }
	});

}
// Quick Menu
function quickMenu() {
	var $quickMenu = $('.quick_menu');
	var $quickWrap = $('.quick_wrap');

	//예외처리
	if ($quickMenu.length < 1) { return; }

	// 초기 위치값 지정 (메인/상세)
	if ($('#contents').hasClass('contents_main')) {
		$quickWrap.css({ 'padding-top': $('.main_cont_wrap.special').position().top - $('.contents_main').position().top })
	} else {
		$quickWrap.css({ 'padding-top': $('#contents').css('padding-top') })
	}

	var qScroll = $quickMenu.position().top;
	fixScroll(qScroll, $quickMenu);

	// top 버튼 클릭시 상단으로 이동
	$('.qick_top').off().on('click', function () {
		$('html, body').stop().animate({
			scrollTop: 0
		}, 500, function () {
			// focus 처리
			$('.skip_nav').attr('tabindex', '0').focus()
		})
	})
}

// Layer popup fix
function scrollPopup() {
	var $child = $('.banner_side_wrap').children();
	var bScroll;

	//type banner_01
	if ($child.hasClass('banner_01')) {
		// 초기 위치값 지정
		if ($('.visual_top').length < 1) {
			$('.banner_side_wrap').css({ top: 485 })
		}else{
			$('.banner_side_wrap').css({ top: $('#contents').position().top - 50 })
		}
		bScroll = $child.position().top;
	}
	else { return; } //예외처리

	fixScroll(bScroll, $child);
}

// 전체 팝업 오픈
function dimPopup() {
	var target = $('.banner_dim_wrap');
	var isOpen = (target.css('display')=='block') ? true : false ;

	//예외처리
	if(target.length < 1) { return;}

	if(isOpen){ createOverlay(); }
	else{ return; }
}

// popup Close
function closePopup() {
	var $banner = $('div[class^="banner_"]');
	$banner.each(function () {
		var todayCheck = $(this).find('#todayCookie').prop('checked');
		var $close = $(this).find('.btn_close');
		$close.on('click', function () {
			$(this).parents('div[class^="banner_"]').remove();
		})
	})
}
//User Agent - Browser check
function BrowserAgent() {
	var _ua = navigator.userAgent;
	var result = "";

	//IE 11,10,9,8
	var trident = _ua.match(/Trident\/(\d.\d)/i);
	if (trident != null) {
		if (trident[1] == "7.0") {
			$('body').addClass('IE11')
			return result = "IE" + 11;
		}
		if (trident[1] == "6.0") {
			$('body').addClass('IE10')
			return result = "IE" + 10;
		}
		if (trident[1] == "5.0") {
			$('body').addClass('IE9')
			return result = "IE" + 9;
		}
		if (trident[1] == "4.0") {
			$('body').addClass('IE8')
			return result = "IE" + 8;
		}
	}

	//IE 7...
	if (navigator.appName == 'Microsoft Internet Explorer') {
		$('body').addClass('IE7')
		return result = "IE" + 7;
	}

	//other
	var agt = _ua.toLowerCase();
	if (agt.indexOf("chrome") != -1) return result = 'Chrome';
	if (agt.indexOf("opera") != -1) return result = 'Opera';
	if (agt.indexOf("staroffice") != -1) return result = 'Star Office';
	if (agt.indexOf("webtv") != -1) return result = 'WebTV';
	if (agt.indexOf("beonex") != -1) return result = 'Beonex';
	if (agt.indexOf("chimera") != -1) return result = 'Chimera';
	if (agt.indexOf("netpositive") != -1) return result = 'NetPositive';
	if (agt.indexOf("phoenix") != -1) return result = 'Phoenix';
	if (agt.indexOf("firefox") != -1) return result = 'Firefox';
	if (agt.indexOf("safari") != -1) return result = 'Safari';
	if (agt.indexOf("skipstone") != -1) return result = 'SkipStone';
	if (agt.indexOf("netscape") != -1) return result = 'Netscape';
	if (agt.indexOf("mozilla/5.0") != -1) return result = 'Mozilla';
}

//스페셜관 (gif효과)
function imgGif(){
    $('.section').find('.img_secondary').each(function(){
        var obj = $(this).children()
        if (obj.length>1){
            setInterval(function(){
                obj.eq(1).toggleClass('fade_out');
            }, 5000);
        };
    })
}

function mainSpecialLogo() {
	//PC 메인 스페셜관 이미지간격 일정하게 수정
	var mainSp_totalWidth = 0,
		mainSp_Li = $('.special_wrap2 li')
		mainSp_Liimg = $('.special_wrap2 li img'),
		mainSp_allWidth = $('.special_wrap2').outerWidth(), //전체 가로길이
		mainSp_imgLength = $('.special_wrap2 li').length;

	mainSp_Liimg.each(function (index) {
		//각각의 이미지 가로길이 합
		mainSp_totalWidth = mainSp_totalWidth + mainSp_Liimg.eq(index).outerWidth();
	});

	//각각의 이미지 가로길이 합과 전체 가로길이를 뺀 공간을 나누어 이미지의 좌측 여백으로 사용
	var mainSp_blankWidth = mainSp_allWidth - mainSp_totalWidth,
		mainSp_padleft = parseInt(mainSp_blankWidth / mainSp_imgLength);

	mainSp_Li.css('padding-left', mainSp_padleft);
	mainSp_Li.first().css('padding-left', '13px');
}

//간편결제 즉시할인
function paySimple() {
    $(".article_pay_simple li button").on('click', function () {
        var $this = $(this),
            $target = $(".article_pay_simple .toggle_wrap"),
            chk = $this.attr("data-chk"),
            info = $this.attr("data-info");
        chk ? $target.show() : $target.hide();
        info && $target.find("label").text(info);
    });
}


// 주문/결제 : 추가 선택한 상품 삭제 2020.08.14
function fn_addSelectprodClose() {
    var $addSelectprodClose = $('.addprodlist.selected .pay_movie_infor .btn_close');

    $addSelectprodClose.on('click', function () {
        console.log('111')
        $(this).parent().parent('li').hide();
    });
}

// 팝업 : 추가상품 구매 2020.08.14
function fn_addProdinfo() {
    var $addProdinfoBtn = $('.wrap_pay_addprodbuy_info .pay_addprodbuy_info .icon_arrowup');

    $addProdinfoBtn.on('click', function () {
        if (!$(this).parent().siblings('.useinfo').hasClass('active')) {
            $(this).parent().siblings('.useinfo').addClass('active');
            $(this).addClass('active');
        } else {
            $(this).parent().siblings('.useinfo').removeClass('active');
            $(this).removeClass('active');
        }
    });
}

// 상단 광고 배너 닫을 때 : 멤버십 탭 2021.02.16
function fn_membershipTopinBanner() {
	var $target = $('#main_top_of_top_banner .btn_close');

	$target.on('click', function () {
		if ($('#contents .contents_friends').hasClass('changed')) {
			$('#contents .contents_friends').removeClass('changed');
		} else if ($('#contents .contents_vip').hasClass('changed')) {
			$('#contents .contents_vip').removeClass('changed');
		} else {
			return false;
		}
	});
}

// 멤버십 탭 : 상단 광고 배너 체크 2021.02.16
function fn_membershipTabinBanner() {
	if ($('#main_top_of_top_banner').hasClass('banner_top_wrap')) {
		$('#contents .contents_friends').addClass('changed')
		$('#contents .contents_vip').addClass('changed')
	} else {
		$('#contents .contents_friends').removeClass('changed')
		$('#contents .contents_vip').removeClass('changed')
	}
}

// vip 쿠폰 다운로드 영화 혜택 타입 선택
function fn_vipcoupontypechk() {
	var $target = $('.box_list .selectbox input'),
		$change = $('.box_list .selectbox dl');

	$target.change(function () {
		var $this = $(this);
		var checked = $this.prop('checked'); // checked 문자열 참조(true, false)
		if (checked) {
			$target.attr('title', '선택해제');
			$this.attr('title', '선택됨');
			$change.removeClass('active');
			$this.siblings().children('dl').addClass('active');
		} else {
			$change.siblings().removeClass('active');
		}
	});
}

// 숫자 카운트 애니매이션 : 영잘알, 눈치
function fn_counterAnima() {
	var $target = $('.fn_counterAnimaTarget');
	$target.each(function () {
		// 2. prop(), Counter라는 속성을 생성한 뒤 0으로 초기화 한다.
		$(this)
			.prop('Counter', 0)
			// 3. animate(), 각각의 text를 받아와 Counter에 넣어 애니메이트한다.
			.animate(
				{
					Counter: $(this).text(),
				},
				// 4. 부드러운 애니메이션을 만들기 위해 속성을 지정한다.
				{
					duration: 2000,
					easing: 'swing',
					// 5. step(), 애니메이션 과정을 받아온다.
					step: function (now) {
						// 6. 소숫점을 올려서 반환된 정수를 표시한다.
						$(this).text(Math.ceil(now));
					},
				}
			);
	});
}