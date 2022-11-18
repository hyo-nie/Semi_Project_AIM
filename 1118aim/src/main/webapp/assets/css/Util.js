/*******************************************
 * UTIL
 * *****************************************/

DebugMode = true;

// 브라우저 환경 
function getBrowserAgent() {
    var _ua = navigator.userAgent;
    var result = "";

    //IE 11,10,9,8
    var trident = _ua.match(/Trident\/(\d.\d)/i);
    if (trident != null) {
        if (trident[1] == "7.0") return result = "IE" + 11;
        if (trident[1] == "6.0") return result = "IE" + 10;
        if (trident[1] == "5.0") return result = "IE" + 9;
        if (trident[1] == "4.0") return result = "IE" + 8;
    }

    //IE 7...
    if (navigator.appName == 'Microsoft Internet Explorer') return result = "IE" + 7;

    /*
    var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
    if(re.exec(_ua) != null) result = parseFloat(RegExp.$1);
    if( result == 7 ) return result = "IE" + 7; 
    */

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

    return result;
}

// 디바이스 타입 
function getDeviceType() {
    var userAgent = navigator.userAgent || navigator.vendor || window.opera;
    var osType = userAgent.match(/iPad/i) || userAgent.match(/iPhone/i) || userAgent.match(/iPod/i) ? "I" : userAgent.match(/Android/i) ? "A" : "W";
    return osType;
}

// http => https 치환
function ReplaceContext(type, str) {
    var tempValue;
    if (type == "http") {

        if (DebugMode) {
            if (str != undefined && str != null && str != "" && (str.indexOf('http://www.') > -1 || str.search('https://www.') > -1) && document.location.protocol == "https:") {
                tempValue = "https://caching." + str.substr(str.indexOf("lottecinema"), str.length);
            }
        }
        else {
            if (str != undefined && str != null && str != "" && (str.indexOf('http://') > -1 || str.search('https://') > -1) && document.location.protocol == "https:") {
                tempValue = "https" + str.substr(str.indexOf("://"), str.length);
            }
        }
        
    }
    return tempValue;
}

/**
 * 글자수(바이트 체크)
 */
function chkword(str, maxByte) {

    var strValue = str;

    if (strValue == "") return;

    var strLen = strValue.length;
    var returnStr;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";

    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) {
            totalByte += 2;
        } else {
            totalByte++;
        }

        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }

    // 넘어가는 글자는 자른다.
    if (totalByte > maxByte) {
        returnStr = strValue.substr(0, len) + "..";
    }
    else {
        returnStr = strValue;
    }

    return returnStr;
}



/**
 * 글자수(바이트 체크)
 */
function chkwordB(str, maxByte) {

    var strValue = str;

    if (strValue == "") return;

    var strLen = strValue.length;
    var returnStr;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";

    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) {
            totalByte += 3;
        } else {
            totalByte++;
        }

        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }

    // 넘어가는 글자는 자른다.
    if (totalByte > maxByte) {
        returnStr = strValue.substr(0, len) + "..";
    }
    else {
        returnStr = strValue;
    }

    return returnStr;
}


// As-Is Util
var Utils = function (set) {
    var elements = {
        jsonHistory: {
            scrollKey: 'scroll',
            historyType: 'hash'
        }
    }
    var set = $.extend({}, elements, set);
    this.elements = set;
}

