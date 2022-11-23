var pageRules = null;
var isWaiting = false;
//전체 화면에서 사용되는 공통 함수 목록
//api 호출
function fnCallApi(url,data,callBackFun){
	fnConsoleLog('[fnCallApi] url  : ' + url);
	fnConsoleLog('[fnCallApi] data  : ' + JSON.stringify(data));

	Common.callApi({
		akUrl: url,
		akDta : data,
		callback: function(rspDta,jwt){		
			rspDta = checkJSON(rspDta);
			fnConsoleLog('[fnCallApi] return  : ' + JSON.stringify(rspDta));
			if(callBackFun){
				eval(callBackFun).call(this,rspDta,jwt);
				return '';			
			}
		}
	});
}
//이전 화면 버튼
function fnBack(){
	var url = $('#formBack').attr('action');
	if(checkIsEmpty(url)){
		return false;
	}
	var data = $('#formBack').serializeObject();
	
	Common.movePage(url, data);
	return false;
}

//다음 화면 버튼
function fnNext(url){
	
	var data;
	
	if(checkIsEmpty(url)){
		return false;
	}
	
	/*
	 * 1. 로그인 에러
	 * 2. 휴면 해제인 경우 어떤 회원사 인지 표시해주려고 에러 코드 들고가야..
	 */
	
	if( url == "/view/manage/mbrManage_03_002" || url == "/view/manage/chPassword_04_002" ||
		url == "/exView/manage/fdPassword_05_002" ){//로그인 에러인 경우 에러 form값을 들고갈 수 있도록 하기 위함.
											  //formError를 더이상 안 사용할 것 같습니다..
		data = $('#formError').serializeObject();
	}else{
		data = $('#formNext').serializeObject();
	}
	
	Common.movePage(url, data);
	return false;
}


//프로세스 종료의 확인 또는 프로세스 시작의 취소 버튼
function fnClose(data, jwt, idAutoCrtYn, lgnResult){
	Common.endScreen(data, jwt, idAutoCrtYn, lgnResult);
	return false;
}

//언어 변경
function fnChangeLocale(lang, flag){
	Common.changeLocale(lang, flag);
	return false;
}

//화면 title 설정
function fnPageTitle(title) {
	document.title = title;
}

//이전 호출 체크 : 중복 방지를 위해 5초 딜레이 (협업 요청)
function fnDoDelay(timeout,$obj) {
	if(typeof(event) != 'null' && typeof(event) != 'undefined'){
		if( event.preventDefault)
			event.preventDefault();
		else
			event.returnValue = false;
	}	
	if($obj == undefined || $obj == null)
		return false;
	if($obj.attr('data-time'))
		return true;

	if(!$.isNumeric(timeout))
		timeout = 5000;
	
	$obj.prop('disabled',true);
	setTimeout(function() { $obj.prop('disabled',false);}, timeout);
	return false;
}
//해당 row 보여짐 TODO (hide class 제거 : 추후에 변경 가능) 
function displayRow($row){
	
	if($row.length == 0 || $row == undefined){//해당 영역 row 가 없으면 return;
		fnConsoleLog('#'+$row.attr('id')+' element not found.');
		return false;
	}
	$row.removeClass('__none');
	$row.show();		
	$row.parents().removeClass('__none');
	return true;
}
//핸드폰 앞자리 번호 추가하기
function displayTccDc(data){
	if(data.length == 0)
		return false;

	var html = '';
	var $input 	= $('*[data-id="input-mbzNoC"]');//input row
	if($input.length == 0 || $input == undefined)//해당 영역이 없으면 return;
		return false;
	
	$input.html('<option>선택</option>');
	for(var key in data){
		 html = '<option value="'+data[key]+'">'+data[key]+'</option>';
		 $input.append(html);
	}
}
//기준데이터 보여지기
function fnDisplayData(data){
	pageRules =  data.items;
	for (var key in data.items){
		switch(key){
			case 'user':
				displayUser(data.items[key]);
				break;
			case 'commonTccDc':
				displayTccDc(data.items[key]);
				break;
			case 'commonSTermDc':
				displaySTermDc(data.items[key]);
				break;
			case 'agreement':
					getAgreementInfo(data.items[key]);
					break;
		}
	}		
}
//기준데이터 가져오기
function onLoad(callBackFun){
	var $obj   = $('#mast-body');
	var pageId = $obj.data('id');
	fnCallApi(onURL.checkEmailDuplicate,{'serviceId':pageId},'fnDisplayData');
	
	//기준데이터를 적용 후, loading 화면 제거
	$('#loading').hide();
	$('#mast-body > .container').removeClass('hide');
}
//제휴사 로고 및 css 세팅
function onLoadCcoSet(){
	if($('#ccoLogo').length == 0)
		return false;
	var ccoSiteNo = Common.getChannelData().ccoSiteNo;
	$('#ccoLogo').attr('src','/resources/images/logo/img_'+ccoSiteNo+'.png');
	/* 제휴사 웹접근성 심사 관련 문구 수정 MYENG */
	$('#ccoLogo').attr('alt', Common.getChannelData().ccoNm);
	$('#ccoLogo').parent('a').attr('href',Common.getChannelData().hmpgUrl);
	$('#ccoLogo').parent('a').removeClass('__none');
	
	var $head = $("head");
	var $headerlinklast = $head.find("link[ref='stylesheet']:last");
	var linkElement = "<link rel='stylesheet' href='/resources/css/css_"+ccoSiteNo+".css?date=20211221000001' type='text/css' media='screen'>";
	if($headerlinklast.length)
		$headerlinklast.after(linkElement);
	else
		$head.append(linkElement);
}

