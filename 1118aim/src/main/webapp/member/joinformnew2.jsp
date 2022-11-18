<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<title>간편회원 정보입력 &lt; 회원가입 &lt; L.POINT</title>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="../assets/joincss/common.css">
<link rel="stylesheet" href="../assets/joincss/component.css">
<link rel="stylesheet" href="../assets/joincss/resize.css">
<link rel="stylesheet" href="../assets/joincss/swiper.min.css">
<link rel="stylesheet" href="../assets/joincss/css_1050.css"
	type="text/css" media="screen">
</head>
<script src="../assets/joincss/jquery-1.12.3.min.js"></script>
<script src="../assets/joincss/serialize.object.js"></script>
<script src="../assets/joincss/json2.js"></script>
<script src="../assets/joincss/CryptoJS.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../assets/joincss/common.js"></script>
<script src="../assets/joincss/common-ui.js"></script>
<script src="../assets/joincss/common-string.js"></script>
<script src="../assets/joincss/common-channel.js"></script>
<script src="../assets/joincss/common-message.js"></script>
<script type="text/javascript"
	src="../assets/joincss/jquery.i18n.properties-1.0.9.js"></script>
<script src="../assets/joincss/util.js"></script>
<script src="../assets/joincss/common-cookie-notice.js"></script>
<script src="../assets/joincss/itraceraf.cfg.js?"></script>
<script src="../assets/joincss/itraceraf.min.js"></script>
<script src="../assets/joincss/swfobject-min.js"></script>
<script src="../assets/joincss/swiper.min.js"></script>
<script src="../assets/joincss/ua.parser.min.js"></script>

