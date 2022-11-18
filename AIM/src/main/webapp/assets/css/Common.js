/****************************************
* Common Function JSX
 * [공통로직]
 *
 * 2019.7.17
 * 메가존 이철주 차장
****************************************/

/****************************************
* 공통 전역변수 선언
****************************************/

//시네마몰 메뉴코드
var CLASSIFICATION_SWEET_CODE = "10";  //스위트샵
var CLASSIFICATION_GIFT_CODE = "20";   // 기프트샵

// 영화 좌석 퍼센트 설정
// 퍼센트에 따른 클래스명 반환
var CLASSBOOKINGSEAT_PERCENT_VALUE = "80";

var DebugMode = false;

/****************************************
* 공통 함수 선언
****************************************/
var defaultUrl = "";

var browserAgent = getBrowserAgent();
var deviceType = getDeviceType();

var commonUrl = window.location.search;
var getUrlParams = new URLSearchParamsCustom(commonUrl);


//20200608 CDN 이미지 정상 체크 - sp에서 내려주는 값으로 변경
var CNDYN = "Y";

var paramsCdn = {
    MethodName: "GetCDNImageYN",
    channelType: CHANNEL_TYPE,
    osType: deviceType,
    osVersion: navigator.userAgent,
    multiLanguageID: Language,
};

try {
    $.ajax({
        type: "post",
        async: false,
        url: '/LCWS/Common/MainData.aspx',
        dataType: "json",
        data: "paramList=" + JSON.stringify(paramsCdn),

        fail: function (data) {
        },
        complete: function (obj) {
            try {
                var result = obj.responseJSON;
                if (result == undefined) return;
                if (result.IsOK == undefined) return;

                if (result.IsOK == "true") {								//Data에 오류가 있으면
                    if (result.ResultCode == "0") {
                        CNDYN = "Y";
                    } else {
                        CNDYN = "N";
                    }
                }

            } catch (e) {
                
            }
        }
    });
} catch (e) {
    
}

//var url = "https://caching.lottecinema.co.kr";
//var xhr = new XMLHttpRequest();

//xhr.open('get', "/" + PLATFORM_TYPE + "/callcheckcdn?url=" + encodeURIComponent(url), false);
//xhr.onload = function() {
//    try {
//        if (xhr.status === 200 || xhr.status === 201) {
//            if (JSON.parse(xhr.responseText) == "true") {                
//                CNDYN = "Y";
//            } else {                
//                CNDYN = "N";
//            }
//        } else {            
//            CNDYN = "N";
//        }
//    }
//    catch (error) {
//        CNDYN = "N";
//    }
//};
//xhr.send(null);
////20200507 CDN 이미지 정상 체크




// ex
// var foo = getUrlParams.get('movieCd');

/****************************************
* 세션 스토리지 LifeCycle
****************************************/
function todayStorageCheck() {
    if (window.sessionStorage.getItem('STORAGEONEDAYCHECK') != moment().format('YYYY-MM-DD')) {
        // 스페셜 시네마 목록
        //window.sessionStorage.removeItem('SPECIALCINEMALIST');
        // 메시지 목록
        //window.sessionStorage.removeItem('MSGCONFIG');
    }
}
todayStorageCheck();

/****************************************
* LCWS 호출 URL 정의
****************************************/
function GetLcwsUrls(menu) {
    var dataUrl;

    try {
        switch (menu.toLowerCase()) {
            case "main":	// 메인
                dataUrl = "/LCWS/Common/MainData.aspx";
                break;
            case "menu":	// 메인
                dataUrl = "/LCWS/Common/MenuData.aspx";
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
                //syncType = syncType == "async" ? "" : "sync";
                break;
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
            case "setting": //설정
                dataUrl = "/LCWS/App/AppData.aspx";
                break;
            case "sms": // SMS
                dataUrl = "/LCWS/SMS/SMSData.aspx";
                break;
            default:
                return false;
        }
    }
    finally { }
    return dataUrl;
}


/****************************************
* LCAPI 호출 URL 정의
****************************************/
function GetLcApiUrls(menu) {
    var dataUrl;

    try {
        switch (menu.toLowerCase()) {
            case "homemovie":	// 메인 영화목록
                dataUrl = "/LCAPI/Home/getMovie";
                break;
            case "homerecommend":	// 메인추천아이콘
                dataUrl = "/LCAPI/Home/getRecommend";
                break;
            case "homeevent":	// 메인 이벤트
                dataUrl = "/LCAPI/Home/getEvent";
                break;
            case "homepreview":	// 메인시츄
                dataUrl = "/LCAPI/Home/getEvent";
                break;
            case "homespecial":	// 메인 스페셜관
                dataUrl = "/LCAPI/Home/getSpecial";
                break;
            case "cinemapreset":	// 영화관 프리셋
                dataUrl = "/LCAPI/Cinema/getPreSetResv";
                break;
            case "cinemaeventpreview":	// 영화관 무대인사
                dataUrl = "/LCAPI/Cinema/getCinemaEventPreview";
                break;
            case "moviemylikemovieinfo":	// 영화상세 > 나의 보고싶어요(찜) 정보 조회
                dataUrl = "/LCAPI/Movie/getMyLikeMovieInfo";
                break;
            case "movieaddmylikemovie":	// 영화상세 > 나의 보고싶어요(찜) 정보 저장
                dataUrl = "/LCAPI/Movie/addMyLikeMovie";
                break;
            case "movieremovemylikemovie":	// 영화상세 > 나의 보고싶어요(찜) 정보 삭제
                dataUrl = "/LCAPI/Movie/removeMyLikeMovie";
                break;
            case "movie_wish_list":	// 보고싶어요(찜) 리스트 조회
                dataUrl = "/LCAPI/Member/getMyLikeMovie";
                break;
            case "moviecastinfo":	// 영화상세 > 인물정보 조회
                dataUrl = "/LCAPI/Movie/getMovieCastInfo";
                break;
            case "moviefilmography":	// 영화상세 > 필모그래피 조회
                dataUrl = "/LCAPI/Movie/getFilmography";
                break;
            case "movieevent":	// 영화상세 > 이벤트
                dataUrl = "/LCAPI/Movie/getMovieEvent";
                break;
            case "baroticketcombo":	// 바로티켓 > 추천 콤보제품
                dataUrl = "/LCAPI/Home/getRecomendComboItem";
                break;
            case "usecinema":	// 선물 상세 > 사용가능한 영화관 조회
                dataUrl = "/LCAPI/Shop/getUseCinema";
                break;
            case "profileinfo":	// 마이페이지 > 회원 프로필 수정(닉네임,회원사진)
                dataUrl = "/LCAPI/Member/setProfileInfo";
                break;
            case "membergetalraminfo":	// 마이페이지 > 알림함 조회
                dataUrl = "/LCAPI/Member/getAlramInfo";
                break;
            case "memberremovealraminfo":	// 마이페이지 > 알림함 삭제
                dataUrl = "/LCAPI/Member/removeAlramInfo";
                break;
            case "couponlist":	// 마이페이지 > 쿠폰함 리스트
                dataUrl = "/LCAPI/Member/getCouponList";
                break;
            case "setgalleryevent":
                dataUrl = "/LCAPI/Event/setGalleryImageWASSend";
                break;
            case "getcinemapolldetail":
                dataUrl = "/LCAPI/CinemaPoll/getCinemaPollDetail"; //시네마폴 상세 조회
                break;
            case "setcinemapoll":
                dataUrl = "/LCAPI/CinemaPoll/setCinemaPoll"; //시네마폴 응모 하기
                break;
            case "getcinemapollentryresult":
                dataUrl = "/LCAPI/CinemaPoll/getCinemaPollEntryResult"; //시네마폴 투표 결과
                break;
            case "my_cinemapoll_list":
                dataUrl = "/LCAPI/CinemaPoll/getMyCinemaPollList"; //My 시네마폴 목록
                break;
            case "getmysettlehistory":
                dataUrl = "/LCAPI/Member/getMySettleHistory"; //VIP존 > 적립내역
                break;
            case "getmysettlehistorynew":
                dataUrl = "/LCAPI/Member/getMySettleHistoryNew"; //VIP존 > 적립내역
                break;
            case "addresslist":
                dataUrl = "/LCAPI/Address/search";  // 주소 검색
                break;
            case "addaffiliatechannelcd":
                dataUrl = "/LCAPI/Member/addMemberAffiliateChannelCd"; // 제휴사채널코드 추가
                break;
            default:
                return false;

        }
    }
    finally { }

    return dataUrl;
}


