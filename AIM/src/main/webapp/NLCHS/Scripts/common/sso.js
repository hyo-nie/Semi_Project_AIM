var ssoObj = {
    sso: {},
    ssoTkn: "",
    acesTkn: null,
    rnwTkn: "",
    cIntAkInfs: "",
    Init: function (opMd) {

        if (typeof (cIntAkInfs) != undefined && typeof (cIntAkInfs) != "undefined") {
            ssoObj.cIntAkInfs = cIntAkInfs;
        }

        var openMode = (opMd == null || opMd == undefined || opMd == "undefined" || opMd == "") ? "2" : opMd

        ssoObj.sso = new SsoClientLibrary({
            ccoSiteNo: ccoSiteNo,                                   // 제휴사사이트번호
            clntAkInf: decodeURIComponent(ssoObj.cIntAkInfs),       // 클라이언트요청정보
            acesTkn: ssoObj.acesTkn,			    // 접근토큰
            urEvnmtDc: '0',							// 사용자환경구분코드 0: PC Web 1: Mobile Web 2: Mobile App
            vrblNm: 'ssoObj.sso',							// 라이브러리변수명
            srnOpt: {
                opMd: openMode,							// 오픈모드 0: Redirect 1: iframe 2: Popup (팝업인경우:srnOpt.popRturUrl은 필수)
                srnHeaderExpsYn: 'Y',
                popRturUrl: CinemaServerDomain +"/"+ PLATFORM_TYPE  
            }
        });

    },
    Init_open: function (popRturUrl) {

        if (typeof (cIntAkInfs) != undefined && typeof (cIntAkInfs) != "undefined") {
            ssoObj.cIntAkInfs = cIntAkInfs;
        }

        //var openMode = (opMd == null || opMd == undefined || opMd == "undefined" || opMd == "") ? "2" : opMd

        ssoObj.sso = new SsoClientLibrary({
            ccoSiteNo: ccoSiteNo,                                   // 제휴사사이트번호
            clntAkInf: decodeURIComponent(ssoObj.cIntAkInfs),       // 클라이언트요청정보
            acesTkn: ssoObj.acesTkn,			    // 접근토큰
            urEvnmtDc: '0',							// 사용자환경구분코드 0: PC Web 1: Mobile Web 2: Mobile App
            vrblNm: 'ssoObj.sso',							// 라이브러리변수명
            srnOpt: {
                opMd: "2",							// 오픈모드 0: Redirect 1: iframe 2: Popup (팝업인경우:srnOpt.popRturUrl은 필수)
                srnHeaderExpsYn: 'Y',
                popRturUrl: popRturUrl
            }
        });

    },
    acesTknCk: function (opMd) {

        var openMode = (opMd == null || opMd == undefined || opMd == "undefined" || opMd == "") ? "2" : opMd

        var memberSetting = window.localStorage.getItem("WMEMBER_AUTH");
        if (memberSetting == null || memberSetting == undefined || memberSetting == "") {
            memberSetting = $.cookie("WMEMBER_AUTH");
        }

        if (memberSetting != null && memberSetting != undefined && memberSetting != "") {
            var memberSettingSplit = memberSetting.split('|');

            ssoObj.cIntAkInfs = memberSettingSplit[8];
            if (ssoObj.cIntAkInfs == "undefined" || ssoObj.cIntAkInfs == undefined || ssoObj.cIntAkInfs == null || ssoObj.cIntAkInfs == "") {
                ssoObj.cIntAkInfs = $.cookie("cIntAkInfs");
            }

            if (memberSettingSplit[6] == "" || memberSettingSplit[6] == "null") {
                alert("L.Point 회원가입된 계정으로 로그인 후 가능합니다.");
                if (typeof (showLoading) != undefined)
                    global.showLoading(false);
                return false;
            }

            ssoObj.acesTkn = memberSettingSplit[6];

        } else {
            if (!(cIntAkInfs == undefined || cIntAkInfs == null || cIntAkInfs == "")) {
                ssoObj.cIntAkInfs = cIntAkInfs;
                if (ssoObj.cIntAkInfs == "undefined" || ssoObj.cIntAkInfs == undefined || ssoObj.cIntAkInfs == null || ssoObj.cIntAkInfs == "") {
                    ssoObj.cIntAkInfs = $.cookie("cIntAkInfs");
                }
            }
        }

        ssoObj.Init(openMode);

        return true;
    },
    ssoCall: function (params, akUrl, reCall, rturUrl) {

        try {

            ssoObj.sso.callLogin({
                akUrl: akUrl,		                    // 요청URL
                akDta: params,					        // 요청데이터
                aftPcMd: '1',					        // 0:라이브러리 후 제휴사 페이지 호출,1:callback 호출
                rturUrl: rturUrl,				        // 리턴URL
                rturUrlCaloMethd: 'POST',		        // 리턴URL호출메소드
                callback: function (rspDta) {	        // 콜백함수

                    if (reCall != undefined && reCall != "") {
                        reCall(rspDta);
                    }
                    else {
                        ssoCall = rspDta;
                    }
                }
            });
        }
        catch (e) {
        }
    },
    callApi: function (params, akUrl, reCall) {
        ssoObj.Init();

        try {
            ssoObj.sso.callApi({
                akUrl: akUrl,		                    // 요청URL
                akDta: params,					        // 요청데이터
                ccoDlyMsg: '',
                acesTkn: '',
                callback: function (rspDta) {	        // 콜백함수
                    if (reCall) {
                        reCall(rspDta);
                    }
                    else {
                        callApi = rspDta;
                    }
                }
            });
        }
        catch (e) {
        }
    },
    /**
     * SSO 회원 로그인
     */
    callLogin: function (params, rturUrl, reCall, showLoading) {

        $.showMask();

        ssoObj.Init();

        try {
            ssoObj.sso.callLogin({
                akUrl: '/exBiz/login/login_01_001',		// 요청URL
                akDta: params,					        // 요청데이터
                aftPcMd: '1',					        // 0:라이브러리 후 제휴사 페이지 호출,1:callback 호출
                rturUrl: rturUrl,				        // 리턴URL
                rturUrlCaloMethd: 'POST',		        // 리턴URL호출메소드
                callback: function (rspDta) {	        // 콜백함수

                    ssoObj.ssoTkn = rspDta.ssoTkn;
                    ssoObj.acesTkn = rspDta.acesTkn;
                    ssoObj.rnwTkn = rspDta.rnwTkn;
                    ssoObj.cIntAkInfs = $.cookie("cIntAkInfs");

                    $.cookie("ssoTkn", rspDta.ssoTkn, { path: '/' });
                    $.cookie("acesTkn", rspDta.acesTkn, { path: '/' });
                    $.cookie("rnwTkn", rspDta.rnwTkn, { path: '/' });
                    $.cookie("cIntAkInfs", decodeURIComponent(rspDta.cIntAkInfs), { path: '/' });

                    if (reCall != null || reCall != undefined && reCall != "") {
                        reCall(rspDta);
                    }
                    else {
                        callLogin = rspDta;
                    }
                }
            });
        }
        catch (e) {
            alert("로그인 처리 실패 하였습니다.");
            $.hideMask();
        }
    },
    //회원자동 로그인
    callAutoLogin: function (params, reCall, showLoading) {

        if (showLoading == undefined)
            showLoading = true;

        if (showLoading)
            global.showLoading(true);

        //회원자동 로그인

        if (!ssoObj.acesTknCk()) return;

        try {
            ssoObj.sso.callApi({
                akUrl: '/exBiz/login/autoLogin_01_001',		// 요청URL
                akDta: params,					            // 요청데이터
                rturUrlCaloMethd: 'POST',		            // 리턴URL호출메소드
                callback: function (rspDta) {	            // 콜백함수

                    ssoObj.ssoTkn = rspDta.ssoTkn;
                    ssoObj.acesTkn = rspDta.acesTkn;
                    ssoObj.rnwTkn = rspDta.rnwTkn;

                    $.cookie("ssoTkn", rspDta.ssoTkn, { path: '/' });
                    $.cookie("acesTkn", rspDta.acesTkn, { path: '/' });
                    $.cookie("rnwTkn", rspDta.rnwTkn, { path: '/' });

                    if (showLoading)
                        global.showLoading(false);

                    if (reCall != undefined && reCall != "") {
                        reCall(rspDta);
                    }
                    else {
                        callLogin = rspDta;
                    }
                }
            });
        }
        catch (e) {
            if (showLoading)
                global.showLoading(false);
        }
    },
    //SSO 로그인:타사 로그인
    callSsoLogin: function (params, reCall, showLoading) {

        if (showLoading == undefined)
            showLoading = true;

        if (showLoading)
            global.showLoading(true);

        //회원자동 로그인
        try {

            if (!ssoObj.acesTknCk()) return;

            ssoObj.sso.callApi({
                akUrl: '/exBiz/login/ssoLogin_01_001',		// 요청URL
                akDta: params,					            // 요청데이터
                rturUrlCaloMethd: 'POST',		            // 리턴URL호출메소드
                callback: function (rspDta) {	            // 콜백함수

                    ssoObj.ssoTkn = rspDta.ssoTkn;
                    ssoObj.acesTkn = rspDta.acesTkn;
                    ssoObj.rnwTkn = rspDta.rnwTkn;

                    $.cookie("ssoTkn", rspDta.ssoTkn, { path: '/' });
                    $.cookie("acesTkn", rspDta.acesTkn, { path: '/' });
                    $.cookie("rnwTkn", rspDta.rnwTkn, { path: '/' });

                    if (showLoading)
                        global.showLoading(false);

                    if (reCall != undefined && reCall != "") {
                        reCall(rspDta);
                    }
                    else {
                        callLogin = rspDta;
                    }
                }
            });
        }
        catch (e) {
            if (showLoading)
                global.showLoading(false);
        }
    },
    callLogout: function (reCall, showLoading) {

        if (showLoading == undefined)
            showLoading = true;

        if (showLoading)
            global.showLoading(true);

        //회원로그아웃
        try {

            //초기화(토큰전달)
            ssoObj.acesTkn = $.cookie("acesTkn");
            ssoObj.cIntAkInfs = $.cookie("cIntAkInfs");
            ssoObj.Init();

            ssoObj.sso.callLogout({
                callback: function (rspDta) {

                    if ('00' == rspDta.rspC) {
                        $.removeCookie("ssoTkn", { path: '/' });
                        $.removeCookie("acesTkn", { path: '/' });
                        $.removeCookie("rnwTkn", { path: '/' });
                        $.removeCookie("cIntAkInfs", { path: '/' });

                        if (showLoading)
                            global.showLoading(false);

                        if (reCall != undefined && reCall != "") {
                            reCall(rspDta);
                        }
                        else {
                            callLogout = rspDta;
                        }
                    }
                }
            });
        }
        catch (e) {
            if (showLoading)
                global.showLoading(false);
            loginPage.logOutProc('POST');
        }
    },
    callUserInfo: function (reCall, showLoading) {
        //회원정보조회
        try {
            if (!ssoObj.acesTknCk()) return;

            ssoObj.sso.callApi({
                akUrl: '/biz/login/urInfInq_01_002',        // 요청URL
                akDta: null,                                // 요청데이터
                ccoDlyMsg: "제휴사전달메세지입니다.",       // 제휴사전달메시지
                acesTkn: ssoObj.acesTkn,
                callback: function (rspDta) {

                    if (showLoading)
                        global.showLoading(false);

                    if (reCall != undefined && reCall != "") {
                        reCall(rspDta);
                    }
                    else {
                        callUserInfo = rspDta;
                    }
                }
            });
        }
        catch (e) {
        }
    },
    callViewSnsJoin: function (params, rturUrl, reCall, showLoading) {

        if (showLoading == undefined)
            showLoading = true;

        if (showLoading)
            global.showLoading(true);

        ssoObj.Init();

        try {
            //소셜 회원가입(sso 요청 화면호출)
            ssoObj.sso.callScreen({
                akUrl: '/exView/login/socialReg_01_001',	// 요청URL
                akDta: params,					            // 요청데이터
                aftPcMd: '1',					            // 0:라이브러리 후 제휴사 페이지 호출,1:callback 호출
                rturUrl: rturUrl,                           // 리턴URL
                rturUrlCaloMethd: 'GET',		            // 리턴URL호출메소드
                callback: function (rspDta) {	            // 콜백함수

                    if (showLoading)
                        global.showLoading(false);

                    if (reCall != undefined && reCall != "") {
                        reCall(rspDta);
                    }
                    else {
                        callViewSnsJoin = rspDta;
                    }
                }
            });
        } catch (e) {
            if (showLoading)
                global.showLoading(false);
        }
    },
    //회원가입
    callViewMbrJoin: function () {
        //회원가입
        ssoObj.Init("0");

        ssoObj.sso.callScreen({
            akUrl: '/exView/join/mbrJoin_01_001',       // 요청URL
            rturUrl: window.location.href,
            rturUrlCaloMethd: 'GET'                     // 리턴URL호출메소드
        });
    },
    callViewAffiliateMbrJoin: function (returnUrl) {
        //제휴사 회원가입
        ssoObj.Init("0");

        ssoObj.sso.callScreen({
            akUrl: '/exView/join/mbrJoin_01_001',       // 요청URL
            rturUrl: returnUrl,
            rturUrlCaloMethd: 'GET'                     // 리턴URL호출메소드
        });
    },
    //회원정보 수정.
    callViewEdit: function () {
        //회원정보 수정.
        if (!ssoObj.acesTknCk("0")) return;
        //ssoObj.Init("0");
        ssoObj.sso.callScreen({
            akUrl: '/view/manage/mbrManage_01_001',       // 요청URL
            rturUrl: "https://www.lottecinema.co.kr/NLCHS/Common/Logout",
            rturUrlCaloMethd: 'GET'                     // 리턴URL호출메소드
        });
    },
    //선택약관동의:로그인 후 선택약관 동의여부를 변경하고자 하는 경우 호출하는 화면.
    callViewMbrAgreement: function (params) {

        if (!ssoObj.acesTknCk("0")) return;

        ssoObj.sso.callScreen({
            akUrl: '/view/manage/mbrAgreement_01_001',      // 요청URL
            akDta: params,					            // 요청데이터
            rturUrl: "https://www.lottecinema.co.kr/NLCHS/Common/Logout",
            rturUrlCaloMethd: 'GET'                         // 리턴URL호출메소드
        });

    },
    //이중제휴사 약관동의:로그인 후 정보 처리
    callViewMbrJoin04: function () {

        if (!ssoObj.acesTknCk("0")) return;

        ssoObj.sso.callScreen({
            akUrl: '/exView/join/mbrJoin_04_001',       // 요청URL
            rturUrl: "https://www.lottecinema.co.kr/NLCHS/Common/Logout",
            rturUrlCaloMethd: 'GET'                     // 리턴URL호출메소드
        });

    },
    //비밀번호 찾기
    callViewFdPassword: function () {

        ssoObj.Init("0");
        ssoObj.sso.callScreen({
            akUrl: '/exView/manage/fdPassword_01_001',       // 요청URL
            rturUrl: window.location.href,
            rturUrlCaloMethd: 'GET'                     // 리턴URL호출메소드
        });

    },
    callViewSOCIAL: function () {

        if (!ssoObj.acesTknCk("0")) return;
        ssoObj.sso.callScreen({
            akUrl: '/view/manage/socialManage_01_001',       // 요청URL
            rturUrl: window.location.href,
            rturUrlCaloMethd: 'GET'                     // 리턴URL호출메소드
        });

    },
    //아이디 찾기
    callViewFdId: function () {

        ssoObj.Init("0");

        ssoObj.sso.callScreen({
            akUrl: '/exView/manage/fdId_01_001',       // 요청URL
            rturUrl: window.location.href,
            rturUrlCaloMethd: 'GET'                     // 리턴URL호출메소드
        });

    },
    //비밀번호 변경:로그인 후 가능
    callViewChPassword: function () {

        if (!ssoObj.acesTknCk("0")) return;
        //ssoObj.Init("0");
        ssoObj.sso.callScreen({
            akUrl: '/view/manage/chPassword_01_000',       // 요청URL
            rturUrl: "https://www.lottecinema.co.kr/NLCHS/Common/Logout",
            rturUrlCaloMethd: 'GET'                     // 리턴URL호출메소드
        });

    },
    //회원탈퇴:로그인 후 가능
    callViewMbrSes: function () {
        
        if (!ssoObj.acesTknCk("0")) return;

        ssoObj.sso.callScreen({
            akUrl: '/view/manage/mbrSes_01_001',       // 요청URL
            rturUrl: "https://www.lottecinema.co.kr/NLCHS/Common/Logout",
            rturUrlCaloMethd: 'GET'                     // 리턴URL호출메소드
        });
    },
    //제휴사 약관동의:로그인 후 가능
    callViewMbrJoin2: function (params) {

        if (!ssoObj.acesTknCk("0")) return;

        ssoObj.sso.callScreen({
            akUrl: '/exView/join/mbrJoin_04_001',       // 요청URL 
            rturUrlCaloMethd: 'GET',                     // 리턴URL호출메소드
            rturUrl: "https://www.lottecinema.co.kr/NLCHS/Common/Logout",
            akDta: params	
        });

    },
    //제휴사 약관동의(14세미만):로그인 후 가능
    callViewMbrJoin3: function (params) {

        if (!ssoObj.acesTknCk("0")) return;

        ssoObj.sso.callScreen({
            akUrl: '/exView/join/mbrJoin_03_001',       // 요청URL 
            rturUrlCaloMethd: 'GET',                     // 리턴URL호출메소드
            rturUrl: "https://www.lottecinema.co.kr/NLCHS/Common/Logout",
            akDta: params
        });

    },
    getSsoToken: function (params, reCall) {
        ssoObj.Init();
        ssoObj.sso.callCtfLogin({
            akUrl: '/exBiz/login/ctfLogin_01_001',
            akDta: params,
            aftPcMd: '1',
            lgoSepYn: 'Y',
            callback: function (rspDta) {
                // 제휴사 약관 미동의 회원
                if (rspDta && rspDta.rspC === '44' && rspDta.rspDtc === '419') {
                    reCall(rspDta.ssoTkn);
                } else {
                    reCall('');
                }
            }
        });
    },
    callPage: function (target, akDta, rturUrl, Tkn) {
        try {
            switch (target) {
                case 6:
                    acesTkn = Tkn;
                    break;
                case 7:
                    acesTkn = Tkn;
                    break;
                case 11:
                    acesTkn = Tkn;
                    break;
                case 12:
                    acesTkn = Tkn;
                    break;
                case 14:
                    acesTkn = Tkn;
                    break;
                case 23:
                    acesTkn = Tkn;
                    break;
                default:
                    acesTkn = "";
                    break;
            }
                        
            ssoObj.sso = new SsoClientLibrary({
                ccoSiteNo: '1050',                      // 제휴사사이트번호
                clntAkInf: decodeURIComponent(ssoObj.cIntAkInfs),				    // 클라이언트요청정보
                acesTkn: acesTkn,			            // 접근토큰
                urEvnmtDc: '0',							// 사용자환경구분코드 0: PC Web 1: Mobile Web 2: Mobile App
                vrblNm: 'ssoObj.sso',							// 라이브러리변수명
                srnOpt: {
                    opMd: '2',							// 오픈모드 0: Redirect 1: iframe 2: Popup (팝업인경우:srnOpt.popRturUrl은 필수)
                    srnHeaderExpsYn: 'Y',
                    popRturUrl: CinemaServerDomain + "/" + PLATFORM_TYPE  
                }
            });

            rturUrl = (rturUrl == null || rturUrl == "undefined" || rturUrl == "") ? window.location.href : rturUrl;
            akDta = (akDta == null || akDta == "undefined" || akDta == "") ? null : akDta;


            ssoObj.sso.callScreen({
                akUrl: ssoObj.akUrl(target),		    // 요청URL
                akDta: akDta,
                rturUrl: rturUrl,
                rturUrlCaloMethd: "GET"               //  리턴URL호출메소드
            });
        } catch (e) {
            alert("통합회원제 화면 전환 실패 하였습니다.");
            if (typeof (global) == "object") {
                global.showLoading(false);
            }
        }
    },
    callPage_new: function (target, akDta, rturUrl, Tkn) {
        try {
            switch (target) {
                case 6:
                    acesTkn = Tkn;
                    break;
                case 7:
                    acesTkn = Tkn;
                    break;
                case 11:
                    acesTkn = Tkn;
                    break;
                case 12:
                    acesTkn = Tkn;
                    break;
                case 14:
                    acesTkn = Tkn;
                    break;
                case 23:
                    acesTkn = Tkn;
                    break;
                default:
                    acesTkn = "";
                    break;
            }

            ssoObj.sso = new SsoClientLibrary({
                ccoSiteNo: '1050',                      // 제휴사사이트번호
                clntAkInf: decodeURIComponent(ssoObj.cIntAkInfs),				    // 클라이언트요청정보
                acesTkn: acesTkn,			            // 접근토큰
                urEvnmtDc: '0',							// 사용자환경구분코드 0: PC Web 1: Mobile Web 2: Mobile App
                vrblNm: 'ssoObj.sso',							// 라이브러리변수명
                srnOpt: {
                    opMd: '2',							// 오픈모드 0: Redirect 1: iframe 2: Popup (팝업인경우:srnOpt.popRturUrl은 필수)
                    srnHeaderExpsYn: 'Y',
                    popRturUrl: CinemaServerDomain + "/" + PLATFORM_TYPE + "/Member/ssoResult"
                }
            });

            rturUrl = (rturUrl == null || rturUrl == "undefined" || rturUrl == "") ? window.location.href : rturUrl;
            akDta = (akDta == null || akDta == "undefined" || akDta == "") ? null : akDta;

            ssoObj.sso.callScreen({
                akUrl: ssoObj.akUrl(target),		    // 요청URL
                akDta: akDta,
                rturUrl: rturUrl,
                rturUrlCaloMethd: "GET"               //  리턴URL호출메소드
            });
        } catch (e) {
            alert("통합회원제 화면 전환 실패 하였습니다.");
            if (typeof (global) == "object") {
                global.showLoading(false);
            }
        }
    },
    akUrl: function (target) {
        let akUrl = "";
        switch (target) {
            case 0:  //로그인
                akUrl = "/exBiz/login/login_01_001";
                break;
            case 1:   //SSO 로그인
                akUrl = "/exBiz/login/ssoLogin_01_001";
                break;
            case 2:   //SSO 자동로그인
                akUrl = "/exBiz/login/autoLogin_01_001";
                break;
            case 3:   //간편로그인(PIN)
                akUrl = "/exBiz/login/pinLogin_01_001";
                break;
            case 4:   //간편로그인(지문,페이스 ID)
                akUrl = "/exBiz/login/fidoLogin_01_001";
                break;
            case 5:    //회원가입
                akUrl = "/exView/join/mbrJoin_01_001";
                break;
            case 6:   //회원정보 수정.(로그인 후 정보 처리)
                akUrl = "/view/manage/mbrManage_01_001";
                break;
            case 7:    //선택약관동의:로그인 후 선택약관 동의여부를 변경하고자 하는 경우 호출하는 화면.
                akUrl = "/view/manage/mbrAgreement_01_001";
                break;
            case 8:    //이중제휴사 약관동의
                akUrl = "/exView/join/mbrJoin_04_001";
                break;
            case 9:      //비밀번호 찾기
                akUrl = "/exView/manage/fdPassword_01_001";
                break;
            case 10:    //아이디 찾기
                akUrl = "/exView/manage/fdId_01_001";
                break;
            case 11:    //비밀번호 변경:로그인 후 가능
                akUrl = "/view/manage/chPassword_01_000";
                break;
            case 12:    //회원탈퇴(로그인후 가능)
                akUrl = "/view/manage/mbrSes_01_001";
                break;
            case 13:    //제휴사 약관동의
                akUrl = "/exView/join/mbrJoin_04_001";
                break;
            case 14:    //회원정보 조회(로그인후 가능)
                akUrl = "/biz/login/urInfInq_01_002";
                break;
            case 15:    //제휴사 휴면해제처리
                akUrl = "/exBiz/manage/dmcyRlsPc_01_001";
                break;
            case 16:    //임시비밀번호 발급상태
                akUrl = "/exView/manage/chPassword_03_001";
                break;
            case 17:    //정회원 전환
                akUrl = "/exView/join/mbrJoin_16_001";
                break;
            case 18:    //제휴사 약관 미동의
                akUrl = "/exView/join/mbrJoin_04_001";
                break;
            case 19:    //법정대리인 휴대폰 인증
                akUrl = "/exView/join/mbrJoin_03_001";
                break;
            case 20:    //소셜계정 등록
                akUrl = "/exView/login/socialReg_01_001";
                break;
            case 21:    //휴면해제
                akUrl = "/exView/login/login_05_001";
                break;
            case 22:    //부정 로그인 해제
                akUrl = "/exView/login/login_03_001";
                break;
            case 23:    //비밀번호 변경 캠페인(로그인후 호출가능)
                akUrl = "/view/login/login_04_001";
                break;
            case 24:    //소셜로그인
                akUrl = "/exBiz/login/sociLogin_01_001";
                break;
            case 25:    //이중회원사 약관동의 처리
                akUrl = "/exBiz/join/geMbrJoin_04_002";
                break;
            case 26:    //일반회원가입 처리
                akUrl = "/exBiz/join/geMbrJoin_07_002";
                break;
            case 27:    //이메일 중복확인
                akUrl = "/exBiz/join/comMbrJoin_01_003";
                break;
            case 28:    //아이디 중복확인
                akUrl = "/exBiz/join/comMbrJoin_01_002";
                break;
            case 29:    //온라인 ID 전체 목록 조회
                akUrl = "/exBiz/manage/idMg_02_002";
                break;
        }

        return akUrl;
    }
}