<!--[if lt IE 9]>
<link rel="stylesheet" href="/resources/polyfill/reset-ie8fix.css">
<script src="/resources/polyfill/happybrowser.js"></script>
<script src="/resources/polyfill/IE9.js"></script>
<script src="/resources/polyfill/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript">
       if(window.console == undefined){console={log:function(){}};};
       //초기화 데이터(from 서버)
       Common.init('eyJmbHdObyI6InNmbDl1VlFZS0giLCJha1NyblZkdFZhbHVlIjoicCt4SG9uK0dJOHI4RkdZV09QSHBpM3ArNGJSN3FXTnpRYTZOazNpbFRoSVx1MDAzZCJ9.L3VONFpkVWN5UmE2UEY5MitTcWNVVi9udVdqdHlFRDJJdVVoTEU5T0E5MXNzTy9ncnJMeDRrMFJCc3B1Q05PRFovK3Z5ZGNWYjY1TjlSYjhqYkQ2LzlmUmNSSU5hSTdtK3IyR3VtN3pnZXlJcklkNVRkbzJLbGJHYlhaelU4NFdMV2JBY1BvQ2JhM3RjMEtEY0FMbEk0cENWbW5YKzhaRXg2SGRlc2lIeU1wQTc5SHNNTlIvallHV0ZBTGFac0VJSW5zNTR6aUtFQ1lXT2lmTHNFZWxKQ3hpczIxVnNwN2NTS3RFTmQ4NWJWRVhhaVJzd3JTVGF3SFBBVkwzdzhSekdZeTBHdjllcFdsb0lpeVhvQTQrcHlobHJwNnlMSmIra0JsYVFYVHVTc0NQZVgrTng5S0k4UkQ5djQweDUxUnJaUkNPRi9yR2dVNlFKTit2OWhLYzY2dmN5VHpRZURydzdaU2NhTThRamVsRVM2K29lTm1ic1o0c3l6SUovdXhRQjNyczgra2dicWdSVFpBeGM0TFhPYnpYNmhuMzBKQWl4aStpOGdUMjNLRFZkaVFEUFRwdzFoeXJ1Z0dtMWZmZ0tlOUpGRmxmWmV6YkN2b3R2c1VPdlBTc1ZldVNTZjhPZnRJTGZJalAyY0JPNkM1VGF0UER4bVpSdTdmdlhsZ0xTM2lFQm1WNSs1SEJzQXZFMndJcEJ0blNGRytpZFV6WlEzSkNVRkEwTHhUQmxXWGZDRlVzblFseWVCZkJLTlhKRVdZQnk3WUw4U213RWkvNXBpL2Y5U2VFWVpmWklpS0FXMEJtSmhFc3ZMMmZvVzAvSEdZeUdCMVNRNnVvMTF0L2lMTlVkVVF1ZkpZZzkrWEkzc3ByZnBoN0xkR1ZRdU5GcDVNYnBLaU83bzRPZHhYNEZoM2NnVjlrWDJ4d1ZtNkM0MFdMRWROU2ovNzNwZXhWbWVEbFNxbkJZdGpjNGFmSzZwdUprUWUycVJjUElWaTVVb0p2Sm10bWFKdDRMbG9qY0QxSXFSSWRxV3lqdGRkcjhHNk9laXR6VUpBOFlKQ29JbzJCaWlzL29VQWV3V2xuOUlNZTRMZXg3UkZBQTZWdEY0bEE2MEtscG1WdThPeWNCVmFWNjQ1K1pGdWRUckRTNllTWjF6RWVUTWtjdDNPSi9rRDlCdFZnQWttZVd1S1Q1b3FWWCszdUEwalg1R281RzBaRjJYM21nQU1tZkJnMnpXUlFSNVBuTjFRRjdiN244Zk1zWGlNVWV3NmxTZEVpVW1EajBGSmQxaFZTbmFrbTNMdUN0WVgxL0ZjZVJob3A3azQ2Z01kOFpuTDl0OTRkeFJLQmRQK0liU1YyZjdlZy8xNGZUQ3hwTDNMSElNY2hFVmI1dVJJcGEzSXZ3d3hCbnFqNTBYYmRyTHFidGl0RXFRWmFhT0w5emRKb2lJdGNqSzlxSFJKdG44UTUwVmZDZURheDYvQWlmMXM0V3Jsb2NRS3AvK0k2WVg5YzlaVlJFOHNwL1hXVU5CNTdkalpuSTYxelk1QXZnWS9Qc1VqS0NYa2hNUEkraUlvN0xOZTZ5ZmM1QVZ1T05LSVhneVYvZ2wrbWxZN0Q0REtFV0ZkS0Z2YnhrTVUvd0l2WjFYNmZJbE8xcER3ekZWSXk4OGR0TVo1OFh5eHVnNER4NCsrbVE3NlFTRmhwRS9BZUd4TkgxU3ZhSnZwWHR5SGt2YkRGd0VNbDN4TXc3WFgxWXFrV0ZRcXdmMHppd2FiLzVtMjE3SzU5T1VwaVY0M0xHMENCek9YQ1FXajk3VUxSenNnY215RW9zZmxDTDNHOXhPNVc2R2NEZWtqQWh3TnFwbHRjb25BWlF6bTh2SVU3ZVZ2L0JEL0tsUDBQY1NLclZ3V01nNGJnM0hyY2NCZXBwNXh1UjdnRWtpa2Nyd2RNN2IvTWxKUjlBVzlFVDE3M09rMTN2dFhPU0daOE4vSTREektiZ0VraFFmL25OWG1pWm9VNWFUQWRvS2NubURKN3BNSWV0T0JKLzVkelYvQTc4UW4zajliK3FXdjlubXUxcVZpT0NvanBPMk1kV2tKK21zZGVJSjhsZWpKc0UwQ2hZWmRFaDN5c2l4blNCVDYyUkorcHJBSklLc2V6Y1ZheWZlUEtqUUd4eFRuU0hoZGVJK2Fvc0pha1BsVWhIaTB0UXk0ZTVjTGlFNm1MV25xdlBBaEpINTNBREdYWG9tZlFscHZnSGt6eGpjRDNZZ2RsZW54cko1V1dXQ2gvYUFicTBxRnRkSjg5ckF1bUp1cE85QzZodkxTemZZOTl5WEpPTnh4bWpCamE4SVNvOFdrTnl0RVNEYlFsYk1YcThMTHpIT1k3emJVMHB0Y2l5czZsSW5HMHVYbUhwYTZ6eERIdHFzcUhQQ29TS1JJdEdWWWRWU0NPejU3ek8vdnhFL3R2WFZpVWhNSGx2dFd0dklFZWcvN1FjTmd6QmZXeXorSmJPZmMyRUp5N0NBN3FVUnlZWk1NNkt3em9BQTRESzdEQUE2NlhaMzZrYkRZV0xFU1JHb1JMb3JkUE9LbHRuOGtLR3hady90djR2WlFhdGJQVkp3eEdzblpnZENqWUZHcUkvQ0c5V0xObjh5eWorMUNST001MjVkY0VOMXY2MFNla0xSdjBWelFCZ0dJNjhIUlZxN0pzc0RzQmFmZHh6N1FRYW1HMmJiWlJIcVhqS0lXWFk4WXU2Z1htUzkvU21Geko5dTZIU3drWC9LV1hZMDBueHJyb1NoTWJPaG5mSFVnZU1SWUxOdWNPYmhiTmgvNjBOdndtY1pkTGNYUTJSUHU3OG5wNzZZSVJFbHdELzFFSzlBdXlwR3pWWmh3ZHlqTFc3by9RempwL3JMajVPN2poQ3ZpNGw5azhMT05rcGNEUGg4MFBrd3RYdWZyZkVoZktVS2RvbWRTbEN1YkhGTXBYemFZdnBhcUJjMHQ5V0lMUy9XdTFQdHNpODhsbnFEYzY0cTZESG9lWERXM2RaZjhZbWNIbkRWbm1vWUpFWjdQK3kyODJXUjluV3hUcWp6MC9IZTlLOEI4MXNhN2pRSEpxRHRESVg1ODBSZEtmK3RsY2g5V3pHS3FQMDloQXFRZVpUbEFHdVo4OWdYM09Kbm5sN0NYeW56T1ZESUdEajVRY1F3M1BqU0dXc29MTk4yRi8vbXhEVjBQYXkxMzJ0YnRxUTRsbVVUTXY3TDN6S3V3VWdGV05uVVFzUDVBWnoxUmJSMzc2a2VPRmxuWEhrUFZ2WDBTMW5hNVZMMUJEalVaVWVKRTJ2WmpWQldsRjFwZTIrRE1hYnk0M3FGQzZqanEvdEo2Nk4xS2N2djkrYjBFYUZZNUYrNzFmZDkwNU5JODlhdXlQK1lLTmtXcGFaUEdUZmE3SGtKbTl2WnVNMnMzcjJ3ODFNY2FZT3FHcnFqcHEzUEt2eE9udFpuNE9zZnFJVWNoK3l1MG1xaWVMbzhQTVowbmpHQ04xVzB5SHU1Sk5ZQVVWaDRBck5mdGxVb3hDeFdyNEJValoxTkdWL3N5anN0MlZGTG5Yb0owMkVaM2pPajdlU20zUDF4S0VTelFpeXJkeDZoMzJ1cjJQR29jaWN2dmVNRklNUEczaWxUanlHVElkWjdWK1FPemZCd1ZaNzJyNUhnQ2J0eU9PMk9PSVJwZU41cm95dkRrcWNVV0tjZUlPRUVlTW53RFlhWUNpYjBtc3NnTGhiMTNiWlNYMXpwQ1FoYkhkSlBUQ3JOb1BGbzk3aEI4WmQ2SkliWGFidVlrcWZDSXhYWHBmVksxd1lBVytWWUxMVVlBK0xMd2FTalFDVWk1a0dHaHZhQnl3Q3Z4U2IxV0NiVmJQT3BBRnEzTmJsZ2M4YnRuRGlYdFQ2dDNrOWx6QWFXS0FBZVozUnYwenY5MmlhajRZYTlZaFc5dTN4Z01zaWNjUXRUK1haV1R5QWlIWDNhQk15VVRibEd4MmYyZzhqeWYvaGlua0lsRy9GMTUxTGNqRzMvQTNoQnErM3FXMWVRNFhNYW9RUHA5cVNwQnJEOUpiZWdxRDhEcmhHWHphMTFKZUVScE92c1p2MUdENFhicDVWRmdUdURJcEZPWFlmZmlKVWRDMG9LV1JWdVYxVzR5TURFYjMvTVR5elRSMmRDUFBGYmlMSXhYV29OaFUwNHlnTDFZSXlMZE51cW05QS8vZ1ZCVGl3ZVlRcnhoOFEzRUprOGc9',"N");
       
       var langCode = Common.getChannelData().langCode; 	// 언어코드
       /*
       document.oncontextmenu=function(e){if(e !== undefined ){return false;}}
       document.onselectstart=function(e){if(e !== undefined ){return false;}}
       document.ondragstart=function(e){if(e !== undefined ){return false;}}
       
       //우측 클릭 방지
       document.onmousedown = function (e){
    	   if(e !== undefined && e.button == 2){
    		   return false;
    	   }
       };
       */