Utils.prototype = {
    setJsonHistoryType: function (set) {
        this.elements.jsonHistory.historyType = set;

    },
    /**
    * 해시파라미터 리턴
    * @function
    * @example
    var param = new Util().getHashParam();
    console.log( param[ 'value' ] );
    */
    getHashParam: function () {
        var hash = location.hash.substring(1).split('&');
        var ret = {};
        for (var x = 0, len = hash.length; x < len; x++) {
            var temp = hash[x].split('=');
            ret[temp[0]] = temp[1];
        }
        return ret;
    },
    /**
    * 페이지 이동시 해시에 스크롤값 세팅
    * @function
    * @example
    new Utils().setScrolls($('section.content-cinemamall.list-wrap'));
    */
    setScrolls: function ($hashTarget) {
        var self = this;
        var jsonHistory = self.elements.jsonHistory;
        var scrollKey = jsonHistory.scrollKey;
        var historyType = jsonHistory.historyType;

        /*if (historyType == 'input') {
            var el = document.createElement('input');
            el.setAttribute('id', '__jsonHistory__');
            el.setAttribute('type', 'text');
            $(document.body).prepend(el);
        }*/


        $hashTarget.bind({
            'click': function (event) {
                var $win = $(window);
                var hash = '';
                var hashParam = self.getHashParam();
                hashParam[scrollKey] = $win.scrollLeft() + '|' + $win.scrollTop();
                for (val in hashParam) {
                    if (val) {
                        hash += val + '=' + hashParam[val] + '&';
                    }
                }
                hash = hash.substring(0, hash.length - 1);
                location.hash = hash;
                //el.setAttribute('value', hash);
            }
        });

        //dom구조에 변경이 있을경우 활성화
        $hashTarget.bind('DOMSubtreeModified', function () {
            self.moveScrolls();
        });

    },
    /**
    * 해시에 설정된 스크롤 값 획득
    * @function
    * @exampl
    new Utils().getScrollPosition();
    */
    getScrollPosition: function () {
        var self = this;
        var hashParam = self.getHashParam();
        var jsonHistory = self.elements.jsonHistory;
        var scrollKey = jsonHistory.scrollKey;

        var scroll = hashParam[scrollKey];
        scroll = (scroll ? scroll.split('|') : [0, 0]);

        return {
            left: scroll[0],
            top: scroll[1]
        };
    },
    /**
    * 리스트 end 시점에서 스크롤 이동시키기
    * @function
    * @example
    */
    moveScrolls: function (time) {
        var self = this;
        var scrolls = utils.getScrollPosition();
        setTimeout(function () {
            window.scrollTo(scrolls.left, scrolls.top);
        }, time);
    }
};

//-----------------------------------------------------------------------------
// 문자형으로 반환한다.
// @return : String
//-----------------------------------------------------------------------------
ToString = function (obj) {
    if (obj == null || obj == undefined)
        return "";
    else
        return obj.toString();
}

//-----------------------------------------------------------------------------
// 문자의 좌, 우 공백 제거
// @return : String
//-----------------------------------------------------------------------------
Trim = function (str) {
    if (ToString(str) == "")
        return str;

    return str.replace(/(^\s*)|(\s*$)/g, "");
}

//-----------------------------------------------------------------------------
// 문자의 좌 공백 제거
// @return : String
//-----------------------------------------------------------------------------
LTrim = function (str) {
    if (ToString(str) == "")
        return str;

    return str.replace(/(^\s*)/, "");
}

//-----------------------------------------------------------------------------
// 문자의 우 공백 제거
// @return : String
//-----------------------------------------------------------------------------
RTrim = function (str) {
    if (ToString(str) == "")
        return str;

    return str.replace(/(\s*$)/, "");
}

//-----------------------------------------------------------------------------
// 지정된길이만큼 문자열 잘라내고, 잘렸을 경우 추가 문자를 붙임(한글처리됨)
// @return : String
//-----------------------------------------------------------------------------
CutString = function (str, len, tail) {
    if (ToString(str) == "")
        return str;

    var l = 0;
    for (var i = 0; i < str.length; i++) {
        l += (str.charCodeAt(i) > 128) ? 2 : 1;
        if (l > len)
            return str.substring(0, i) + tail;
    }

    return str;
}

//-----------------------------------------------------------------------------
// 문자열의 byte 길이 반환
// @return : int
//-----------------------------------------------------------------------------
ByteLength = function (str) {
    if (ToString(str) == "")
        return 0;

    var cnt = 0;
    for (var i = 0; i < str.length; i++) {
        if (str.charCodeAt(i) > 127)
            cnt += 2;
        else
            cnt++;
    }

    return cnt;
}

//-----------------------------------------------------------------------------
// 숫자에 3자리마다 , 를 찍어서 반환
// @return : String
//-----------------------------------------------------------------------------
ToMoney = function (str) {
    str = ToString(str);
    if (str == "")
        return str;

    var num = Trim(str);
    while ((/(-?[0-9]+)([0-9]{3})/).test(num)) {
        num = num.replace((/(-?[0-9]+)([0-9]{3})/), "$1,$2");
    }

    return num;
}

//요금안내표 시니아 장애인 0원->하이픈
ToMoneyZero = function (str) {
    str = ToString(str);

    if (str == "")
        return str;

    var num = Trim(str);
    if (num == '0') {
        num = '-';
    } else {
        while ((/(-?[0-9]+)([0-9]{3})/).test(num)) {
            num = num.replace((/(-?[0-9]+)([0-9]{3})/), "$1,$2");
        }
    }

    return num;
}

