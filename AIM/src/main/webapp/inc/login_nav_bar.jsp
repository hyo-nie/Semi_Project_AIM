<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Login - AIM</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">

<meta id="description">
<meta id="Keywords">
<link href="./Main.aim">
<script type="text/javascript" src="https://tag-deepad.lpoint.com/cookie?mid=4&amp;cid=1154777567.1667836528"></script>
<script type="text/javascript" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" src="https://www.googletagmanager.com/gtag/js?id=UA-164790289-1&amp;l=dataLayer&amp;cx=c"></script>
<script src="//dsp.dmcmedia.co.kr/selper/js/selperevt.js?ver=0.1.4.1"></script>
<script src="https://connect.facebook.net/signals/config/233523444404890?v=2.9.89&amp;r=stable"></script>
<script src="https://connect.facebook.net/en_US/fbevents.js"></script>
<script src="https://www.googletagmanager.com/gtag/js?id=UA-164790289-1"></script>
<script src="https://www.googletagmanager.com/gtm.js?id=GTM-PJ6LCKF"></script>
<script src="https://www.googletagmanager.com/gtm.js?id=GTM-K8MP435"></script>
<script src="https://www.google-analytics.com/analytics.js"></script>

</script>
<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp" />


<script type="text/javascript">
	var MypageCommonQuery = RequestParams(document.location.search); //페이지 파라메터
</script>

<body>




	<noscript>
        <iframe
			src="https://www.googletagmanager.com/ns.html?id=GTM-K8MP435"
			height="0" width="0" style="display:none;visibility:hidden"></iframe>
    </noscript>
    

    
    <div id="loading" class="loader loader-bouncing is-active hidden"></div>
    

 <div id="header_section" class="header ty3">
	<h1 class="logo">
		<a href="./Main.aim"></a>
		<!-- aim 주소창 변경하기 -->
	</h1>
	<div class="gnb">
		<ul class="g_menu1">
			<li><a href="https://www.facebook.com" class="btn_facebook"
				target="_blank" title="AIM 페이스북 새창열림">페이스북</a></li>
			<!-- AIM 페이스북 주소 변경 -->
			<li><a href="https://www.youtube.com" class="btn_youtube"
				target="_blank" title="AIM 유튜브 새창열림">유튜브</a></li>
			<!-- AIM 유튜브 주소 변경 -->
			<li><a href="https://www.instagram.com" class="btn_follow"
				target="_blank" title="AIM 인스타그램 새창열림">인스타그램</a></li>
			<!-- AIM 인스타 주소 변경 -->
		</ul>
		<ul class="g_menu2">
			<li><a href="#">멤버십</a></li>
			<!-- 멤버십 주소 변경 -->
			<li><a href="#">고객센터</a></li>
			<!-- 고객센터 주소 변경 -->
			<li><a href="#">단체관람/대관문의</a></li>
			<!-- 단체/대관문의 -->

			<c:if test="${mb_id == null }">
				<li><a href="./Login.aim">로그인</a></li>
			</c:if>
			<!-- 로그인 x : 로그인 버튼 -->

			<c:if test="${mb_id != null }">
				<li><a onclick="logout();">로그아웃</a></li>
			</c:if>
			<!-- 로그인 o : 로그아웃 버튼 -->

		</ul>
		<ul class="g_menu3">

			<c:if test="${mb_id == null }">
				<li><a href="./JoinTerms.aim" class="btn_my">회원가입</a></li>
			</c:if>
			<!-- 로그인 x : 회원가입 버튼 -->

			<c:if test="${mb_id != null }">
				<li><a href="./MyPage.aim" class="btn_my">마이페이지</a></li>
			</c:if>
			<!-- 로그인 o : 마이페이지 버튼 -->

			<li><a href="./Ticketing.tk" class="btn_reserve">바로 예매</a></li>
			<!-- 바로예매 이동 -->
			<li><button class="btn_menu_all">전체 메뉴 레이어 열기</button>
				<div id="allmenu"></div></li>
		</ul>
	</div>
	<div id="nav" class="area__gnbmovingbar">
		<ul>
			<li class=""><a href="./Ticketing.tk">예매</a> <!-- 예매 임시 가상주소 입니다 자유롭게 변경해서 사용해주세요 -->
				<div>
					<ul>
						<li><a href="./Ticketing.tk" title="예매하기">예매하기</a></li>
						<li><a href="#" title="상영시간표">상영시간표</a></li>
						<li><a href="#" title="할인안내">할인안내</a></li>
					</ul>
				</div></li>
			<li class=""><a href="./MovieHomeList.mv">영화</a> <!-- 영화 임시 가상주소 입니다 자유롭게 변경해서 사용해주세요 -->
				<div>
					<ul>
						<li><a href="./MovieHomeList.mv" title="홈">홈</a></li>
						<li><a href="./MovieList.mv" title="현재상영작">현재상영작</a></li>
					</ul>
				</div></li>
				<li class=""><a href="#">영화관</a> <!-- 영화관은 상세영화관 클릭안하면 클릭해도 이동 없습니다 자유롭게 변경해서 사용해주세요 -->
					<div>
						<ul>
							<li><a href="./branch.th?branchCd=1" title="서면">서면</a></li>
							<li><a href="./branch.th?branchCd=2" title="해운대">해운대</a></li>
							<li><a href="./branch.th?branchCd=3" title="대연">대연</a></li>
							<li><a href="./branch.th?branchCd=4" title="사상">사상</a></li>
							<li><a href="./branch.th?branchCd=5" title="동래">동래</a></li>
						</ul>
					</div></li>
				<li class=""><a href="./Store.st">스토어</a> <!-- 스토어 임시 가상주소 입니다 자유롭게 변경해서 사용해주세요 -->
					<div>
						<ul>
							<li><a href="#" title="베스트">베스트</a></li>
							<li><a href="#" title="관람권">관람권</a></li>
							<li><a href="#" title="스낵음료">스낵음료</a></li>
							<li><a href="#" title="포토카드">포토카드</a></li>
						</ul>
					</div></li>
			<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
		</ul>
	</div>
</div>

    
    <div id="layerCommonAlert"
		class="layer_wrap layer_alert layer_wrap200"></div>
    <ul id="layerPopupMulti" class="layer_wrap layerMultiType"></ul>

    

    

<div id="contents" class="contents_full contents_member_comn" style="">
    <script src="/NLCHS/Scripts/common/aes.js"></script>
    <script src="/NLCHS/Scripts/common/sso.js?v=202211080103"></script>
    <script src="/NLCHS/Scripts/common/LcCommon.js?v=202211080103"></script>
    <script src="/NLCHS/Scripts/common/crossDomainStorage.js?v=202211080103"></script>
	<script src="/NLCHS/Scripts/Dist/Login.bundle.js?v=202211080103"></script>  
</div>


</head>

</html>