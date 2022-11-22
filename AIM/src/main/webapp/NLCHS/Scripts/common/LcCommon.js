'use strict';

var memberInfo;
var NOW_MENU_TYPE = '';

/************************************************************
 * storage  관련
 ************************************************************/
var cdstorage;
var cdstorage_event;
var sdstorage_event;
var sdstorage;

$.fn.Global = function () {
    this.isLoading = false;
    this.validateReservation = false;
    this.loadingNum = 0;
    this.Init();
};

$.fn.Global.prototype = {
    Init: function () {
        var G = this;
    },
    showLoading: function (showYN, validateReservation) {
        var G = this;
        G.validateReservation = (validateReservation != undefined) ? validateReservation : false;

        if (showYN) {
            ++G.loadingNum;
            if (!G.isLoading) {
                G.isLoading = true;

                $('#loading').addClass('loader');
                $('#loading').addClass('loader-bouncing');
                $('#loading').addClass('is-active');

                //
                $.showMask();
            }
        } else {
            //--G.loadingNum;
            G.loadingNum = 0;
            if (G.isLoading == true && G.loadingNum == 0) {
                if ($('#loading').find('.loader') != undefined) {
                    $('#loading').removeClass('loader');
                    $('#loading').removeClass('loader-bouncing');
                    $('#loading').removeClass('is-active');
                }

                //
                $.hideMask();

                G.isLoading = false;
            }
        }
    }
};
var global = new $.fn.Global();


