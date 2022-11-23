// 제휴사 약관 정보 조회
function getAgreeData(param){
	fnCallApi("/exBiz/cco/criInf_03_001", param, 'getAgreeDataCallBack');
}

// 이용약관 list view 
function getAgreeDataCallBack(data){

	var mbPrvInfHtml = '',ccoPrvInfHtml='';
	
	if(data.mbPrvInfList != null){
		if(data.mbPrvInfList.length > 0){
			for (var key in data.mbPrvInfList){//LPoint 약관정보
				mbPrvInfHtml += displayAgreement(data.mbPrvInfList[key],key);
			}
			mbPrvInfHtml = displayAgreementOuter(mbPrvInfHtml,data.mbPrvInfList[0]);		
		}else{
			//$('#div-choPrvAgGud02').addClass('__none');	// /*2020-02-24  NSR2020021200037  GUN 주석처리*/ LPOINT 약관이 없는 경우 해당 문구 안보임(L.POINT선택약관에 동의하시면 DM쿠폰발송, 백화점MVG선정 등 다양한 혜택을 경험하실 수 있습니다.)		
		}
	}
	
	if(data.ccoPrvInfList != null){
		if(data.ccoPrvInfList.length > 0){
			for (var key in data.ccoPrvInfList){//제휴사 약관정보
				ccoPrvInfHtml += displayAgreement(data.ccoPrvInfList[key],key);
			}
			ccoPrvInfHtml = displayAgreementOuter(ccoPrvInfHtml,data.ccoPrvInfList[0]);
		}
	}
	
	$('#div-prv').html(mbPrvInfHtml.concat(ccoPrvInfHtml));
}
// 약관 display html 생성
function displayAgreement(item,index){
	var result	 	= '';
	var string		= (item.prvChoMyn == 'Y')? I18n.getMessage('co.prv.txt.mndt'): I18n.getMessage('co.prv.txt.cho');
	var cssClass 	= (item.prvChoMyn == 'Y')? '' : '__point-color';
	var mPrvClass = (item.prvChoMyn == 'Y')? 'mPrv' : '';
	var ccoNm 		= (langCode == 'ko')? item.ccoNm :item.ccoEnm;
	var prvTitle 	= '';
	if(item.prvDvC.charAt(0) == 'C'){
		prvTitle = ccoNm.concat(' '.concat(I18n.getMessage('co.prv.lit.'.concat(item.prvDvC))));
	}else{
		prvTitle = I18n.getMessage('co.prv.lit.'.concat(item.prvDvC));	
	}
	
	var prvAgYn = item.prvAgYn;
	var checked = '';
	if (prvAgYn == 'Y') {
		checked = 'checked="checked"';
	}
	
	/* 제휴사 웹접근성 심사 관련 문구 수정 MYENG */
	result = '<div class="inner">'+
					'<div class="ui-wrap">'+
						'<div class="ui-check">'+
							'<input type="checkbox" id="agreeCco_'+item.ccoNo+item.prvDvC+'" name="'+item.ccoNo+'"' + checked + '" class="'+mPrvClass+'" onclick="fnPrvAgChange(\'agreeCco_'+item.ccoNo+item.prvDvC+'\');" data-title="'+prvTitle+'" data-prvDvC="'+item.prvDvC+'" data-ccoNm="'+item.ccoNm+'" data-ccoEnm="'+item.ccoEnm+'"/>'+
							'<label for="agreeCco_'+item.ccoNo+item.prvDvC+'">'+prvTitle+'  <em class='+cssClass+' >'+string+'</em></label>'+
						'</div>'+
						'<div class="detail">'+
							'<button type="button" class="ui-button __square-mini __underline" onclick="modal_init(\'term-code-agree-'+item.ccoNo+index+'\',800)">'+I18n.getMessage('co.prv.txt.btnDt')+'</button>'+ // 자세히
						'</div>'+
					'</div>'+
					// ModalPop : 약관내용
					'<div id="term-code-agree-'+item.ccoNo+index+'" class="modal-container __fixed">'+
						'<div class="modal-header">'+
							'<div class="headline">'+prvTitle+'</div>'+ //약관 제목
						'</div>'+
						'<div class="modal-contents __no-style">'+
							'<div class="privacyArea">'+
								'<iframe src="/resources/html/privacy/iframe_'+item.ccoNo+'_'+item.prvDvC+'_'+langCode+'.html" width="100%" height="100%" frameborder="0" scrolling="auto" marginwidth="0" marginheight="0" allowTransparency="true" title=""></iframe>'+
							'</div>'+
						'</div>'+
						'<div class="modal-closer">'+
							'<button type="button" class="btn-close">'+I18n.getMessage('co.btn.cls')+'</button>'+ // 닫기
						'</div>'+
					'</div>'+
				'</div>';
	return result;
}

// 제휴사명 영역 셋팅
function displayAgreementOuter(innerHtml,data){
	var ccoNm = (langCode == 'ko')? data.ccoNm :data.ccoEnm;
	var outerHtml='<div class="row __block">'+
							'<div class="col-md">'+ccoNm+'</div>'+
							'<div class="col-md">'+
									'<div class="form-wrap __agreement">{{innerHtml}}</div>'+
							'</div>'+
						'</div>';
	
	outerHtml = outerHtml.replace('{{innerHtml}}',innerHtml);
	return outerHtml;
}

