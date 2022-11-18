/**
 * 통합회원제 Web : 통합회원제 클라이언트 라이브러리 
 * @fileName : common.js
 */

var _noticePageUrl = {
		'default_error' : '/exView/login/login_02_001',
		'00401' : '/view/login/login_04_001',				//성공 후처리 안내페이지 (비밀번호 변경 캠페인)
		'00403' : '/view/login/login_04_002',				//성공 후처리 안내페이지 (선택약관 추가수집 캠페인)
		'44404' : '/exView/login/login_03_001',				//실패 후처리 안내페이지 (부정로그인)
		'44406' : '/exView/login/login_05_001',             //실패 후처리 안내페이지 (LPOINT&제휴사 휴면)
		'44407' : '/exView/login/login_05_001',             //실패 후처리 안내페이지 (LPOINT 휴면)
		'44408' : '/exView/login/login_05_001',             //실패 후처리 안내페이지 (제휴사 휴면)
		'44410' : '/exView/manage/chPassword_03_001',		//실패 후처리 안내페이지 (임시비밀번호)
		'44419' : '/exView/join/mbrJoin_04_001',			//실패 후처리 안내페이지 (제휴사 약관 미동의상태)
		'44420' : '/exView/join/mbrJoin_03_001',			//실패 후처리 안내페이지 (제휴사 약관 미동의상태 14세미만)
		'44423' : '/exView/login/socialReg_01_001',			//실패 후처리 안내페이지 (소셜정보 매핑 실패)
		'44705' : '/exView/login/esyReg_01_001',			//실패 후처리 안내페이지 (등록된 간편인증 정보가 없음)
		'44434' : '/exView/login/lv2CtfLogin_01_001'		//실패 후처리 안내페이지 (2단계 인증 대기화면)
	};

var cookieEnabledMsg = {
		'ko' : '',
		'en' : '',
		'ja' : '',
		'zh_cn' : '',
		'zh_tw' : ''
}

var _isDebug = false;				//디버그모드
function fnConsoleLog(msg) {
	if(_isDebug) {
		console.log(msg);
	}
}

var ukey = "";
var wdata = "";