var common = {
    JsonCallSync: function (url, params, reCall, syncType, showLoading) {

        if (showLoading == undefined)
            showLoading = true;

        if (showLoading)
            global.showLoading(true);

        if (syncType == undefined || syncType == "" || syncType == null) {
            params = JSON.stringify(params);
            try {
                $.ajax({
                    type: "post",
                    async: false,
                    url: url,
                    headers: {
                        "Content-Type": "application/json"
                    },
                    data: params,
                    fail: function (data) {
                        if (showLoading)
                            global.showLoading(false);
                    },
                    complete: function (data) {
                        if (showLoading)
                            global.showLoading(false);
                        if (reCall !== undefined && reCall !== "") {
                            reCall(data);
                        }
                        else {
                            JsonCallSync = data;
                        }
                    }
                });
            }
            catch (e) {
                if (showLoading)
                    global.showLoading(false);
            }
        }
        else {
            params = "paramList=" + JSON.stringify(params);
            try {
                $.ajax({
                    type: "post",
                    async: false,
                    url: url,
                    dataType: "json",
                    data: params,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Content-Encoding", "gzip");
                    },
                    fail: function (data) {
                        if (showLoading)
                            global.showLoading(false);
                    },
                    complete: function (data) {

                        if (showLoading)
                            global.showLoading(false);

                        if (reCall !== undefined && reCall !== "") {
                            reCall(data);
                        }
                        else {
                            JsonCallSync = data;
                        }
                    }
                });
            }
            catch (e) {
                if (showLoading)
                    global.showLoading(false);
            }
        }

    },
    JsonCall: function (url, params, reCall, showLoading) {
        params = "paramList=" + JSON.stringify(params);
        if (showLoading == undefined)
            showLoading = true;

        try {
            if (showLoading)
                global.showLoading(true);
            $.ajax({
                type: "post",
                url: url,
                dataType: "json",
                data: params,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Content-Encoding", "gzip");
                },

                fail: function (data) {
                    if (showLoading)
                        global.showLoading(false);
                },
                complete: function (data) {
                    if (showLoading)
                        global.showLoading(false);
                    reCall(data);
                }
            });
        }
        catch (e) {
        }
    },
    //윈도우 팝업.
    openWindow: function (url, width, height, winName, left, top) {
        if (!width) width = 400;
        if (!height) height = 300;
        if (!winName) winName = '';
        if (!left) left = '';
        if (!top) top = '';
        var newWin = window.open(url, winName, 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top + ',history=yes,resizable=yes,status=yes,scrollbars=yes,menubar=no');
        if (newWin != null) {
            newWin.focus();
        }
        return newWin;
    },
    setALState: function (key, value) {
        if (typeof localStorage === 'object' && typeof (localStorage) !== 'undefined') {
            try {
                window.localStorage.setItem(key, value);
                cdstorage_event.setItem(key, value);
            } catch (e) {
                $.cookie(key, value);
            }
        }
        else {
            $.cookie(key, value);
        }
    },
    //메뉴별 JSON data를 reCall 함수에 전달한다.
    //params>
    //		menu: 해당 메뉴의 약어 string
    //		params: JSON data를 받기위한 parameter object
    //		reCall: JSON data를 받아 처리하기 위한 javascript function
    //		syncType: "sync" 동기처리, undefined 비동기
    //return> false - 해당 메뉴가 없을 경우, true - 정상 호출이 처리된 경우
    GetData: function (menu, params, reCall, syncType) {

        var dataUrl;
        try {
            switch (menu.toLowerCase()) {
                case "main":	// 메인
                    dataUrl = "/LCWS/Common/MainData.aspx";
                    break;
                case "member": //회원
                    dataUrl = "/LCWS/Member/Mobile/Login.aspx";
                    break;
                case "ticket": //예매
                    dataUrl = "/LCWS/Ticketing/TicketingData.aspx";
                    break;
                case "payment": //예매결제
                    dataUrl = "/LCWS/Ticketing/PaymentData.aspx";
                    break;
                case "movie": //영화
                    dataUrl = "/LCWS/Movie/MovieData.aspx";
                    break;
                case "cinema": //영화관
                    dataUrl = "/LCWS/Cinema/CinemaData.aspx";
                    break;
                case "special": //스페셜관
                    dataUrl = "";
                    break;
                case "event": //이벤트
                    dataUrl = "/LCWS/Event/EventData.aspx";
                    break;
                //case "eventetc": //이벤트 이외
                //    dataUrl = "/LCWS/Event/EventEtcData.aspx";
                //    break;
                //case "mall": //시네마몰
                //    dataUrl = "/LCWS/CinemaMall/CinemaMallEtcData.aspx";
                //    break;
                case "cinemamall": //시네마몰
                    dataUrl = "/LCWS/CinemaMall/CinemaMallData.aspx";
                    break;
                case "cinemamalletc": //시네마몰 이외
                    dataUrl = "/LCWS/CinemaMall/CinemaMallEtcData.aspx";
                    break;
                case "custom": //고객센타
                    dataUrl = "/LCWS/Customer-Service-Center/CustomerServiceCenterEtcData.aspx";
                    break;
                case "customerservice": //고객센타 공지사항
                    dataUrl = "/LCWS/Customer-Service-Center/CustomerServiceCenterData.aspx";
                    break;
                case "mycinema": //마이시네마
                    dataUrl = "/LCWS/MyCinema/MyCinemaData.aspx";
                    break;
                case "commoncode": //공통코드
                    dataUrl = "/LCWS/Common/CommonCodeData.aspx";
                    break;
                default:
                    return false;
            }
            if (syncType == "api")
                common.JsonCallSync(CinemaServiceDomain + dataUrl, params, reCall);
            else if (syncType == "sync")
                common.JsonCallSync(CinemaServiceDomain + dataUrl, params, reCall, syncType);
            else
                common.JsonCall(CinemaServiceDomain + dataUrl, params, reCall);
            return true;
        } catch (e) {
            return false;
        }
    },
    //특수문자 입력 체크
    isSpecial: function (str) {
        try {
            var result = false;
            var valid = "~`!@#$%^&*-=+\|[](){};:'<.,>/?_";
            for (var i = 0; i < str.length; i++) {
                var checkStr = (valid.indexOf(str.substring(i, i + 1)) != -1);
                if (checkStr) {
                    result = true;
                    break;
                }
            }
        } catch (e) {
            //alert(e.message);
            common.checkException(e, "isSpecial", NOW_MENU_TYPE);					//오류 발생 처리
        }
        return result;
    },
    checkException: function (e, headerText, menue) {

    }
}

