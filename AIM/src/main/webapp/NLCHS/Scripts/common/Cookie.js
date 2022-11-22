
var cookieJson = '';
var memberInfo;
//$.cookie('ticketingStateCookie','');
if ($.cookie('ticketingStateCookie') == '' || $.cookie('ticketingStateCookie') == null || $.cookie('ticketingStateCookie') == 'undefined') {
    cookieJson = {
        ticketingState: {
            ticketing: {
                playDate: "",
                playWeek: "",
                screentype: [],
                areaCodes: [],
                cinemaCodes: [],
                movieCodes: [],
                playSequenceCode: [],
                sortMovieCode: "",
                sortFilmCode: "",
                // 20170203 - 시사화/무대인사일 경우에만 쿠키에 저장된 영화관 정보 사용
                isFromPreviewStageGreeting: ""
            },
            seatSelect: {
                SeatType: [],
                SeatCodes: [],
                seatArray: [],
                seatPreview: [],
                transNo: ""
            },
            schedule: {
                tabIdx: "",
                playDateId: "",
                cinemaId: "",
                movieId: "",
                movieSort: "",
                playSequenceId: ""
            },
            payment: "",
            // eventCode: "",
            goods: "",
            BookingStatus: '',
            facebookActLogConnectionID: '',
            facebookActLogMovieCode: '',
            facebookActLogFacebookID: '',
            facebookActLogPageUrl: '',
            LpointSaveType: '',
            CashSaveAmount: ''
        }
    };
} else {

    cookieJson = $.parseJSON($.cookie('ticketingStateCookie'));
};

$(document).ready(function () {

    $.fn.cookieGeneration = function (option) {
        var S = $.extend({ 'action': 'add', 'node': '', 'dataChange': '', 'key': '' }, option);

        this.dataChange = S.dataChange;

        this.action = S.action;
        this.key = S.key;

        this.init();
    };

    $.fn.cookieGeneration.prototype = {
        init: function () {
            switch (this.action) {
                case 'add':
                    this.addCookie();
                    break;
                case 'del':
                    this.delCookie();
                    break;
            };
        },

        addCookie: function () { // 쿠키 추가
            var arr = this.dataChange.split(".");

            if (arr.length == 2) {
                if ($.isPlainObject(this.key)) {
                    cookieJson[arr[0]][arr[1]].push(this.key);
                } else {
                    cookieJson[arr[0]][arr[1]] = this.key;
                }
            } else if (arr.length == 3) {
                if ($.isPlainObject(this.key)) {
                    cookieJson[arr[0]][arr[1]][arr[2]].push(this.key);
                } else {
                    cookieJson[arr[0]][arr[1]][arr[2]] = this.key;
                }
            };
            //$.cookie('ticketingStateCookie', JSON.stringify(cookieJson), { path: CinemaServerDomain });
            $.cookie('ticketingStateCookie', JSON.stringify(cookieJson), { path: '/' });
        },

        delCookie: function () { // 쿠키 제거
            var arr = this.dataChange.split(".");
            if (arr.length == 2) {
                if (this.key = 'arr') {
                    cookieJson[arr[0]][arr[1]] = [];
                } else {
                    cookieJson[arr[0]][arr[1]] = '';
                }
            } else if (arr.length == 3) {
                if (this.key = 'arr') {
                    cookieJson[arr[0]][arr[1]][arr[2]] = [];
                } else {
                    cookieJson[arr[0]][arr[1]][arr[2]] = '';
                }
            };

            $.cookie('ticketingStateCookie', JSON.stringify(cookieJson), { path: '/' });
        },
    };

    $.fn.cookieChanges = function (action, state, key) { // 쿠키 추가,제거 호출
        var cookieChange = new $.fn.cookieGeneration({ 'action': action, 'dataChange': state, 'key': key });
    };


    $.fn.cookieReset = function () { // 쿠키 리셋
        $.cookie('ticketingStateCookie', '', { path: '/' });
        cookieJson = {
            ticketingState: {
                ticketing: {
                    playDate: "",
                    playWeek: "",
                    screentype: [],
                    areaCodes: [],
                    cinemaCodes: [],
                    movieCodes: [],
                    playSequenceCode: [],
                    sortMovieCode: "",
                    sortFilmCode: ""
                },
                seatSelect: {
                    SeatType: [],
                    SeatCodes: [],
                    seatArray: [],
                    seatPreview: [],
                    transNo: ""
                },
                schedule: {
                    tabIdx: "",
                    playDateId: "",
                    cinemaId: "",
                    movieId: "",
                    movieSort: "",
                    playSequenceId: ""
                },
                payment: "",
                // eventCode: "",
                goods: "",
                BookingStatus: '',
                facebookActLogConnectionID: '',
                facebookActLogMovieCode: '',
                facebookActLogFacebookID: '',
                facebookActLogPageUrl: '',
                LpointSaveType: '',
                CashSaveAmount: ''
            }
        }
    };
});
/****************************************
* 쿠키 추가,제거 호출
****************************************/
$.fn.cookieChanges = function (action, state, key) { // 쿠키 추가,제거 호출
    var cookieChange = new $.fn.cookieGeneration({ 'action': action, 'dataChange': state, 'key': key });
};


/****************************************
* 쿠키 등록
* eventID : 이벤트 아이디
****************************************/
addCookieEventID = function (eventID) {
    //$.fn.cookieChanges('add', 'ticketingState.eventCode', eventID);
    if (eventID != null && eventID != "") {
        $.cookie('eventID', eventID, { path: '/' });
    }
};

/****************************************
* 쿠키 등록
* movieCode : 영화코드
****************************************/
addCookieMovieCode = function (movieCode) {
    if (movieCode != "") {
        var arr = [];
        arr[0] = movieCode;

        $.fn.cookieChanges('add', 'ticketingState.ticketing.movieCodes', arr);
    }
};

/****************************************
* 쿠키 등록
* areaCodes : 영화관 지역코드
****************************************/
addCookieAreaCodes = function (areaCode) {
    if (areaCode != "") {
        var arr = [];
        arr[0] = areaCode;
        $.fn.cookieChanges('add', 'ticketingState.ticketing.areaCodes', arr);
    }
};

/****************************************
* 쿠키 등록
* cinemaCodes :영화관 코드
****************************************/
addCookieCinemaCodes = function (cinemaCode) {
    if (cinemaCode != "") {
        var arr = [];
        arr[0] = cinemaCode;
        $.fn.cookieChanges('add', 'ticketingState.ticketing.cinemaCodes', arr);
        // 20170203 - 시사화/무대인사일 경우에만 쿠키에 저장된 영화관 정보 사용
        $.fn.cookieChanges('add', 'ticketingState.ticketing.isFromPreviewStageGreeting', "Y");
    }
};

/****************************************
* 쿠키 등록
* screentype :일반관, 스페셜
****************************************/
addCookieScreentype = function (screentype) {
    if (screentype != "") {
        var arr = [];
        arr[0] = screentype;
        $.fn.cookieChanges('add', 'ticketingState.ticketing.screentype', arr);
    }
};