// 약관 선택 / 해제 이벤트
function fnPrvAgChange(id){
	if(!$('#'.concat(id)).is(':checked')){
		
		var msg1_1	= I18n.getMessage('ch.prv.alt.gud1_1'); // 
		var msg1_2	= I18n.getMessage('ch.prv.alt.gud1_2'); // 에 동의하지 않으시면
		var msg2_1	= I18n.getMessage('ch.prv.alt.gud2_1'); //
		var msg2_2	= I18n.getMessage('ch.prv.alt.gud2_2'); // 서비스를 이용하실 수 없습니다.
		var msg3_1	= I18n.getMessage('ch.prv.alt.gud3_1'); //
		var msg3_2	= I18n.getMessage('ch.prv.alt.gud3_2'); //에서 제공되는 혜택에 제한이 있을 수 있으니 신중하게 선택해주십시오.
		var ccoNm	= (langCode == 'ko')? $('#'.concat(id)).attr('data-ccoNm') :$('#'.concat(id)).attr('data-ccoEnm');
		var prvTitle	= $('#'.concat(id)).attr('data-title');
		
		var msg1 = msg1_1.concat(prvTitle.concat(msg1_2)); 				// 필수 / 선택 공통 (()에 동의하지 않으시면())
		var msg2 = msg2_1.concat(ccoNm.concat(' '.concat(msg2_2))); 	// 필수 문구 (()서비스를 이용하실 수 없습니다.)
		var msg3 = msg3_1.concat(ccoNm.concat(msg3_2));	 				// 선택 문구 (()에서 제공되는 혜택에 제한이 있을 수 있으니 신중하게 선택해주십시오.)

		if(langCode == 'en'){
			msg1 = msg1_1.concat(' '.concat(prvTitle.concat(msg1_2)));				// 필수 / 선택 공통 (()에 동의하지 않으시면())
			msg2 = msg2_1.concat(ccoNm.concat(' '.concat(msg2_2))); 				// 필수 문구 (()서비스를 이용하실 수 없습니다.)
			msg3 = msg3_1.concat(' '.concat(ccoNm.concat(' '.concat(msg3_2))));	// 선택 문구 (()에서 제공되는 혜택에 제한이 있을 수 있으니 신중하게 선택해주십시오.)
			
		}else if(langCode == 'zh_cn' || langCode == 'zh_tw'){
			msg1 = msg1_1.concat(' '.concat(prvTitle.concat(msg1_2)));				// 필수 / 선택 공통 (()에 동의하지 않으시면())
			msg2 = msg2_1.concat(' '.concat(ccoNm.concat(' '.concat(msg2_2))));	// 필수 문구 (()서비스를 이용하실 수 없습니다.)
			msg3 = msg3_1.concat(' '.concat(ccoNm.concat(' '.concat(msg3_2))));	// 선택 문구 (()에서 제공되는 혜택에 제한이 있을 수 있으니 신중하게 선택해주십시오.)
		}
		
		if($('#'.concat(id)).hasClass("mPrv")){
			alert(msg1.concat(msg2)); // ()에 동의하지 않으시면\n()서비스를 이용하실 수 없습니다.
		}else{ /*2020-01-23  NSR2020012000368  Gun */
			if($('#'.concat(id)).attr('name')=='1009'&&langCode == 'ko'){
				var msg4_1	= I18n.getMessage('ch.prv.alt.gud4_1'); //L.POINT 모든 제휴사에서 회원 혜택이 제한됩니다. \n 1) 롯데백화점 MVG 등 제휴사 회원등급 선정 및 추가포인트 적립 대상에서 제외\n2) 롯데마트 등 쿠폰 지급 대상에서 제외\n3) 모든 제휴사 이벤트 당첨 대상에서 제외
				alert(msg1.concat(msg4_1));
			}else{
				alert(msg1.concat(msg3)); // ()에 동의하지 않으시면\n()에서 제공되는 혜택에 제한이 있을 수 있으니 신중하게 선택해주십시오.
			}

		}
	}
}