$(document).ready(function () {
    var sdstorage_options_www = { origin: "https://www.lottecinema.co.kr", path: "/" + PLATFORM_TYPE + "/crossd_iframe.html", storage: 'sessionStorage' };
    sdstorage = crossDomainStorage(sdstorage_options_www);


    var cdstorage_options = { origin: "https://www.lottecinema.co.kr", path: "/" + PLATFORM_TYPE + "/crossd_iframe.html" };
    cdstorage = crossDomainStorage(cdstorage_options);
    var cdstorage_options_event = { origin: "https://event.lottecinema.co.kr", path: "/" + PLATFORM_TYPE + "/crossd_iframe.html" };
    cdstorage_event = crossDomainStorage(cdstorage_options_event);
    var sdstorage_options_event = { origin: "https://event.lottecinema.co.kr", path: "/" + PLATFORM_TYPE + "/crossd_iframe.html", storage: 'sessionStorage' };
    sdstorage_event = crossDomainStorage(sdstorage_options_event);
});
    //debugger;
    // 20160627 비회원 로그인일 경우 자동로그인을 타지 않도록 수정
    var tempIsMember = true;
    if (typeof localStorage === 'object' && typeof (localStorage) != 'undefined') {
        try {

            var tempS = window.localStorage.getItem("WMEMBER_AUTH");
            if (tempS != null) {
                var tempSA = tempS.split('|');
                if (tempSA[3] == "0") {
                    tempIsMember = false;
                }
            }
            else {
                tempIsMember = false;
            }

        }
        catch (e) {
        }
    }

    // 20160926 이벤트 도메인 관련 추가
    if (window.localStorage.getItem("WMEMBER_AUTH") == undefined || window.localStorage.getItem("WMEMBER_AUTH") == null || window.localStorage.getItem("WMEMBER_AUTH") == "") {
        try {
            var tempS2 = $.cookie("WMEMBER_AUTH");
            if (tempS2 != undefined) {
                var tempSA2 = tempS2.split('|');
                if (tempSA2[3] == "0") {
                    tempIsMember = false;
                }
            }
            else {
                tempIsMember = false;
            }

        }
        catch (e) {
        }
    }

    if (tempIsMember) {
        getAutoLoginStatus();
    }
    else {
        setMemberStatus();
    }
//});

function getAutoLoginStatus() {

    try {

        if (typeof localStorage === 'object' && typeof (localStorage) != 'undefined') {

            try {

                if (window.localStorage.getItem("WMEMBER_AUTH") != null) {

                    var memberSettings = window.localStorage.getItem("WMEMBER_AUTH").split('|');

                    if (memberSettings[0].toUpperCase() == "0" && memberSettings[1].toUpperCase() == "Y") {

                        LoginProcess(memberSettings[3], "", "Y", memberSettings[7]);
                    }
                    else {
                        // 20160608 - 로그인 위치 수정
                        setMemberStatus();
                    }
                }
                else if (window.localStorage.getItem("WMEMBER_AUTH") == undefined || window.localStorage.getItem("WMEMBER_AUTH") == null || window.localStorage.getItem("WMEMBER_AUTH") == "") {

                    if ($.cookie("WMEMBER_AUTH") != undefined && $.cookie("WMEMBER_AUTH") != "") {

                        var memberSettings2 = $.cookie("WMEMBER_AUTH").split('|');
                        if (memberSettings2[0].toUpperCase() == "1" && memberSettings2[1].toUpperCase() == "Y") {

                            LoginProcess(memberSettings2[3], "", "Y", rnwTkn);
                        }
                        else {
                            // 20160608 - 로그인 위치 수정
                            setMemberStatus();
                        }
                    }
                    else {
                        // 20160608 - 로그인 위치 수정
                        setMemberStatus();
                    }
                }
                else {
                    // 20160608 - 로그인 위치 수정
                    setMemberStatus();
                }
            } catch (e) {

                if ($.cookie("WMEMBER_AUTH") != undefined && $.cookie("WMEMBER_AUTH") != "") {

                    var memberSettings3 = $.cookie("WMEMBER_AUTH").split('|');
                    if (memberSettings3[0].toUpperCase() == "1" && memberSettings3[1].toUpperCase() == "Y") {

                        LoginProcess(memberSettings3[3], "", "Y");
                    }
                    else {
                        // 20160608 - 로그인 위치 수정
                        setMemberStatus();
                    }
                }
                else {
                    // 20160608 - 로그인 위치 수정
                    setMemberStatus();
                }
            }
        } else {
            if ($.cookie("WMEMBER_AUTH") != undefined && $.cookie("WMEMBER_AUTH") != "") {
                var memberSettings4 = $.cookie("WMEMBER_AUTH").split('|');
                if (memberSettings4[0].toUpperCase() == "1" && memberSettings4[1].toUpperCase() == "Y") {
                    LoginProcess(memberSettings4[3], "", "Y");
                }
                else {
                    // 20160608 - 로그인 위치 수정
                    setMemberStatus();
                }
            }
            else {
                // 20160608 - 로그인 위치 수정
                setMemberStatus();
            }
        }
    }
    catch (e) {
        setMemberStatus();
    }
}