/****************************************
* GetGradeClassByCode 관람등급 코드로 스타일 클래스 변환
****************************************/
function GetGradeClassByCode(code, language) {
    var resultClass;

    language = (language == "") ? "KR" : language;

    switch (code) {
        case 0:
            resultClass = "gr_all";
            break;
        case 100:
            resultClass = "gr_non";
            break;
        case 12:
            resultClass = "gr_12";
            break;
        case 15:
            resultClass = "gr_15";
            break;
        case 18:
            resultClass = "gr_18";
            break;
        case '0':
            resultClass = "gr_all";
            break;
        case '전체':
            resultClass = "gr_all";
            break;
        case '100':
            resultClass = "gr_non";
            break;
        case '12':
            resultClass = "gr_12";
            break;
        case '15':
            resultClass = "gr_15";
            break;
        case '18':
                resultClass = "gr_18";
            break;
        case '청불':
            resultClass = "gr_18";
            break;
           
        default:
            resultClass = "";
            return false;
    }

    return resultClass;
}

/****************************************
* GetMoviesPoster 영화 포스터 URL 매칭
****************************************/
function GetMoviesPoster(poster) {
    var resultPoster = "";
    //var tempUrl = defaultUrl;
    var tempUrl = "https://www.lottecinema.co.kr";

    if (poster != null && poster != "") {

        if (poster.toLowerCase().indexOf('http://') == 0) {
            poster = 'https://' + poster.substr(7, poster.length);
        }

        if (poster.toLowerCase().indexOf('http') != 0) {
            resultPoster = tempUrl + poster;
        } else {
            resultPoster = poster;
        }

        
        if (resultPoster.toLowerCase().indexOf('caching.') > -1) {
            if (CNDYN == "Y") {
                resultPoster = resultPoster;
            } else {
                resultPoster = "";
            }
        }
        //20200507 CDN 이미지 정상 체크
        //var url = resultPoster;
        //var xhr = new XMLHttpRequest();

        //xhr.open('get', "/" + PLATFORM_TYPE + "/callcheckcdn?url=" + encodeURIComponent(url), false);
        //xhr.onload = () => {
        //    try {
        //        if (xhr.status === 200 || xhr.status === 201) {

        //            if (JSON.parse(xhr.responseText) == "true") {
        //                console.log("정상");
        //            } else {
        //                console.log("비정상");
        //                resultPoster = "";
        //            }
        //        } else {
        //            console.log("비정상");
        //            resultPoster = "";
        //        }
        //    }
        //    catch (error) {
        //        console.log("비정상");
        //        resultPoster = "";
        //    }
        //};
        //xhr.send(null);
        //20200507 CDN 이미지 정상 체크


        /*if (poster.indexOf('http://www.') > -1 || poster.indexOf('http://.') > -1) {
            //resultPoster = "https" + poster.substr(poster.indexOf("://"), poster.length);
            resultPoster = "https://www." + poster.substr(poster.indexOf("lottecinema"), poster.length);
        }
        else {
            if (poster.indexOf('https://www.') > -1) {
                resultPoster = poster;
            }
            else {
                resultPoster = tempUrl + poster;
            }
        }*/
    }

    return resultPoster;
}

/****************************************
* React Json string(html) -> get -> 텍스트 표현을 HTML 형식 표현
****************************************/
function createRemarkable() {
    var remarkable =
        'undefined' != typeof global && global.Remarkable
            ? global.Remarkable
            : window.Remarkable;

    return new remarkable();
}


///*******************************************
// ** 공통 - Axios HttpWebRequst
// * *****************************************/
//const getObjectData = async (api, menu, paramsData) => {

//    try {

//        var dataUrl;
//        if (api == "LCAPI") {
//            dataUrl = GetLcApiUrls(menu); //LCAPI
//        }
//        else {
//            dataUrl = GetLcwsUrls(menu); //LCWS
//        }

//        // LCWS 대상 URL
//        var url = defaultUrl + dataUrl;
//        var params = JSON.stringify(paramsData);