//약관동의 체크
function fnCheckAgree(url) {
	if( fnDoDelay(5000, $('#delaychk')) )
		return false;
	
	var prvAgList 	= [];
	var isChk 		= false;
	var chBox 		= $('#member-terms').find(":checkbox").not('#terms-all-check');
	var msg1_1		= I18n.getMessage('ch.prv.alt.gud1_1'); // 
	var msg1_2		= I18n.getMessage('ch.prv.alt.gud1_2'); // 에 동의하지 않으시면
	var msg2_1		= I18n.getMessage('ch.prv.alt.gud2_1'); //
	var msg2_2		= I18n.getMessage('ch.prv.alt.gud2_2'); // 서비스를 이용하실 수 없습니다.
	
	chBox.each(function(idx){ // 필수 동의 체크
		if(!$(this).is(":checked")){
			if($(this).hasClass("mPrv")){
				var ccoNm	= (langCode == 'ko')? $(this).attr('data-ccoNm') :$(this).attr('data-ccoEnm');
				var prvTitle	= $(this).attr('data-title');
				var msg1 = msg1_1.concat(prvTitle.concat(msg1_2).concat(' ')); // 필수 / 선택 공통 (()에 동의하지 않으시면())
				var msg2 = msg2_1.concat(ccoNm.concat(' '.concat(msg2_2)));  // 필수 문구 (()서비스를 이용하실 수 없습니다.)
				
				alert(msg1.concat(msg2));
				$(this).focus();
				
				isChk = true;
				return false;
			}
		}
	});
	
	if(isChk) {
		return false;
	}
	
	chBox.each(function(idx){ // 약관 List 생성
		var ccoNo  	= $(this).attr('name');
		var prvDvC 	= $(this).attr('data-prvDvC');
		var prvAgYn 	= $(this).is(":checked") ? 'Y' : 'N';
		
		var param = {'ccoNo'		:ccoNo		,
				           'prvDvC'		:prvDvC		,
				           'prvAgYn'		:prvAgYn	
				          };
		prvAgList.push(param);
	});
	
	$('#prvAgList').val(JSON.stringify(prvAgList));
	
	/*2020.03.16 선택약관 확인/취소 버튼 추가 NSR2020030400319*/
	 var choPrvCnt = 0;
     var choPrv = 0;
     var prvTitle = '';
	 var msg1 = '';     // 필수 / 선택 공통 (()에 동의하지 않으시면())
	 var msg4_1 = ''; //L.POINT 모든 제휴사에서 회원 혜택이 제한됩니다. \n 1) 롯데백화점 MVG 등 제휴사 회원등급 선정 및 추가포인트 적립 대상에서 제외\n2) 롯데마트 등 쿠폰 지급 대상에서 제외\n3) 모든 제휴사 이벤트 당첨 대상에서 제외

	    
	 chBox.each(function(idx){ // 선택약관 동의 체크상태 확인

	  if(!$(this).hasClass("mPrv")&& $(this).attr('name')=='1009' && langCode == 'ko'){
	   choPrvCnt++; // 선택약관 갯수
	  }
	  
	  if(!$(this).is(":checked")&& $(this).attr('name')=='1009' && langCode == 'ko'){ // 동의하지 않은 선택약관 갯수
	   choPrv++;
	  }
	 });
	 
	 chBox.each(function(idx){ // 선택 약관 동의 여부 체크
	  if(!$(this).is(":checked")){
	   if(!$(this).hasClass("mPrv")&& $(this).attr('name')=='1009' && langCode == 'ko' && choPrv == choPrvCnt){ // 모든 선택약관 미동의한 경우
	    prvTitle = I18n.getMessage('co.prv.txt.allChoPrv');
	    msg1 = msg1_1.concat(prvTitle,msg1_2);     // 필수 / 선택 공통 (()에 동의하지 않으시면())
	    msg4_1 = I18n.getMessage('ch.prv.alt.gud4_1');     //L.POINT 모든 제휴사에서 회원 혜택이 제한됩니다. \n 1) 롯데백화점 MVG 등 제휴사 회원등급 선정 및 추가포인트 적립 대상에서 제외\n2) 롯데마트 등 쿠폰 지급 대상에서 제외\n3) 모든 제휴사 이벤트 당첨 대상에서 제외

	    if(confirm(msg1.concat(msg4_1)+'\n\n'+I18n.getMessage('co.prv.txt.confirm')) == true){ // 모든 선택약관 미동의 진행 확인한 경우
	     return false;
	       }  
	       else{
	        $(this).focus();
	     isChk = true;
	     return false;
	       }
	   }else if(!$(this).hasClass("mPrv")&& $(this).attr('name')=='1009' && langCode == 'ko' && choPrv < choPrvCnt){ // 개별 선택약관 미동의한 경우
	    prvTitle = $(this).attr('data-title');
	    msg1 = msg1_1.concat(prvTitle,msg1_2);     // 필수 / 선택 공통 (()에 동의하지 않으시면())
	    msg4_1 = I18n.getMessage('ch.prv.alt.gud4_1');     //L.POINT 모든 제휴사에서 회원 혜택이 제한됩니다. \n 1) 롯데백화점 MVG 등 제휴사 회원등급 선정 및 추가포인트 적립 대상에서 제외\n2) 롯데마트 등 쿠폰 지급 대상에서 제외\n3) 모든 제휴사 이벤트 당첨 대상에서 제외

	    if(confirm(msg1.concat(msg4_1)+'\n\n'+I18n.getMessage('co.prv.txt.confirm')) == true){ // 개별 선택약관 미동의 진행 확인한 경우
	     return false;
	       }
	       else{
	        $(this).focus();
	     isChk = true;
	     return false;
	        }
	    }
	   }
	  }
	 );
	  
	 if(isChk) { // 선택약관 미동의 진행 취소한 경우
	  return false;
	 }
	 
	 /*--------------join-agreement.js-------------------*/
	
	fnNext(url);
	return false;
}