function setMemberStatus() {
    //==========================================================================
    //임시 주석 처리:윤우진:20190808
    //==========================================================================
    //getMobileAllMenusData();
    //==========================================================================

    // 회원 정보
    if ($.cookie("MemberInfo") != undefined && $.cookie("MemberInfo") != "") {

        memberInfo   = JSON.parse(decodeURI($.cookie("MemberInfo")));
        lcMemberInfo = JSON.parse(decodeURI($.cookie("MemberInfo")));
        //==========================================================================
        //임시 주석 처리:윤우진:20190808
        //==========================================================================
        //$('.loginNew').hide();
        ////20170111 - 우측메뉴 개선
        ////$('.login_after').show();
        //$('.wrap_loginAfter').show();
        //$('#loginNonMember').hide();
        //==========================================================================

        // 20170628 - 이름 복호화
        if (memberInfo.LotteCinemaMemberGubun == "3") {
            if (memberInfo.MemberName.indexOf('^') > -1) {
                var tempMemberName1 = memberInfo.MemberName.split('^');
                var tempMemberName2 = "";
                for (var i = 0; i < tempMemberName1.length - 1; i++) {

                    tempMemberName2 += String.fromCharCode(tempMemberName1[i]);
                }
                //==========================================================================
                //임시 주석 처리:윤우진:20190808
                //==========================================================================
                //$('#loginMemberInfo').html(Aes.Ctr.decrypt(tempMemberName2, gud, 256));
                //$('#nonMemberName').text(Aes.Ctr.decrypt(tempMemberName2, gud, 256));
                //==========================================================================
            }
            else {
                //==========================================================================
                //임시 주석 처리:윤우진:20190808
                //==========================================================================
                //$('#loginMemberInfo').html(memberInfo.MemberName);
                //$('#nonMemberName').text(memberInfo.MemberName);
                //==========================================================================
            }
        }
        else {
            //==========================================================================
            //임시 주석 처리:윤우진:20190808
            //==========================================================================
            //$('#loginMemberInfo').html(memberInfo.MemberName);
            //$('#nonMemberName').text(memberInfo.MemberName);
            //==========================================================================
        }

        // 비회원 로그인 시 메뉴 제거
        // 2015. 11. 29. by johnharu
        //***********************************************************************************************************
        //2016. 01. 10. by johnharu
        // 회원 여부를 판단하는 필드로 MemberGubun 대신 LotteCinemaMemberGubun 으로 수정
        // LotteCinemaMemberGubun 값의 유형
        // 1 : 정회원
        // 2 : 간편회원(준회원)
        // 3 : 비회원
        //***********************************************************************************************************
        if (memberInfo.LotteCinemaMemberGubun != "1") {
            //==========================================================================
            //임시 주석 처리:윤우진:20190808
            //==========================================================================
            //// 20170111 - 우측메뉴 개선
            //$('.mylpointcoupon').hide();
            //$('.mygrademoney').hide();
            ////$('.myPtWrap').hide();
            ////$('.mLayer_nBody .login_after').height(70);
            //$('#loginNonMember').show();
            //$('#loginAfter').hide();
            //$("#favorite").hide();
            //==========================================================================
        }
        // 회원일 경우에만 선호 영화관 조회
        else if (memberInfo.LotteCinemaMemberGubun == "1") {
            //==========================================================================
            //임시 주석 처리:윤우진:20190808
            //==========================================================================
            //getMyCinemaInfo();
            //==========================================================================
        }

    } else {

        var tempAuth2 = "";
        if (typeof localStorage === 'object' && typeof (localStorage) != 'undefined') {
            var storageValue = window.localStorage.getItem('WMEMBER_AUTH');

            if (storageValue != null && storageValue != "" && storageValue.length > 0) {
                tempAuth2 = "0" + storageValue.substr(1, storageValue.length - 1);
                // 20160926 이벤트 도메인 관련 추가
                //$.cookie('WMEMBER_AUTH', tempAuth2, { path: '/' });
            }
            window.localStorage.setItem("WMEMBER_AUTH", tempAuth2);
            
            //event.lottecinema.co.kr, www.lottecinema.co.kr Storage 처리
            if (cdstorage_event != null && cdstorage_event != "" && cdstorage_event.length > 0) {
                cdstorage_event.setItem('WMEMBER_AUTH', tempAuth2);
            }            
        } else {
            window.localStorage.setItem("WMEMBER_AUTH", tempAuth2);
            
            if (cdstorage_event != null && cdstorage_event != "" && cdstorage_event.length > 0) {
                cdstorage_event.setItem('WMEMBER_AUTH', tempAuth2);
            }  
        }

        lcMemberInfo = "";
        memberInfo = "";
        //==========================================================================
        //임시 주석 처리:윤우진:20190808
        //==========================================================================
        //$('.loginNew').show();
        //// 20170111 - 우측메뉴 개선
        ////$('.login_after').hide();
        //$('.wrap_loginAfter').hide();

        //$(".btn_tkBaro em").text("0");
        //$("#favorite").hide();
        ////$(".wrap_mypoint").hide();
        //==========================================================================

        // 20160214 김태완 - 추가
        //로그인 이전 회원은 장바구니 비운다.
        //delBucketProduct();

    }
}

