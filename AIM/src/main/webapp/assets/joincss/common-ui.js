/* 목록
	* currentScreen
		가로폭 기준 mobile / tablet / pc 구분값 출력

	* modal_init
		모달 레이어팝업

	* post_step
		주소검색

	* toast_pop
		토스트 팝업

	* fn_tab
		공통탭
		ex) 우편번호 버튼 : 주소 검색 기능의 도로명/지번 주소 탭

	* uiTrigger
		placeholder 기능
		선택안함 체크박스
		disabled 토글기능

	* allCheckControl
		전체동의 체크 기능

	* radioAccodion
		라디오 아코디언 기능

	* chkIE9
		IE9 브라우저일 경우 body 에 클래스 ie9 추가

	* formElFocus
		input, select 요소 포커스 시 클래스 추가 (iOS app 대응)
*/


/* 가로폭 기준 분기점 체크 */
var currentScreen = function(){
	var _screen;
	if($(window).outerWidth() <= 680){
		_screen = '__mobile';
	}else if($(window).outerWidth() <= 1024){
		_screen = '__tablet';
	}else{
		_screen = '__pc';
	}
	return _screen;
};

/* 모달 레이어팝업 */
var modal_init = function(id,size){
	var scrollPos = $(window).scrollTop(),	// 모달활성화 시, 스크롤 초기값
		_modals = $('.modal-container'),
		_el = $('#'+id),
		_modalBtn = _el.parent('.inner').find('.ui-button');	// 모달 활성화 버튼

	_modals.addClass(currentScreen);
	_el.addClass('active');

	$('html, body').addClass('dimmed-layer-open');	// 추가 부모창 스크롤 방지
	if (currentScreen() !='__pc'){
		$('body').addClass('layer-type-full');	// 오픈한 레이어 팝업 풀사이즈 클래스 추가
	}

	// 약관 iframe 처리
	if(id.indexOf('term-code-agree') >= 0){
		try {
			var agreement = $('#'+id+' iframe').contents().find('body').html();
			$('#'+id+' .modal-contents').html(agreement);
		} catch(e) {
			// 해당파일이 없을 때
		}
	}

	$('body').append('<div class="modal-dimmed"></div>');

	if(size && currentScreen()=='__pc'){
		_el.width(size);
		_modals.each(function(){
			$(this).css({
				'marginTop':-($(this).outerHeight()/2),
				'marginLeft':-($(this).outerWidth()/2)
			});
		});
	}else{
		_modals.removeAttr('style');
	}

	/* 제휴사 웹접근성 심사 관련 문구 수정 MYENG */
	//_el.attr('tabindex','0').find('>.modal-contents').attr('tabindex','0');
	_el.focus();

	// 리사이즈 되었을 때
	$(window).resize(function(){
		var w_size = $(window).outerWidth();
		if( w_size <= 1024){
			_modals.removeClass('__pc __tablet __mobile').addClass(currentScreen);
			$('body').addClass('layer-type-full');	// 오픈한 레이어 팝업 풀사이즈 클래스 추가
			_modals.removeAttr('style');
		} else{
			_modals.removeClass('__pc __tablet __mobile').addClass(currentScreen);
			$('body').removeClass('layer-type-full');	// 오픈한 레이어 팝업 풀사이즈 클래스 제거
			if(currentScreen()=='__pc'){
				_el.width(size);
				_modals.each(function(){
					$(this).css({
						'marginTop':-($(this).outerHeight()/2),
						'marginLeft':-($(this).outerWidth()/2)
					});
				});
			}
		}
	});

	// 모달 닫기 함수
	function closeModal() {
		_el.removeClass('active');
		$('.modal-dimmed').remove();
		$('html, body').removeClass('dimmed-layer-open');	// 스크립트로 추가된 클래스 제거
		$('body').removeClass('layer-type-full');	// 스크립트로 추가된 클래스 제거(오픈한 레이어 팝업 풀사이즈 클래스 제거)
		$(window).scrollTop(scrollPos);	// 스크롤 위치 복귀
		_modalBtn.focus();	// 모달 활성화 버튼 포커스 이동
	}

	// 모달 닫기 실행
	$('.modal-dimmed').on('click',function(){ closeModal(); });	// 딤드 부분 클릭 시
	$('.modal-closer .btn-close').on('click',function(){ closeModal(); });	// 닫기 버튼 클릭 시
};

