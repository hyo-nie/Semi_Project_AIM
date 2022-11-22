var dataLayer;
var lcga = {
    common: {},
    init: function () {
        try {
            lcga.common = $.cookie("MemberInfo") == null || $.cookie("MemberInfo") == undefined || $.cookie("MemberInfo") == "" ? {} : JSON.parse($.cookie("MemberInfo"));
        } catch (e) {
            ;
        }
    },
    isLogin: function () {
        return !lcga.getValue("IsLogin") || lcga.getValue("IsLogin").length < 1 ? false : (lcga.getValue("IsLogin") == "Y" ? true : false);
    },
    getValue: function (nm) {
        var value = "";
        try {
            value = lcga.common[nm];
            value = value == null || value == undefined || value == "undefined" ? "" : value;
        } catch (e) {
            value = "";
        }
        return (value + "");
    },
    getTitle: function () {
        return $("title").val();
    },
    getAutoLoginDate: function (format) {
        var value = "";
        try {
            //2019-10-30 오후 3:18:16
            var date = lcga.getValue("AutoLoginSetDate");
            if (date != null && date != undefined && date.length >= 10) {
                var d1 = date.split(" ");
                var d2 = d1[0].split("-");
                if (format == "YYYY") {
                    value = d2[0];
                } else if (format == "MM") {
                    value = d2[1];
                } else if (format == "DD") {
                    value = d2[2];
                }
            }
        } catch (e) {
            ;
        }
        return (value + "");
    },
    getDateToYYYYMMDD: function (date) {
        var value = "";
        try {
            //2019-10-30 오후 3:18:16
            value = date.substr(0, 10).replace(/-/g, '')
        } catch (e) {
            ;
        }
        return (value + "");
    },
    getBrowser: function () {
        var value = "";
        try {
            if (CHANNEL_TYPE == "MW") {
                value = "Mobile";
            } else if (CHANNEL_TYPE == "MA") {
                value = "APP";
            } else if (CHANNEL_TYPE == "HO") {
                value = "PC";
            }
        } catch (e) {
            ;
        }
        return value;
    },
    push: function (obj) {
        try {
            dataLayer.push(obj);
            lcga.clearData();
        } catch (e) {
            ;
        }
    },
    clearData: function () {
        try {
            dataLayer.push({
                'dimension102': undefined,
                'metric21': undefined,
                'metric22': undefined,
                'metric23': undefined,
                'metric24': undefined,
                'metric29': undefined,
                'metric30': undefined,
                'metric32': undefined,
                'metric33': undefined,
                'layerCategory': undefined,
                'layerAction': undefined,
                'layerLabel': undefined,
                'ecommerce': undefined,
                'nonInteraction': false
            });
        } catch (e) {
            ;
        }
    },
    //GA 전자상거래 이벤트(영화예매)
    ticketingPush: function (movieCode, movieName, title) {
        try {
            movieCode = movieCode + "";
            movieName = movieName + "";
            lcga.push({
                'event': 'ga_Event_Ecommerce',
                'layerCategory': 'Ecommerce',
                'layerAction': 'Click',
                'ecommerce': {
                    'click': {
                        'actionField': {
                            'list': title
                        },
                        'products': [
                            {
                                'id': movieCode,
                                'name': movieName,
                                'category': '영화예매'
                            }
                        ]
                    }
                }
            });
        } catch (e) {
            //console.log(e);
        };
    }
}

//
lcga.init();

var ageData = $.cookie("AGE") == null || $.cookie("AGE") == undefined || $.cookie("AGE") == "" ? "" : $.cookie("AGE");
var ageRange = (parseInt(ageData / 10) * 10);
var link;
var getParam;
var chkCode = false;
//
function getUrlParamsGa() {
    var params = {};
    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) { params[key] = value; });
    return params;
}

function getGaTitle() {
    link = document.location.href;
    if (link.indexOf("/Event/") > -1)
    {
        var gaTit = "";
        if (link.indexOf("DetailList?code=") > -1) {
            getParam = getUrlParamsGa();
            gaTit = "이벤트_";
            if (getParam.code == "10") gaTit += "HOT";
            else if (getParam.code == "20") gaTit += "영화";
            else if (getParam.code == "30") gaTit += "우리동네 영화관";
            else if (getParam.code == "40") gaTit += "시사회/무대인사";
            else if (getParam.code == "50") gaTit += "제휴할인";
            else gaTit = headTitle;
        }
        else if (link.indexOf("eventId=") > -1) {
            gaTit = link.replace("https://www.lottecinema.co.kr/", "");
        }
        return gaTit;
    }
    else if (link.indexOf("/Cinema/SpecialCinema") > -1) {
        getParam = getUrlParamsGa();
        if (getParam.SpecialCinema == "2" && getParam.screendivcd == "300") gaTit = "스페셜관_샤롯데";
        if (getParam.SpecialCinema == "2" && getParam.screendivcd == "941") gaTit = "스페셜관_수퍼플렉스G";
        if (getParam.SpecialCinema == "2" && getParam.screendivcd == "980") gaTit = "스페셜관_수퍼S";
        if (getParam.SpecialCinema == "2" && getParam.screendivcd == "940") gaTit = "스페셜관_수퍼플렉스";
        if (getParam.SpecialCinema == "2" && getParam.screendivcd == "930") gaTit = "스페셜관_수퍼 4D";
        if (getParam.SpecialCinema == "2" && getParam.screendivcd == "950") gaTit = "스페셜관_씨네비즈";
        if (getParam.SpecialCinema == "2" && getParam.screendivcd == "200") gaTit = "스페셜관_씨네커플";
        if (getParam.SpecialCinema == "2" && getParam.screendivcd == "960") gaTit = "스페셜관_씨네패밀리";
        if (getParam.SpecialCinema == "2" && getParam.screendivcd == "986") gaTit = "스페셜관_씨네컴포트";
        return gaTit;
    }
    else return headTitle;
}