//-----------------------------------------------------------------------------
// 숫자의 자리수(cnt)에 맞도록 반환
// @return : String
//-----------------------------------------------------------------------------
Digit = function (str, cnt, digit) {
    var returnValue = "";
    if (str.length < cnt) {
        for (var i = 0; i < cnt - str.length; i++) {
            returnValue += digit;
        }
    }

    return returnValue + str;
}

//-----------------------------------------------------------------------------
// 지정한 소숫점에서 반올림
// @return : int
//-----------------------------------------------------------------------------
RoundPoint = function (str, cipher) {
    var num = Trim(str);
    var cipstr = "";

    for (var i = 0; i < cipher; i++) {
        cipstr += "0";
    }
    cipstr = parseInt("1" + cipstr);

    num = (Math.round(num * cipstr)) / cipstr;

    return num;
}

//-----------------------------------------------------------------------------
// 특수문자 포함여부
// @return : boolean
//-----------------------------------------------------------------------------
IsSpecialCharacter = function (str) {
    var m_Sp = /[$\!\\@\\\#%\^\&\*\(\)\[\]\+\_\{\}\`\~\=\|\;\:\"\'\,\.\<\>\/\?/ ]/;
    var strLen = str.length;
    var m_char, Isresult
    for (var i = 0; i < strLen; i++) {
        m_char = str.charAt(i);
        if (m_char.search(m_Sp) != -1) {
            Isresult = true;
            break;
        }
        else {
            Isresult = false;
        }
    }

    return Isresult;
}

//-----------------------------------------------------------------------------
// 정규식에 쓰이는 특수문자를 찾아서 이스케이프 한다.
// @return : String
//-----------------------------------------------------------------------------
ExceptSpecialCharacter = function (str) {
    var result = ""

    for (var i = 0; i < str.length; i++) {
        if ((/([\$\(\)\*\+\.\[\]\?\\\^\{\}\|]{1})/).test(str.charAt(i))) {
            result += str.charAt(i).replace((/([\$\(\)\*\+\.\[\]\?\\\^\{\}\|]{1})/), "\\$1");
        }
        else {
            result += str.charAt(i);
        }
    }
    return result;
}

//-----------------------------------------------------------------------------
// 특수문자 제한함
// @return : 없음
//-----------------------------------------------------------------------------
ForbidSpecialChar = function (obj) {
    var $o = $(obj);
    var re = /[@\#$%^&*<>\()\-=+_'"]/gi;
    var temp = $o.val();
    if (re.test(temp)) { //특수문자가 포함되면 삭제하여 값으로 다시셋팅
        $o.val(temp.replace(re, ""));
    }
}
//-----------------------------------------------------------------------------
// 정규식에 쓰이는 특수문자를 찾아서 이스케이프 한다.
// @return : String
//-----------------------------------------------------------------------------
RemoveSpecialCharacter = function (str, pattern) {
    return (pattern == null) ? str : eval("str.replace(/[" + ExceptSpecialCharacter(pattern) + "]/g, \"\")");
}

//-----------------------------------------------------------------------------
// 최소 최대 길이인지 검증
// str.isLength(min [,max])
// @return : boolean
//-----------------------------------------------------------------------------
CheckMinMaxLength = function (str) {
    var min = arguments[1];
    var max = arguments[2] ? arguments[2] : null;
    var success = true;

    if (str.length < min) {
        success = false;
    }
    if (max && str.length > max) {
        success = false;
    }
    return success;
}

//-----------------------------------------------------------------------------
// 최소 최대 바이트인지 검증
// str.isByteLength(min [,max])
// @return : boolean
//-----------------------------------------------------------------------------
CheckMinMaxByteLength = function (str) {
    var min = arguments[1];
    var max = arguments[2] ? arguments[2] : null;
    var success = true;

    if (ByteLength(str) < min) {
        success = false;
    }
    if (max && ByteLength(str) > max) {
        success = false;
    }
    return success;
}

//-----------------------------------------------------------------------------
// 숫자로 구성되어 있는지 학인
// arguments[1] : 허용할 문자셋
// @return : boolean
//-----------------------------------------------------------------------------
CheckNumber = function (str) {
    return (/^[0-9]+$/).test(RemoveSpecialCharacter(str, arguments[1])) ? true : false;
}

//-----------------------------------------------------------------------------
// 영어만 허용 - arguments[1] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
CheckEnglish = function (str) {
    return (/^[a-zA-Z]+$/).test(RemoveSpecialCharacter(str, arguments[1])) ? true : false;
}

//-----------------------------------------------------------------------------
// 숫자와 영어만 허용 - arguments[1] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
CheckEnglishNumber = function (str) {
    return (/^[0-9a-zA-Z]+$/).test(RemoveSpecialCharacter(str, arguments[1])) ? true : false;
}

//-----------------------------------------------------------------------------
// 휴대폰 유효성 검사
// @return : boolean
//-----------------------------------------------------------------------------
CheckPhoneNumber = function (str) {
    return (/(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/).test(RemoveSpecialCharacter(str, arguments[1])) ? true : false;
}

//-----------------------------------------------------------------------------
// 아이디 체크 영어와 숫자만 체크 첫글자는 영어로 시작 - arguments[1] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
CheckUserID = function (str) {
    return (/^[a-zA-z]{1}[0-9a-zA-Z]+$/).test(RemoveSpecialCharacter(str, arguments[1])) ? true : false;
}

//-----------------------------------------------------------------------------
// 한글 체크 - arguments[1] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
CheckKorea = function (str) {
    return (/^[가-힣]+$/).test(RemoveSpecialCharacter(str, arguments[1])) ? true : false;
}

//-----------------------------------------------------------------------------
// 닉네임 체크:숫자,영어,한글만 허용 - arguments[1] : 추가 허용할 문자들
// @return : boolean
//-----------------------------------------------------------------------------
CheckNackName = function (str) {
    return (/^[0-9a-zA-Z가-힣]+$/).test(RemoveSpecialCharacter(str, arguments[1])) ? true : false;
}

//-----------------------------------------------------------------------------
// 주민번호 체크 - arguments[1] : 주민번호 구분자
// XXXXXX-XXXXXXX
// @return : boolean
//-----------------------------------------------------------------------------
CheckJumin = function (str) {
    var arg = arguments[0] ? arguments[0] : "";
    var jumin = eval("str.match(/[0-9]{2}[01]{1}[0-9]{1}[0123]{1}[0-9]{1}" + arg + "[1234]{1}[0-9]{6}$/)");

    if (jumin == null) {
        return false;
    }
    else {
        jumin = jumin.toString().num().toString();
    }
    // 생년월일 체크
    var birthYY = (parseInt(jumin.charAt(6)) == (1 || 2)) ? "19" : "20";
    birthYY += jumin.substr(0, 2);

    var birthMM = jumin.substr(2, 2) - 1;
    var birthDD = jumin.substr(4, 2);
    var birthDay = moment(birthYY + "-" + birthMM + "-" + birthDD).toDate();

    if (birthDay.getYear() % 100 != jumin.substr(0, 2) || birthDay.getMonth() != birthMM || birthDay.getDate() != birthDD) {
        return false;
    }

    var sum = 0;
    var num = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5]
    var last = parseInt(jumin.charAt(12));

    for (var i = 0; i < 12; i++) {
        sum += parseInt(jumin.charAt(i)) * num[i];
    }
    return ((11 - sum % 11) % 10 == last) ? true : false;
}

//-----------------------------------------------------------------------------
// 외국인 등록번호 체크 - arguments[1] : 등록번호 구분자
// XXXXXX-XXXXXXX
// @return : boolean
//-----------------------------------------------------------------------------
CheckForeign = function (str) {
    var arg = arguments[1] ? arguments[1] : "";
    var jumin = eval("str.match(/[0-9]{2}[01]{1}[0-9]{1}[0123]{1}[0-9]{1}" + arg + "[5678]{1}[0-9]{1}[02468]{1}[0-9]{2}[6789]{1}[0-9]{1}$/)");

    if (jumin == null) {
        return false;
    }
    else {
        jumin = jumin.toString().num().toString();
    }

    // 생년월일 체크
    var birthYY = (parseInt(jumin.charAt(6)) == (5 || 6)) ? "19" : "20";
    birthYY += jumin.substr(0, 2);
    var birthMM = jumin.substr(2, 2) - 1;
    var birthDD = jumin.substr(4, 2);
    var birthDay = moment(birthYY + "-" + birthMM + "-" + birthDD).toDate();

    if (birthDay.getYear() % 100 != jumin.substr(0, 2) || birthDay.getMonth() != birthMM || birthDay.getDate() != birthDD) {
        return false;
    }
    if ((parseInt(jumin.charAt(7)) * 10 + parseInt(jumin.charAt(8))) % 2 != 0) {
        return false;
    }

    var sum = 0;
    var num = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5]
    var last = parseInt(jumin.charAt(12));

    for (var i = 0; i < 12; i++) {
        sum += parseInt(jumin.charAt(i)) * num[i];
    }
    return (((11 - sum % 11) % 10) + 2 == last) ? true : false;
}

//-----------------------------------------------------------------------------
// 사업자번호 체크 - arguments[1] : 등록번호 구분자
// XXX-XX-XXXXX
// @return : boolean
//-----------------------------------------------------------------------------
CheckBizNumber = function (str) {
    var arg = arguments[1] ? arguments[1] : "";
    var biznum = eval("str.match(/[0-9]{3}" + arg + "[0-9]{2}" + arg + "[0-9]{5}$/)");

    if (biznum == null) {
        return false;
    }
    else {
        biznum = biznum.toString().num().toString();
    }

    var sum = parseInt(biznum.charAt(0));
    var num = [0, 3, 7, 1, 3, 7, 1, 3];

    for (var i = 1; i < 8; i++) sum += (parseInt(biznum.charAt(i)) * num[i]) % 10;
    sum += Math.floor(parseInt(parseInt(biznum.charAt(8))) * 5 / 10);
    sum += (parseInt(biznum.charAt(8)) * 5) % 10 + parseInt(biznum.charAt(9));

    return (sum % 10 == 0) ? true : false;
}

//-----------------------------------------------------------------------------
// 법인 등록번호 체크 - arguments[1] : 등록번호 구분자
// XXXXXX-XXXXXXX
// @return : boolean
//-----------------------------------------------------------------------------
CheckCorpNumber = function (str) {
    var arg = arguments[1] ? arguments[1] : "";
    var corpnum = eval("str.match(/[0-9]{6}" + arg + "[0-9]{7}$/)");

    if (corpnum == null) {
        return false;
    }
    else {
        corpnum = corpnum.toString().num().toString();
    }

    var sum = 0;
    var num = [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2]
    var last = parseInt(corpnum.charAt(12));

    for (var i = 0; i < 12; i++) {
        sum += parseInt(corpnum.charAt(i)) * num[i];
    }
    return ((10 - sum % 10) % 10 == last) ? true : false;
}

//-----------------------------------------------------------------------------
// 이메일의 유효성을 체크
// @return : boolean
//-----------------------------------------------------------------------------
CheckEmail = function (str) {
    return (/\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/).test(str.trim());
}

//-----------------------------------------------------------------------------
// 전화번호 체크 - arguments[1] : 전화번호 구분자
// @return : boolean
//-----------------------------------------------------------------------------
CheckPhone = function (str) {
    var arg = arguments[1] ? arguments[1] : "";
    return eval("(/(02|0[3-9]{1}[0-9]{1})" + arg + "[1-9]{1}[0-9]{2,3}" + arg + "[0-9]{4}$/).test(str)");
}

//-----------------------------------------------------------------------------
// 핸드폰번호 체크 - arguments[1] : 핸드폰 구분자
// @return : boolean
//-----------------------------------------------------------------------------
CheckMobile = function (str) {
    var arg = arguments[1] ? arguments[1] : "";
    return eval("(/01[016789]" + arg + "[1-9]{1}[0-9]{2,3}" + arg + "[0-9]{4}$/).test(str)");
}

//-----------------------------------------------------------------------------
// 날짜 체크 - arguments[1] : 핸드폰 구분자
// @return : boolean
//-----------------------------------------------------------------------------
CheckDate = function (str) {
    var result = false;
    var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/g;
    str = ToString(str);

    if (pattern.test(str)) {
        result = true;
    } else {
        result = false;
    }
    return result;
}
//YYYY-MM-DD
CheckDate2 = function (str) {
    var result = false;
    var pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
    str = ToString(str);

    if (pattern.test(str)) {
        result = true;
    } else {
        result = false;
    }
    return result;
}
//YYYYMMDD HH24:mm
CheckDate3 = function (str) {
    var result = false;
    var pattern = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])\s([1-9]|[01][0-9]|2[0-3]):([0-5][0-9])$/;
    str = ToString(str);

    if (pattern.test(str)) {
        result = true;
    } else {
        result = false;
    }
    return result;
}
//HH24:mm
CheckDate4 = function (str) {
    var result = false;
    var pattern = /^([1-9]|[01][0-9]|2[0-3]):([0-5][0-9])$/;
    str = ToString(str);

    if (pattern.test(str)) {
        result = true;
    } else {
        result = false;
    }
    return result;
}
//-----------------------------------------------------------------------------
// 모든 문자 변환 - old : 이전문자, str : 변환문자
// @return : string
//-----------------------------------------------------------------------------
ReplaceAllCharacter = function (str, old, newStr) {
    return (str.split(old)).join(newStr);
}