</script>
</head>
<body id="KOR" data-device="0" oncontextmenu="return false" onselectstart="return false" ondragstart="return false"> <!-- KOR / ENG / JPN / CHN-CN / CHN-TW -->


 
	<!-- header -->
	<div id="mast-head">
		<div class="container">
			<h1 class="bi">
				<!-- <a href="https://www.lpoint.com/" onclick="return fnWindowOpen(this.href);" target="_blank"><img src="/resources/images/common/bi-lpoint.png" alt="L.POINT"></a> -->

				<a href="./Main.aim" onclick="return fnWindowOpen(this.href);"
					target="_blank"><img src="https://ifh.cc/g/RGtYO5.png"
					alt="AIM홈페이지"></a>
			</h1>
		</div>
	</div>
	<!-- //header -->


<!-- mast body -->
<div id="mast-body">
	<div class="container">
		<!-- toparea -->
		<div class="toparea">
			<h2 class="title">회원가입<!-- 회원가입 --></h2>   
			<div class="step __2">
				<div class="step-desc">짠! 벌써<br>마지막 단계에요!<!-- 짠! 벌써<br>마지막 단계에요! --></div>
			</div>
		</div>
		<!-- //toparea -->

		<!-- contents -->
		<div class="contents">
			<!-- section : 정보입력 -->
			<div class="section __half">
				<h3 class="subject __underline">
					<em>회원정보입력<!-- 회원정보입력 -->
						<span class="__require-info __point-color"><small>*는 필수입력 항목입니다.<!-- *는 필수입력 항목입니다. --></small></span>
					</em>
				</h3>
				<!-- 아이디 -->
				<div class="row _none" id="div-cstNm">
					<div class="col-md">
						<label for="cstNm"><em class="__point-color">*</em>아이디<!-- 아이디 --></label>
					</div>
					<div class="col-md">
						<div class="form-wrap __normal">
							<div class="ui-input">
								<input type="text" id="cstNm" title="아이디를 입력해주세요." maxlength="13"> <!-- 아이디를 입력해주세요 -->
								<span class="placeholder">영문으로 입력해주세요.<!-- 한글 또는 영문으로 입력해주세요. --></span>
							</div>
						</div>
					</div>
				</div>
				<!-- 아이디 -->
				<div class="section rowgroup" id="div-elcAdd">
					<!-- 이름 -->
					<div class="row">
						<div class="col-md">
							<label for="elcAdd"><em class="__point-color">*</em>이름<!-- 본인 이름 --></label>
						</div>
						<div class="col-md">
							<div class="form-wrap __normal __x1">
								<div class="inner">
									<div class="ui-input">
										<input type="text" id="elcAdd" title="이름을 입력해주세요." class="" maxlength="10"><!-- 이름을 입력해주세요. -->
										<span class="placeholder">이름을 입력해주세요.<!-- 이름을 입력해주세요. --></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 닉네임 -->
					<div class="row">
						<div class="col-md">
							<label for="ctfMg"><em class="__point-color">*</em>닉네임<!-- 닉네임 --></label>
						</div>
						<div class="col-md">
							<div class="form-wrap __normal __x1">
								<div class="inner">
									<div class="ui-input">
										<input type="text" id="ctfMg" maxlength="10" title="닉네임을 입력해주세요." class=""><!-- 닉네임을 입력해주세요. -->
										<span class="placeholder">닉네임을 입력해주세요.<!-- 닉네임을 입력해주세요. --></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 이메일 -->
				<div class="row _none" id="div-cstNm">
					<div class="col-md">
						<label for="cstNm"><em class="__point-color"></em>이메일<!-- 이메일 --></label>
					</div>
					<div class="col-md">
						<div class="form-wrap __normal">
							<div class="ui-input">
								<input type="text" id="cstNm" title="이메일을 입력해주세요." maxlength="20"> <!-- 이메일 입력해주세요 -->
								<span class="placeholder">이메일을 입력해주세요.<!-- 이메일을 입력해주세요. --></span>
							</div>
						</div>
					</div>
				</div>
				<!-- 이메일 -->
				<!-- 비밀번호 -->
				<div class="row" id="div-pswd">
					<div class="col-md">
						<label for="onlCstPswd"><em class="__point-color">*</em>비밀번호<!-- 비밀번호 --></label>
						<!-- SSO페이지 수정 비밀번호규칙 안내문구 추가 MYENG 3.26 -->
						<div class="tooltip-container">
			              <button type="button" class="tooltip-trigger" onclick="$(this).parent().toggleClass('active');">설명보기</button>
			              <div class="tooltip-content">
			                <p class="tooltip-title"><b>비밀번호 입력 시 아래 규칙을 참고해주세요!</b></p>
			                <p>1. 비밀번호는 영문자,숫자,특수기호의 조합으로 <b>8~15자리</b>를 사용해야합니다.</p>
			                <p>2. 특수기호는 <b>? = . *  [ # ? ! @ $ % ^ & * -</b> 만 사용 가능합니다.</p>
			                <p>3. 연속된 문자열을 <b>3자 이상</b> 사용할 수 없습니다.</p>
			                <p>4. 동일한 문자열을 <b>3자 이상</b> 사용할 수 없습니다.</p>
			                <p>5. <b>아이디가포함된</b> 비밀번호를 사용할 수 없습니다.</p>
			              </div>
			            </div>
					</div>
					<div class="col-md">
						<div class="form-wrap __normal">
							<div class="inner">
								<div class="ui-input">
									<input type="password" id="onlCstPswd" title="비밀번호를 입력해주세요." maxlength="20" class="" aria-autocomplete="list">
									<span class="placeholder">비밀번호를 입력해주세요.<!-- 비밀번호를 입력해주세요. --></span>
								</div>
							</div>
							<span class="__point-color"><small>8-20자리의 대소문자/숫자/특수기호를 함께 입력해주세요.<!-- 8-20자리의 대소문자/숫자/특수기호를 함께 입력해주세요. --></small></span>
							<div class="inner">
								<div class="ui-input">
									<input type="password" id="onlCstPswdChk" title="입력하신 비밀번호를 다시 한번 입력해주세요." maxlength="20">
									<span class="placeholder">입력하신 비밀번호를 다시 한번 입력해주세요.<!-- 입력하신 비밀번호를 다시 한번 입력해주세요. --></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 휴대폰 번호 -->
				<div class="row" id="div-mblNo">
					<div class="col-md">
						<label for="tcccDc"><em class="__point-color">*</em>휴대폰 번호<!-- 휴대폰 번호 --></label>
					</div>
					<div class="col-md">
						<div class="form-wrap __mobile __telecom">
							<div class="inner"> 
								<select title="통신사" id="tcccDc" name="tcccDc" class="ui-select"><!-- 통신사 -->
									
										<option value="1">SKT</option>
									
										<option value="2">KT</option>
									
										<option value="3">LGU+</option>
									
										<option value="4">SKT알뜰폰</option>
									
										<option value="5">KT알뜰폰</option>
									
										<option value="6">LGU+알뜰폰</option>
									
										<option value="9">ETC</option>
									
								</select>
								<select title="통신사번호" id="mbzNoC" name="mbzNoC" class="ui-select"><!-- 통신사번호 -->
									<option value="">선택<!-- 선택 --></option>
									
										<option value="010">010</option>
									
										<option value="011">011</option>
									
										<option value="016">016</option>
									
										<option value="017">017</option>
									
										<option value="018">018</option>
									
										<option value="019">019</option>
									
								</select>
								<div class="ui-input">
									<input id="mmtExno" name="mmtExno" type="tel" onkeydown="return fnNumOnly(event);" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" style="ime-mode:disabled;" maxlength="4" title="휴대폰 번호 중간자리"><!-- 휴대폰 번호 중간자리 -->
								</div>
								<div class="ui-input">
									<input id="mtlno" name="mtlno" type="tel" onkeydown="return fnNumOnly(event);" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" style="ime-mode:disabled;" maxlength="4" title="휴대폰 번호 뒷자리"><!-- 휴대폰 번호 뒷자리 -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 생년월일 -->
				<div class="row" id="div-bird">
					<div class="col-md">
						<label for="birthday-y"><em class="__point-color">*</em>생년월일<!-- 생년월일 --></label>
					</div>
					<div class="col-md">
						<div class="form-wrap __date ui-check-date">
							<select id="birthday-y" class="ui-select" title="년도" data-default-option="년도" data-unit="y"><option value="">년도</option><option value="2022">2022</option><option value="2021">2021</option><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option></select>
							<select id="birthday-m" class="ui-select" title="월" data-default-option="월" data-unit="m"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
							<select id="birthday-d" class="ui-select" title="일" data-default-option="일" data-unit="d"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
						</div>
					</div>
				</div>        
			</div>
			<!-- //section -->

			<!-- section : 마케팅정보수신동의 -->
			<div class="section __half __expiry" id="div-cstMrktRcvYn">     
				<h3 class="subject __underline">
					<em>마케팅 정보 수신동의<!-- 마케팅 정보 수신동의 --></em>
				</h3>
				<div class="ui-check __toggle">
					<input type="checkbox" id="all-agreement" data-trigger="#marketing-agreement" class="ui-allchk-btn ui-allchk-group1" data-separator-number="1">
					<label for="all-agreement">전체동의<!-- 전체동의 --></label>
				</div>
				<div class="row ui-allchk-wrap ui-allchk-group1" id="marketing-agreement" data-separator-number="1">
					<div class="col-md">
						<div class="form-wrap __agreement">
							<!-- 제휴사 유효기간 설정 loop -->
							<div class="row" id="div-mbMrktRcvYn">    
								<div class="col-md">
									<label id="txt-lpointNm">수신방법</label>
								</div>
								<div class="col-md">
									<div class="ui-check">
										<input type="checkbox" id="mbMlRcvYn" name="mbMlRcvYn" class="ui-allchk-el ui-allchk-group1" data-separator-number="1">
										<label for="mbMlRcvYn" title="E-Mail">카카오톡<!-- E-Mail --></label>
									</div>
									<div class="ui-check">
										<input type="checkbox" id="mbSmsRcvYn" name="mbSmsRcvYn" class="ui-allchk-el ui-allchk-group1" data-separator-number="1">
										<label for="mbSmsRcvYn" title="SMS">SMS<!-- SMS --></label>
									</div>
									<div class="ui-check">
										<input type="checkbox" id="mbSmsRcvYn" name="mbSmsRcvYn" class="ui-allchk-el ui-allchk-group1" data-separator-number="1">
										<label for="mbSmsRcvYn" title="SMS">미동의<!-- SMS --></label>
									</div>

									<div class="description">
										<p>AIM 및 제휴사에서 진행하는 AIM 회원 맞춤 이벤트, 혜택 등 광고성 정보를 받으실 수 있습니다.<!-- L.POINT 및 제휴사에서 진행하는 L.POINT 회원 맞춤 이벤트, 혜택 등 광고성 정보를 받으실 수 있습니다. --></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //section -->

			<!-- section : 개인정보유효기간 -->
				<div class="section __half __expiry" id="div-cstVltrmMg">
					<h3 class="subject __underline">
						<em>개인정보 유효기간<span class="__require-info __point-color"><small>*는
									필수입력 항목입니다.</small></span></em>
					</h3>
					<div class="row">
						<div class="col-md">
							<div class="form-wrap __agreement">
								<div class="row">
									<div class="col-md">
										<label><em class="__point-color">*</em><span>유효기간</span></label>
									</div>
									<div class="col-md">
										<div class="ui-radio">
											<input type="radio" id="10090-privacy" name="1009" value="1"><label
												for="10090-privacy">1년</label>
										</div>
										<div class="ui-radio">
											<input type="radio" id="10091-privacy" name="1009" value="9"><label
												for="10091-privacy">탈퇴시 파기</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="description">
						<p>개인정보 유효기간 경과 이후 개인정보를 분리 저장/관리 또는 파기합니다.</p>
					</div>
				</div>
				<!-- //section -->

			<!-- btn -->
			<div class="btn-area __center">
				<button type="button" class="ui-button __square-large __black" onclick="fnBack();">이전<!-- 이전 --></button>
				<button type="button" class="ui-button __square-large __point-color" id="delaychk" onclick="fnNextPage('/exBiz/join/esyMbrJoin_13_001');">다음<!-- 다음 --></button>
			</div>
		</div>
		<!-- //contents -->
	</div>
</div>
<!-- //mast body -->
<input type="hidden" id="ctfYn" name="ctfYn" value="N">
<input type="hidden" id="onlId" name="onlId" value="">

<!-- 기준정보 고객 마케팅 수신정보 hidden -->
<input type="hidden" id="lpointEmailRcvYnBk" name="lpointEmailRcvYnBk" value="">
<input type="hidden" id="lpointSmsRcvYnBk" name="lpointSmsRcvYnBk" value="">
<input type="hidden" id="lpointTmRcvYnBk" name="lpointTmRcvYnBk" value="">
<input type="hidden" id="lpointDmRcvYnBk" name="lpointDmRcvYnBk" value="">
<input type="hidden" id="ccoEmailRcvYnBk" name="ccoEmailRcvYnBk" value="">
<input type="hidden" id="ccoSmsRcvYnBk" name="ccoSmsRcvYnBk" value="">
<input type="hidden" id="ccoTmRcvYnBk" name="ccoTmRcvYnBk" value="">
<input type="hidden" id="ccoDmRcvYnBk" name="ccoDmRcvYnBk" value="">

<input type="hidden" id="mbCstVltrmDcBk" name="mbCstVltrmDcBk" value="">
<input type="hidden" id="ccoCstVltrmDcBk" name="ccoCstVltrmDcBk" value="">

<form name="formBack" action="/exView/join/mbrJoin_12_001" id="formBack" method="post"></form>
<form name="formNext" id="formNext" method="post">
	<input type="hidden" id="prvAgIzData" name="prvAgIzData" value="">
	<input type="hidden" id="resultData" name="resultData" value="">
</form>	
<script src="/resources/js/join-signup.js"></script>
<script>
	$(document).ready(function(){
		fnPageTitle(I18n.getMessage('pg.title.mbrJoinS9003')); //정보입력 < 회원가입 < L.POINT
		
		selectDateCheck();         
		
 		var ccoNo 		= Common.getChannelData().ccoNo; 		// 제휴사 코드
		var svId 		= 'MBR_JOIN';										// 서비스ID
		var frnYn 		= Common.getChannelData().frnYn;
		var onlCstTpC = Common.getChannelData().onlCstTpC;
		var ageDc 		= '1';
		
  		var param = { 'ccoNo'		:ccoNo,
  							'svId'			:svId,
  							'frnYn'		:frnYn,
  							'onlCstTpC'	:onlCstTpC,
  							'ageDc'		:ageDc
				   		  };
  		// 서비스 기준정보 조회
		fnCallApi("/exBiz/cco/criInf_02_001", param, 'fnCriInfCallBack');  

	});
	
	function fnNextPage(url){
		if( fnDoDelay(5000, $('#delaychk')) )
			return false;
		
		var ccoSiteNo 			= Common.getChannelData().ccoSiteNo;	// 제휴사 코드
		var frnYn					= Common.getChannelData().frnYn; 		// 외국인여부
		var ctfYn					= $('#ctfYn').val();								// 인증여부
		var onlId 					= $('#onlId').val();								// 아이디
		var elcAdd 					= $('#elcAdd').val(); 							// 전자주소
		var onlCstPswd 			= $('#onlCstPswd').val();						// 패스워드
		var onlCstPswdChk		= $('#onlCstPswdChk').val();					// 패스워드 체크
		var cstNm					= $('#cstNm').val(); 								// 고객명

		var tcccDc 				= $('#tcccDc').val();								// 통신사구분코드
		var mbzNoC 				= $('#mbzNoC').val(); 							// 이동전화사업자번호
		var mmtExno 				= $('#mmtExno').val();							// 이동전화국번
		var mtlno 					= $('#mtlno').val();								// 이동전화개별번호
		
		var bird						= '';													// 생년월일
		var year 					= $('#birthday-y').val();						// 년
		var mon 					= $('#birthday-m').val();						// 월
		var day 						= $('#birthday-d').val();						// 일
		
		var lpointEmailRcvYn 	= $('#lpointEmailRcvYnBk').val();				// Lpoint EMAIL 수신여부
		var lpointSmsRcvYn 		= $('#lpointSmsRcvYnBk').val();				// Lpoint SMS 수신여부
		var lpointTmRcvYn 		= $('#lpointTmRcvYnBk').val();				// Lpoint TM 수신여부
		var lpointDmRcvYn 		= $('#lpointDmRcvYnBk').val();				// Lpoint DM 수신여부
		var ccoEmailRcvYn 		= $('#ccoEmailRcvYnBk').val();				// 제휴사 EMAIL 수신여부
		var ccoSmsRcvYn 		= $('#ccoSmsRcvYnBk').val();					// 제휴사 SMS 수신여부
		var ccoTmRcvYn 			= $('#ccoTmRcvYnBk').val();					// 제휴사 TM 수신여부
		var ccoDmRcvYn 			= $('#ccoDmRcvYnBk').val();					// 제휴사 DM 수신여부
		var prvAgList 				= JSON.parse(Common.getChannelData().prvAgList);			// 약관정보
		
		for(var i in criInfData.mbrSvAtcList){ // 필수 여부 체크
			var mbrSvAtc = criInfData.mbrSvAtcList[i];
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.mndtYn == 'Y' && mbrSvAtc.atcDc == 'cstNm'){
				
				if(checkIsEmpty(cstNm)){
					alert(I18n.getMessage('ch.mobHs.alt.ckNmI')); // 이름을 입력해주세요.
					$('#cstNm').focus();
					return false;
				}
			}
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'elcAdd'){
				
				if(ctfYn == 'N'){
					alert(I18n.getMessage('ch.Email.alt.ckCtfGud7')); // 이메일 인증을 해주세요.
					$('#elcAdd').focus();
					return false;
				}else if(ctfYn == 'E'){
					alert(I18n.getMessage('ch.Email.alt.ckCtfGud6')); // 인증된 이메일 주소가 변경 되었거나 인증이 되지 않았습니다.\n 이메일 인증을 해주세요.
					$('#elcAdd').focus();
					return false;
				}
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'pswd'){
				// 비밀번호 일치 검증
				if(onlCstPswd != onlCstPswdChk){
					alert(I18n.getMessage('ch.pswd.alt.mndt1')); // 비밀번호가 일치하지 않습니다.
					$('#onlCstPswdChk').focus();
					return false;
				}
				// 비밀번호 유효성 검증
				if(!checkIsPassword(onlCstPswd)){
					$('#onlCstPswd').focus();
					return false;
				}
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'mblNo'){
				if(mbrSvAtc.mndtYn == 'Y'){
					if(checkIsEmpty(mbzNoC) && checkIsEmpty(mmtExno) && checkIsEmpty(mtlno)){
						alert(I18n.getMessage('ch.mobHs.alt.mndt1')); // 휴대폰 번호가 입력되지 않았습니다.
						$('#mbzNoC').focus();
						return false;
					}
					if(!fnMobNoChk(mbzNoC, mmtExno, mtlno)){return false;} // 휴대폰번호 유효성 검증
				
				}else{ // 필수값이 아닐때 휴대폰번호 유효성 검증
					
					if(!checkIsEmpty(mbzNoC) || !checkIsEmpty(mmtExno) || !checkIsEmpty(mtlno)){
						if(!fnMobNoChk(mbzNoC, mmtExno, mtlno)){return false;} // 휴대폰번호 유효성 검증
					}else{
						tcccDc 	= '';	// 통신사구분코드
					}
				}
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'bird'){
				if(mbrSvAtc.mndtYn == 'Y'){
					if(checkIsEmpty(year) && checkIsEmpty(mon) && checkIsEmpty(day)){
						alert(I18n.getMessage('co.in.birdInGudExpr')); // 생년월일을 입력해 주세요.
						$('#birthday-y').focus();
						return false;
					}
					if(!fnBirdChk(year, mon, day, 'birthday-y', 'birthday-m', 'birthday-d')){return false;} // 생년월일 유효성 검증
					
				}else{// 필수값이 아닐때 생년월일 유효성 검증
					if(!checkIsEmpty(year) || !checkIsEmpty(mon) || !checkIsEmpty(day)){
						
						if(!fnBirdChk(year, mon, day, 'birthday-y', 'birthday-m', 'birthday-d')){return false;} // 생년월일 유효성 검증
					}
				}
				var m = (mon.length == 1) ? '0'.concat(mon) : mon;
				var d = (day.length == 1) ? '0'.concat(day) : day;
				bird = year.concat(m.concat(d));
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'mbMlRcvYn'){
				if($('#mbMlRcvYn').prop('checked')){lpointEmailRcvYn = 'Y';}else{lpointEmailRcvYn = 'N';}
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'mbSmsRcvYn'){
				if($('#mbSmsRcvYn').prop('checked')){lpointSmsRcvYn = 'Y';}else{lpointSmsRcvYn = 'N';}
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'mbTmRcvYn'){
				if($('#mbTmRcvYn').prop('checked')){lpointTmRcvYn = 'Y';}else{lpointTmRcvYn = 'N';}
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'mbDmRcvYn'){
				if($('#mbDmRcvYn').prop('checked')){lpointDmRcvYn = 'Y';}else{lpointDmRcvYn = 'N';}
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'ccoMlRcvYn'){
				if($('#ccoMlRcvYn').prop('checked')){ccoEmailRcvYn = 'Y';}else{ccoEmailRcvYn = 'N';}
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'ccoSmsRcvYn'){
				if($('#ccoSmsRcvYn').prop('checked')){ccoSmsRcvYn = 'Y';}else{ccoSmsRcvYn = 'N';}
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'ccoTmRcvYn'){
				if($('#ccoTmRcvYn').prop('checked')){ccoTmRcvYn = 'Y';}else{ccoTmRcvYn = 'N';}
			}
			
			if(mbrSvAtc.srnMarkYn == 'Y' && mbrSvAtc.atcDc == 'ccoDmRcvYn'){
				if($('#ccoDmRcvYn').prop('checked')){ccoDmRcvYn = 'Y';}else{ccoDmRcvYn = 'N';}
			}
		}
		
		var lpointCstVltrmDc 	= $('#mbCstVltrmDcBk').val();
		var ccoCstVltrmDc 		= $('#ccoCstVltrmDcBk').val();
		
		if(criInfData.cstVltrmMgList != null){
			if(__cstVltrmDc[0] == 'Y'){
				if(criInfData.cstVltrmMgList[0].ccoNo != null){
					lpointCstVltrmDc 	= $('input:radio[name="'+criInfData.cstVltrmMgList[0].ccoNo+'"]:checked').val(); // 고객유효기간구분코드 Lpoint
					
					if(checkIsEmpty(lpointCstVltrmDc)){
						alert(I18n.getMessage('ch.join.alt.cstVltrmDc')); // 고객정보유효기간을 선택해 주세요.
						return false;
					}
				}
			}
			if(__cstVltrmDc[1] == 'Y'){
				if(criInfData.cstVltrmMgList.length > 1){
					if(criInfData.cstVltrmMgList[1].ccoNo != null){
						ccoCstVltrmDc 		= $('input:radio[name="'+criInfData.cstVltrmMgList[1].ccoNo+'"]:checked').val(); // 고객유효기간구분코드 제휴사
						
						if(checkIsEmpty(ccoCstVltrmDc)){
							alert(I18n.getMessage('ch.join.alt.cstVltrmDc')); // 고객정보유효기간을 선택해 주세요.
							return false;
						}	
					}
				}
			}
		}
		
  		var param = { 'ccoSiteNo'				:ccoSiteNo				,
  							'frnYn'					:frnYn					,
  							'ctfYn'					:ctfYn					,
  							'cstNm'					:cstNm					,
  							'elcAdd'					:elcAdd					,
  							'onlId'						:onlId						,
							'onlCstPswd'			:onlCstPswd			,
							'tcccDc'					:tcccDc					,
							'mbzNoC'					:mbzNoC					,
							'mmtExno'				:mmtExno				,
							'mtlno'					:mtlno					,
							'bird'						:bird						,
							'lpointEmailRcvYn'		:lpointEmailRcvYn		,
							'lpointSmsRcvYn'		:lpointSmsRcvYn		,
							'lpointTmRcvYn'		:lpointTmRcvYn		,
							'lpointDmRcvYn'		:lpointDmRcvYn		,
							'ccoEmailRcvYn'		:ccoEmailRcvYn		,
							'ccoSmsRcvYn'			:ccoSmsRcvYn			,		
							'ccoTmRcvYn'			:ccoTmRcvYn			,
							'ccoDmRcvYn'			:ccoDmRcvYn			,
							'lpointCstVltrmDc'		:lpointCstVltrmDc		,
							'ccoCstVltrmDc'		:ccoCstVltrmDc		,
							'prvAgList'				:prvAgList
	  					};

		// 일반 회원가입 처리
		fnCallApi(url, param, 'fnEsyMbrJoinPcBack');
	}
	
	// 가입처리 콜백
	function fnEsyMbrJoinPcBack(data){
		if(data.rspClac == 'S'){
			$('#prvAgIzData').val(JSON.stringify(data));
			fnNext('/exView/join/mbrJoin_08_001');	
			
		}else if(data.rspClac == 'E'){
			$('#resultData').val(JSON.stringify(data));
			fnNext('/exView/join/mbrJoin_08_004');
			
		}else if(data.rspClac == 'A'){
			alert(I18n.getMessage('ch.join.alt.'.concat(data.rspC.concat(data.rspDtc)))); // 유효성 검증 실패시 리턴 코드별 안내 메세지 
			var reCode =  data.rspC.concat(data.rspDtc); 
			if(reCode != '44401' && reCode != '44114' && reCode != '44121'){
				$('#onlCstPswd').focus();
				return false;
			}
		}
	}
	
	// 이메일 onKeyUp 이벤트(ctfYn E)
	function fnElcAddCtfYnFlagChange(){
		$('#ctfYn').val('E');
		$('#onlId').val('');
	}