//엔터키 이벤트
//param으로 id or class 세팅
function fnEnterKey(btn){
	
	var target = $("."+btn).length < 1 ? $("#"+btn) : $("."+btn);
	
	if(target.length < 1){
		return false;
	}
	
	var  result = '';
	if(typeof(event) != 'undefined') {                                       
		result = event.which;
	}else{
		result = event.keyCode;
	}
	
	if(result == 13){
		event.preventDefault();
		target.click();
	}
}
var interval;
function fnTimer(limit){//타이머
	var max = limit;//시간(sec)
	var min = 0;
	var sec = 0;
	
	clearInterval(interval);
	$(".timer").html("");
	
	interval = setInterval(function(){
		max -= 1;
		if(max < 1) {
			clearInterval(interval);
			FLAG = false;
			$(".timer").html("");
		}else{
			min = max / 60 < 1 ? "0" : Math.floor(max / 60);
			sec = max % 60 < 10 ? "0"+Math.floor(max % 60) : Math.floor(max % 60);
			$(".timer").html(min+":"+sec);
			FLAG = true;
		}
	},1000);
}

function fnCardAuthTimer(limit){//타이머
    var max = limit;//시간(sec)
    var min = 0;
    var sec = 0;
    $(".timer-graph").css({
      'transition-duration' : limit*1000+'ms',
      'stroke-dasharray' : '302 300'
    });
    interval = setInterval(function(){
      max -= 1;
      if(max < 1) {
        clearInterval(interval);
        FLAG = false;
        $(".timer-text").html("시간 초과");
      }else{
        min = max / 60 < 1 ? "0" : Math.floor(max / 60);
        sec = max % 60 < 10 ? "0"+Math.floor(max % 60) : Math.floor(max % 60);
        $(".timer-text").html(min+":"+sec);
        FLAG = true;
      }
    },1000);
  }

function fnCardAppAuthTimer(limit){
  var max = limit;
  var min = 0;
  var sec = 0;
  $(".timer-graph").css({
    'transition-duration' : limit*1000+'ms',
    'stroke-dasharray' : '302 300'
  });
  interval = setInterval(function(){
    max -= 1;
    if(max < 1) {
      clearInterval(interval);
      FLAG = false;
      $(".timer-text > .counter").html("시간 초과");
    }else{
      min = max / 60 < 1 ? "0" : Math.floor(max / 60);
      sec = max % 60 < 10 ? "0"+Math.floor(max % 60) : Math.floor(max % 60);
      $(".timer-text > .counter").html(min+":"+sec);
      FLAG = true;
    }
  },1000);
}