/****************************************
* 시네몰 담은 상품 삭제
*****************************************/
var delBucketProduct = function () {
    //var bucketID = getBucketProductUID()
    //var rtnVal = ""
    //if (bucketID != undefined && bucketID != null && bucketID != '') {
    //    var obj = {
    //        MethodName: "DeleteCinemaMallBucketItem"
    //        , channelType: CHANNEL_TYPE
    //        , osType: BrowserAgent()
    //        , osVersion: navigator.userAgent
    //    	//, multiLanguageID: Language
    //    	// 20160219 김태완 - 스위트샵,기프트샵 Language 고정
    //    	, multiLanguageID: "KR"
    //        , bucketID: bucketID
    //    };
    //    //alert(1)
    //    rtnVal = JsonReturnDataSync(CinemaServiceDomain + "/LCWS/CinemaMall/CinemaMallData.aspx", obj)
    //    //JsonCall(CinemaServiceDomain + "/LCWS/CinemaMall/CinemaMallData.aspx", obj, returnJsonDataNone)
    //    resetBucketCookie()
    //}

}

// ##### 모바일 로그인 #####
var LoginProcess = function (memberNoOn, password, isAutoLogin, rnwTkn) {
    var ua = navigator.userAgent.toLowerCase();
    var osType = "Android";
    var isAndroid = ua.indexOf("android") > -1; //&& ua.indexOf("mobile");
    if (!isAndroid) {
        osType = "iOS";
    }
    //lgnTpDc:4 (자동로그인)
    var akDta = { rnwTkn: rnwTkn, autoLgnRgDtti: getTimeStamp(), lgnTpDc: "4" };

    //ssoObj.callAutoLogin(akDta, callAutoLoginProc);
    //var obj = { MethodName: "ALProcessMW", MemberNoOn: memberNoOn, Password: encodeURIComponent(password), IsAutoLogin: isAutoLogin, RegistID: '', MobileOSType: osType };    //  모바일 로그인 처리 1603274
    // 20160614 Async->Sync 수정 
    //JsonCallSync("/LCWS/Member/Mobile/Login.aspx", obj, LoginProcessReturnJsonData);
};

