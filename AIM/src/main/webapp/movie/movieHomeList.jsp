<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 영화 홈</title>

<jsp:include page="../inc/include.jsp" />

<!-- 상위 배너 -->
<jsp:include page="../inc/topbanner.jsp"/>

<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp" />

<!-- 영화 배너 스크립트 --> <!-- 슬라이드 자동 재생 / 정지 버튼 기능 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="./NLCHS/Content/js/jquery-1.12.3.min.js"></script>
    <script src="./NLCHS/Content/js/jquery.jplayer.min.js"></script>
    <script src="./NLCHS/Content/js/jquery.lazy.min.js"></script>
    <script src="./NLCHS/Content/js/jquery-ui.min.js"></script>
    <script src="./NLCHS/Content/js/jquery.cookie.js"></script>
    <script src="./NLCHS/Content/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="./NLCHS/Content/js/owl.carousel-2.3.4-custom.js"></script>
    <script src="./NLCHS/Content/js/plugin.js"></script>
    <script src="./NLCHS/Content/js/pl_custom.js"></script>
    <script src="./NLCHS/Scripts/Library/moment.js"></script>
    <script type="text/javascript" src="https://members.lpoint.com/api/js/lotte.sso.api.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

    <script src="./NLCHS/Content/js/common.js"></script>
    <script src="./NLCHS/Content/js/common_lc21new.js"></script>
    <script src="./NLCHS/Scripts/common/Cookie.js"></script>
    
    <script src="./NLCHS/Scripts/Library/jquery.blockUI.min.js"></script>
    <script src="./NLCHS/Scripts/Library/React/remarkable.min.js"></script>
    <script src="./NLCHS/Scripts/Library/React/axios.min.js"></script>
    <script src="./NLCHS/Scripts/common/URLSearchParamsCustom.js"></script>
    <script src="./NLCHS/Scripts/common/Util.js"></script>
    <script src="./NLCHS/Scripts/common/Common.js"></script>
<!-- 영화 배너 스크립트 --> 


</head>
<body>


<!-- 영화 홈 배너 --> <!-- 뽀로로 포기 -->
<div id="visual_top" class="visual_top visual_theater_detail" style="">
		<div class="inner">
			<div class="slide_wrap full slide_cinema_home_visual">
				<div class="owl-one owl-carousel owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage"
							style="transform: translate3d(-5760px, 0px, 0px); transition: all 0.25s ease 0s; width: 11520px;">
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1108/ST_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1110/ST_1280720.mp4"
										alt=""></a>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1280720_1.mp4"
										alt=""></a>
								</div>
							</div>
						</div>
					</div>
					<div class="owl-nav" style="width: 2378px; margin-left: -1189px;">
						<button type="button" role="presentation" class="owl-prev">
							<span aria-label="Previous">‹</span>
						</button>
						<button type="button" role="presentation" class="owl-next">
							<span aria-label="Next">›</span>
						</button>
					</div>
					<div class="owl-dots">
						<button role="button" class="owl-dot">
							<span></span>
						</button>
						<button role="button" class="owl-dot active" style="">
							<span></span>
						</button>
					</div>
				</div>
				<div class="bx_ctrl" style="left: 990px;">
					<button class="play active">슬라이드 자동재생</button>
					<button class="stop">슬라이드 일시정지</button>
				</div>
			</div>
		</div>
	</div>
<!-- 영화 홈 배너 -->


<!-- 영화 홈 페이지 좌우 여백 틀 -->
<div id="contents" class="contents_movie_list">
	<h2 class="hidden">영화목록</h2>
		<div class="movie_screen_box">
<!-- 영화 홈 페이지 좌우 여백 틀 -->			





<br><br><br><br><br><br><br><br><br><br><br><br><br>


<!-- 영화 홈 페이지 추천영화 -->
<div class="movi_pre_list">
<h3 class="tit_type0">11월 AIM 추천영화  <strong class="ty2 eng">TOP 6</strong></h3>
	<ul class="homemovie_list">
	<c:forEach var="movie" items="${movieList }">
		<li class="">
			<div class="top_info">
				<span class="poster_info">
				<em class="tit_info">${movie.boxrank-10 }위</em>
					<img src="${movie.poster }"	alt="영화명">
				</span>
			</div>
			<div class="btm_info">
				<strong class="tit_info">${movie.movieNm }</strong>
				<span class="sub_info1"><span class="rate_info"> ${movie.actors } <br> ${movie.contents } </span></span>
			</div>
		</li>
	</c:forEach>	
	</ul>
</div>
<!-- 영화 홈 페이지 추천영화 -->
<!-- css 수정 : /* HOMEMOVIELIST */ /* 영화홈 */ -->

	
			
<!-- 영화 홈 페이지 좌우 여백 -->
		</div>
</div>
<!-- 영화 홈 페이지 좌우 여백 -->


<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />


</body>
</html>