/* 년월일 selectbox 윤달 처리 */
function selectDateCheck(){
	// 현재 년월일, 년월일 select 지정
	var nowDate = new Date(),
		nowYear = nowDate.getFullYear(),
		nowMonth = nowDate.getMonth() + 1,
		nowDay = nowDate.getDate(),
		_wrap = document.querySelectorAll('.ui-check-date'),
		_select = document.querySelectorAll('.ui-check-date .ui-select'),
		_year = document.querySelectorAll('.ui-check-date .ui-select[data-unit=y]'),
		_month = document.querySelectorAll('.ui-check-date .ui-select[data-unit=m]'),
		_day = document.querySelectorAll('.ui-check-date .ui-select[data-unit=d]'),
		yearTerm = 100;	// default 년도 기간 설정

	// 초기 연도 설정
	// (1) data-term (년도 기간설정)
	// (2) data-point (년도 시점설정)
	for(var i=0; i < _wrap.length; i++){
		var startYear,
			endYear,
			setTerm = _wrap[i].getAttribute('data-term') *1,
			setPoint = _wrap[i].getAttribute('data-point'),
			num = 0;

		_year[i].options[0] = new Option(_year[i].getAttribute('data-default-option'), '');

		// data-term 속성값이 있을 경우 기간 적용
		if (setTerm != null && setTerm != ''){
			yearTerm = setTerm;
		}

		// 년도 option 설정
		if (setPoint =='up'){ // 미래~현재
			startYear = nowYear + yearTerm;
			endYear = nowYear;
		} else if (setPoint =='down' || setPoint =='' || setPoint == null) { // 현재~과거
			startYear = nowYear;
			endYear = nowYear - yearTerm;
		} else {
			// up, down, null 이 외의 값 지정
		}

		for(var j=startYear; j>=endYear; j--){
			num++;
			_year[i].options[num] = new Option(j, j);
		}
	}

	// 초기 월 설정
	for(var i=0; i < _wrap.length; i++){
		_month[i].options[0] = new Option(_month[i].getAttribute('data-default-option'), '');
		for(var j=1; j<=12; j++){
			_month[i].options[j] = new Option(j, j);
		}
	}
	// 초기 일 설정
	for(var i=0; i < _wrap.length; i++){
		_day[i].options[0] = new Option(_day[i].getAttribute('data-default-option'), '');
		for(var j=1; j<=31; j++){
			_day[i].options[j] = new Option(j, j);
		}
	}

	// 년 선택 시, 일 설정 함수 실행
	for(var i=0; i < _wrap.length; i++){
		_year[i].addEventListener('change', selectSetDay, false);
	}
	// 월 선택 시, 일 설정 함수 실행
	for(var i=0; i < _wrap.length; i++){
		_month[i].addEventListener('change', selectSetDay, false);
	}
}

// 일 설정 함수
function selectSetDay(){
	// 평년 각 달의 일수 배열
	// 선택한 select 그룹의 년월일 option value
	var arrDay = [31,28,31,30,31,30,31,31,30,31,30,31],
		lastDay,
		wrap = this.parentNode,
		yearVal = wrap.querySelector('.ui-select[data-unit=y]').value,
		monthVal = wrap.querySelector('.ui-select[data-unit=m]').value,
		selectedDay = wrap.querySelector('.ui-select[data-unit=d]'),
		dayVal = selectedDay.value,
		defaultTxt = selectedDay.getAttribute('data-default-option');

	// 윤달체크 (true : 2월 마지막날 29일)
	if(yearVal%4 == 0 && yearVal%100 != 0 || yearVal%400 == 0){ arrDay[1] = 29; }
	// 선택한 달의 일수 설정
	lastDay = (monthVal != '') ? arrDay[monthVal-1] : 31;

	// 일 option 재설정
	selectedDay.options.length = 0;
	selectedDay.options[0] = new Option(defaultTxt, '');

	for(var i=1; i<=lastDay; i++){
		selectedDay.options[i] = new Option(i, i);
	}

	// 선택한 날과 그 달의 마지막 날 비교
	// 선택한 날이 default가 아니고 마지막 날 보다 크면 : 마지막 날짜로 선택 일 변경
	// 아니면 : 선택한 날 그대로 가져감
	selectedDay.value = (dayVal != '' && dayVal > lastDay) ? lastDay : dayVal;
}

$(document).ready(function(){
	onLoadCcoSet();	
	$('html').attr('lang',langCode);
	switch(langCode){
		case "ko":
			$('body').attr('id','KOR');
			break;
		case "en":
			$('body').attr('id','ENG');
			break;
		case "ja":
			$('body').attr('id','JPN');
			break;
		case "zh_cn":
			$('body').attr('id','CHN-CN');
			break;
		case "zh_tw":
			$('body').attr('id','CHN-TW');
			break;
	}
	
	//F12막기
	$(document).on('keydown',function(event){
		
		var  keyValue = event.which || event.keyCode;
		
		if(keyValue == 123){
			event.preventDefault();
			event.returnValue = false;
		}
	});
});

//인증번호 자동 Set 이벤트
function fnCtfNoSet(str){
	$('#an').val(str);
	$('#an').parent().addClass('active');                                   
	
}
//새창 띄우기 함수
function fnWindowOpen(url){
	if(url.indexOf("://") == -1) 
		return false;
	
	if(window.opener != null)
		window.opener.document.location.href = url;
	else
		window.open(url,'lpointWin');
	return false;
}