var callAutoLoginProc = function (rspDta) {
    if ('00' === rspDta.rspC) {

        //회원조회
        var memberSettings = window.localStorage.getItem("WMEMBER_AUTH").split('|');

        var vData = {
            "loginId": memberSettings[4],
            "deviceToken": ""
        };

        var vDta = {
            "channelType": CHANNEL_TYPE,
            "osType": BrowserAgent(),
            "osVersion": navigator.userAgent,
            "data": vData
        };

        //LC 회원정보조회
        common.JsonCallSync("/LCAPI/Account/getUserInfo", vDta, GetUserInfoProc);

    }
}

var GetUserInfoProc = function (rspDta) {

    var memberSettings = window.localStorage.getItem("WMEMBER_AUTH").split('|');

    var jsonData = rspDta.responseJSON;

    if ('false' == jsonData.IsOK) {
        //회원이 없는 경우.
    }
    else {
        //회원이 있는경우.

        try {

            var tempAuth2 = "1|" + memberSettings[1] + "|" + memberSettings[2] + "|" + jsonData.userInfo.mbrNoOnLine + "|" + memberSettings[4] + "|" + memberSettings[5] + "|" + memberSettings[6] + "|" + memberSettings[7] + "|" + memberSettings[8];
            common.setALState("WMEMBER_AUTH", tempAuth2);
            $.cookie("WMEMBER_AUTH", tempAuth2, { path: '/' });

        } catch (e) {
        }

        var vDta = {
            "channelType": CHANNEL_TYPE,
            "osType": BrowserAgent(),
            "osVersion": navigator.userAgent,
            "data": jsonData.userInfo
        };

        common.JsonCallSync("/LCAPI/MemberCookie/setMemberCookie", vDta);

    }
}

Number.prototype.to2 = function () { return this < 10 ? '0' + this : this; }
Date.prototype.getYMD = function (s) {
    if (s == undefined || s == '')
        s = '';

    s = s || '-';
    return this.getFullYear() + s
        + (this.getMonth() + 1).to2() + s
        + this.getDate().to2();
}

Date.prototype.addDays = function (days) {
    var dat = moment(this.valueOf()).toDate();
    dat.setDate(dat.getDate() + days);
    return moment(dat).toDate();
}


//휴대폰 번호 Array 형식으로 변환
var getCellPhoneArray = function (phoneNum) {
    var hpArray = [];

    try {
        if (phoneNum == undefined || phoneNum == '')
            return hpArray;

        // 번호에서 - 삭제
        phoneNum = phoneNum.replace(/-/g, "");

        var hpLen = phoneNum.length;
        var hp1 = '';
        var hp2 = '';
        var hp3 = '';

        if (hpLen == 13) {// 13자리 번호 일때 : 010-2222-3333
            hp1 = phoneNum.substring(0, 3);
            hp2 = phoneNum.substring(4, 8);
            hp3 = phoneNum.substring(9);
        } else if (hpLen == 12) {// 12자리 번호 일때 : 010-222-3333
            hp1 = phoneNum.substring(0, 3);
            hp2 = phoneNum.substring(4, 7);
            hp3 = phoneNum.substring(8);
        } else if (hpLen == 11) {// 11자리 번호 일때 : 01022223333
            hp1 = phoneNum.substring(0, 3);
            hp2 = phoneNum.substring(3, 7);
            hp3 = phoneNum.substring(7);
        } else if (hpLen == 10) {// 10자리 번호 일때 : 0102223333
            hp1 = phoneNum.substring(0, 3);
            hp2 = phoneNum.substring(3, 6);
            hp3 = phoneNum.substring(6);
        } else {
            hp1 = phoneNum.substring(0, 3);
            hp2 = phoneNum.substring(3, 7);
            hp3 = phoneNum.substring(7);
        }

        hpArray.push(hp1);
        hpArray.push(hp2);
        hpArray.push(hp3);
    }
    catch (e) { }

    return hpArray;
}