function fn_encCustId(custID) {
    var uid = "";
    var dt = new Date();
    var yyyy = dt.getFullYear().toString();
    var M = dt.getMonth() + 1;
    var MM = M < 10 ? '0' + M.toString() : M.toString();
    var dd = dt.getDate() < 10 ? '0' + dt.getDate().toString() : dt.getDate().toString();
    var HH = dt.getHours() < 10 ? '0' + dt.getHours().toString() : dt.getHours().toString();
    var mm = dt.getMinutes() < 10 ? '0' + dt.getMinutes().toString() : dt.getMinutes().toString();
    var ss = dt.getSeconds() < 10 ? '0' + dt.getSeconds().toString() : dt.getSeconds().toString();
    // 최종 값 형태 : yyyy + 쳔샹 + MMddHHmmss [Hit 발생시간기준]
    uid = yyyy + custID + MM + dd + HH + mm + ss;
    return uid;
}

var pageviewObj = {
    'title': getGaTitle(),                             //{{ 정의된 페이지 제목 }},
    'dimension2': (lcga.isLogin() == false) ? "" : fn_encCustId(lcga.getValue("CustID")),      // CustID 맴버스 요청으로 수정
    'dimension3': lcga.getValue("IsLogin") == "Y" ? "Y" : "N",  //{{ 로그인 여부 }},
    'dimension4': lcga.getBrowser(),                //{{ 브라우저 접속유형 }},
    'dimension7': (lcga.isLogin() == false) ? "" : lcga.getValue("Sex") == "1" ? "M" : "F",   //{{ 성별 정보 }}, // 비 로그인 시 세팅 하지 않음.
    'dimension8': ageData,                               //{{ 연령 정보 }}, // 비 로그인 시 세팅 하지 않음.
    'dimension10': (lcga.isLogin() == false) ? "" : lcga.getValue("MemberClass"),    //{{ 회원 등급 }}, // 비 로그인 시 세팅 하지 않음.
    'dimension11': (lcga.isLogin() == false) ? "" : lcga.getValue("LotteCinemaMemberGubun"),  //{{ 정회원 / 준회원 / 비회원 구분 }},
    'dimension61': (lcga.isLogin() == false)? "" : lcga.getValue("MemberNo"),       //{{ 롯데시네마 고유 고객 번호 }}, // 비 로그인 시 세팅 하지 않음.
    'dimension97': (lcga.isLogin() == false) ? "" : lcga.getAutoLoginDate("YYYY"),   //{{ 자동 로그인 YYYY }}, // 비 로그인 시 세팅 하지 않음.
    'dimension98': (lcga.isLogin() == false) ? "" : lcga.getAutoLoginDate("MM"),     //{{ 자동 로그인 M }}, // 비 로그인 시 세팅 하지 않음.
    'dimension99': lcga.getAutoLoginDate("DD"),     //{{ 자동 로그인 D }}, // 비 로그인 시 세팅 하지 않음.
    'dimension100': (ageRange > 0 ? ageRange : "") + ""                              //{{ 고객 연령대(10단위로 구분) }} // 비 로그인 시 세팅 하지 않음.
}
dataLayer = [pageviewObj];

//
(function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
        (i[r].q = i[r].q || []).push(arguments)
    }, i[r].l = 1 * new Date(); a = s.createElement(o),
        m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
})(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
ga('create', 'UA-106764115-1', 'auto');
//
(function (w, d, s, l, i) {
    w[l] = w[l] || []; w[l].push({
        'gtm.start':
            new Date().getTime(), event: 'gtm.js'
    }); var f = d.getElementsByTagName(s)[0],
        j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
            'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
})(window, document, 'script', 'dataLayer', 'GTM-K8MP435');

//DMC 스크립트 20200601
(function (w, d, s, l, i) {
w[l] = w[l] || []; w[l].push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' }); var f = d.getElementsByTagName(s)[0],
    j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
})(window, document, 'script', 'dataLayer', 'GTM-PJ6LCKF');