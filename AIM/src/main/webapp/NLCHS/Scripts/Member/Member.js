'use strict';

var loginPage = {
    lcApiUserInfo: {},
    ssoUserInfo: {},
    pType: 0, //0:일반, 11:LC회원정보 수정 후 쿠키만 없데이트, 12:L.Point회원정보 수정 후 쿠키만 없데이트
    sType: 1, //1:Web, 2:Mobile
    //초기화
    Init: function (flag) {
        if (memberInfo === "" || memberInfo === null) {
            $("#liLogout").hide();
            $("#liEdit").hide();
            $("#liChPassword").hide();
            $("#liOutMem").hide();
        } else {
            $("#liLogout").show();
            $("#liEdit").show();
            $("#liChPassword").show();
            $("#liOutMem").show();
        }
        var id = $.cookie("lottecinemaSaveId_lchs");
        if (id != "" && id != undefined && id != "undefined") {
            $("#userId").val(id);
            $("#checkSavedID").prop("checked", true);
        }
        if (flag !== undefined && flag !== "") {
            $("#userId").focus();
        }
    },
    viewAlert: function (errMessage, inputText) {
        if (loginPage.sType == 1) {
            alert(errMessage);
            if (inputText !== undefined && inputText !== "") {
                $(inputText).focus();
            }
        }
        else if (loginPage.sType == 2) {
            $("#errMessage").text(errMessage);
            if (inputText !== undefined && inputText !== "") {
                $(inputText).focus();
            }
        }
    },
    login: function () {

        //LPoint 세션값 초기화
        window.sessionStorage.removeItem("LPOINTDATA");

        //회원 로그인
        var id = $("#userId").val();
        var pw = $("#userPassword").val();

        if ($("#userId").val() === "") {
            loginPage.viewAlert("아이디를 입력해 주세요.", "#userId");
            return false;
        }
        else if ($("#userPassword").val() === "") {
            loginPage.viewAlert("비밀번호를 입력해 주세요.", "#userPassword");
            return false;
        }

        // 로그인 구분 - 1:회원, 2:간편계정, 3:비회원, 4:소셜로그인
        $("#hidLoginType").val('1');

        //아이디저장 체크
        if ($("#checkSavedID").prop("checked")) {
            $.cookie("lottecinemaSaveId_lchs", $("#userId").val(), { path: '/', expires: 7 })
        } else {
            $.removeCookie('lottecinemaSaveId_lchs', { path: '/' });
        }

        $.showMask();

        var akDta = { onlId: id, cstPswd: pw };

        var CkID = id.substr(0, 3).toLowerCase();
        //var CkID = id.substr(0, 3);
        if (typeof (ISDEBUG) != "undefined" && ISDEBUG != null && ISDEBUG != undefined && ISDEBUG != "" && ISDEBUG == "1") {
            if (CkID == "dev") {

                //alert("dev 계정은 임시로 L.Point 인증없이 로그인 됩니다.");
                var vDta = {
                    "channelType": CHANNEL_TYPE,
                    "osType": BrowserAgent(),
                    "osVersion": navigator.userAgent,
                    "data": {
                        "loginId": id,
                        "deviceToken": ""
                    }
                };

                //LC 회원정보조회
                common.JsonCallSync('/LCAPI/Account/getUserInfo', vDta, loginPage.lcapiGetUserInfoNonProc);
            } else {
                ssoObj.callLogin(akDta, window.location.href, loginPage.lpointSsoLoginProc);
            }
        } else {
            //SSO 로그인 요청 > 처리 : loginPage.lpointSsoLoginProc
            ssoObj.callLogin(akDta, window.location.href, loginPage.lpointSsoLoginProc);
        }
    },
    //회원정보 쿠키 업데이트
    memberCookieUpdete: function (pType) {
        try {
            //0:일반,11:LC회원정보 수정 후 쿠키만 없데이트,12:L.Point회원정보 수정 후 쿠키만 없데이트
            if (pType != undefined) { loginPage.pType = pType; }

            var vData = {
                "loginId": memberInfo.UserID,
                "deviceToken": ""
            };

            var vDta = {
                "channelType": CHANNEL_TYPE,
                "osType": BrowserAgent(),
                "osVersion": navigator.userAgent,
                "data": vData
            };

            //LC 회원정보조회
            common.JsonCallSync('/LCAPI/Account/getUserInfo', vDta, loginPage.memberCookieUpdeteProc);
        } catch (e) {
        }
    },
    //회원정보 쿠키 
    memberCookieUpdeteProc: function (rspDta) {
        try {

            var responseJSON = rspDta.responseJSON;

            loginPage.lcApiUserInfo = responseJSON.userInfo;

            loginPage.lcapiLoginProc();

        } catch (e) {
        }
    },
    lpointSsoLoginProc: function (rspDta) {
        //console.log("rspDta.rspC", rspDta.rspC);
        //console.log("rspDta.rspC", rspDta.rspDtc);
        //console.log("rspDta.ssoTkn", rspDta.ssoTkn);
        //console.log("rspDta.onlCstTpC", rspDta.onlCstTpC);       

        if ('00' === rspDta.rspC) {
            if (rspDta.rspDtc == "000" || rspDta.rspDtc == "401") {
                try {

                    if (rspDta.rspDtc == "401") {
                        loginPage.viewAlert("비밀번호 변경 캠페인 대상 입니다.\n비밀번호를 변경하여 주십시오.", "");
                        ssoObj.callPage_new(23, "", "", rspDta.acesTkn);
                    }

                    var vData = {
                        "loginId": $("#userId").val().trim(),
                        "deviceToken": "",
                        "MobileOSType": getDeviceType(),
                        "acesTkn": rspDta.acesTkn
                    };

                    var vDta = {
                        "channelType": CHANNEL_TYPE,
                        "osType": BrowserAgent(),
                        "osVersion": navigator.userAgent,
                        "multiLanguageID": "KR",
                        "data": vData
                    };

                    common.JsonCallSync('/LCAPI/Account/getSSO', vDta, loginPage.lcapiGetUserInfoProc);

                } catch (e) {
                    loginPage.viewAlert("로그인 처리 실패 하였습니다.", "#userId");
                    $.hideMask();
                }
            //} else if (rspDta.rspDtc == "401") {
            //    loginPage.viewAlert("비밀번호 변경 캠페인 대상 입니다.\n비밀번호를 변경하여 주십시오.", "#userId");
            //    $.hideMask();
            //    window.location.reload();
            //    ssoObj.callPage(23, "", "", rspDta.acesTkn);

            } else {
                loginPage.viewAlert("아이디, 비밀번호가 일치하지 않습니다.", "#userId");
                $.hideMask();
            }
        } else if ('44' === rspDta.rspC) {

            var akDta = "";

            if ('419' === rspDta.rspDtc) {
                //제휴사 약관 미동의
                //제휴사 약관동의 요청:로그인 후 가능

                //loginPage.viewAlert(rspDta.rspMsgCn, "#userId");

                var vData2 = {
                    ssoTkn: rspDta.ssoTkn,
                    onlCstTpC: rspDta.onlCstTpC,
                    frnYn: rspDta.frnYn
                };

                ssoObj.callViewMbrJoin2(vData2);

                //loginPage.viewAlert("");
            }
            else if ('420' === rspDta.rspDtc) {
                //loginPage.viewAlert(rspDta.rspMsgCn, "#userId");

                var vData2 = {
                    ssoTkn: rspDta.ssoTkn,
                    onlCstTpC: rspDta.onlCstTpC,
                    frnYn: rspDta.frnYn
                };

                ssoObj.callViewMbrJoin3(vData2);
            }
            else if ('405' === rspDta.rspDtc) {
                //비밀번호 오류횟수가 5회 초과하였습니다.
                //loginPage.viewAlert(rspDta.rspMsgCn, "#userId");
                var result = confirm(rspDta.rspMsgCn + "\n L.point 비밀번호 찾기 페이지로 이동하시겠습니까?");
                if (result) {
                    loginPage.FdPassword();
                }
            }
            else if ('401' === rspDta.rspDtc) {
                loginPage.viewAlert("아이디, 비밀번호가 일치하지 않습니다", "#userId");
            }
            else if ('404' === rspDta.rspDtc) {
                //alert("부정 로그인 대상 입니다.");
                akDta = {
                    ssoTkn: rspDta.ssoTkn,
                    onlCstTpC: rspDta.onlCstTpC
                }
                ssoObj.callPage(22, akDta, "", rspDta.acesTkn);
            }
            else if ('405' === rspDta.rspDtc) {
                alert("비밀번호 오류횟수가 5회 초과하였습니다.");
                ssoObj.callPage(9, akDta, "", "");
            }
            else if ('406' === rspDta.rspDtc) {
                alert("L.POINT & 제휴사 휴면 회원입니다.");
                akDta = {
                    ssoTkn: rspDta.ssoTkn,
                    onlCstTpC: rspDta.onlCstTpC,
                    rspDtc: rspDta.rspDtc
                }
                ssoObj.callPage(21, akDta, "", "");
            }
            else if ('407' === rspDta.rspDtc) {
                alert("L.POINT 휴면 회원입니다.");
                akDta = {
                    ssoTkn: rspDta.ssoTkn,
                    onlCstTpC: rspDta.onlCstTpC,
                    rspDtc: rspDta.rspDtc
                }
                ssoObj.callPage(21, akDta, "", "");
            }
            else if ('408' === rspDta.rspDtc) {
                alert("제휴사 휴면 회원입니다..");
                akDta = {
                    ssoTkn: rspDta.ssoTkn,
                    onlCstTpC: rspDta.onlCstTpC,
                    rspDtc: rspDta.rspDtc
                }
                ssoObj.callPage(21, akDta, "", "");
            }
            else if ('410' === rspDta.rspDtc) {
                alert("임시 비밀번호 발급 상태 회원입니다.");
                akDta = {
                    ssoTkn: rspDta.ssoTkn,
                }
                ssoObj.callPage(16, akDta, "", "");
            }
            else if ('412' === rspDta.rspDtc) { //강제 차단 상태 회원입니다.
                loginPage.viewAlert("로그인 불가 회원입니다.\nL.POINT 고객센터(1899-8900)로 문의 바랍니다.", "#userId");
			}
            else if ('414' === rspDta.rspDtc) {
                alert("정회원 전환 가능 대상 입니다.");
                ssoObj.callPage(17, akDta, "", "");
            }
            else if ('419' === rspDta.rspDtc) {
                alert("제휴사 약관 미동의 회원입니다.");
                akDta = {
                    ssoTkn: rspDta.ssoTkn,
                    onlCstTpC: rspDta.onlCstTpC,
                    frnYn: rspDta.frnYn
                }
                ssoObj.callPage(18, akDta, "", "");
            }
            else if ('420' === rspDta.rspDtc) {
                alert("제휴사 약관 미동의 회원입니다.(14세미만)");
                akDta = {
                    ssoTkn: rspDta.ssoTkn,
                    onlCstTpC: rspDta.onlCstTpC,
                    frnYn: rspDta.frnYn
                }
                ssoObj.callPage(18, akDta, "", "");
            }
            else if ('423' === rspDta.rspDtc) {
                loginPage.viewAlert("소셜로그인 맵핑 정보가 존재하지 않습니다.", "#userId");
            }
            else if ('705' === rspDta.rspDtc) {
                loginPage.viewAlert("등록된 사용자가 아닙니다.", "#userId");
            } else {
                loginPage.viewAlert(rspDta.rspMsgCn, "#userId");
            }
            $.hideMask();
        } else {

            $('#userPassword').attr('disabled', false);
            loginPage.viewAlert(rspDta.rspMsgCn, "#userId");

            $.hideMask();
        }

    },
    //LC 회원정보조회 결과
    lcapiGetUserInfoProc: function (rspDta) {

        let responseJSON = rspDta.responseJSON;
        if (responseJSON.IsOK == "true") {

            loginPage.lcApiUserInfo = responseJSON.userInfo;

            if (loginPage.lcApiUserInfo.drmntMbrYN == "1") {

                alert("반갑습니다. 고객님! 휴면상태의 계정이 활성화 되었습니다. 지금부터 정상적인 서비스 이용이 가능합니다.");

                let vDta = {
                    "channelType": CHANNEL_TYPE,
                    "osType": BrowserAgent(),
                    "osVersion": navigator.userAgent,
                    "data": { lpointOnlineMemberID: loginPage.lcApiUserInfo.lPntOnLineMbrID }
                };
                common.JsonCallSync('/LCAPI/Account/getRestoreDormantMember', vDta);
                loginPage.lcApiUserInfo.drmntMbrYN = "0";
            }

            loginPage.lcapiLoginProc();


        } else {
            alert('로그인 실패하였습니다.');
        }

        $.hideMask();

    },
    lcapiGetUserInfoNonProc: function (rspDta) {

        var responseJSON = rspDta.responseJSON;

        if (responseJSON.IsOK == "false") {
            loginPage.viewAlert(responseJSON.ResultMessage, "#userId");
        }
        else {
            loginPage.lcApiUserInfo = responseJSON.userInfo;

            loginPage.lcapiLoginProc();
        }

    },
    //SSO 회원정보조회 결과
    lpointSsoGetUserInfoProc: function (jsonData) {

        loginPage.ssoUserInfo = jsonData;

        //회원동기화처리.
        loginPage.lcapiSyncUserInfo(jsonData);

    },
    //회원동기화처리.
    lcapiSyncUserInfo: function (jsonData) {

        const onlCno = (jsonData.onlCno == null) ? "" : jsonData.onlCno;             //LPOINT 온라인고객번호
        const onlId = (jsonData.onlId == null) ? "" : jsonData.onlId;                //온라인ID
        //const cstPswd = (jsonData.cstPswd == null) ? "" : jsonData.cstPswd;
        //const onlCstPswd = (jsonData.onlCstPswd == null) ? "" : jsonData.onlCstPswd;
        //const pswdUdDtti = (jsonData.pswdUdDtti == null) ? "" : jsonData.pswdUdDtti;  //비밀번호 변경 일시?
        //const onlCstStc = (jsonData.onlCstStc == null) ? "" : jsonData.onlCstStc;     //온라인 고객상태
        const frnYn = (jsonData.frnYn == null) ? "" : jsonData.frnYn;                 //외국인여부
        const cstNm = (jsonData.cstNm == null) ? "" : jsonData.cstNm;
        const bird = (jsonData.bird == null) ? "" : jsonData.bird;
        const mlRcvYn = (jsonData.mlRcvYn == null) ? "N" : jsonData.mlRcvYn;          //메일수신여부
        const telZonNo = (jsonData.telZonNo == null) ? "" : jsonData.telZonNo;        //전화지역번호
        const exno = (jsonData.exno == null) ? "" : jsonData.exno;                    //전화 국번
        const tlno = (jsonData.tlno == null) ? "" : jsonData.tlno;                    //전화개별번호
        const tcccDc = (jsonData.tcccDc == null) ? "" : jsonData.tcccDc;              //통신사구분코드
        const mbzNoC = (jsonData.mbzNoC == null) ? "" : jsonData.mbzNoC;              //통신사구분코드
        const mmtExno = (jsonData.mmtExno == null) ? "" : jsonData.mmtExno;           //이동전화국번
        const mtlno = (jsonData.mtlno == null) ? "" : jsonData.mtlno;                 //이동전화개별번호
        const fdstPstNo = (jsonData.fdstPstNo == null) ? "" : jsonData.fdstPstNo;     //기초구역우편번호
        const rdnmPstNo = (jsonData.rdnmPstNo == null) ? "" : jsonData.rdnmPstNo;     //도로명우편번호
        const rdnmPnadd = (jsonData.rdnmPnadd == null) ? "" : jsonData.rdnmPnadd;     //도로명우편번호주소
        const rdnmBpsnoAdd1 = (jsonData.rdnmBpsnoAdd1 == null) ? "" : jsonData.rdnmBpsnoAdd1; //도로명우편번호외주소1
        const rdnmBpsnoAdd2 = (jsonData.rdnmBpsnoAdd2 == null) ? "" : jsonData.rdnmBpsnoAdd2; //도로명우편번호외주소2
        const pnadd = (jsonData.pnadd == null) ? "" : jsonData.pnadd;                 //(구)우편번호주소
        const bpsnoAdd = (jsonData.bpsnoAdd == null) ? "" : jsonData.bpsnoAdd;        //(구)우편번호외주소
        const ciNo = (jsonData.ciNo == null) ? "" : jsonData.ciNo;
        const maFemDvC = (jsonData.maFemDvC == null) ? "" : jsonData.maFemDvC;
        const cno = (jsonData.cno == null) ? "" : jsonData.cno;                         //고객번호
        const bfOnlId = (jsonData.bfOnlId == null) ? "" : jsonData.bfOnlId;              //이전아이디
        const elcAdd = (jsonData.elcAdd == null) ? "" : jsonData.elcAdd;                  //전자주소
        const naddYn = (jsonData.naddYn == null) ? "" : jsonData.naddYn;                 //신주소여부
        const bzno = (jsonData.bzno == null) ? "" : jsonData.bzno;                       //사업자번호
        const smsRcvYn = (jsonData.smsRcvYn == null) ? "N" : jsonData.smsRcvYn;          //SMS수신여부
        const onlIdChDtti = (jsonData.onlIdChDtti == null) ? "N" : jsonData.onlIdChDtti;          //온라인아이디변경일시
        const onlCstTpC = (jsonData.onlCstTpC == null) ? "N" : jsonData.onlCstTpC;          //온라인고객유형코드
        const ageDc = (jsonData.ageDc == null) ? "N" : jsonData.ageDc;          //온라인고객유형코드
        const addDc = (jsonData.addDc == null) ? "" : jsonData.addDc;           //주소구분코드
        const pstNo = (jsonData.pstNo == null) ? "" : jsonData.pstNo;           //우편번호

        //신주소 : 구주소
        const _homeZipCode = (addDc == "002" && naddYn == "Y") ? fdstPstNo : pstNo;
        const _homeAddr01 = (addDc == "002" && naddYn == "Y") ? rdnmPnadd : pnadd;
        const _homeAddr02 = (addDc == "002" && naddYn == "Y") ? rdnmBpsnoAdd1 + " " + rdnmBpsnoAdd2 : (addDc == "002" && naddYn == "N") ? bpsnoAdd : "";
        const _memberGubun = (bzno == "") ? "1" : "2";  //1(개인), 2(법인)
        const _homeTel = telZonNo + "-" + exno + "-" + tlno;
        const _handPhone = mbzNoC + "-" + mmtExno + "-" + mtlno;
        const companyZipCode = (addDc == "001" && naddYn == "Y") ? fdstPstNo : pstNo;
        const companyAddr01 = (addDc == "001" && naddYn == "Y") ? rdnmPnadd : pnadd;
        const companyAddr02 = (addDc == "001" && naddYn == "Y") ? rdnmBpsnoAdd1 + " " + rdnmBpsnoAdd2 : (addDc == "001" && naddYn == "N") ? bpsnoAdd : "";

        let onl_cst_dc = "5";

        if (onlCstTpC == "1" && ageDc == "1") {
            onl_cst_dc = "1";
        } else if (onlCstTpC == "2" && ageDc == "1") {
            onl_cst_dc = "1";
        } else if (onlCstTpC == "1" && ageDc == "2") {
            onl_cst_dc = "2";
        } else if (onlCstTpC == "2" && ageDc == "2") {
            onl_cst_dc = "2";
        } else if (onlCstTpC == "1" && ageDc == "3") {
            onl_cst_dc = "3";
        } else if (onlCstTpC == "2" && ageDc == "3") {
            onl_cst_dc = "3";
        } else if (onlCstTpC == "3" && ageDc == "1") {
            onl_cst_dc = "4";
        } else if (onlCstTpC == "4" && ageDc == "1") {
            onl_cst_dc = "5";
        }

        let vData = {
            "memberCode": onlId,
            "memberName": cstNm,
            "password": "",
            "juminNo": "",
            "memberGubun": "",
            "birthday": bird,
            "lunarSolarGubun": "",
            "homeTel": _homeTel,
            "handPhone": _handPhone,
            "homeZipCode": _homeZipCode,
            "homeAddr01": _homeAddr01,
            "homeAddr02": _homeAddr02,
            "emailAddr": elcAdd,
            "occupationGubun": "",
            "patronizes": "",
            "mailingYN": mlRcvYn,
            "passwordQ": "",
            "passwordA": "",
            "favoriteMovieType": "",
            "anniversary": "",
            "anniversaryGubun": "",
            "interest": "",
            "companyName": "",
            "companyZipCode": companyZipCode,
            "companyAddr01": companyAddr01,
            "companyAddr02": companyAddr02,
            "movieChoiceRoute": "",
            "choiceInfoType": "",
            "cardApplyYN": "", //-
            "sex": maFemDvC,
            "homepageUrl": "",
            "receiptPlace": "",
            "companyTel": "", //--
            "ipinNo": "",
            "ipinYN": "",
            "di_hash": {
                "ciHash": "",
                "dihash": ciNo
            },
            "ipinVersion": "",
            "mbrCustNo": cno,
            "bfchLoginId": bfOnlId,
            "custId": onlCno,
            "nationFg": frnYn,
            "smsYn": smsRcvYn,
            "BF_ONL_ID_CH_DTTI": onlIdChDtti,
            "strIsAutoLogin": "N",
            "oNL_CST_DC": onl_cst_dc,
            "channel": ""
        };

        var vDta = {
            "channelType": CHANNEL_TYPE,
            "osType": BrowserAgent(),
            "osVersion": navigator.userAgent,
            "data": vData
        };

        if (loginPage.lcApiUserInfo != null) {
            //동기화 처리
            common.JsonCallSync('/LCAPI/Account/syncUserInfo', vDta, loginPage.lcapiLoginProc);
        }
        else {
            //동기화 처리
            common.JsonCallSync('/LCAPI/Account/syncUserInfo', vDta, loginPage.lcapiLogin2Proc);

            //var vTest = {
            //};

            //vTest.responseJSON = {
            //    IsOK: "true"
            //};

            loginPage.lcapiLogin2Proc(vTest);
        }
    },
    userNameMasking: function (strCar) {
        if (strCar == undefined || strCar === '') {
            return '';
        }
        //var pattern = /(?<=.{1})./; // 정규식
        var pattern = /.{1}$/

        return strCar.replace(pattern, "*");
    },
    //회원동기화처리 결과.
    lcapiSyncUserInfoProc: function (jsonData) {

        //로그인 처리.
        var vDta = {
            "channelType": CHANNEL_TYPE,
            "osType": BrowserAgent(),
            "osVersion": navigator.userAgent,
            "data": loginPage.lcApiUserInfo
        };

        loginPage.lcapiLoginProc();
    },
    //lcapi 동기화 처리. 로그인 처리.
    lcapiLoginProc: function () {

        if (loginPage.pType == 0) {     //생성

            var savedId = $("#userId").val();
            var checkSavedID = $('#checkSavedID').is(":checked") ? "Y" : "N";
            try {
                var userAuth = "1|N|" + checkSavedID + "|" + loginPage.lcApiUserInfo.mbrNoOnLine + "|" + savedId + "|" + ssoObj.ssoTkn + "|" + ssoObj.acesTkn + "|" + ssoObj.rnwTkn + "|" + ssoObj.cIntAkInfs;
                $.cookie("WMEMBER_AUTH", userAuth, { path: '/' });
                common.setALState("WMEMBER_AUTH", userAuth);
            } catch (e) {

            }
        }

        var vDta = {
            "channelType": CHANNEL_TYPE,
            "osType": BrowserAgent(),
            "osVersion": navigator.userAgent,
            "data": loginPage.lcApiUserInfo
        };

        common.JsonCallSync('/LCAPI/MemberCookie/setMemberCookie', vDta, loginPage.PageClose);

    },
    //lcapi 동기화 처리 이후 회원정보 조회
    lcapiLogin2Proc: function (jsonData) {
        //로그인 결과 처리

        var responseJSON = jsonData.responseJSON;

        if (responseJSON.IsOK == "true") {

            var id = $("#userId").val();

            var vData = {
                "loginId": id,
                "deviceToken": ""
            };

            var vDta = {
                "channelType": CHANNEL_TYPE,
                "osType": BrowserAgent(),
                "osVersion": navigator.userAgent,
                "data": vData
            };

            //LC 회원정보조회
            common.JsonCallSync('/LCAPI/Account/getUserInfo', vDta, loginPage.lcapiGetUserInfo2Proc);
        }
        else {
            return false;
        }

    },
    lcapiGetUserInfo2Proc: function (rspDta) {

        var responseJSON = rspDta.responseJSON;

        loginPage.lcApiUserInfo = responseJSON.userInfo;

        loginPage.lcapiLoginProc();

    },
    PageClose: function (jsonData) {
        if (typeof (returnurl) != "undefined" && returnurl != null && returnurl != undefined && returnurl != "") {
            location.href = decodeURIComponent(returnurl);
        } else {
            location.href = "/" + PLATFORM_TYPE;
        }
    },
    logout: function () {

        //로그아웃
        if (confirm('로그아웃 하시겠습니까?')) {

            if ($.cookie("acesTkn") === undefined || $.cookie("acesTkn") === "" || $.cookie("acesTkn") === null) {
                loginPage.logOutProc('POST');
                return false;
            }

            ssoObj.callLogout(loginPage.callLogoutProc);
        }
    },
    callLogoutProc: function (resJsonLogout) {
        if (resJsonLogout.rspC === '00') {
            loginPage.logOutProc('POST');
        }
    },
    logOutProc: function (method) {

        //로그아웃 결과처리.
        var vDta = {
            "channelType": CHANNEL_TYPE,
            "osType": BrowserAgent(),
            "osVersion": navigator.userAgent,
            "data": null
        };

        $.ajax({
            type: method,
            url: '/LCAPI/MemberCookie/setMemberCookieOut',
            data: JSON.stringify(vDta),
            headers: {
                "Content-Type": "application/json"
            },
            success: function (rspDta, status, xhr) {

                $("#liLogout").hide();
                $("#liEdit").hide();
                $("#liChPassword").hide();
                $("#liOutMem").hide();

                try {
                    var tempAuth2 = "";
                    var storageValue = window.localStorage.getItem('WMEMBER_AUTH');

                    if (storageValue != "" && storageValue.length > 0) {
                        tempAuth2 = "0" + storageValue.substr(1, storageValue.length - 1);
                        // 20160926 이벤트 도메인 관련 추가
                        $.cookie('WMEMBER_AUTH', tempAuth2, { path: '/' });
                    }

                    if (typeof localStorage === 'object' && typeof (localStorage) != 'undefined') {
                        window.localStorage.setItem('WMEMBER_AUTH', tempAuth2);
                        cdstorage_event.setItem('WMEMBER_AUTH', tempAuth2);
                    }
                    else {
                        window.localStorage.setItem('WMEMBER_AUTH', '');
                        cdstorage_event.setItem('WMEMBER_AUTH', '');
                    }

                }
                catch (e) {
                    $.cookie('WMEMBER_AUTH', '', { path: '/' });
                }

                loginPage.removeAllCookie();

                if (typeof (returnurl) == 'undefined') {
                    location.href = "/" + PLATFORM_TYPE + "/";
                } else {
                    location.href = decodeURIComponent(returnurl);
                }

            }, error: function (jqXHR, textStatus, errorThrown) {
            }
        });

    },
    //로그인정보 전체 삭제
    removeAllCookie: function () {

        $.removeCookie("WMEMBER_AUTH", { path: "/" });
        $.removeCookie("MemberInfo", { path: "/" });
        $.removeCookie("ssoTkn", { path: "/" });
        $.removeCookie("acesTkn", { path: "/" });
        $.removeCookie("rnwTkn", { path: "/" });
        $.removeCookie("cIntAkInfs", { path: "/" });
        $.removeCookie("ticketingStateCookie", { path: "/" });

        common.setALState("WMEMBER_AUTH", "");
        common.setALState("AUTH_INFO", "");

        lcMemberInfo = "";
        if (typeof (memberInfo) != "undefined") {
            memberInfo = "";
        }
    },
    //비회원 로그인
    getNonLoginURL: function () {
        //비회원 로그인
        common.openWindow('/' + PLATFORM_TYPE + '/member/NonMemLogin');
    },//회원가입
    join: function () {
        //회원가입
        ssoObj.callViewMbrJoin();
    },
    // 제휴사 회원가입
    affiliateJoin: function (returnUrl) {
        ssoObj.callViewAffiliateMbrJoin(returnUrl);
    },
    //회원정보 수정:로그인 후 가능
    edit: function () {
        //회원정보 수정.
        ssoObj.callViewEdit();
    },
    //비밀번호 찾기
    FdPassword: function () {
        //비밀번호 찾기
        ssoObj.callViewFdPassword();
    },
    //아이디 찾기
    FdId: function () {
        //아이디 찾기
        ssoObj.callViewFdId();
    },
    //비밀변경:로그인 후 가능
    ChPassword: function () {
        //비밀변경
        ssoObj.callViewChPassword();
    },
    //회원탈퇴:로그인 후 가능
    OutMem: function () {
        //비밀변경
        ssoObj.callViewMbrSes();
    },
    /**
     * 맴버스회원동기화 및 롯데시네마 회원정보보 조회
     * @param {any} loginId
     * @param {any} acesTkn
     * @param {any} deviceToken
     * @returnValue 회원정보 조회값
     */
    getUserNaverInfo: function (loginId, acesTkn, deviceToken) {
        let returnValue = null;
        try {
            var vData = {
                "loginId": loginId,
                "deviceToken": deviceToken,
                "MobileOSType": "HO",
                "acesTkn": acesTkn
            };

            var vDta = {
                "channelType": CHANNEL_TYPE,
                "osType": BrowserAgent(),
                "osVersion": navigator.userAgent,
                "multiLanguageID": "KR",
                "data": vData
            };

            common.JsonCallSync('/LCAPI/Account/getSSONever', vDta, function (rspDta) {
                returnValue = rspDta.responseJSON;
            });

        } catch (e) {
            returnValue = "{isOK : false}";
        }

        return returnValue;
    },
    /**
     * 휴면해제 처리
     * @param {any} member
     */
    getRestoreDormantMember: function (member) {

        let lMembers = member.lMemberInfo;
        var prv_ag_dt = lMembers.prv_ag_dt == null || lMembers.prv_ag_dt == undefined ? "" : lMembers.prv_ag_dt;

        /* [씨츄연동]주석처리(테스트후 주석해제)*/
        let vDta = {
            "channelType": CHANNEL_TYPE,
            "osType": BrowserAgent(),
            "osVersion": navigator.userAgent,
            "data": {
                lpointOnlineMemberID: member.lPntOnLineMbrID,
                mbrNoOnLine: member.mbrNoOnLine,
                loginId: member.loginId,
                UserID: member.loginId,
                USER_NAME: member.mbrNm,
                FRN_YN: member.frgnrYN,
                MA_FEM_DV_C: member.sexCd,
                ELC_ADD: member.emailAddr,
                BIRD: member.brthDt,
                cco_optin_sms: lMembers.cco_optin_sms,
                cco_optin_ml: lMembers.cco_optin_ml,
                cco_optin_ml_dtti: lMembers.cco_optin_ml_dtti,
                cco_optin_sms_dtti: lMembers.cco_optin_sms_dtti,
                TL_NO: lMembers.tl_no,
                MBL_NO: lMembers.mbl_no,
                add_dc: lMembers.add_dc,
                pst_no: lMembers.pst_no,
                PNADD: lMembers.pnadd,
                BPSNO_ADD: lMembers.bpsno_add,
                PRV_AG_DC: lMembers.prv_ag_dc,
                PRV_AG_DT: prv_ag_dt,
                CNO_CH_DTTI: lMembers.cno_ch_dttl,
                LT_CH_DTTI: lMembers.lt_ch_dttl
            }
        };

        /*let vDta = {
            "channelType": CHANNEL_TYPE,
            "osType": BrowserAgent(),
            "osVersion": navigator.userAgent,
            "data": {
                lpointOnlineMemberID: member.lPntOnLineMbrID
            }
        };*/

        common.JsonCallSync('/LCAPI/Account/getRestoreDormantMember', vDta);
    }
};