</script>


<!-- Footer -->
<div id="mast-foot">
	<div class="container">
		<div class="utility">
			<div class="item"><a href="http://www.lottemembers.com/">회사소개<!-- 회사소개 --></a></div>
			<div class="item"><a href="https://m.lpoint.com/app/center/LWDE100100.do">고객센터<!-- 고객센터 --></a></div>
			<div class="item"><a href="https://m.lpoint.com/app/center/LWDD100100.do">이용약관<!-- 이용약관 --></a></div>
			<div class="item"><a href="https://m.lpoint.com/app/center/LWDD100100.do?popup=4"><em class="__point-color">개인정보처리방침<!-- 개인정보처리방침 --></em></a></div>
		</div>
		<div class="com-address">
			<address>
				<span>서울시 중구 통일로 2길 16 AIA타워 14층<!-- 서울시 중구 통일로 2길 16 AIA타워 14층 --></span>
				<span>회사명 롯데멤버스(주)<!-- 회사명 롯데멤버스(주) --></span>
				<span>대표이사 전형식<!-- 대표이사 강승하 --></span>
				<span>사업자등록번호 104-86-58491<!-- 사업자등록번호 104-86-58491 --></span>
				<span>고객센터 1899-8900<!-- 고객센터 1899-8900 --></span>
			</address>
		</div>
		<div class="copyright">© LOTTE MEMBERS CO.,LTD.</div>
		<div class="friendly">
			<div class="site-linker">
				<button type="button" role="button" class="">Service Site<!-- Service Site --></button>
				<ul>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="https://www.lpoint.com">L.POINT<!-- L.POINT --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="https://www.lpay.com">L.pay<!-- L.pay --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="https://www.lime-in.co.kr">라임<!-- 라임 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="https://partners.lpoint.com">L.POINT 파트너스<!-- L.POINT 파트너스 --></a></li>
				</ul>
			</div>
			<div class="site-linker">
				<button type="button" role="button">Family Site<!-- Family Site --></button>
				<ul>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lotte.co.kr">롯데그룹<!-- 롯데그룹 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lottetown.com">롯데타운<!-- 롯데타운 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lotte.com/">롯데닷컴<!-- 롯데닷컴 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lottemart.com/">롯데마트<!-- 롯데마트 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.vic-market.com/vicmarket/main.do">롯데빅마켓<!-- 롯데빅마켓 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.toysrus.co.kr/to/main.do">토이저러스<!-- 토이저러스 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lottesuper.co.kr/">롯데슈퍼<!-- 롯데슈퍼 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lotteimall.com/main/Index.jsp">롯데홈쇼핑<!-- 롯데홈쇼핑 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.7-eleven.co.kr/">바이더웨이<!-- 바이더웨이 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.7-eleven.co.kr/">세븐일레븐<!-- 세븐일레븐 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.himart.co.kr/">하이마트<!-- 하이마트 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.fujifilm.co.kr/">한국후지필름<!-- 한국후지필름 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lohbs.co.kr/main.do">LOHB's<!-- LOHB's --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.ellotte.com/">롯데백화점<!-- 롯데백화점 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://kr.lottedfs.com/main">롯데면세점<!-- 롯데면세점 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lottefitin.com">롯데피트인<!-- 롯데피트인 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://gimpoairport.lottemall.co.kr">롯데몰 김포공항점<!-- 롯데몰 김포공항점 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lwt.co.kr">롯데월드몰<!-- 롯데월드몰 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=021&amp;gubun=2">롯데영플라자<!-- 롯데영플라자 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=057">롯데아울렛<!-- 롯데아울렛 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=054&amp;gubun=1">롯데프리미엄아울렛<!-- 롯데프리미엄아울렛 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.mujikorea.net/">무인양품<!-- 무인양품 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.uniqlo.kr/">유니클로<!-- 유니클로 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lotteria.com/">롯데리아<!-- 롯데리아 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.angelinus.co.kr/">엔제리너스커피<!-- 엔제리너스커피 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.tgif.co.kr/">T.G.I FRIDAY'S<!-- T.G.I FRIDAY'S --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.natuur.co.kr/">나뚜루POP<!-- 나뚜루POP --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.krispykreme.co.kr/">크리스피크림도넛<!-- 크리스피크림도넛 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.boulangerie.co.kr/">보네스뻬<!-- 보네스뻬 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lottecinema.co.kr/">롯데시네마<!-- 롯데시네마 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lotteworld.com/">롯데월드 어드벤처<!-- 롯데월드 어드벤처 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lotteworld.com/aquarium/index.asp">롯데월드 아쿠아리움<!-- 롯데월드 아쿠아리움 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lotteworld.com/waterpark/index.asp">롯데 워터파크<!-- 롯데 워터파크 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.giantsclub.com/">롯데자이언츠<!-- 롯데자이언츠 --></a></li>
					<li><a target="_blank" onclick="return fnWindowOpen(this.href);" title="새 창" href="http://www.lottejtb.com/">롯데제이티비<!-- 롯데제이티비 --></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>


</body>



</html>