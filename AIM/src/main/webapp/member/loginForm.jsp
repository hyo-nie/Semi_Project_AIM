<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function ckLogin(){
		if(document.loginfr.mb_id.value==""){
			alert('아이디를 입력해주세요!');
			return false;
		}
		if(document.loginfr.mb_pw.value==""){
			alert('비밀번호를 입력해주세요!');
			return false;
		}
	}
		
</script>

<meta charset="UTF-8">
<title>AIM - Login</title>
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp" />
	<!-- 사이드 퀵메뉴 -->
	<jsp:include page="../inc/side_quick_menu.jsp" />

</head>
<body>


	<div id="loginContents"
		class="contents_full contents_member_comn area__movingbar litype3">
		<div class="tab_con">
			<div class="member_login_wrap">
				<div class="contents_inner">
					<div class="login_box" style="margin-top:65px;">
						<p class="tip">세상의 모든 영화 - All In Movie !</p>
						<div class="login_area">
							<form action="./LoginAction.aim" method="post" name="loginfr"
								onsubmit="return ckLogin()">
								<div>
									<input type="hidden" name="movieCd" value="${param.movieCd }">
									<input type="hidden" name="url" value="${param.url }">
									<input type="hidden" name="ticketing" value="${param.ticketing }">
									<input type="text" id="userId" maxlength="50"
										placeholder="아이디 또는 이메일을 입력해 주세요." title="입력태그" name="mb_id"><input
										type="password" id="userPassword" maxlength="15"
										placeholder="비밀번호를 입력해 주세요." title="입력태그" name="mb_pw"><input
										type="hidden" name="hidLoginType" id="hidLoginType" value="">
									<button type="submit" class="btn_login" style="background-color: #18315D;">로그인</button>
								</div>
							</form>
						</div>
						<div class="login_bot_wrap">
							<div class="login_check">
								<input type="checkbox" name="loginCheck" id="checkSavedID"><label
									for="checkSavedID">아이디 저장</label>
							</div>
							<div class="login_menu">
								<a href="./JoinTerms.aim" title="페이지 이동">회원가입</a> <a
									href="./FindId.aim" title="페이지 이동">아이디 찾기</a> <a
									href="./FindPw.aim" title="페이지 이동">비밀번호 찾기</a>
							</div>
						</div>
					</div>
					<!-- 								<div class="ad_box">
									<a
										href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_42&amp;adgroupid=adg_lottecinema_20221031_15&amp;adid=adi_lottecinema_20221031_15"
										target=""><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/Hyundaicard/Hyundaicard_450220.jpg"
										alt="상시 영화티켓 장당 6,000M포인트 사용 자세히보기"></a>
								</div> -->
				</div>
			</div>
		</div>
	</div>




	<!-- 하단배너 -->
	<jsp:include page="../inc/loginform_bottom_banner.jsp" />
	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>