//-----------------------------------------------------------------------------
// HTML 태그 제거
// @return : string
//-----------------------------------------------------------------------------
RemoveHTMLTags = function (str) {
    var pos1 = str.indexOf('<');

    if (pos1 == -1) {
        return str.replace(/&nbsp;/g, "").trim();
    }
    else {
        var pos2 = str.indexOf('>', pos1);
        if (pos2 == -1) return str;
        return (RemoveHTMLTags(str.substr(0, pos1) + str.substr(pos2 + 1))).replace(/&nbsp;/g, "").trim();
    }
}

//-----------------------------------------------------------------------------
// 파일 확장자만 가져오기
// @return : String
//-----------------------------------------------------------------------------
GetFileExtention = function (str) {
    return (str.indexOf(".") < 0) ? "" : str.substring(str.lastIndexOf(".") + 1, str.length);
}

//-----------------------------------------------------------------------------
// URL에서 파라메터 제거한 순수한 url 얻기
// @return : String
//-----------------------------------------------------------------------------    
GetURL = function (str) {
    var arr = str.split("?");
    arr = arr[0].split("#");
    return arr[0];
}

//-----------------------------------------------------------------------------
// URL에서 url 제거한 순수한 파라메터 얻기
// @return : String
//-----------------------------------------------------------------------------    
GetURLQueryString = function (str) {
    var arr = str.split("?");
    arr.splice(0, 1);
    return arr.join("?");
}