var mypage1 = {
    TOYEAR: "",	        //현재일자
    COUPONOPENDATE: "",	//vip쿠폰 다운로드 체크 일자
    Init: function () {
        mypage1.COUPONOPENDATE = getTimeStamp();
        mypage1.TOYEAR = mypage1.COUPONOPENDATE.substr(0, 4);
    },
    //VIP 쿠폰 다운로드 체크 
    CheckAlreadyDownloaded: function (memberAceYN, vipCouponGroupCode) {
        try {
            // 객체 설정
            // memberAceYN: 0(VIP플래티넘, VIP골드), 1(ACE)
            // vipCouponGroupCode: VIP플래티넘/VIP골드(10(기본-X), 20(선택1-O), 30(선택2-O)), ACE(10)
            memberAceYN = parseInt(memberAceYN, 10);
            vipCouponGroupCode = parseInt(vipCouponGroupCode, 10);
            var obj = {
                MethodName: "SetVipCouponCategoryDownloadCheck"
                , channelType: CHANNEL_TYPE
                , osType: BrowserAgent()
                , osVersion: navigator.userAgent
                , multiLanguageID: Language
                , memberNoOn: memberInfo.MemberNoOn
                , year: mypage1.TOYEAR
                , memberAceYN: memberAceYN
                , vipCouponGroupCode: vipCouponGroupCode
            };
            // JSON 호출
            common.GetData("mycinema", obj, mypage1.returnCheckAlreadyDownloaded);
        } catch (e) {
        }
    },
    //VIP 쿠폰 다운로드 체크 확인
    returnCheckAlreadyDownloaded: function (data) {
        try {
            var jsonData = data.responseJSON;               //json 객체
            var isOK = jsonData.IsOK;
            var resultMessage = jsonData.ResultMessage;     // 결과 메세지

            // Data 유효성 검사
            if (jsonData == undefined) { throw new Error("None Data Error"); }
            if (isOK == undefined) { throw new Error("JSon Struct Error"); }

            if (isOK === "true") {   // download available
                // 20170123 - 쿠폰 다운로드 가능 시 ResultMessage에 회원 등급 리턴
                //if (memberInfo.MemberClass == "11" || memberInfo.MemberClass == "12") {// ace 
                document.getElementById("hidMemberClass").value = resultMessage;
                var popSet = new $.fn.modalPopGeneration_re({
                    type: 'load'
                    , url: '/' + PLATFORM_TYPE + '/View/My-Cinema/vip-member-vip-coupon-download.html?v=20190125001'
                    , closed: '.btn_pop_close'
                    , btns: false, btnParam1: false, btnParam2: false
                    , elem: $(this)
                });

            } else {  // already downloaded

                alert(resultMessage);
            }

        } catch (e) {
        }
    },
    //VIP 쿠폰 다운로드
    setVipCouponCategoryDownload: function (memberAceYN, vipCouponGroupCode) {
        try {
            // 객체 설정
            // memberAceYN: 0(VIP플래티넘, VIP골드), 1(ACE)
            // vipCouponGroupCode: VIP플래티넘/VIP골드(10(기본-X), 20(선택1-O), 30(선택2-O)), ACE(10)
            memberAceYN = parseInt(memberAceYN, 10);
            vipCouponGroupCode = parseInt(vipCouponGroupCode, 10);
            var obj = {
                MethodName: "SetVipCouponCategoryDownload"
                , channelType: CHANNEL_TYPE
                , osType: BrowserAgent()
                , osVersion: navigator.userAgent
                , multiLanguageID: Language
                , memberNoOn: memberInfo.MemberNoOn
                , year: mypage1.TOYEAR
                , memberAceYN: memberAceYN
                , vipCouponGroupCode: vipCouponGroupCode
            };
            // JSON 호출
            common.GetData("mycinema", obj, mypage1.returnSetVipCouponCategoryDownload);
        } catch (e) {
        }
    },
    //VIP 쿠폰 다운로드 결과
    returnSetVipCouponCategoryDownload: function (data) {
        try {
            var jsonData = data.responseJSON                  //json 객체
            var isOK = jsonData.IsOK;
            var resultMessage = jsonData.ResultMessage; // 결과 메세지

            // Data 유효성 검사
            if (jsonData == undefined) { throw new Error("None Data Error"); }
            if (isOK == undefined) { throw new Error("JSon Struct Error"); }

            // isOK가 true 이거나 false 라도 무조건 서버 메세지 출력
            new $.fn.modalPopGeneration({
                type: 'server'
                , lang: Language
                , serverMessage: resultMessage
                , btns: true, btnParam1: false, btnParam2: true
                , elem: $(this)
            });

            $('.pop_wrap_inner .btnc_confirm').off().on('click', function () {
                $(this).parents('.pop_wrap01').remove();

                location.reload(); // 1603201
            });
        } catch (e) {
        }
    },
    getTempMyCinemaMemberInfo: function () {

        //비회원 여부 체크
        if (memberInfo == undefined) {
            return;
        } else {
            if (memberInfo.MemberNoOn == '0' || memberInfo.CustomerNo == undefined || memberInfo.CustomerNo == '')
                return;
        }

        try {

            // 객체 설정
            var obj = {
                MethodName: "GetMyCinemaMemberInfo"
                , channelType: CHANNEL_TYPE
                , osType: BrowserAgent()
                , osVersion: navigator.userAgent
                , multiLanguageId: Language
                , memberNoOn: memberInfo.MemberNoOn
                , customerNo: memberInfo.CustomerNo
            };

            // JSON 호출
            common.GetData("mycinema", obj, mypage1.appendTempMyCinemaMemberInfo);
        } catch (e) {
        }
    },
    appendTempMyCinemaMemberInfo: function (data) {
        try {

            var jsonData = data.responseJSON;                  //json 객체
            var isOK = jsonData.IsOK;
            var resultMessage = jsonData.ResultMessage; // 결과 메세지

            // Data 유효성 검사
            if (jsonData == undefined) { return; }
            if (isOK == undefined) { return; }
            if (isOK != "true") { return; }

            var details = jsonData.MyCinemaMemberInfo;

            var myCouponInfo = jsonData.MyCouponInfo;

            //if (details != undefined) {

            //    var htmlString = "";
            //    var sb = new StringBuilder();

            //    var memberName = details.MemberName;
            //    var memberGradeCode = details.MemberGradeCode;
            //    var memberGradeName = details.MemberGradeName;
            //    var lPOINT = details.LPOINT;
            //    var accumulationLotteCinemaPoint = details.AccumulationLotteCinemaPoint;
            //    var CinemaLPoint = details.CinemaLPoint;


            //    $("#MbrName_c").html(memberName);
            //    $("#MbrGrade_c").html(memberGradeName);

            //    if (details.MemberGradeCode == "22") {
            //        $("#classicon_c").html('<img src="/NLCMS/Image/icon/vip2019_platinum.png" alt="platinum" />');
            //        $("#MbrGrade_c2").html("VIP 등급은");
            //        VipType = 2;
            //    } else if (details.MemberGradeCode == "21") {
            //        $("#classicon_c").html('<img src="/NLCMS/Image/icon/vip2019_gold.png" alt="gold" />');
            //        $("#MbrGrade_c2").html("VIP 등급은");
            //        VipType = 1;
            //    } else if (details.MemberGradeCode == "12") {
            //        $("#classicon_c").html('<img src="/NLCMS/Image/icon/vip2019_silver.png" alt="silver" />');
            //        $("#MbrGrade_c2").html("VIP 등급은");
            //        VipType = 0;
            //    } else {
            //        $("#classicon_c").html('<img src="/NLCMS/Image/icon/vip2019_common.png" alt="일반" />');
            //        $("#MbrGrade_c2").html("등급은");
            //        VipType = 0;
            //    }

            //    $("#memberVIPPoints").html(ToMoney(CinemaLPoint));


            //    var tempFirstPoint = 0;
            //    var tempSecondPoint = 0;

            //    try {
            //        tempFirstPoint = Number(details.FirstGradePoint);
            //        tempSecondPoint = Number(details.SecondGradePoint);

            //        var maxPoint = tempSecondPoint + (tempSecondPoint - tempFirstPoint);
            //        var tempWidth = (Number(details.CinemaLPoint) / maxPoint) * 100;
            //        if (tempWidth > 99) {
            //            tempWidth = 99;
            //        }

            //        var tempFirstPoint_left = (tempFirstPoint / maxPoint) * 100;
            //        var tempSecondPoint_left = (tempSecondPoint / maxPoint) * 100;

            //        $('.rategraph .gradeline li.grade1').css('width', parseInt(tempFirstPoint_left) + '%');
            //        $('.rategraph .gradeline li.grade2').css('width', parseInt(tempSecondPoint_left) - parseInt(tempFirstPoint_left) + '%');

            //        $(".gradeline .grade2 > span > em").html(ToMoney(tempFirstPoint));
            //        $(".gradeline .grade3 > span > em").html(ToMoney(tempSecondPoint));

            //        $('#spanArrows').css('width', parseInt(tempWidth) + "%");


            //    } catch (e) {
            //    }


            //    vipside(VipType);


            //    //20190125 쿠폰 카운트 추가
            //    if (myCouponInfo != undefined) {
            //        var vipCouponCnt = myCouponInfo.RestVipCpn;
            //        var birthCouponCnt = myCouponInfo.RestAnnivCpn;
            //        $('#vipCouponNum').text(vipCouponCnt);
            //        $('#birthCouponNum').text(birthCouponCnt);


            //    } else {
            //        $('#vipCouponNum').text("0");
            //        $('#birthCouponNum').text("0");
            //    }
            //    //20190125 쿠폰 카운트 추가
            //}

        } catch (e) {
        }
    },
    getAnniversaryMember: function () {
        try {
            var obj = {
                MethodName: "GetAnniversaryMember"
                , channelType: CHANNEL_TYPE
                , osType: BrowserAgent()
                , osVersion: navigator.userAgent
                , multiLanguageId: Language
                , memberNoOn: memberInfo.MemberNoOn
            };

            common.GetData("mycinema", obj, mypage1.appendAnniversaryMemberData);

        } catch (e) {
        }
    },
    //회원 기념일 반환 결과
    appendAnniversaryMemberData: function (data) {
        try {

            var jsonData = data.responseJSON;                  //json 객체
            var isOK = jsonData.IsOK;
            var resultMessage = jsonData.ResultMessage; // 결과 메세지

            //// Data 유효성 검사
            //if (jsonData == undefined) { throw new Error("None Data Error"); }
            //if (isOK == undefined) { throw new Error("JSon Struct Error"); }
            //if (isOK == "true") {

            //    $("#mybirth").show();

            //    if (jsonData.ResultCode != 1) {
            //        var birthArray = resultMessage.split('|');
            //        var AnniversaryDay = birthArray[0];
            //        var ModifyDay = birthArray[1];
            //        var couponDownYN = birthArray[2];
            //        var Year = AnniversaryDay.substring(0, 4);
            //        var Month = AnniversaryDay.substring(4, 6).replace(/(^0+)/, "");
            //        var Day = AnniversaryDay.substring(6, 8).replace(/(^0+)/, "");

            //        var paramObj = {
            //            year: AnniversaryDay.substring(0, 4),
            //            month: AnniversaryDay.substring(4, 6).replace(/(^0+)/, ""),
            //            day: AnniversaryDay.substring(6, 8).replace(/(^0+)/, ""),
            //            modifiedDay: ModifyDay.replace(/-/gi, ".")
            //        };

            //        if (couponDownYN == "Y") {
            //            gBirthDayPayment = birthArray[3].replace(/-/gi, ".");//20170119 sunho 변경 하이픈에서 쿠폰 다운로드 받았을때 년도 표시      
            //        }

            //        mypage1.makeBirthdayHTML(3, paramObj);

            //    } else {
            //        mypage1.makeBirthdayHTML(2);
            //    }

            //}

            //// 20170116 sunho  생일 쿠폰 추가 
            //$("#btnSetLayer").click(function () {
            //    mypage1.getAnniversarySInfo();
            //    //alert("VIP 승급 페이지 이동");
            //    // new $.fn.modalPopGeneration({ type: 'load', url: '/' + PLATFORM_TYPE + '/View/My-Cinema/vip_birthday_coupon.html?v=20170119', btns: false, btnParam1: false, btnParam2: false, elem: $(this), closed:'.btn_pop_close' });
            //});
        } catch (e) {
        }
    },
    makeBirthdayHTML: function (ntype, paramobj) {

        //$('#mybirth').empty();

        var html = '';
        switch (ntype) {//0 비회원 삭제 
            case 1: // 로그인-일반
                //        html = '<strong>VIP 전용 혜택 입니다.</strong><br />';
                //        $('#mybirth').css('text-align', 'center');
                break;
            case 2: // 로그인-VIP-생일미설정
                //        html = '<br>';
                //        html += '<span class="latest">&nbsp;</span>';
                //        html += '<div class="enrollbtn">';
                //        html += '   <a href="javascript:void(0);" class="btn_couponblack" title="생일 등록하기 팝업 새창"  id="btnSetLayer">생일 등록하기</a>';
                //        html += '</div>';
                break;
            case 3: // 로그인-VIP-생일설정
                //        html = paramobj.year + '년 ' + paramobj.month + '월 ' + paramobj.day + '일 <br>';
                //        html += '<span class="latest">(최근 수정일 : ' + paramobj.modifiedDay + ')</span>';
                //        html += '<div class="enrollbtn">';
                //        html += '   <a href="javascript:void(0);" class="btn_couponblack" title="생일 등록하기 팝업 새창"  id="btnSetLayer">생일 변경하기</a>';
                //        html += '</div>';
                break;
            default:
                break;
        }
        //$('#mybirth').html(html);
    }
};