var Common = (function(){
	function Common() {
		
		var _srnPmtHeader = {};				//화면전달데이터의 헤더부
		var _akHeader = {};					//callApi에서 생성할 JWT의 헤더부
		var _flwNo = null;					//추적번호
		var _ccoSiteNo = null;				//제휴사사이트번호(제휴사에서 넘어오는 값)
		var _acesTkn = null;				//접근토큰
		var _ccoDlyMsg = null;				//제휴사전달메시지(제휴사에서 넘어오는 값)
		var _langCode = null;				//언어코드
		var _opMd = null;					//통합회원제 화면호출 방식(제휴사에서 넘어오는 값)
		var _srnHeaderExpsYn = null;		//통합회원제 상단 헤더부분(ex.로고) 표시여부
		var _rturUrl = null;				//제휴사 리턴 URL
		var _rturUrlCaloMethd = null;		//제휴사 리턴 URL 호출시 사용할 HTTP Method방식
		var _clntEncKey = null;				//callApi에서 생성할 JWT를 만드는데 사용할 암호화키
		var _signKey = null;				//callApi에서 생성할 JWT를 만드는데 사용할 서명키
		var _bfSrnPmt = {};					//이전 화면에서 전달받은 데이터
		var _urEvnmtDc = null;				//사용자환경구분코드
		var _ccoNo = null;                  //제휴사번호
		var _ccoNm = null;                  //제휴사명
		var _ccoEnm = null;                 //제휴사영문명
		var _onlCstTpC = null;              //온라인고객유형코드
		var _ageDc = null;                  //연령구분코드
		var _frnYn = null;                  //외국인여부
		var _iosMobYn = false;				//ios 웹앱 여부확인 flag
		var _hmpgUrl = null;                //홈페이지URL
		var _rnmCtfMdc = null;              //실명인증방법코드
		var _hostNm = "lpointSsoApp";		//앱 스키마의 호스트명이 없을 때 세팅할 초기 값
		var _self = this;
		var _fdsUYn = ""; 	                    //fds사용여부 추가
		var _lgnLmRsc = "";

		/**
		 * 통합회원제 Web 라이브러리
		 * - 내부 멤버 변수 초기화
		 * - fds 처리 유무
		 */
		this.init = function(srnPmt, fdsYn){
			if(DataUtil.isEmpty(srnPmt)){
				throw _isDebug ? "[Common|init] 서버에서 전달받은 데이터가 없습니다." : "ERROR";
				return;
			} else{
				try{
					if(_isDebug) {
						console.log("[Common|init] srnPmt : " + srnPmt);
					}
					//헤더 세팅 및 추적번호 세팅
					_srnPmtHeader = EncryptUtil.extractJwtHeader(srnPmt);
					_flwNo = _srnPmtHeader.flwNo;
					
					//화면이동시 포함된 srnPmt를 복호화하는 키는 flwNo로 생성하여 사용
					var clntEncKey = EncryptUtil.generateSrnPmtEncKey(_flwNo);
					var pmt = EncryptUtil.extractJwtPayload(clntEncKey,srnPmt);
					_bfSrnPmt = EncryptUtil.revertXssFiltering(pmt.bfSrnPmt);
					//payload 부분에 있는 데이터 세팅
					if(DataUtil.isJsonStr(_bfSrnPmt)){
						_bfSrnPmt = JSON.parse(_bfSrnPmt);
					} else if(DataUtil.isEmpty(_bfSrnPmt)) {
						_bfSrnPmt = {};
					}
					
					_ccoSiteNo = pmt.ccoSiteNo;
					_acesTkn = pmt.acesTkn;
					_ccoDlyMsg = pmt.ccoDlyMsg;
					_langCode = pmt.langCode;
					_opMd = pmt.opMd;
					_srnHeaderExpsYn = pmt.srnHeaderExpsYn;
					_rturUrl = pmt.rturUrl;
					_rturUrlCaloMethd = pmt.rturUrlCaloMethd;
					_clntEncKey = pmt.clntEncKey;
					_signKey = _clntEncKey;
					_urEvnmtDc = pmt.urEvnmtDc;
					_hmpgUrl = pmt.hmpgUrl;
					_ccoNo = pmt.ccoNo;
					_ccoNm = pmt.ccoNm;
					_ccoEnm = pmt.ccoEnm;
					_rnmCtfMdc = pmt.rnmCtfMdc;
					
					_onlCstTpC = (_bfSrnPmt != null && !DataUtil.isEmpty(_bfSrnPmt.onlCstTpC)) ?_bfSrnPmt.onlCstTpC : pmt.onlCstTpC;
					_ageDc = (_bfSrnPmt != null && !DataUtil.isEmpty(_bfSrnPmt.ageDc)) ?_bfSrnPmt.ageDc : pmt.ageDc;
					_frnYn = (_bfSrnPmt != null && !DataUtil.isEmpty(_bfSrnPmt.frnYn)) ?_bfSrnPmt.frnYn : pmt.frnYn;
					//callApi에서 사용할 헤더부분 세팅
					_akHeader = {
							akTypCode : 'I',
							flwNo : _flwNo,
							ccoSiteNo : _ccoSiteNo
					};
					if((_urEvnmtDc == '2' || _urEvnmtDc == '3') && navigator.userAgent.toLowerCase().match(/(iphone|ipod|ipad)/)) {
						_iosMobYn = true;
					}
					_fdsUYn = pmt.fdsUYn;
					//fds적용
					if(_fdsUYn == "Y"){
						if(fdsYn != 'Y'){
							iTracerAF.init(function(_date){
				            // data parameter 구조
				            // data.wdata : 암호화된 단말 정보, 해당 정보를 WAS로 전달
				            // data.ukey : 암호화된 단말키
				            	console.log(_date);
				            	console.log(_date.wdata);
				            	console.log(_date.ukey);
				            	wdata = _date.wdata;
				            	ukey = _date.ukey;
				            });
						}
					}
					
				} catch(e) {
					throw e;
				}
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 이전 화면에서 전달한 parameters 반환
		 */
		this.getChannelData = function (){
			var channelData = _bfSrnPmt;
			channelData.ccoSiteNo = _ccoSiteNo;
			channelData.ccoNo = _ccoNo;
			channelData.ccoNm = _ccoNm;
			channelData.ccoEnm = _ccoEnm;
			channelData.onlCstTpC = _onlCstTpC;
			channelData.hmpgUrl = _hmpgUrl;
			channelData.ageDc = _ageDc;
			channelData.frnYn = _frnYn;
			channelData.langCode = _langCode;
			channelData.rnmCtfMdc = _rnmCtfMdc;
			channelData.fdsUYn = _fdsUYn;
			channelData.rturUrl = _rturUrl;
			return channelData;
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - ajax 서비스 호출
		 */
		this.callApi = function(options) {
			if(_isDebug) {
				console.log("[callApi] API start");
				console.log("[callApi] open : " + options.akUrl);
			}
			if(DataUtil.isEmpty(options.akUrl)) {
				throw 'akUrl은 필수 항목입니다.';
			}
			
			var data = {};
			if(!DataUtil.isEmpty(options.akDta)) {
				data = options.akDta;
			}
			data.acesTkn = _acesTkn;
			data.ccoDlyMsg = _ccoDlyMsg;
			data.fdsUYn = _fdsUYn;
            
			if(!DataUtil.isFunction(options.callback)) {
				throw 'callback 함수는 필수 항목입니다.';
			}
			
			//fds 데이터 추가
			if(DataUtil.isEmpty(data.wdata)){
				data.wdata = wdata;
				data.ukey = ukey;
			}
			
			//JSON->JWT
			data = EncryptUtil.createJwt(_clntEncKey, _signKey, _akHeader, data);
			
			//서비스 호출(use Ajax)
			HttpUtil.ajax(options.akUrl, data,
				function(jwt) {
					var rspDta = {};
					try {
						if(typeof(jwt) === 'object') {
							rspDta = jwt;
						} else if(DataUtil.isJsonStr(jwt)) {
							rspDta = JSON.parse(jwt);
						} else {
							rspDta = EncryptUtil.extractJwtPayload(_clntEncKey, jwt);
						}
					} catch(e) {
						throw 'JWT 변환오류';
					}
					
					if(!DataUtil.isEmpty(rspDta) && !DataUtil.isEmpty(rspDta.acesTkn)) {
						_acesTkn = rspDta.acesTkn;
					}
					if(_isDebug) {
						console.log("[callApi] jwt			: " + JSON.stringify(rspDta));
					}
					//callback에 응답데이터 전달
					options.callback(rspDta, jwt);
				}
			);
			
			if(_isDebug) {
				console.log("[callApi] API end");
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 화면 이동
		 */
		this.movePage = function(url, parameters) {
			if(DataUtil.isEmpty(url)) {
				throw 'url은 필수 항목입니다.';
			}
			var data = {};
			
			if(!DataUtil.isEmpty(parameters)) {
				if(DataUtil.isJsonStr(parameters)) {
					data = JSON.parse(parameters);
				} else {
					data = parameters;
				}
			}
			
			var _data = {};
			_data.bfSrnPmt = JSON.stringify(data);
			_data = _self._addRequiredParameters(_data);
			_data = EncryptUtil.createSrnPmt(EncryptUtil.generateSrnPmtEncKey(_flwNo), _srnPmtHeader, _data);
			_self._submit(url, _data);
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 화면 이동 데이터 조회 : 받은 파라미터값을 jwt변환한 후 url에 srnPmt값으로 붙여 리턴하는 함수
		 */
		this.getNextPageUrl = function(url, parameters) {
			if(DataUtil.isEmpty(url)) {
				throw 'url은 필수 항목입니다.';
			}
			var data = {};
			
			if(!DataUtil.isEmpty(parameters)) {
				if(DataUtil.isJsonStr(parameters)) {
					data = JSON.parse(parameters);
				} else {
					data = parameters;
				}
			}
			
			var _data = {};
			_data.bfSrnPmt = JSON.stringify(data);
			_data = _self._addRequiredParameters(_data);
			_data = EncryptUtil.createSrnPmt(EncryptUtil.generateSrnPmtEncKey(_flwNo), _srnPmtHeader, _data);
			
			var domain = '';
			domain += window.location.protocol + '//';
			domain += window.location.hostname;
			if(window.location.port){
				domain += ':'+ window.location.port;
			}
			
			return domain + url + '?srnPmt=' + _data;
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 화면 이동 데이터 조회 : 받은 파라미터값을 jwt변환해주는 함수
		 */
		this.getNextPageParameter = function(parameters) {
			var data = {};
			
			if(!DataUtil.isEmpty(parameters)) {
				if(DataUtil.isJsonStr(parameters)) {
					data = JSON.parse(parameters);
				} else {
					data = parameters;
				}
			}
			
			var _data = {};
			_data.bfSrnPmt = JSON.stringify(data);
			_data = _self._addRequiredParameters(_data);
			_data = EncryptUtil.createSrnPmt(EncryptUtil.generateSrnPmtEncKey(_flwNo), _srnPmtHeader, _data);
			
			return _data;
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 통합회원제 화면서비스 종료시점에 버튼 누를 시 동작하는 함수
		 * - 2021-03-04 modified by 박재홍. 로그인 응답 데이터 파라미터 추가
		 * @param data : ssoTkn
		 * 		- hidden iframe에서는 jwt
		 * 		- popup에서는 jwt(rturUrl이 일반 URL형식)
		 */
		this.endScreen = function(data, jwt, idAutoCrtYn, lgnResult) {
			//2018-10-23 add. 네이티브 앱인 경우, sdk로 webview 제거 요청 interface 호출
			if(DataUtil.isEmpty(data)) {
				data = "";
			}
			//2018-11-19 add. PC Web 혹은 Mobile Web에서 팝업 종료 시점에 반환하는 데이터의 null체크 추가
			//체크 하지 않았을 때 'undefined' 문자열이 세팅이 되어 넘어가는 문제 발생
			if(DataUtil.isEmpty(jwt)) {
				jwt = "";
			}
			
			//2021-02-01 added by 박재홍. 3번째 파라미터 ID 자동생성여부가 들어올 경우, 리턴URL 호출 시 전달함
			if(DataUtil.isEmpty(idAutoCrtYn)) {
				idAutoCrtYn = "";
			}
			
			if(_urEvnmtDc == '3') {
				if(window.ssoJsItf) {
					//AOS
					window.ssoJsItf.endScreen();
				} else if(_iosMobYn){
					//IOS
					_self._callIOSScheme("lpointSsoApp://endScreen");
				}
			} else {
				//2018-11-27 add. Lpoint앱로그인 프로세스를 타는 경우 해당 값 "Y"로 세팅됨
				var itgAppCtfYn = $("input[name='itgAppCtfYn']").val();
				//네이티브 앱이 아닌경우 아래 로직을 진행
				if(_opMd == '1') {
					//iframe일 때는 부모페이지가 남아있고, api 라이브러리가 있으므로 message를 보내 eventHandler를 동작시킨다.
					_self._triggerEventForIframeParent('END', jwt);
				} else if(!DataUtil.isEmpty(_rturUrl)) {
					//일반 URL(http, https)일때
					if(_self._urlChecker(_rturUrl)) {
						//화면호출방식(opMd)에 따라서 분기처리
						if(_urEvnmtDc == '2' && _opMd == '2') {
							//사용자 환경구분코드 '2' == 하이브리드 앱 & opMd '2' == 팝업모드 -> Lpoint앱
							
							//2018-11-27 add. Lpoint 앱로그인 종료시점에 ssoTkn을 넘겨주는 케이스면 뒤에 구분자와 값 추가
							//2018-12-03 fixed. data가 있을 때만 @+itgAppCtfYn 값이 포함되도록 변경(Lpoint앱 로그인 화면에서 취소 누를 때 @Y를 넘겨주는 버그 픽스)
							if(itgAppCtfYn == 'Y' && !DataUtil.isEmpty(data)) {
								data += "@" + itgAppCtfYn;
							}
							
							if(_iosMobYn) {
								var url = "lpointSsoApp://requestApp";
								//data가 있는 경우는 ssoTkn 값이 파라미터로 넘어옴
								
								//2018-12-06 modified by MP01126. _rturUrl에 쿼리스트링이 있는 경우를 감안하여 URI 인코딩 처리 
								url += "?scheme=" + EncryptUtil.encodeUri(_rturUrl);
								
								//2018-12-06 modified by MP01126. 쿼리스트링에 추가하는 데이터는 없는 경우엔 추가하지 않도록 수정
								if(!DataUtil.isEmpty(data)) {
									url += "&ssoTkn=" + data;
								}
								if(!DataUtil.isEmpty(_ccoDlyMsg)) {
									url += "&ccoDlyMsg=" + _ccoDlyMsg;
								}
								_self._callIOSScheme(url);
							} else if(window.ssoJsItf) {
								window.ssoJsItf.requestApp(_rturUrl, data, _ccoDlyMsg);
							}
						} else if(_opMd == '2') {
							//PC Web 혹은 Mobile Web에서 팝업으로 호출하면 팝업리턴URL 호출
							if(_rturUrlCaloMethd.toLowerCase() == "post") {
								//2021-02-01 modified by 박재홍. idAutoCrtYn 항목 추가
								//2021-02-17 modified by 박재홍. pop-up 일때 ccoDlyMsg, ssoTkn 항목 같이 넘기도록 추가 (L.POINT 채널 고도화 대응)
								_self._submit(_rturUrl, "", "", data, _ccoDlyMsg, jwt, idAutoCrtYn, lgnResult);
							} else {
								var url = _rturUrl;
								
								//2018-12-06 modified by MP01126. jwt 데이터가 없는 경우 쿼리스트링에 추가하지 않음
								if(!DataUtil.isEmpty(jwt)) {
									if(url.indexOf("?") == -1) {
										url += "?jwt=";
									} else {
										url += "&jwt=";
									}
									url += jwt;
								}
								//2021-02-17 modified by 박재홍. pop-up 일때 ccoDlyMsg, ssoTkn 항목 같이 넘기도록 추가 (L.POINT 채널 고도화 대응)
								if(!DataUtil.isEmpty(data)) {
									if(url.indexOf("?") == -1) {
										url += "?ssoTkn=";
									} else {
										url += "&ssoTkn=";
									}
									url += data;
								}
								if(!DataUtil.isEmpty(_ccoDlyMsg)) {
									if(url.indexOf("?") == -1) {
										url += "?ccoDlyMsg=";
									} else {
										url += "&ccoDlyMsg=";
									}
									url += _ccoDlyMsg;
								}
								//2021-02-01 added by 박재홍. idAutoCrtYn 항목 추가
								if(!DataUtil.isEmpty(idAutoCrtYn)) {
									if(url.indexOf("?") == -1) {
										url += "?idAutoCrtYn=";
									} else {
										url += "&idAutoCrtYn=";
									}
									url += idAutoCrtYn;
								}
								//2021-03-04 added by 박재홍. 로그인 결과 데이터 항목 추가(ssoTkn은 별도 파라미터가 잇으므로, 해당 데이터 제외하고 처리)
								if(!DataUtil.isEmpty(lgnResult)) {
									for (var key in lgnResult) {
										if(key != "ssoTkn") {
											//ssoTkn을 제외한 나머지 항목들
											if(url.indexOf("?") == -1) {
												url += "?" + key + "=";
											} else {
												url += "&" + key + "=";
											}
											url += DataUtil.isEmpty(lgnResult[key]) ? '' : lgnResult[key];
										} else {
											if(DataUtil.isEmpty(data)) {
												//data(ssoTkn) 파라미터가 null인 경우, 로그인 결과데이터에 있는 ssoTkn을 세팅함
												if(url.indexOf("?") == -1) {
													url += "?" + key + "=";
												} else {
													url += "&" + key + "=";
												}
												url += DataUtil.isEmpty(lgnResult[key]) ? '' : lgnResult[key];
											}
										}
									}
								}
								
								window.location.href = url;
							}
						} else {
							if(_rturUrlCaloMethd.toLowerCase() == "post") {
								//2021-02-01 modified by 박재홍. idAutoCrtYn 항목 추가
								_self._submit(_rturUrl,"","",data, _ccoDlyMsg, "", idAutoCrtYn, lgnResult);
							} else {
								var url = _rturUrl;
								
								//2018-12-06 modified by MP01126. 데이터가 없으면 쿼리스트링에 추가하지 않도록 수정
								if(!DataUtil.isEmpty(data)) {
									if(url.indexOf("?") == -1) {
										url += "?ssoTkn=";
									} else {
										url += "&ssoTkn=";
									}
									url += data;
								}
								
								if(!DataUtil.isEmpty(_ccoDlyMsg)) {
									if(url.indexOf("?") == -1) {
										url += "?ccoDlyMsg=";
									} else {
										url += "&ccoDlyMsg=";
									}
									url += _ccoDlyMsg;
								}
								
								//2021-02-01 added by 박재홍. idAutoCrtYn 항목 추가
								if(!DataUtil.isEmpty(idAutoCrtYn)) {
									if(url.indexOf("?") == -1) {
										url += "?idAutoCrtYn=";
									} else {
										url += "&idAutoCrtYn=";
									}
									url += idAutoCrtYn;
								}
								
								//2021-03-04 added by 박재홍. 로그인 결과 데이터 항목 추가(ssoTkn은 별도 파라미터가 잇으므로, 해당 데이터 제외하고 처리)
								if(!DataUtil.isEmpty(lgnResult)) {
									for (var key in lgnResult) {
										//실제 데이터가 존재하는 항목에 대해서만 처리
										if(key != "ssoTkn") {
											//ssoTkn을 제외한 나머지 항목들
											if(url.indexOf("?") == -1) {
												url += "?" + key + "=";
											} else {
												url += "&" + key + "=";
											}
											url += DataUtil.isEmpty(lgnResult[key]) ? '' : lgnResult[key];
										} else {
											if(DataUtil.isEmpty(data)) {
												//data(ssoTkn) 파라미터가 null인 경우, 로그인 결과데이터에 있는 ssoTkn을 세팅함
												if(url.indexOf("?") == -1) {
													url += "?" + key + "=";
												} else {
													url += "&" + key + "=";
												}
												url += DataUtil.isEmpty(lgnResult[key]) ? '' : lgnResult[key];
											}
										}
									}
								}
								
								window.location.href = url;
							}
						}
					} else {
						//앱 스키마 일때 화면 호출여부와 상관없이 앱스키마를 호출(GET방식)
						//스키마에 호스트 부분이 비어있는 경우 세팅
						var rturScheme = _self._addHostName(_rturUrl);
						//하이브리드 앱에서 endscreen이 호출될 때 rturUrl이 스키마면 외부로 불러줘야 함
						if(_urEvnmtDc == '2') {
							//2018-11-27 add. Lpoint 앱로그인 종료시점에 ssoTkn을 넘겨주는 케이스면 뒤에 구분자와 값 추가
							//2018-12-03 fixed. data가 있을 때만 @+itgAppCtfYn 값이 포함되도록 변경(Lpoint앱 로그인 화면에서 취소 누를 때 @Y를 넘겨주는 버그 픽스)
							if(itgAppCtfYn == 'Y' && !DataUtil.isEmpty(data)) {
								data += "@" + itgAppCtfYn;
							}

							if(_iosMobYn) {
								var url_scheme = "lpointSsoApp://requestApp";
								url_scheme += "?scheme=" + EncryptUtil.encodeUri(rturScheme);
								if(!DataUtil.isEmpty(data)) {
									url_scheme += "&ssoTkn=" + data;
								} else {
									url_scheme += "&ssoTkn=";
								}
								url_scheme += "&ccoDlyMsg=" + _ccoDlyMsg;
								
								_self._callIOSScheme(url_scheme);
							} else if(window.ssoJsItf) {
								window.ssoJsItf.requestApp(rturScheme, data, _ccoDlyMsg);
							}
						} else {
							_rturUrlCaloMethd = 'get';
							//_rturUrl이 스키마("://"앞부분)만 있는 경우, 안드로이드에서 스키마 호출에 대한 컨트롤이 안됨
							//-> 미리 약속한 호스트명을 추가하고, 쿼리스트링을 추가하여 호출한다
							//2018-12-06 modified by MP01126. 앱스키마에 쿼리스트링이 포함되어있는 경우 데이터 세팅 시 분기처리
							if(!DataUtil.isEmpty(data)) {
								if(rturScheme.indexOf("?") == -1) {
									rturScheme += "?ssoTkn=" + data;
								} else {
									rturScheme += "&ssoTkn=" + data;
								}
							}
							
							if(!DataUtil.isEmpty(_ccoDlyMsg)) {
								if(rturScheme.indexOf("?") == -1) {
									rturScheme += "?ccoDlyMsg=" + _ccoDlyMsg;
								} else {
									rturScheme += "&ccoDlyMsg=" + _ccoDlyMsg;
								}
							}
							
							window.location.href = rturScheme;
						}
					}
				}
			}
			
			//======================================================
			//2018-11-15 add. Lpoint앱 종료를 위한 인터페이스 호출부 추가
			if(window.lpointJsItf) {
				window.lpointJsItf.endLpointApp();
			} else if(_iosMobYn) {
				var lpointScheme = "lpointJsItf://endLpointApp";
				setTimeout(function() {
					_self._callIOSScheme(lpointScheme);
				}, 100);
			}
			//======================================================
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - SSO토큰을 sessionStorage에서 조회
		 */
		this.getSsoTkn = function(callback) {
			if(window.ssoJsItf) {
				return window.ssoJsItf.getSsoTkn();
			} else if (_iosMobYn) {
				if(DataUtil.isFunction(callback)){
					var fnNm = callback.toString().match(/^function\s*([^\s(]+)/)[1];
					_self._callIOSScheme('lpointSsoApp://getSsoTkn?callback='+fnNm);
				} else {
					throw _isDebug ? "callback이 함수가 아닙니다." : "ERROR";
				}
				return;
			} else {
				try{
					return sessionStorage.getItem('ssoTkn');
				}catch(e){
					if(_isDebug) {
						console.log("[getSsoTkn]:sessionStorage.getItem error");
					}
					return null;
				}
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - SSO토큰을 sessionStorage에 저장
		 */
		this.setSsoTkn = function(ssoTkn) {
			if(DataUtil.isEmpty(ssoTkn)) {
				return;
			} else {
				if(window.ssoJsItf) {
					window.ssoJsItf.saveSsoTkn(ssoTkn);
				} else if(_iosMobYn) {
					_self._callIOSScheme("lpointSsoApp://saveSsoTkn?ssoTkn="+ssoTkn);
				} else {
					try{
						sessionStorage.setItem('ssoTkn', ssoTkn);
					}catch(e){
						if(_isDebug) {
							console.log("[setSsoTkn]:sessionStorage.setItem error");
						}
					}
				}	
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - sessionStorage에서 SSO토큰을 삭제
		 */
		this.removeSsoTkn = function() {
			if(window.ssoJsItf) {
				window.ssoJsItf.removeSsoTkn();
			} else if(_iosMobYn) {
				_self._callIOSScheme("lpointSsoApp://removeSsoTkn");
			} else {
				try{
					sessionStorage.removeItem('ssoTkn');
				}catch(e){
					if(_isDebug) {
						console.log("[removeSsoTkn]:sessionStorage.removeItem error");
					}
				}
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - Lpoint앱로그인정보(갱신토큰, 자동로그인등록일시)를 조회
		 */
		this.getLpointLoginInf = function(callback) {
			if(window.ssoJsItf) {
				return window.ssoJsItf.getLpointLoginInf();
			} else if (_iosMobYn) {
				if(DataUtil.isFunction(callback)){
					var fnNm = callback.toString().match(/^function\s*([^\s(]+)/)[1];
					_self._callIOSScheme('lpointSsoApp://getLpointLoginInf?callback='+fnNm);
				} else {
					throw _isDebug ? "callback이 함수가 아닙니다." : "ERROR";
				}
				return;
			} else {
				var rnwTkn = sessionStorage.getItem('rnwTkn');
				var autoLgnRgDtti = sessionStorage.getItem('autoLgnRgDtti');
				return JSON.stringify({rnwTkn: rnwTkn, autoLgnRgDtti: autoLgnRgDtti});
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - Lpoint앱로그인정보(갱신토큰, 자동로그인등록일시)를 저장
		 */
		this.setLpointLoginInf = function(rnwTkn) {
			if(DataUtil.isEmpty(rnwTkn)) {
				return;
			} else {
				if(window.ssoJsItf) {
					window.ssoJsItf.saveLpointLoginInf(rnwTkn);
				} else if(_iosMobYn) {
					_self._callIOSScheme("lpointSsoApp://saveLpointLoginInf?rnwTkn="+rnwTkn);
				} else {
					sessionStorage.setItem('rnwTkn', rnwTkn); // 갱신토큰
					sessionStorage.setItem('autoLgnRgDtti', DataUtil.getCurrentDateTime()); // 자동로그인등록일시
				}	
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - Lpoint앱로그인정보(갱신토큰, 자동로그인등록일시)를 삭제
		 */
		this.removeLpointLoginInf = function() {
			//2018-11-14 add. Lpoint앱에서 갱신토큰 삭제(다른 아이디로 로그인하기) 시점에 Common이 들고있는 acesTkn 초기화
			_acesTkn = null;
			
			if(window.ssoJsItf) {
				window.ssoJsItf.removeLpointLoginInf();
			} else if(_iosMobYn) {
				_self._callIOSScheme("lpointSsoApp://removeLpointLoginInf");
			} else {
				sessionStorage.removeItem('rnwTkn');
				sessionStorage.removeItem('autoLgnRgDtti');
			}
		}		
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 화면 언어설정 변경
		 * @param String langCode 언어코드
		 * @param boolean 다음 페이지부터 적용할지 여부 (기본값 false) 
		 */
		this.changeLocale = function(langCode, applyFromNextPage) {
			_langCode = langCode;
			
			if(!applyFromNextPage){
				var nowUrl = window.location.href;
				var data = {};
				data.bfSrnPmt = JSON.stringify(_bfSrnPmt);
				data = _self._addRequiredParameters(data);
				var encKey = EncryptUtil.generateSrnPmtEncKey(_flwNo);
				data = EncryptUtil.createSrnPmt(encKey, _srnPmtHeader, data);
				_self._submit(nowUrl, data);
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 팝업 생성 및 팝업으로 submit 
		 */
		this.callPopup = function(url, data) {
			var param = {};
			var popup_title = "";
			
			if(!DataUtil.isEmpty(data)) {
				if(DataUtil.isJsonStr(data)) {
					param = JSON.parse(data);
				} else if(typeof(data) === 'object') {
					param = data;
				}
			}
			
			//data setting
			var _data = {};
			_data.bfSrnPmt = JSON.stringify(param);
			_data = _self._addRequiredParameters(_data);
			//2018-10-24 add. native 앱에서 webView를 생성하고, 팝업을 호출하는 경우 jwt로 말아지기 전에
			//사용자환경구분코드 값 변경 '3'->'2'
			//hybrid 앱에서 외부 브라우저로 팝업을 호출한다와 흐름이 동일
			if(_data.urEvnmtDc == '3') {
				_data.urEvnmtDc = '2';
			}
			_data = EncryptUtil.createSrnPmt(EncryptUtil.generateSrnPmtEncKey(_flwNo), _srnPmtHeader, _data);
			
			var _domain;
			if(window.location.origin) {
				_domain = window.location.origin;
			} else {
				//http:// or https://
				_domain += window.location.protocol + "//";
				//testmembers.lpoint.com
				_domain += window.location.hostname + ":";
				//500
				_domain += window.location.port;
			}
			
			if(window.ssoJsItf) { //android popup으로 submit
				//안드로이드 javascriptinterface 호출
				window.ssoJsItf.callExternalBrowser(_domain + url, "srnPmt",_data);
			} else if(_iosMobYn){
				//IOS 스키마 호출 및 파라미터 세팅
				_self._callIOSScheme("lpointSsoApp://callExternalBrowser?url=" + _domain+url +"&srnPmt="+_data);
			} else {
				try {
					//get popup name for form target
					popup_title = _self._createPopup();
					
					_self._submit(url, _data, popup_title);
				} catch(e) {
					alert("팝업이 차단되었습니다. 팝업차단을 해제해주세요.");
				}
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - app native영역으로 핀/지문 입력화면 요청
		 */
		this.showFidoInput = function(fido, type, rspDta) {
			//fido : 핀('0')/지문('1') 구분값
			//type : 등록('0')/변경('1')/해지('2') 구분값
			var fnNm = "SsoInterfaceCallback";
			var data = {};
			if(DataUtil.isJsonStr(rspDta)) {
				data = JSON.parse(rspDta);
			} else {
				data = rspDta;
			}
			//필수 값 검증 시작
			
			if(DataUtil.isEmpty(fido) || DataUtil.isEmpty(type)) {
				throw _isDebug ? "필수 항목 누락입니다." : "ERROR";
			} else if(fido != '0' && fido != '1') {
				throw _isDebug ? "fido값이 '0' 또는 '1'이 아닙니다." : "ERROR";
			} else if(type != '0' && type != '1' && type != '2') {
				throw _isDebug ? "type값이 '0' 또는 '1' 또는 '2'가 아닙니다." : "ERROR";
			}
			if(DataUtil.isEmpty(rspDta)) {
				throw _isDebug ? "필수 항목 누락입니다." : "ERROR";
			}
			if(DataUtil.isEmpty(data.fidoCtfInf)) {
				throw _isDebug ? "fidoCtfInf는 필수 값입니다." : "ERROR";
			}
			if(DataUtil.isEmpty(data.fidoSysId)) {
				throw _isDebug ? "fidoSysId는 필수 값입니다." : "ERROR";
			}
			if(DataUtil.isEmpty(_acesTkn)) {
				throw _isDebug ? "acesTkn이 없습니다. 로그인이 선행되어야 합니다." : "ERROR";
			} else {
				data.acesTkn = _acesTkn;
			}
			//2018-11-13. add. 화면호출 API로 간편인증 등록화면 직접호출시 앱 라이브러리에서 통합회원제 도메인과 요청제휴사사이트번호값이 없어
			//해당 데이터 추가
			data.domain = _self._getFidoDta().domain;
			data.ccoSiteNo = _ccoSiteNo;
			
			//필수 값 검증 끝
			//JSON Object -> JSON String
			data = JSON.stringify(data);
			
			//URI 인코딩 처리
			//data = EncryptUtil.encodeUri(data);
			//자바스크립트 인터페이스를 호출한다. --> native 입력화면 호출 요청
			if(_iosMobYn) {
				var url = "lpointSsoApp://showFidoInput?";
				url += "fido=" + fido + "&type=" + type + "&rspDta=" + data + "&callback=" + fnNm;
				//url += "domain=" + _self._getFidoDta().domain + "&ccoSiteNo=" + _ccoSiteNo + "&fido=" + fido + "&type=" + type + "&rspDta=" + data + "&callback=" + fnNm;
				_self._callIOSScheme(url);
			} else if(window.ssoJsItf) {
				window.ssoJsItf.showFidoInput(fido, type, data, fnNm);
				//window.ssoJsItf.showFidoInput(_self._getFidoDta().domain, _ccoSiteNo, fido, type, data, fnNm);
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 등록화면에서 사용하는 로그인 공통 callback
		 * @param rspDta - 서버 응답을 JSON Object 형태로 넘겨 받음
		 * @param option - 후처리 화면으로 넘기는 데이터 중에서 rspDta 항목에 없는 경우 option(JSON Object)에 추가해서 파라미터로 전달
		 */
		this.loginCallback = function(rspDta) {
			var _rspDta = {};
			
			if(DataUtil.isJsonStr(rspDta)) {
				_rspDta = JSON.parse(rspDta);
			} else if(typeof(rspDta) === 'object'){
				_rspDta = rspDta;
			} else {
				throw _isDebug ? "rspDta 형식이 맞지 않습니다." : "ERROR";
			}
			
			//후처리가 있는 경우 URL 파싱
			var akUrl = _noticePageUrl[_rspDta.rspC + _rspDta.rspDtc];
			
			if(_rspDta.rspClac == 'S') {
				//로그인 성공 응답
				//로그인 성공시 ssoTkn을 저장소에 저장한다
				if(!DataUtil.isEmpty(_rspDta.ssoTkn)) {
					_self.setSsoTkn(_rspDta.ssoTkn);
				}
				
				if((_rspDta.rspC == '00' && _rspDta.rspDtc == '401')||(_rspDta.rspC == '00' && _rspDta.rspDtc == '403')) {
					//캠페인 화면 팝업처리
					var opMdBkp = _opMd;
					//팝업 처리를 위해 화면 호출 방식을 팝업모드로 세팅
					_opMd = '2';
					_self.callPopup(akUrl, _rspDta);
					//팝업 호출 후 기존 화면 호출 방식으로 백업
					_opMd = opMdBkp;
				}
				//로그인 성공 후처리 종료
			} else if(_rspDta.rspClac == 'E') {
				//로그인 실패 응답
				//후처리 화면 중에 세팅 데이터가 필요한 경우 추가!
				
				if(!DataUtil.isEmpty(akUrl)) {
					//후처리 URl이 파싱된 경우, 해당 화면으로 rspDta를 전달
					/** 2020-11-24 added by 박재홍. 44434 2단계 인증 대상 응답 받았을 때 화면 데이터 체크*/
					if("44" == _rspDta.rspC && "434" == _rspDta.rspDtc) {
						//현재 통합회원제 URL의 서비스 URL을 파싱하여 화면 데이터 체크
						//ex) members.lpoint.com/exView/join/mbrJoin_01_001 -> /exView/join/mbrJoin_01_001
						var pathNm = window.location.pathname;
						
						if("/lgnView/login/lpointLogin_01_001" == pathNm) {
							//엘아로 ID/PW 로그인 > 2단계 인증 대상 응답 받은 경우
							_rspDta['lptIdLgnYn'] = 'Y';
						} else if("/exView/login/socialReg_01_001" == pathNm || "/exView/login/socialReg_02_001" == pathNm) {
							//소셜로그인인 경우
							_rspDta['copAccDc'] = _bfSrnPmt.copAccDc;
							_rspDta['copTkn'] = _bfSrnPmt.copTkn;
							_rspDta['copAdInf'] = _bfSrnPmt.copAdInf;
							_rspDta['isSocialReg'] = 'Y';
						} else if("/exView/login/esyReg_01_002" == pathNm) {
							//간편로그인인 경우
							_rspDta['itgAppCtfYn'] = _bfSrnPmt.itgAppCtfYn;
							_rspDta['lgnTpDc'] = _bfSrnPmt.lgnTpDc;
							_rspDta['isEsyReg'] = 'Y';
						}
						_self.movePage(akUrl, _rspDta);
					} 
					/**==================================================================================*/
					_self.movePage(akUrl, _rspDta);
				} else {
					//후처리 URL이 파싱되지 않은 경우, 기본 오류페이지 화면으로 rspDta를 전달
					akUrl = _noticePageUrl['default_error'];
					_self.movePage(akUrl, _rspDta);
				}
				//로그인 실패 후처리 종료
			} else {
				//alert는 화면마다 처리 - 공통에서 처리하지 않음
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 웹 화면 헤더영역 노출여부 SET함수
		 */
		this.setSrnHeaderExpsYn = function(srnHeaderExpsYn) {
			_srnHeaderExpsYn = srnHeaderExpsYn;
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - javascript 기본 alert에 파라미터로 넘겨준 메시지 내용을 출력
		 */
		this.fnAlert = function(msg) {
			alert(msg)
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 제휴사 정보 업데이트
		 * @param ccoSiteInf : { 
		 * 						ccoSiteNo     : 제휴사사이트번호
		 * 						ccoNo         : 제휴사번호
		 * 						ccoNm         : 제휴사명
		 * 						ccoEnm        : 제휴사영문명
		 * 						hmpgUrl       : 홈페이지URL
		 * 						}
		 */
		this._setCcoSiteInf = function(ccoSiteInf) {
			if(!DataUtil.isEmpty(ccoSiteInf) && typeof(ccoSiteInf) === "object") {
				_ccoSiteNo = ccoSiteInf.ccoSiteNo;
				_ccoNo = ccoSiteInf.ccoNo;
				_ccoNm = ccoSiteInf.ccoNm;
				_ccoEnm = ccoSiteInf.ccoEnm;
				_hmpgUrl = ccoSiteInf.hmpgUrl;
				_akHeader.ccoSiteNo = _ccoSiteNo;
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - IOS 앱스키마 요청 메소드
		 */
		this._callIOSScheme = function(urlScheme) {
			var _ifrm = $('<iframe></iframe>');
			_ifrm.attr('src', urlScheme);
			_ifrm.appendTo('body');
			_ifrm.remove();
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 입력받은 URL이 일반 URL(http, https)인지, 앱 스키마인지 판별한다.
		 * @param url : 프로토콜 부분을 포함한 FULL URL
		 * @return boolean : true(일반 URL), false(앱 스키마)
		 */
		this._urlChecker = function (url) {
			if(url.indexOf("://") == -1) {
				//프로토콜 부분 누락
				throw _isDebug ? "프로토콜을 포함한 전체 URL을 입력해주세요." : "ERROR";
			}
			var protocol = url.split("://")[0].toLowerCase();
			var hostNm = url.split("://")[1];
			if(protocol == "http" || protocol == "https") {
				//일반 URL로 판단
				if(DataUtil.isEmpty(hostNm)) {
					//일반 URL일 때 호스트 부분이 없으면 잘못된 URL이므로 에러를 던진다(방어로직)
					throw _isDebug ? "잘못된 URL 형식입니다." : "ERROR";
				}
				return true;
			} else {
				return false;
			}
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - URL이 스키마 일 때, 호스트명이 없으면 약속된 값으로 세팅
		 * 
		 */
		this._addHostName = function(url) {
			if(url.indexOf("://") == -1) {
				//프로토콜 부분 누락
				throw _isDebug ? "프로토콜을 포함한 전체 URL을 입력해주세요." : "ERROR";
			}
			var _url = url;
			var protocol = _url.split("://")[0].toLowerCase();
			var hostNm = _url.split("://")[1];
			if(DataUtil.isEmpty(hostNm)) {
				//hostNm이 없으면 약속한 호스트명을 세팅
				_url += _hostNm;
			}
			
			return _url;
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 통합로그인 화면에서 FIDO(핀/지문) 로그인 요청에 필요한 데이터 조회
		 */
		this._getFidoDta = function() {
			var _domain;
			if(window.location.origin) {
				_domain = window.location.origin;
			} else {
				//http:// or https://
				_domain += window.location.protocol + "//";
				//testmembers.lpoint.com
				_domain += window.location.hostname + ":";
				//500
				_domain += window.location.port;
			}
			
			var fidoDta = {
					domain : _domain,
					rturUrl : _rturUrl,
					rturUrlCaloMethd : _rturUrlCaloMethd,
					ccoSiteNo : _ccoSiteNo,
					langCode : _langCode,
					iosMobYn : _iosMobYn
			};
			
			return fidoDta;
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 사용자환경구분코드 조회
		 */
		this._getUrEvnmtDc = function() {
			return _urEvnmtDc;
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 화면호출방식 조회
		 */
		this._getOpMd = function() {
			return _opMd;
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - acesTkn get 메소드
		 */
		this._getAcesTkn = function() {
			return _acesTkn;
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 팝업 생성 메소드
		 */
		this._createPopup = function(){
			try {
				var popup_title = "sso_channel_popup";
				var popWidth = 1160;
				var popHeight = 850;
				
				var popCssText = eval("'width=" + popWidth + 
									  ",height=" + popHeight + 
									  ",left=0" +
									  ",top=0" + 
									  ",scrollbars=1" + 
									  ",resizable=1'");
				
				var popup = window.open('about:blank', popup_title, popCssText);
				popup.focus();
			} catch (e) { //popup 생성 실패!
				throw _isDebug ? e : 'ERROR';
			}
			return popup_title;
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - URL로 submit 처리
		 */
		this._submit = function (url, srnPmt, target, ssoTkn, ccoDlyMsg, jwt, idAutoCrtYn, lgnResult) {
			//submit을 하기 위해 form 생성
			var _form = $('<form></form>');
			_form.attr('action', url);
			_form.attr('method', 'post');
			_form.appendTo('body');
			if (!DataUtil.isEmpty(target)) {
				_form.attr('target', target);
			}
			//hidden data 세팅
			var _formDta;
			if (!DataUtil.isEmpty(srnPmt)) {
				_formDta = $("<input name='srnPmt' type='hidden' value='"+ srnPmt + "'/>");
				_form.append(_formDta);
			}
			if(!DataUtil.isEmpty(jwt)) {
				_formDta = $("<input name='jwt' type='hidden' value='"+ jwt + "'/>");
				_form.append(_formDta);
			}
			if(!DataUtil.isEmpty(ssoTkn)) {
				_formDta = $("<input name='ssoTkn' type='hidden' value='"+ ssoTkn + "'/>");
				_form.append(_formDta);
			}
			if(!DataUtil.isEmpty(ccoDlyMsg)) {
				_formDta = $("<input name='ccoDlyMsg' type='hidden' value='"+ ccoDlyMsg + "'/>");
				_form.append(_formDta);
			}
			//2021-02-01 added by 박재홍. idAutoCrtYn 항목 추가
			if(!DataUtil.isEmpty(idAutoCrtYn)) {
				_formDta = $("<input name='idAutoCrtYn' type='hidden' value='"+ idAutoCrtYn + "'/>");
				_form.append(_formDta);
			}
			//2021-03-04 added by 박재홍. 로그인 결과데이터 항목 추가 (ssoTkn은 별도 파라미터로 처리 하므로, 그외 데이터만 세팅)
			if(!DataUtil.isEmpty(lgnResult)) {
				for(var item in lgnResult) {
					if(item == "ssoTkn") {
						if(DataUtil.isEmpty(ssoTkn)) {
							//파라미터에 ssoTkn 데이터는 비어있고, 로그인 결과데이터에는 ssoTkn이 존재하면 데이터 세팅하여 보냄
							_formDta = $("<input name='" + item + "' type='hidden' value='"+ DataUtil.isEmpty(lgnResult[item]) ? '' : lgnResult[item] + "'/>");
							_form.append(_formDta);
						}
					} else {
						//그 외 항목들
						_formDta = $("<input name='" + item + "' type='hidden' value='"+ DataUtil.isEmpty(lgnResult[item]) ? '' : lgnResult[item] + "'/>");
						_form.append(_formDta);
					}
				}
			}
			_form.submit();
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 통합회원제 화면이 iframe에 띄워진 경우, 부모창으로 message를 보내는 함수
		 */
		this._triggerEventForIframeParent = function(eventCode, data) {
			
			if(_isDebug) {
				console.log("[postMessage] eventCode	: " + eventCode);
				console.log("[postMessage] data			: " + data);
			}
			var message = {};
			message.eventCode = eventCode;
			if(!DataUtil.isEmpty(data)) {
				message.data = data;
			}
			message = JSON.stringify(message);
			
			window.parent.postMessage(message, '*');
		}
		
		/**
		 * 통합회원제 Web 라이브러리
		 * - 화면이동시 넘겨줄 parameters에 같이 들고갈 데이터 세팅
		 */
		this._addRequiredParameters = function(parameters) {
			var param = parameters;
			param.ccoSiteNo = _ccoSiteNo;
			param.acesTkn = _acesTkn;
			param.ccoDlyMsg = _ccoDlyMsg;
			param.langCode = _langCode;
			param.opMd = _opMd;
			param.srnHeaderExpsYn = _srnHeaderExpsYn;
			param.urEvnmtDc = _urEvnmtDc;
			param.rturUrl = _rturUrl;
			param.rturUrlCaloMethd = _rturUrlCaloMethd;
			param.clntEncKey = _clntEncKey;
			param.ccoNo = _ccoNo;
			param.ccoNm = _ccoNm;
			param.ccoEnm = _ccoEnm;
			param.onlCstTpC = _onlCstTpC;
			param.ageDc = _ageDc;
			param.frnYn = _frnYn;
			param.hmpgUrl = _hmpgUrl;
			param.rnmCtfMdc = _rnmCtfMdc;
			param.fdsUYn = _fdsUYn;
			return param;
		}
	}
	return Common;
}());

Common = new Common();

/**
 * 웹앱 전용 - 간편로그인 요청에 대한 응답을 받아 처리할 callback함수
 */
var SsoInterfaceCallback = function(rspDta) {
	//응답코드 + 응답상세코드
	var _rspDta;
	
	//2018-11-14 add. 화면호출방식에 따라 jwt를 반환하는 케이스 존재
	var _rtnJwt = eval("rtnJwt");
	if(DataUtil.isEmpty(_rtnJwt)) {
		_rtnJwt = "";
	}
	
	if(_isDebug) {
		console.log("[SsoInterfaceCallback] rspDta : " + JSON.stringify(rspDta));
	}
	
	if(DataUtil.isJsonStr(rspDta)) {
		_rspDta = JSON.parse(rspDta);
	} else {
		_rspDta = rspDta;
	}
	//2018-11-26 add. 통합앱 로그인페이지에서 간편인증 후처리로 등록페이지로 이동할 때 itgAppCtfYn 값 같이 물고가도록 추가
	var itgAppCtfYn = $("input[name='itgAppCtfYn']").val();
	if(itgAppCtfYn == "Y") {
		_rspDta.itgAppCtfYn = itgAppCtfYn;
	}

	//응답코드에 대한 후처리
	if(_rspDta.rspClac == "S") {
		Common.loginCallback(_rspDta);
		if(itgAppCtfYn == 'Y') {
			Common.setLpointLoginInf(_rspDta.rnwTkn);
		}
		if(Common._getOpMd() == '1') {
			//후처리 화면이 iframe이면
			Common.endScreen(_rtnJwt);
		} else if((Common._getUrEvnmtDc() == '0' || Common._getUrEvnmtDc() == '1') && Common._getOpMd() == '2') {
			//PC Web & Mobile Web에서 후처리 화면이 popup이면
			Common.endScreen(_rtnJwt);
		} else {
			Common.endScreen(DataUtil.isEmpty(_rspDta.ssoTkn) ? null : _rspDta.ssoTkn);
		}
	} else if(_rspDta.rspClac == "E") {
		//에러 후처리 화면 이동후 SsoInterfaceCallback 함수 종료
		Common.loginCallback(_rspDta);
		return;
	} else {
		//alert or confirm
		if(_rspDta.rspC == '00' && _rspDta.rspDtc == '206') {
			//간편인증 등록 성공
			//앱 SDK에서 alert을 띄우므로 스크립트에서는 alert을 띄우지 않는다
			//endScreen을 호출하여 화면 처리가 되도록 적용
			Common.endScreen();
		}
	}
}