//toast 팝업
//message : 메시지
//margin_bottom : 하단 화면과의 marginBottom
//showtime : 노출 시간. 1초 = 1000
var toast_popup = function(message, margin_bottom, showtime){
	
	// toast show time 시간
	var stime = showtime;
	if(stime == null || stime == undefined || stime == "" || stime == 0){
		stime = 3000;
	}
	
	if(margin_bottom == null || margin_bottom == undefined || margin_bottom == "" || margin_bottom == 0){
		margin_bottom = 300;
	}
	
	var strHtml = "";
	strHtml += '<div class="toast-layer">';
	strHtml += '	<span class="text-box"></span>';
	strHtml += '</div>';
	
	var winHeight = $(window).height();
	var scrollTop = $(window).scrollTop();	
	var mrgBottom = scrollTop + (winHeight - margin_bottom);
	
	if($(".toast-layer").length > 0){	// toast 표시 중일 때 한개만 노출. 신규 toast 노출 안함
		
		if($(".toast-layer").css("display") == "block"){
			return;
		} else {
			$(".toast-layer").css("top", mrgBottom);
			$(".toast-layer .text-box").text(message);
			$(".toast-layer").fadeIn(500);
		}
		
	} else { // toast 화면 없을 때
		$("body").append(strHtml);		
		$(".toast-layer").css("top", mrgBottom);
		$(".toast-layer .text-box").text(message);
		$(".toast-layer").fadeIn(500);		
	}
	
	setTimeout(function(){
		$(".toast-layer").fadeOut(500);
	}, stime);
	
};

/* 모달레이어팝업 type01 */
var popup_init = function(id){
	var scrollPos = $(window).scrollTop(),	// 모달활성화 시, 스크롤 초기값
		_modals = $('.modal-layer'),
		_el = $('#'+id),
		_modalBtn = _el.parent('.inner').find('.ui-button');	// 모달 활성화 버튼

	_modals.addClass(currentScreen);
	_el.addClass('active').animate({'bottom':'0'}, 500);;

	$('html, body').addClass('dimmed-layer-open');	// 추가 부모창 스크롤 방지
	$('body').append('<div class="modal-dimmed __oners"></div>');
	
	// 모달 닫기 함수
	function closeModal() {
		_el.removeClass('active').animate({'bottom':-$(window).height()}, 500);
		$('.modal-dimmed').remove();
		$('html, body').removeClass('dimmed-layer-open');	// 스크립트로 추가된 클래스 제거
		$('body').removeClass('layer-type-full');	// 스크립트로 추가된 클래스 제거(오픈한 레이어 팝업 풀사이즈 클래스 제거)
		$(window).scrollTop(scrollPos);	// 스크롤 위치 복귀
		_modalBtn.focus();	// 모달 활성화 버튼 포커스 이동
	}

	// 모달 닫기 실행
	$('.modal-dimmed').on('click',function(){ closeModal(); });	// 딤드 부분 클릭 시
	$('.modal-closer .btn-close').on('click',function(){ closeModal(); });	// 닫기 버튼 클릭 시
};

/* 주소검색 */
var post_step = function(id,step) {
	var _el = $('#'+id);
	var _step = $('#'+step);
	_el.find('.active .__step').removeClass('active');
	_step.addClass('active');
	if(currentScreen()=='__pc'){
		_el.css({
			'marginTop':-(_el.outerHeight()/2),
		});
	}
};