BrowserAgent = function () {
    var _ua = navigator.userAgent;
    var result = "";

    //IE 11,10,9,8
    var trident = _ua.match(/Trident\/(\d.\d)/i);
    if (trident != null) {
        if (trident[1] == "7.0") return result = "IE" + 11;
        if (trident[1] == "6.0") return result = "IE" + 10;
        if (trident[1] == "5.0") return result = "IE" + 9;
        if (trident[1] == "4.0") return result = "IE" + 8;
    }

    //IE 7...
    if (navigator.appName == 'Microsoft Internet Explorer') return result = "IE" + 7;

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

    return result;
}

//===================================
/**
 * @Content 이전 페이지로 이동
 *		영화관 존재 하지 않을 경우 모달 팝업에서 호출
 * @param
 * @return
 **/
locationBack = function () {
    history.back(-1);
    return;
}

//-----------------------------------------------------------------------------
// 이미지 파일 여부 확인
// @return : boolen, ture - 이미지 파일,  false - 이미지 파일아님
//-----------------------------------------------------------------------------    
checkImage = function (imagePath) {
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

//===================================
/**
 * @Content 정수값을 한글 금액(원단위)으로 변환
 * @param
 *		pWon : 정수(숫자)
 * @return
 *		changeWon : 한글 금액(원단위)
 **/
function setWon(pWon) {
    var won = (pWon + "").replace(/,/g, "");
    var arrWon = ["", "만", "억", "조", "경", "해", "자", "양", "구", "간", "정"];
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

/**
 * 현재 시간 YYYY-MM-DD hh:mm:ss 포맷
 * */
function getTimeStamp(sp1, sp2, sp3, strDate) {

    var d = moment().toDate();

    if (strDate != undefined) {
        d = moment(strDate).toDate();
    }

    if (sp1 == undefined) {
        sp1 = "";
    }
    if (sp2 == undefined) {
        sp2 = "";
    }
    if (sp3 == undefined) {
        sp3 = "";
    }

    var s =
        leadingZeros(d.getFullYear(), 4) + sp1 +
        leadingZeros(d.getMonth() + 1, 2) + sp1 +
        leadingZeros(d.getDate(), 2) + sp2 +
        leadingZeros(d.getHours(), 2) + sp3 +
        leadingZeros(d.getMinutes(), 2) + sp3 +
        leadingZeros(d.getSeconds(), 2);

    return s;
}

/**
 * 현재 시간 YYYY-MM-DD 포맷
 * */
function getDateStamp(sp1, strDate) {

    var d = moment().toDate();

    if (strDate != undefined) {
        d = moment(strDate).toDate();
    }

    if (sp1 == undefined) {
        sp1 = "";
    }

    var s =
        leadingZeros(d.getFullYear(), 4) + sp1 +
        leadingZeros(d.getMonth() + 1, 2) + sp1 +
        leadingZeros(d.getDate(), 2);

    return s;
}

/**
 * 오후 시간 YYYY-MM-DD hh24:mm:ss 포맷
 * */
function convert24H(strDate) {

    var time = strDate; // 'yyyy-MM-dd 오후 hh:mm:ss' 형태로 값이 들어온다 
    var stryyyyMMdd = strDate.substr(0, 10); // yyyy-MM-dd 부분만 저장 
    var strTimeType = strDate.substr(11, 2); // 오전(오후)부분만 저장 
    var getTime = strDate.substr(14, 2); // 시간(hh)부분만 저장 
    var strDates = strDate.split(strTimeType);
    var strTimes = strDates[1].split(':');
    var intTime = parseInt(strTimes[0]); // int형으로 변환 

    var mmss = ':' + strTimes[1] + ':' + strTimes[2]; // :mm:hh 부분만 저장 

    if (strTimeType == '오후') {

        intTime += 12;
        getTime = intTime.toString();
    }
    else {
        if (intTime < 10) {
            getTime = "0" + intTime.toString();
        }
    }

    var res = stryyyyMMdd + " " + getTime + mmss;
    return res;
}

function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}

//-----------------------------------------------------------------------------
// 숫자에 3자리마다 , 를 찍어서 반환
// @return : String
//-----------------------------------------------------------------------------
ToMoney = function (str) {
    str = ToString(str);
    if (str == "")
        return str;

    var num = Trim(str);
    while ((/(-?[0-9]+)([0-9]{3})/).test(num)) {
        num = num.replace((/(-?[0-9]+)([0-9]{3})/), "$1,$2");
    }

    return num;
}

//-----------------------------------------------------------------------------
// 날짜에 맞는 요일 가져오기.
// @return : String
//-----------------------------------------------------------------------------
getInputDayLabel = function (strDate) {

    //strDate = '2014-12-25';

    var week = new Array('일', '월', '화', '수', '목', '금', '토');

    var today = moment(strDate).toDate().getDay();
    var todayLabel = week[today];

    return todayLabel;
}

//-----------------------------------------------------------------------------
// script 에서 파라메터 가져오기.
// @return : {}
//-----------------------------------------------------------------------------
RequestParams = function (qs) {
    qs = qs.split("+").join(" ");

    var params = {}, tokens,
        re = /[?&]?([^=]+)=([^&]*)/g;

    while (tokens = re.exec(qs)) {
        params[decodeURIComponent(tokens[1])]
            = decodeURIComponent(tokens[2]);
    }

    params[decodeURIComponent("pathname")] = decodeURIComponent(document.location.pathname);

    return params;
}

//-----------------------------------------------------------------------------
// 오픈 레이어 위치 가운데 설정
//-----------------------------------------------------------------------------
openLayerLocation = function (obj){
    //위치
    var objWdh = $(obj).outerWidth();
    var objHgt = $(obj).outerHeight();
    $(obj).css({ "left": "50%", "top": "50%", "margin-top": -objHgt / 2, "margin-left": -objWdh / 2 });
}

//문자열빌더
//배열을 사용해사 문자열을 조합하는데 사용한다.
var StringBuilder = function () {
    this.buffer = new Array();
}

StringBuilder.prototype = {
    //문자열을 추가한다.
    Append: function (strValue) {
        this.buffer[this.buffer.length] = strValue;
    },

    // 문자열의 형식을 지정해서 추가한다. 
    AppendFormat: function () {
        var count = arguments.length;
        if (count < 2) return "";
        var strValue = arguments[0];
        for (var i = 1; i < count; i++) {
            var exp = new RegExp("\\{" + (i - 1) + "\\}", "g");
            strValue = strValue.replace(exp, arguments[i]);
        }
        this.buffer[this.buffer.length] = strValue;
    },

    // 해당하는 위치에 문자열을 삽입한다. 
    // idx: index
    // strValue: 삽입할 문자열
    Insert: function (idx, strValue) {
        this.buffer.splice(idx, 0, strValue);
    },

    // 해당 위치에 저장된 문자열을 변경한다.
    // idx: index
    // strValue: 변경한 문자열
    Change: function (idx, strValue) {
        this.buffer.splice(idx, 1, strValue);
    },

    // 해당문자열을 새로운 문자열로 바꾼다. 
    // (배열방 단위로 바꾸므로 배열방 사이에 낀 문자열은 바꾸지 않음)
    Replace: function (from, to) {
        for (var i = this.buffer.length - 1; i >= 0; i--)
            this.buffer[i] = this.buffer[i].replace(new RegExp(from, "g"), to);
    },

    // 문자열로 반환한다.
    ToString: function () {
        return this.buffer.join("");
    },

    // 해당하는 위치의 문자열을 삭제한다.
    //idx: index
    Remove: function (idx) {
        if (this.buffer.length > idx)
            this.buffer.splice(idx, 1);
    },

    // 모든 문자열을 삭제한다.
    RemoveAll: function () {
        this.buffer.splice(0, this.buffer.length);
    },

    //문자열 저장 버퍼의 길이를 반환한다.
    //params>
    //return>
    GetLength: function () {
        return this.buffer.length;
    }
}
//===================================
//만 나이 계산
//===================================
function calcAge(birth) {

    if (birth == undefined) return;

    if (birth.length != 8) {
        alert("올바른 생년월일을 입력하세요.");
        return;
    }

    var date = moment().toDate();
    var year = date.getFullYear();
    var month = (date.getMonth() + 1);
    var day = date.getDate();
    if (month < 10) month = '0' + month;
    if (day < 10) day = '0' + day;
    var monthDay = month + day;

    birth = birth.replace('-', '').replace('-', '');
    var birthdayy = birth.substr(0, 4);
    var birthdaymd = birth.substr(4, 4);

    var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
    return age;
}

/**
 * 마스킹 처리 > 홍길동 => 홍*동
 * @param {any} strCar
 */
function userNameMasking(strCar) {
    if (strCar == undefined || strCar === '') {
        return '';
    }
    //var pattern = /(?<=.{1})./; // 정규식
    var pattern = /.{1}$/

    return strCar.replace(pattern, "*");
}

/**
 * 마스킹 처리 > 한빛나라 => 한**라
 * @param {any} str
 * @param {any} Slen
 * @param {any} Elen
 */
function strMasking(str, Slen, Elen) {

    if (str == undefined || str == "" || str.length <= 2) return str;

    Slen = parseInt(Slen - 1); // 
    Elen = str.length - parseInt(Elen);
    var tmpStr = "";

    try {

        for (var i = 0; i < str.length; i++) {
            if (parseInt(Slen) < i && parseInt(Elen) > i) {
                tmpStr = tmpStr + "*";
            }
            else {
                tmpStr = tmpStr + str.charAt(i).toString();
            }
        }
    } catch (e) {
    }

    return tmpStr;
}

/**
 * 마스킹 이메일 처리 ABCDE@gamil.com => AB***@gamil.com
 * @param {any} email
 */
function emailMasking(email) {

    if (email == undefined || email == "") return email;

    var len = email.split('@')[0].length - 3; // AB***@gamil.com
    return email.replace(new RegExp('.(?=.{0,' + len + '}@)', 'g'), '*');

}

/**
 * 마스킹 폰번호 처리 01012345678 => 010****5678
 * @param {any} phoneNo
 */
function phoneMasking(phoneNo) {

    if (phoneNo == undefined || phoneNo == "") return phoneNo;

    var Slen = 2; // 
    var Elen = phoneNo.length - 4;
    var tmpPhoneNo = "";

    for (var i = 0; i < phoneNo.length; i++) {
        if (Slen < i && Elen > i) {
            tmpPhoneNo = tmpPhoneNo + "*";
        }
        else {
            tmpPhoneNo = tmpPhoneNo + phoneNo.charAt(i);
        }
    }
    return tmpPhoneNo;

}

//10보다 작으면 앞에 0을 붙임
function addzero(n) {
    return n < 10 ? "0" + n : n;
}

/**
 * 문자열을 HTML 형식으로 Convert
 * @param {any} str
 */
function ConvertToHtml(str) {
    if (str == undefined || str == "") return str;

    return $('<textarea />').html(str).text();
}

/**
 * 복사하기
 * @param {any} val
 */
function CopyString(val) {
    try {
        let t = document.createElement("textarea");
        document.body.appendChild(t);
        t.value = val;
        t.select();
        document.execCommand('copy');
        t.blur();
        document.body.removeChild(t);
        setTimeout(function() {
            alert("복사되었습니다.")
        }, 200);
    } catch (e) {
        alert("복사실패하였습니다.")
    }
}