//        //paramList 폼데이타 셋팅
//        var form = new FormData();
//        form.append("paramList", params);

//        // Axios HttpWebRequst
//        var { data: data } = await axios.post(url, api == "LCAPI" ? params : form, {
//            headers: {
//                'Content-Type': 'application/json',
//            }
//        });

//        return data;
//    }
//    catch (e) {
//        return { IsOK: "false", ResultMessage: e.message }
//    }
//    finally {

//    }
//}

///*******************************************
// ** 공통 - 특수문자 변경
// * *****************************************/
function ReplaceSpecialCharacter(str) {
    //var arr = [["%", "%25"], ["#", "%23"], [":", "%3A"], [";", "%3B"]];
    var arr = [["#", "%23"], [":", "%3A"], [";", "%3B"]];
    arr.map(function (p) {
        str = str.indexOf(p[0] > -1) ? ReplaceAllCharacter(str, p[0], p[1]) : str;
    })
    return str;
}
/****************************************
* LCWS 호출 URL 정의
* type : [web] 웹페이지간 링크
* type : [blank] 웹페이지 새창 띄우기 링크
* type : [webapp] 웹앱연동 링크
* cont : 컨트롤러명
* method : 액션명
****************************************/
function SetLCWURLMAP(type, cont, action, param) {
    var _type = type;
    var _cont = cont;
    var _method = action;
    var _param = param == null || param == undefined ? "" : ReplaceSpecialCharacter(param);

    var returnBack;
    const url = (cont.toLowerCase() == "event" || cont.toLowerCase() == "events") ? "https://event.lottecinema.co.kr" : "https://www.lottecinema.co.kr";
    if (_type == "web") {
        // 웹안에서의 이동
        window.location.href = url + "/NLCHS" + (_cont == "" ? "" : "/" + _cont) + (_method == "" ? "" : "/" + _method) + (_param == "" ? "" : "?" + _param);
    }
    else if (_type == "weblink") {
        // 웹안에서의 이동
        returnBack = url + "/NLCHS" + (_cont == "" ? "" : "/" + _cont) + (_method == "" ? "" : "/" + _method) + (_param == "" ? "" : "?" + _param);
    }
    else if (_type == "blank") {
        // 웹안에서의 신규창 띄움 이또한 추후 재정의 예정
        window.location.href = url + "/NLCHS" + (_cont == "" ? "" : "/" + _cont) + (_method == "" ? "" : "/" + _method) + (_param == "" ? "" : "?" + _param);
    }
    else if (_type == "webapp") {
        // 웹앱과의 호환 추후 재정의 예정
    }
    return returnBack;
}

/****************************************
* 나의정보관리 외부 링크 정의 
* 회원정보변경/비밀번호변경/L.POINT적립내역/회원탈퇴 외부 링크
****************************************/
function SetMyInfoURLMAP(type, go) {

    var domain = "https://www.lottecinema.co.kr";

    if (type == "web") {
        //case - web

        if (go == "MEMBER_EDIT") {
            //회원정보변경

            var returnUrl = domain + "/LHS/AT/Auth/Logout";
            var url = "https://member.lpoint.com/door/user/editUser.jsp?sid=CINEMA&opentype=&returnurl=" + encodeURIComponent(returnUrl);
            window.location.href = url;
        } else if (go == "PASSWORD_CHANGE") {
            //비밀번호변경

            var returnUrl = domain + "/LHS/AT/Auth/Logout";
            var url = "https://member.lpoint.com/door/user/editPasswd.jsp?sid=CINEMA&opentype=&returnurl=" + encodeURIComponent(returnUrl);
            window.location.href = url;
        } else if (go == "LPOING_HISTORY") {
            //L.POINT적립내역

            var url = "https://www.lpoint.com/app/mypage/LHMA200100.do";
            window.open(url, "lpoint", "");
        } else if (go == "MEMBER_REMOVE") {
            //회원탈퇴

            var returnUrl = domain + "/LHS/AT/Auth/Logout";
            var url = "https://member.lpoint.com/door/user/withdrawl.jsp?sid=CINEMA&returnurl=" + encodeURIComponent(returnUrl);
            window.location.href = url;
        }
    } else if (type == "webapp") {
        //case - mobile app

        if (go == "MEMBER_EDIT") {
            //회원정보변경

            if (confirm("회원정보 변경을 위해 L.POINT 사이트로 이동 하시겠습니까?\r\n이동시 로그아웃됩니다.")) {
                _METHOD_TYPE = 1;
                var obj = { MethodName: "LogoutProcess" };
                JsonCallSync("/LCWS/Member/Mobile/Logout", obj, InformationLogoutProcessReturnJsonData);
            }
        } else if (go == "PASSWORD_CHANGE") {
            //비밀번호변경

            if (confirm("비밀번호 변경을 위해 L.POINT 사이트로 이동 하시겠습니까?\r\n이동시 로그아웃됩니다.")) {
                _METHOD_TYPE = 2;
                var obj = { MethodName: "LogoutProcess" };
                JsonCallSync("/LCWS/Member/Mobile/Logout", obj, InformationLogoutProcessReturnJsonData);
            }
        } else if (go == "LPOING_HISTORY") {
            //L.POINT적립내역

            if (getDeviceType() == "I") {
                window.location.href = "command://goto_outerWebPage/?link=https://m.lpoint.com/app/mypage/LWMA200100.do^issafari=Y";
            } else {
                window.location.href = "command://goto_outerWebPage/?link=https://m.lpoint.com/app/mypage/LWMA200100.do";
            }
        } else if (go == "MEMBER_REMOVE") {
            //회원탈퇴

            if (confirm("회원탈퇴를 위해 L.POINT 사이트로 이동 하시겠습니까?\r\n이동시 로그아웃됩니다.")) {
                _METHOD_TYPE = 4;
                var obj = { MethodName: "LogoutProcess" };
                JsonCallSync("/LCWS/Member/Mobile/Logout", obj, InformationLogoutProcessReturnJsonData);
            }
        }
    }
}

// 모바일 로그아웃 처리 완료
var _METHOD_TYPE = -1;




/****************************************
 * 회원
****************************************/
var lcMemberInfo = null;