/* 공통 탭 이벤트 */
function fn_tab(el){
	var _el = $(el),
		target_name = _el.data('target'),
		tab_cont = $('.ui-tabcont');

	_el.addClass('active').siblings().removeClass();
	for (i = 0; i < tab_cont.length; i++){
		if (tab_cont.eq(i).data('tabcont') === target_name) {
			tab_cont.eq(i).addClass('active').focus().siblings().removeClass('active');
		}
	}
}

/* ui-trigger */
function uiTrigger() {
	// 초기 value 있을 때, placeholder 와 겹침 방지
	var _inputbox = $('.ui-input > input').not('input[type="hidden"]');

	if (_inputbox.length > 0) {
		for (var i=0; i < _inputbox.length; i++) {
			var _el = _inputbox.eq(i);
			( _el.val()!='' ) ? _el.parent('.ui-input').addClass('active') : _el.parent('.ui-input').removeClass('active');
		}
	}

	$('.ui-input').on('focusout','>input',function(){
		( $(this).val()!='' ) ? $(this).parent().addClass('active') : $(this).parent().removeClass('active');
	});

	$('.ui-check.__not').on('change','>input',function(event){
		var $notChkWrap = $(this).closest('.col-md'),
			$notChkEls = $notChkWrap.find('.ui-input > input, .ui-radio > input, .ui-select, button');

		($(this).prop('checked')) ? $notChkEls.attr('disabled','disabled') : $notChkEls.removeAttr('disabled');
	});
}

/* 전체동의 체크 */
function allCheckControl() {
	var chkBtn = $('.ui-check.__toggle input'),	// 전체동의 체크박스 요소
		groupName = 'ui-allchk-group',			// 연결된 모든 요소 그룹명
		btnName = 'ui-allchk-btn',				// 스크립트에서 지정한 전체동의 체크박스명
		wrapName = 'ui-allchk-wrap',			// 개별 체크박스를 감싸는 요소명
		elName = 'ui-allchk-el';				// 개별 체크박스명

	// 각 요소 구분자 지정
	for (var i=0; i < chkBtn.length; i++) {
		var _btn = chkBtn.eq(i),
			_wrap = $(_btn.attr('data-trigger')),			// 전체동의 체크 이벤트 그룹 요소
			_el = _wrap.find('input[type=checkbox]').not('.ui-check.__toggle input').not('input:disabled'),	// 그룹내 개별 체크박스 요소 (disabled 제외)
			num = i+1;

		_btn.addClass(btnName +' '+ groupName + num).attr('data-separator-number', num);		// 그룹별 전체동의 체크박스 구분자 지정
		_wrap.addClass(wrapName +' '+ groupName + num).attr('data-separator-number', num);	// 그룹별 개별 체크박스 감싸는 요소 구분자 지정
		_el.addClass(elName +' '+ groupName + num).attr('data-separator-number', num);		// 그룹별 개별 체크박스 구분자 지정
	}

	// 초기 체크여부 점검
	for (var i=0; i < chkBtn.length; i++) {
		var _btn = chkBtn.eq(i),
			_wrap = $(_btn.attr('data-trigger')),
			num = i+1,
			totalNum = $('.'+ elName +'.'+ groupName + num).length,
			chkedNum = $('.'+ elName +'.'+ groupName + num +':checked').length;

		// 전체동의 체크 여부 확인 : 그룹내 개별 체크박스 전체 체크 실행
		// 그룹내 개별 체크박스 전체 체크 확인 : 전체동의 체크박스 체크 실행
		if (_btn.prop('checked')){
			$('.'+ elName +'.'+ groupName + num).prop('checked',true);
		} else {
			_btn.prop('checked', (totalNum === chkedNum) ? true : false);
		}
	}

	// 개별 체크박스 클릭 시 이벤트
	$('.' + elName).on('click', function(){
		var separatorNum = $(this).attr('data-separator-number'),
			totalNum = $('.'+ elName +'.'+ groupName + separatorNum).length,
			chkedNum = $('.'+ elName +'.'+ groupName + separatorNum +':checked').length,
			_btn = $('.'+ btnName +'.'+ groupName + separatorNum);

		_btn.prop('checked', (totalNum === chkedNum) ? true : false);
	});

	// 전체동의 클릭시 이벤트
	$('.ui-check.__toggle').on('change','> input',function(){
		var element = $($(this).attr('data-trigger'));
		if($(this).prop('checked')){
			element.find('input').each(function(){
				if($(this).attr('disabled')!= 'disabled'){
					$(this).prop('checked',true);
				}
			});
		}else{
			element.find('input').each(function(){
				$(this).prop('checked',false);
			});
		}
	});
}

/* Radio Accodion */
function radioAccodion() {
	var $objs = $('.ui-radio-accodion').find('.ui-radio');

	// 초기설정
	for (var i = 0; i < $objs.length; i++) {
		var $radio = $objs.eq(i).find('input[type=radio]');
		if ($radio.prop('checked')){
			var $target = $($radio.data('trigger'));
			$target.addClass('active');
		}
	}
	// radio 클릭 시, 이벤트
	$('.ui-radio-accodion').on('click', '.ui-radio', function(){
		var $this = $(this),
			$target = $($this.find('input').data('trigger')),
			$radioAcco = $this.closest('.ui-radio-accodion'),
			$expObjs = $this.closest('.inner-content');
		if ($expObjs.length > 0) {
			$expObjs.find('.inner-content').removeClass('active');
			$target.addClass('active');
		} else {
			$this.closest('.ui-radio-accodion').find('.inner-content').removeClass('active');
			$target.addClass('active');
		}
	});
}

/* IE9 check - IE9 브라우저일 경우 body 에 클래스 ie9 추가 */
function chkIE9() {
	if (document.all && document.addEventListener && !window.atob){ $('body').addClass('ie9'); }
}

/* input, select 요소 포커스 시 클래스 추가 (iOS app 대응) */
function formElFocus() {
	$('.ui-input').on('focusin', 'input', function(){ $(this).addClass('__focus'); });
	$('.ui-input').on('focusout', 'input', function(){ $(this).removeClass('__focus'); });

	$('.ui-select').on('focusin', function(){ $(this).addClass('__focus'); });
	$('.ui-select').on('focusout', function(){ $(this).removeClass('__focus'); });
}
//2020.02.06. add. 유료회원제 footer 약관페이지 호출
function callPrivPopup(){
	
	var urlPriv01 = "/resources/html/privacy/iframe_1009_C0_ko.html";
	var urlPriv02 = "/resources/html/privacy/iframe_C001_O1.html";
	var scrollPos = $(window).scrollTop();
	
	var popup_body = '<div class="clauselayer">'
					+'	<div class="top">'
					+'		<ul class="priv_tab">'
					+'			<li><span class="priv_tab_title on">L.POINT 이용약관</span></li>'
					+'			<li><span class="priv_tab_title">롯데오너스 이용약관</span></li>'
					+'		</ul>'
					+'	</div>'
					+'	<div class="contents">'
					+'		<iframe frameborder="0" class="priv_detail" scrolling="auto"></iframe>'
					+'	</div>'
					+'	<a href="javascript:void(0);" class="btn_close"><em class="blind">닫기</em></a>'
					+'</div>';
	
	$('html, body').addClass('clauselayer-dimmed-layer-open');	// 추가 부모창 스크롤 방지
	
	$('body').append(popup_body);
	var currentTop = $('body').scrollTop();
	$(".clauselayer").fadeIn();
	$('body').addClass('dimm').css('top',-currentTop); 
	$('.dimm').attr('data-scroll',currentTop); 
	
	var heightContents = $(window).height() - $(".clauselayer .top").outerHeight() - 30;
	
	$(".clauselayer .contents").css({'height':heightContents+'px'});
	
	var widthFrame = $(window).width() - Number($(".clauselayer .contents").css("padding-left").replace('px', '')) - Number($(".clauselayer .contents").css("padding-right").replace('px', ''));
	var heightFrame = $(".clauselayer .contents").height() - Number($(".clauselayer .contents").css("padding-top").replace('px', '')) - Number($(".clauselayer .contents").css("padding-bottom").replace('px', ''));
	
	$(".priv_detail").css({'width':widthFrame + 'px','height':heightFrame + 'px'});
	
	$('.btn_close').click(function(e){
		e.stopPropagation();
		$(".clauselayer").fadeOut('fast');		
		$('.dimm').removeAttr('style'); 
		$('.dimm').removeClass('dimm').scrollTop($('body').attr('data-scroll')).removeAttr('data-scroll');
		$(".clauselayer").remove();
		$('html, body').removeClass('clauselayer-dimmed-layer-open');	// 스크립트로 추가된 클래스 제거
		$(window).scrollTop(scrollPos);	// 스크롤 위치 복귀
		e.preventDefault();
	});
	
	$(".priv_tab_title").click(function(e){
		
		var index = $(".priv_tab_title").index(this);
		
		if($(this).hasClass("on")){
			return false;
		} else {
			$(".priv_tab_title").removeClass("on");
			$(".priv_tab_title").eq(index).addClass("on");
			
			if(index == 0){			
				// iframe 화면 표시
				$(".priv_detail").attr("src", urlPriv01);					
			} else if(index == 1){			
				// iframe 화면 표시
				$(".priv_detail").attr("src", urlPriv02);					
			}
			
		}
		
	});
	
	// 초기화
	$(".priv_tab_title").eq(0).addClass("on");
	$(".priv_detail").attr("src", urlPriv01);	
	
}
(function ($) {
	/* DOM 구조 생성 후, 함수 실행 */
	$(document).ready(function(){
		chkIE9();	// IE9 check 실행

		/* Footer Link Event */
		if ( $('#mast-foot .friendly').is(':visible') ){
			$(document).on('click', function(e){
				var $target = $(e.target),
					$siteLinker = $('#mast-foot .site-linker'),
					$siteLinks = $siteLinker.find('a'),
					$btn = $siteLinker.find('button');

				if ( !!$('#mast-foot .site-linker').find('button').length ){
					if ( $target.is($btn) ){
						$siteLinker.removeClass('active');
						$target.closest('.site-linker').addClass('active');
					} else if ( !$target.is($siteLinks) ){
						$btn.closest('.site-linker').removeClass('active');
					}
				}
			});
		}

		/* Language Selector */
		$('#mast-head').on('click', '.language button', function(){
			$(this).addClass('ui-toggle').siblings().removeClass('ui-toggle').parents('.language').toggleClass('active');
		});
		
		/* 정보 수신동의 더보기 */
		$('.more-wrap').on('click', '.more-btn .ui-button', function(){
			$(this).closest('.more-wrap').toggleClass('active');
		});
		
		/* 레이어팝업 내 top버튼 */
		$('.btn-pagetop').click(function(e){
			e.preventDefault();
			$('.modal-contents').animate({scrollTop:0}, 100);
		});
		$('.btn-wrap-pagetop').hide();
		$('.modal-contents').scroll(function(){
			if($(this).scrollTop() > 100){
				$('.btn-wrap-pagetop').fadeIn();
			}else{
				$('.btn-wrap-pagetop').fadeOut();
			}
		});
		
		uiTrigger();	// ui-trigger 함수 실행: 초기 value 있을 때, placeholder 와 겹침 방지
	});

	/* 유료회원 input */
	function formElFocus2() {
		$('.__oners .ui-input').on('focusin', 'input', function(){ $(this).parents('.form-wrap').addClass('__focus'); });
		$('.__oners .ui-input').on('focusout', 'input', function(){ $(this).parents('.form-wrap').removeClass('__focus'); });
	};
	
	/* 모든 요소 로딩완료 후, 함수 실행 */
	$(window).load(function(){
		uiTrigger();	// ui-trigger 함수 실행
		if ( !!$('.ui-radio-accodion').length ) { radioAccodion(); }	// Radio Accodion 함수 실행
		if ( !!$('.ui-check.__toggle').length ) { allCheckControl(); }	// 전체동의 체크 함수 실행
		if ( !!$('.ui-input').length || !!$('.ui-select').length ) { formElFocus(); }	// input, select 요소 포커스 시 클래스 추가 함수 실행
		if ( !!$('.__oners .ui-input').length ) { formElFocus2(); } //유료회원 input 포커스 시 클래스 추가 함수 실행
		$('.modal-layer').css({'bottom':-$(window).height()});
	});
	
	
	
	})(jQuery);