var lcCommon = {
    /****************************************
    * 회원정보
    ****************************************/
    setMemberStatus: function () {


    },
    /****************************************
    * 회원 로그인 체크
    ****************************************/
    LoginCk: function () {
        if (memberInfo == undefined || memberInfo == null || memberInfo == "") {
            return false;
        }
        else {
            return true;
        }
    },

    /****************************************
    * 회원 체크
    ****************************************/
    MemberCk: function () {
        if (memberInfo.MemberNoOn == '0' || memberInfo.CustomerNo == undefined || memberInfo.CustomerNo == '') {
            return false;
        }
        else {
            return true;
        }
    }
}

lcCommon.setMemberStatus();

// // 회원 정보
//if ($.cookie("MemberInfo") != undefined && $.cookie("MemberInfo") != "") {

//    lcMemberInfo = JSON.parse(decodeURI($.cookie("MemberInfo")));

//}

function MemberCk() {
    if (memberInfo.MemberNoOn == '0' || lcMemberInfo.CustomerNo == undefined || memberInfo.CustomerNo == '') {
        return false;
    }
    else {
        return true;
    }
}

function LoginCk() {
    if (memberInfo == undefined || memberInfo == null || memberInfo == "") {
        return false;
    }
    else {
        return true;
    }
}

var SwiperSettings = {
    // 고정 파라미터
    slidesPerView: 8,
    spaceBetween: 40,
    // 화면 사이즈별 브레이크포인트 
    breakpoints: {
        // 화면사이즈 <= 320px
        320: {
            slidesPerView: 7,
            spaceBetween: 10
        },
        // 화면사이즈 <= 480px
        480: {
            slidesPerView: 7,
            spaceBetween: 10
        },
        // 화면사이즈 <= 640px
        640: {
            slidesPerView: 10,
            spaceBetween: 10
        },
        // 화면사이즈 <= 1024px
        1024: {
            slidesPerView: 10,
            spaceBetween: 10
        },
    }
}

function ReloadForSwiper() {
    var swiper = new Swiper('.date_select_wrap .swiper-container', SwiperSettings);
    swiper.update();
}