function modal_confirm(id){
  var scrollPos = $(window).scrollTop(),	// 모달활성화 시, 스크롤 초기값
    _modals = $('.modal-container'),
    _el = $('#'+id),
    _modalBtn = _el.parent('.inner').find('.ui-button');	// 모달 활성화 버튼
    _el.addClass('active');
  $('html, body').addClass('dimmed-layer-open');	// 추가 부모창 스크롤 방지
  $('body').append('<div class="modal-dimmed"></div>');
  _modals.each(function(){
    $(this).css({
      'marginTop':-($(this).outerHeight()/2),
      'marginLeft':-($(this).outerWidth()/2)
    });
  });
  _el.attr('tabindex','0').find('>.modal-contents').attr('tabindex','0');
  _el.focus();

  function closeModal() {
		_el.removeClass('active');
		$('.modal-dimmed').remove();
		$('html, body').removeClass('dimmed-layer-open');	// 스크립트로 추가된 클래스 제거
		$('body').removeClass('layer-type-full');	// 스크립트로 추가된 클래스 제거(오픈한 레이어 팝업 풀사이즈 클래스 제거)
		$(window).scrollTop(scrollPos);	// 스크롤 위치 복귀
		_modalBtn.focus();	// 모달 활성화 버튼 포커스 이동
	}
  $('.modal-dimmed').on('click',function(){ closeModal(); });	// 딤드 부분 클릭 시
  $('#modal_close').on('click',function(){ closeModal(); });	// 취소 버튼 클릭 시
}