/****************************************/
//이벤트 상세 조회 from AS-IS
//<param name="eventid">이벤트 ID</param>
//<param name="eventtypecode">이벤트 유형</param>
//<param name="devtmplyn">개발 템플릿 여부</param>
//<param name="type">3 :return url, 2:window.open(), 그외:windows.location</param>
/****************************************/
function goEventDtailsMove(eventid, type) {
    var url;
    var prefix = "/NLCHS";

    // 101:정보전달형(공지)
    // 102:예매형
    // 103:구매형
    // 104:설문형
    // 105:퀴즈형
    // 106:댓글형
    // 107:무대인사
    // 108:시사회
    // 109:갤러리등록형

    // 110:단순 선착순형 XX

    // 111:버튼형
    // 112:스탬프형
    // 113:출석형

    // 114:영수증응모형
    // 115:정보전달형(할인)
    // 120 : 제휴발급형

    var eventtypecode = eventid.substring(2, 5);

    //101_정보전달형
    if (eventtypecode == "101") url = SetLCWURLMAP(type, "Event", "EventTemplateInfo", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplateInfo?EventID=' + eventid;
    //102_예매형
    else if (eventtypecode == "102") url = SetLCWURLMAP(type, "Event", "EventTemplateBooking", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplateBooking?EventID=' + eventid;
    //103_구매형
    else if (eventtypecode == "103") url = SetLCWURLMAP(type, "Event", "EventTemplateBuy", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplateBuy?EventID=' + eventid;
    //104_설문형
    else if (eventtypecode == "104") url = SetLCWURLMAP(type, "Event", "EventTemplateSurvey", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplateSurvey?EventID=' + eventid;
    //105_퀴즈형
    else if (eventtypecode == "105") url = SetLCWURLMAP(type, "Event", "EventTemplateQuiz", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplateQuiz?EventID=' + eventid;
    //106_댓글형
    else if (eventtypecode == "106") url = SetLCWURLMAP(type, "Event", "EventTemplateComment", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplateComment?EventID=' + eventid;
    //107_무대인사
    else if (eventtypecode == "107") url = SetLCWURLMAP(type, "Event", "EventTemplateStageGreeting", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplateStageGreeting?EventID=' + eventid;
    //108_시사회
    else if (eventtypecode == "108") url = SetLCWURLMAP(type, "Event", "EventTemplatePreview", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplatePreview?EventID=' + eventid;
    //109_갤러리 등록형
    else if (eventtypecode == "109") url = SetLCWURLMAP(type, "Event", "EventTemplateGalleryList", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/gallery-event.aspx?EventID=' + eventid;
    //111_버튼형
    else if (eventtypecode == "111") url = SetLCWURLMAP(type, "Event", "EventTemplateButton", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/button-event.aspx?EventID=' + eventid;
    //112_스탬프형
    else if (eventtypecode == "112") url = SetLCWURLMAP(type, "Event", "EventTemplateStamp", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/stamp-event.aspx?EventID=' + eventid;
    //113_출석형
    else if (eventtypecode == "113") url = SetLCWURLMAP(type, "Event", "EventTemplateAttendance", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/attendance-event.aspx?EventID=' + eventid;
    //114_영수증응모형
    else if (eventtypecode == "114") url = SetLCWURLMAP(type, "Event", "EventTemplateEnter", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/receipt-enter-event.aspx?EventID=' + eventid;
    //115_정보전달형(할인)
    else if (eventtypecode == "115") url = SetLCWURLMAP(type, "Event", "EventTemplateInfo", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplateInfo?EventID=' + eventid;
    //117_게임형
    else if (eventtypecode == "117") url = SetLCWURLMAP(type, "Events", "", "eventId=" + eventid); 
    //120_제휴발급형
    else if (eventtypecode == "120") url = SetLCWURLMAP(type, "Event", "EventTemplateAllnGift", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplateAllnGift?EventID=' + eventid;
    //122_랜덤박스
    else if (eventtypecode == "122") url = SetLCWURLMAP(type, "Event", "EventTemplateRandomBox", "eventId=" + eventid); //EventServerDomain + prefix + '/Event/EventTemplateRandomBox?EventID=' + eventid;
    //124_영잘알
    else if (eventtypecode == "124")  url = SetLCWURLMAP(type, "Event", "EventTemplateInitialQuiz", "eventId=" + eventid);    
    else {
        //url = SetLCWURLMAP(type, "Event", "", "");
    }
    return url;
}

function goToEventPageList(eventType, eventId) {
    var url;
    var prefix = "/NLCHS";

    //xxx, eskang, event page def
    //'L.셀렉션'
    if (eventType == '1') url = EventServerDomain + prefix + '/Contents/Event/l-selection-list.aspx';
    //'영화&예매'
    else if (eventType == '2') url = EventServerDomain + prefix + '/Contents/Event/movie-booking-list.aspx';
    //'우리동네 영화관'
    else if (eventType == '3') url = EventServerDomain + prefix + '/Contents/Event/our-town-cinema-list.aspx?EventId=' + eventId;
    //'무대인사&시사회'
    else if (eventType == '4') url = EventServerDomain + prefix + '/Contents/Event/preview-stage-greeting-list.aspx';
    //'제휴&할인'
    else if (eventType == '5') url = EventServerDomain + prefix + '/Contents/Event/alliance-discount-list.aspx';

    location.href = url;
};

/****************************************
* 모바일 앱에서 호출하는
****************************************/
function getDataFromNative(key) {
    try {
        var $iFrm = $('<IFRAME id="iFrm" frameBorder="0" src="' + "command://getData/?" + key + '" name="' + key + '" scrolling="no" style="display:none;"></IFRAME>');
        $iFrm.appendTo('body');
        $('#iFrm').remove();
        //$("#iframeNativeCommuncation").attr("src", "command://getData/?" + key);
    }
    catch (e) {
        alert(e.Message);
    }
};

//-----------------------------------------------------------------------------
// 이미지 파일 여부 확인
// @return : boolen, ture - 이미지 파일,  false - 이미지 파일아님
//-----------------------------------------------------------------------------    
function checkImage(imagePath) {
    var result;
    try {
        var pointIndex = imagePath.lastIndexOf('.');
        if (pointIndex < 0) throw new Error("NO IMAGE");
        var extension = imagePath.substr(pointIndex).toLowerCase();
        if (extension == '.jpg' ||
            extension == ".png" ||
            extension == ".gif" ||
            extension == ".bmp")
            result = true;
        else
            result = false;

    } catch (e) {
        result = false;
    } finally {
        return result;
    }
}

//////기존 페이지 이동 로직 시작///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/****************************************
* 예매 이동
* eventID : 이벤트 아이디
* areaCodes : 영화관 지역코드
* cinemaCodes :영화관 코드
* screentype :일반관, 스페셜
* type : 3 :return url, 2:window.open(), 그외:windows.location
****************************************/
//기존
//function goEventToTicketIng(eventID, movieCode, areaCode, cinemaCode, screentype, type) {
//    $.fn.cookieReset()
//    addCookieEventID(eventID)
//    addCookieMovieCode(movieCode)
//    addCookieAreaCodes(areaCode)
//    addCookieCinemaCodes(cinemaCode)
//    addCookieScreentype(screentype)
//    var url = CinemaServerDomain + "/NLCHS/Contents/ticketing/ticketing.aspx"
//    type = (type == undefined) ? '1' : type;

//    //기존 1.링크, 2.새창, 3 url
//    goUrl(url, type);
//}
function goEventToTicketIng(eventID, movieCode, areaCode, cinemaCode, screentype, type) {

    //SetLCWURLMAP("", "Ticketing", "", "");
}

/****************************************
* 이벤트에서 시네마몰로 상세 이동
* eventID : 이벤트 아이디
* classifictionCode : 시네마몰 메뉴 코드(스위트:CLASSIFICATION_SWEET_CODE , 기프트:CLASSIFICATION_GIFT_CODE)
* displayMiddleClassificationCode : 중분류 코드
* cinemaID : 영화관 코드 (스위트 상품코드가 있을경우 필수) - 기프트 상품에서는 사용안함
* displayItemID : 상품코드
* type : 3 :return url, 2:window.open(), 그외:windows.location
****************************************/
function goEventToCinemaMallDetail(classifictionCode, displayMiddleClassificationCode, cinemaID, displayItemID, eventID, type) {
    $.fn.cookieReset()
    addCookieEventID(eventID)
    goLotteCinemaMallDetail(classifictionCode, displayMiddleClassificationCode, cinemaID, displayItemID, type)
    //goUrl(url, type);
}

/****************************************
* 시네마몰 상세페이지
* classifictionCode : 시네마몰 메뉴 코드(스위트:CLASSIFICATION_SWEET_CODE , 기프트:CLASSIFICATION_GIFT_CODE)
* detailDivisionCode : 지역코드 (스위트 상품코드가 있을경우 필수) - 기프트 상품에서는 사용안함
* cinemaID : 영화관 코드 (스위트 상품코드가 있을경우 필수) - 기프트 상품에서는 사용안함
* displayItemID : 상품코드
* type : 3 :return url, 2:window.open(), 그외:windows.location
****************************************/
function goLotteCinemaMallDetail(classifictionCode, displayMiddleClassificationCode, cinemaID, displayItemID, type, menuCD) {
    var url = "";
    var param = "";
    if (classifictionCode == CLASSIFICATION_SWEET_CODE) {
        param = "?cinemaID=" + cinemaID + "&displayItemID=" + displayItemID + "&displayMiddleClassification=" + displayMiddleClassificationCode
    } else {
        menuCD = ToString(menuCD) == "" ? "" : menuCD;
        //param = "?displayItemID=" + displayItemID + "&displayMiddleClassification=" + displayMiddleClassificationCode + "&displayMenuID=" + menuCD
        param = "?displayItemID=" + displayItemID + "&displayMiddleClassification=" + classifictionCode + "&displayMenuID=" + menuCD
    }
    url = getLotteCinemaMallDetailUrl(classifictionCode) + param
    type = (type == undefined) ? '1' : type;
    goUrl(url, type)
}

/****************************************
* 이벤트에서 시네마몰로 이동
* eventID : 이벤트 아이디
* classifictionCode : 시네마몰 메뉴 코드(스위트:CLASSIFICATION_SWEET_CODE , 기프트:CLASSIFICATION_GIFT_CODE)
* detailDivisionCode : 지역코드 (스위트 상품코드가 있을경우 필수) - 기프트 상품에서는 사용안함
* cinemaID : 영화관 코드 (스위트 상품코드가 있을경우 필수) - 기프트 상품에서는 사용안함
* displayItemID : 상품코드
* type : 3 :return url, 2:window.open(), 그외:windows.location
****************************************/
function goEventToCinemaMallList(classifictionCode, cinemaID, displayItemID, eventID, type) {
    $.fn.cookieReset()
    addCookieEventID(eventID)
    goLotteCinemaMallList(classifictionCode, cinemaID, displayItemID, type)
    //goUrl(url, type);
}

/****************************************
* 시네마몰 리스트
* classifictionCode : 시네마몰 메뉴 코드(스위트:CLASSIFICATION_SWEET_CODE , 기프트:CLASSIFICATION_GIFT_CODE)
* detailDivisionCode : 지역코드 (스위트 상품코드가 있을경우 필수) - 기프트 상품에서는 사용안함
* cinemaID : 영화관 코드 (스위트 상품코드가 있을경우 필수) - 기프트 상품에서는 사용안함
* displayItemID : 상품코드
* type : 3 :return url, 2:window.open(), 
* ****************************************/
function goLotteCinemaMallList(classifictionCode, cinemaID, displayItemID, type, menuCD) {
    var url = "";
    var param = ""
    if (classifictionCode == CLASSIFICATION_SWEET_CODE) {
        param = "?cinemaID=" + cinemaID + "&displayItemID=" + displayItemID
    } else {
        //param = "?displayItemID=" + displayItemID
        param = "?displayMenuID=" + menuCD
    }
    url = getLotteCinemaMallListUrl(classifictionCode) + param
    type = (type == undefined) ? '1' : type;
    goUrl(url, type);
}

/****************************************
* 타입에 따라 링크 이동 방법이 바뀐다.
* url : 링크 주소
* type : 3 :return url, 2:window.open(), 그외:windows.location,
* ***************************************/
function goUrl(url, type) {
    // type 기본값 설정
    type = (type == undefined) ? '1' : type;
    if (type == "") {
        type = "1"; //1:링크
    }
    if (type == "3") {
        return url;
    } else if (type == "2") {
        if (url == "") {
            alert(templatetype + ' 개발 중');
        } else {
            window.open(url, '_blank');//새창링크
        }
    } else {
        if (url == "") {
            alert(templatetype + ' 개발 중');
        } else {
            location.href = url;//링크
        }
    }
}
//////기존 페이지 이동 로직 끝///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function lpad(originalstr, length, strToPad) {
    /// <summary>
    /// 문자열 LPAD 함수
    /// </summary>
    /// <param name="originalstr">lpad 할 text</param>
    /// <param name="length">lpad할 길이</param>
    /// <param name="strToPad">lpad 시킬 text</param>
    while (originalstr.length < length)
        originalstr = strToPad + originalstr;
    return originalstr;
}



/****************************************
* 글자수 변경 카운터(타겟(input),최대글자수,뷰레이어(ID))
****************************************/
function jschkword(obj, maxByte, wordLen) {

    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";

    var maxLen = maxByte; //length 로만 체크

    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) {
            totalByte += 2;
        } else {
            totalByte++;
        }

        len = i + 1;
    }

    //// 넘어가는 글자는 자른다.
    //if (totalByte > maxByte) {
    //    alert(maxByte + "자를 초과 입력 할 수 없습니다.");
    //    str2 = strValue.substr(0, len);
    //    obj.value = str2;
    //    chkword(obj, 4000);
    //}

    if (len > maxLen) {
        alert(maxLen + "자를 초과 입력 할 수 없습니다.");
        str2 = strValue.substr(0, maxLen);
        len = maxLen;
        obj.value = str2;
        chkword(obj, 4000);
    }

    if (wordLen != undefined) {
        var wordLenObj = $("#" + wordLen);
        wordLenObj.text(len);
    }

}

//회원정보 조회
var getAutoUserInfo = function (UserID) {
    var returnValue = null;
    try {
        var vData = {
            "loginId": UserID,
            "deviceToken": "",
            "MobileOSType": ""
        };

        var vDta = {
            "channelType": CHANNEL_TYPE,
            "osType": browserAgent,
            "osVersion": navigator.userAgent,
            "data": vData
        };

        common.JsonCallSync('/LCAPI/Account/getUserInfo', vDta, function (rspDta) {
            returnValue = rspDta.responseJSON;
        });

    } catch (e) {
        returnValue = "{isOK : false}";
    }

    return returnValue;
}

//회원정보 조회
var getAutoUserInfo_new = function (memberNoOn) {
    var returnValue = null;
    try {
       // var osType = (getDeviceType() == "A") ? "Android" : "iOS";
        let vData = {
            "UUID": "",
            "MemberNoOn": memberNoOn,
            "MobileOSType": "PC"
        };

        var vDta = {
            "channelType": CHANNEL_TYPE,
            "osType": BrowserAgent(),
            "osVersion": navigator.userAgent,
            "multiLanguageID": "KR",
            "data": vData
        };

        common.JsonCallSync('/LCAPI/Account/getALProcess', vDta, function (rspDta) {
            returnValue = rspDta.responseJSON;
        });

    } catch (e) {
        returnValue = "{isOK : false}";
    }

    return returnValue;
}

/*====================================================================================
   ' 함수명 : $.showMask(msg)
   ' 인  수 : msg - 로딩 메세지
   ' 기  능 : 페이지 마스크 처리 및 로딩문구 노출
   ' 리턴값 : 없음.
   '=====================================================================================*/
$.showMask = function (zIndex, msg) {
    if (zIndex == null || zIndex == undefined) {
        zIndex = 999999
    }
    var width = $(window).width();
    var popupwidth = $(window).width() - 70;
    var left = popupwidth / 2;

    $.blockUI({
        message: (msg == "" || msg == undefined) ? "<img src='/" + PLATFORM_TYPE + "/Content/images/preloader_icon.gif' alt=''>" : msg,
        css: {
            border: 'none',
            width: '70px',
            height: '70px',
            left: left + 'px',
            backgroundColor: "rgba(255, 255, 255, 0)",
            opacity: 5,
            color: 'rgba(255, 255, 255, 0)',
            zIndex: zIndex
        },
        overlayCSS: {
            backgroundColor: '#ffffff',
            opacity: 0.6,
            cursor: 'wait',
            zIndex: zIndex
        }
    });
}

/*====================================================================================
' 함수명 : $.hideMask(msg)
' 인  수 : msg - 완료 메세지
' 기  능 : 페이지 마스크 제거
' 리턴값 : 없음.
'=====================================================================================*/
$.hideMask = function (msg) {
    if (msg == "" || msg == undefined) {
        //setTimeout($.unblockUI(), 9000);
        $.unblockUI();
    }
    else {
        $.unblockUI({
            onUnblock: function () {
                alert(msg);
            }
        });
    }
}

var CommonMemberGrade = {
    GradeNames: [
        { "code": "100", "name": "Lv.1", "amt": 20000, "style": "level1", "fullname": "", "qtr": "" },
        { "code": "200", "name": "Lv.2", "amt": 40000, "style": "level2", "fullname": "", "qtr": "" },
        { "code": "300", "name": "Lv.3", "amt": 60000, "style": "level3", "fullname": "", "qtr": "" },
        { "code": "400", "name": "Lv.4", "amt": 320000, "style": "level4", "fullname": "", "qtr": "" },
        { "code": "500", "name": "Lv.5", "amt": 400000, "style": "level5", "fullname": "", "qtr": "" },
        { "code": "0", "name": "일반", "amt": 0, "style": "common", "fullname": "", "qtr": "" },
        { "code": "1", "name": "일반", "amt": 0, "style": "common", "fullname": "", "qtr": "" },
        { "code": "2", "name": "VIP", "amt": 260000, "style": "vip", "fullname": "", "qtr": "" },
        { "code": "3", "name": "VVIP", "amt": 260000, "style": "vvip", "fullname": "", "qtr": "" },
        { "code": "4", "name": "VIP GOLD", "amt": 320000, "style": "vipgold", "fullname": "", "qtr": "" },
        { "code": "5", "name": "VIP PLATINUM", "amt": 400000, "style": "vipplatinum", "fullname": "", "qtr": "" }
    ],

    initGrades: function () {
        this.GradeNames = [
            { "code": "100", "name": "Lv.1", "amt": 20000, "style": "level1", "fullname": "", "qtr": "" },
            { "code": "200", "name": "Lv.2", "amt": 40000, "style": "level2", "fullname": "", "qtr": "" },
            { "code": "300", "name": "Lv.3", "amt": 60000, "style": "level3", "fullname": "", "qtr": "" },
            { "code": "400", "name": "Lv.4", "amt": 320000, "style": "level4", "fullname": "", "qtr": "" },
            { "code": "500", "name": "Lv.5", "amt": 400000, "style": "level5", "fullname": "", "qtr": "" },
            { "code": "0", "name": "일반", "amt": 0, "style": "common", "fullname": "", "qtr": "" },
            { "code": "1", "name": "일반", "amt": 0, "style": "common", "fullname": "", "qtr": "" },
            { "code": "2", "name": "VIP", "amt": 260000, "style": "vip", "fullname": "", "qtr": "" },
            { "code": "3", "name": "VVIP", "amt": 260000, "style": "vvip", "fullname": "", "qtr": "" },
            { "code": "4", "name": "VIP GOLD", "amt": 320000, "style": "vipgold", "fullname": "", "qtr": "" },
            { "code": "5", "name": "VIP PLATINUM", "amt": 400000, "style": "vipplatinum", "fullname": "", "qtr": "" }
        ]
	},

    // 일반, VIP는 년차를 넘겨주지 않음
    //CommonMemberGrade.getMemberGrade("10")
    //CommonMemberGrade.getMemberGrade("2201")
    getMemberGrade: function (value) {
        var code, grades = "";
        this.initGrades();

        if (value.length == 3) {
            code = value;
        } else {
            code = value.substr(0, 1);
        }
        grades = this.GradeNames.filter(function (ele, index, arr) {
            return ele.code == code;
        })[0];
        grades.year = (code > 2 ? parseInt(value.substr(2)).toString() : "");
        grades.fullname = grades.name + (grades.year != "" ? " " + grades.year + "년차" : "");

        return grades;
    },
    /****************************************
    * 타입에 따라 링크 이동 방법이 바뀐다.
    * val : 코드
    * isFriends : 프렌즈여부(부스터 포함)
    * qtr : 프렌즈 - 분기
    * message : 메세지
    * ***************************************/
    getMemberGradeNew: function (value, myVipType, tgVipType, qtr) {
        var code, grades = "";
        this.initGrades();

        //friends
        if (value.length == 3) {
            code = value;
        } else { //일반, VIP
            code = value.substr(0, 1);
        }

        grades = this.GradeNames.filter(function (ele, index, arr) {
            return ele.code == code;
        })[0];

        if (myVipType == "1") { //내등급 == VIP 
            if (tgVipType == "1") { //VIP 페이지
                var year = "";
                if (code.length == 1) {
                    year = (code > 2 ? parseInt(value.substr(2)).toString() : "");
                }
                grades.fullname = grades.name + (year != "" ? " " + year + "년차" : "");

            } else if (tgVipType == "2") { //Friends 페이지
                var d = moment().toDate();
                grades.fullname = "VIP 고객님의 등급은 " + d.getFullYear() + "년 12월까지 그대로 유지됩니다.";

            }
        } else if (myVipType == "2") { //내등급 == Friends
            if (tgVipType == "1") { //VIP 페이지
                var year = "";
                if (code.length == 1) {
                    year = (code > 2 ? parseInt(value.substr(2)).toString() : "");
                }
                grades.fullname = grades.name + (year != "" ? " " + year + "년차" : "");

            } else if (tgVipType == "2") { //Friends 페이지
                grades.name = grades.code == "1" ? "Friends" : grades.name;
                grades.qtr = qtr;
                grades.fullname = !isEmpty(qtr) && qtr > 0 ? qtr + "분기 " + grades.name : grades.name;

			}
		}

        return grades;
    }
}

function isEmpty(val) {
    if (val != null && val != undefined && val != "") {
        return false;
    } else {
        return true;
	}
}

function isNullOfEmpty(val) {
    if (val != null && val != undefined && val != "") {
        return false;
    } else {
        return true;
    }
}

function comma(num) {
    var len, point, str;

    num = num + "";
    point = num.length % 3;
    len = num.length;

    str = num.substring(0, point);
    while (point < len) {
        if (str != "") str += ",";
        str += num.substring(point, point + 3);
        point += 3;
    }
    return str;
}

function refScrollFocus(elm) {
    window.scrollTo(0, elm.offserTop);
    elm.focus();
}

function setWon(pWon) {
    var won = (pWon + "").replace(/,/g, "");
    var arrWon = ["원", "만", "억", "조", "경", "해", "자", "양", "구", "간", "정"];
    var changeWon = "";
    var pattern = /(-?[0-9]+)([0-9]{4})/;
    while (pattern.test(won)) {
        won = won.replace(pattern, "$1,$2");
    }
    var arrCnt = won.split(",").length - 1;
    for (var ii = 0; ii < won.split(",").length; ii++) {
        if (arrWon[arrCnt] == undefined) {
            alert("값의 수가 너무 큽니다.");
            break;
        }
        var tmpwon = 0;
        for (i = 0; i < won.split(",")[ii].length; i++) {
            var num1 = won.split(",")[ii].substring(i, i + 1);
            tmpwon = tmpwon + Number(num1);
        }
        if (tmpwon > 0) {
            changeWon += won.split(",")[ii] + arrWon[arrCnt]; //55억0000만0000원 이런 형태 방지 0000 다 짤라 버린다
        }
        arrCnt--;
    }
    return changeWon;
}

/* CryptoJS_aes-min.js  */
function aesEncrypt(keyF, ivF, pText, keySize) {
    var key = CryptoJS.enc.Utf8.parse(keyF);
    var iv = CryptoJS.enc.Utf8.parse(ivF);
    var Data = CryptoJS.AES.encrypt(pText, key, {
        iv: iv,
        keySize: keySize / 32
    });
    return Data
}
function aesDecrypt(pText) {
    var keyF = "jceeur80KI30s7ol9LO8V73ijRf702Wv";
    var ivF = "P2c6II3T38F7diYR";
    var keySize = 256;
    return aesDecrypt2(keyF, ivF, pText, keySize);
}
function aesDecrypt2(keyF, ivF, pText, keySize) {
    var key = CryptoJS.enc.Utf8.parse(keyF);
    var iv = CryptoJS.enc.Utf8.parse(ivF);
    var Data = CryptoJS.AES.decrypt(pText, key, {
        iv: iv,
        keySize: keySize / 32
    });
    return Data.toString(CryptoJS.enc.Utf8)
}

/****************************************
* 메세지에따라 페이지 이동
 * 결제완료에서 사용 (OrderSettlementPlug.jsx)
****************************************/
function commonResultMessageRedirect(msg) {
    var arrMsg = [
        ["싸다구", "/NLCHS"],
        ["메인화면", "/NLCHS"]
    ];

    if (msg != null && msg != undefined && msg != "") {
        for (var i = 0; i < arrMsg.length; i++) {
            if (msg.indexOf(arrMsg[i][0]) > -1) {
                window.location.replace("https://www.lottecinema.co.kr" + arrMsg[i][1]);
                break;
            }
        }
    }
}

/****************************************
* 코로나19 방역패스 메세지 (영화관, 예매, 스케줄)
****************************************/
function COVID19Message() {
    var msg = "";

    msg += "■ 안전한 영화관 이용안내 ■\n\n"
    msg += "ㆍ상영관 내 물, 무알콜 음료만 취식 가능\n"
    msg += "ㆍ좌석 띄어앉기 적용\n"
    msg += "   - (1인 예매시 타인 동석 가능)\n"
    msg += "ㆍ4월 24일(일)까지 적용\n\n"
    msg += "※ 4월 25일(월)부터 좌석 띄어앉기 및 음식물 취식 제한이 해제됩니다.\n"
    msg += "※ 안전한 영화관람을 위해 관람 중 상시 마스크 착용을 부탁드립니다."

    return msg;
}

/**
 * 다운로드 or 새창 링크
 * @param {boolean} downYN (true:다운로드, false:링크)
 * @param {any} filename
 * @param {any} filepath
 * @param {any} url
 * @param {boolean} newWinYN (true:새창, false:현재창)
 */
function SetDownloadOrLink(downYN, filename, filepath, url, newWinYN) {
    const link = document.createElement('a');

    if (downYN) {
        url = SetLCWURLMAP("weblink", "Customer", "FileDownStream", "FileName=&FileDownName=" + encodeURIComponent(filename) + "&FilePath=" + encodeURIComponent(filepath));

        link.setAttribute('href', url);
        link.setAttribute('download', filename);
    }
    else {
        link.setAttribute('href', url);
        if (newWinYN) {
            link.setAttribute('target', "_blank");
        }
    }

    link.style.display = 'none';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

//연령제한
function checkAge() {
    const grade = cookieJson.ticketingState.ticketing.playSequenceCode[0].viewingCode;
    const age = $.cookie("AGE");
    const seatType = cookieJson.ticketingState.seatSelect.SeatType;
    const adultSeat = seatType.filter(function (seat) { return (seat.code == 10 || seat.code == 11 || seat.code == 12) && seat.count > 0; });

    if (grade == 18) {
        if (grade > age)
            return "R_18";
        else
            return "R_OK";
    }
    else if (grade == 15 || grade == 12) {
        if (grade > age || age >= 18) {
            if (adultSeat.length == 0)
                return "R_" + grade.toString();
            else
                return "R_OK";
        }
        else
            return "R_OK";
    }
    else
        return "R_OK";
}

const ageCheckMessage = [
    {
        "type": "R_18",
        "text": "선택하신 영화의 관람등급은 청소년관람불가 영화입니다.<br/>관람등급에 맞지 않는 연령의 고객 입장 시, 영화관람이 제한될 수 있습니다."
    },
    {
        "type": "R_15",
        "text": "선택하신 영화의 관람등급은 만 15세이상 관람가 영화입니다.<br/>만 15세 미만의 청소년이 보호자 동반 없이 입장 시, 영화관람이 제한될 수 있습니다."
    },
    {
        "type": "R_12",
        "text": "선택하신 영화의 관람등급은 만 12세이상 관람가 영화입니다.<br/>만 12세 미만의 청소년이 보호자 동반 없이 입장 시, 영화관람이 제한될 수 있습니다."
    }
]

function getAgeCheckMsg(msgType) {
    const msg = ageCheckMessage.filter(function (x) { return x.type == msgType; });
    return msg && msg[0].text;
}