var certTimer;
function fnTimerReset(id, time){
  $(id+' .progressbar').remove();
  clearInterval(certTimer);
  if(time != 0) fnProgressTimer(id, time);
}
function fnProgressTimer(id, limit){
  var progressbar = 
    '<div class="progressbar">'
     + '<svg width="120" height="120" xmlns="http://www.w3.org/2000/svg">'
     	+ '<circle cx="60" cy="60" r="54" stroke-width="3" stroke="#c1e7ff" fill="transparent"></circle>'
     	+ '<circle class="progressbar__fill" cx="60" cy="60" r="54" stroke-width="6" stroke="#009bfa" fill="transparent"></circle>'
     + '</svg>'
     +'<div class="progressbar__counter"></div>'
+ '</div>';
  if ( $(id+' .progressbar').length == 0 ) {
    $(id).removeClass('__overtime').prepend(progressbar);
  }else{
    return false;
  }
  var max = limit;
  var min = 0;
  var sec = 0;
  $(id+' .progressbar__fill').css({
    'animation-duration' : limit+'s'
  });
  min = max / 60 < 1 ? '0' : Math.floor(max / 60);
  sec = max % 60 < 10 ? '0'+Math.floor(max % 60) : Math.floor(max % 60);
  $(id+' .progressbar__counter').html( (max < 60 ) ? max : min+":"+sec );
  certTimer = setInterval(function(){
    max -= 1;
    if(max < 1) {
      clearInterval(certTimer);
      FLAG = false;
      $(id).addClass('__overtime');
    }else{
      min = max / 60 < 1 ? '0' : Math.floor(max / 60);
      sec = max % 60 < 10 ? '0'+Math.floor(max % 60) : Math.floor(max % 60);
      $(id+' .progressbar__counter').html( (max < 60 ) ? max : min+":"+sec );
      FLAG = true;
    }
  },1000);
}