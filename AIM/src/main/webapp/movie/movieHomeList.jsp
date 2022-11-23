<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 영화 홈</title>

<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp" />

<!-- 상위 배너 -->
<jsp:include page="../inc/topbanner.jsp"/>

<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp" />

<!-- 영화 배너 스크립트 --> 
<script type="text/javascript">
$(document).ready(function() {
	

	 $('.owl-one').owlCarousel({
		items : 1, // 한번에 보여줄 아이템 수
		loop : true, // 반복여부
		margin : 0, // 오른쪽 간격
		autoplay : true, // 자동재생 여부
		autoplayTimeout : 5000, // 재생간격
		autoplayHoverPause : false, //마우스오버시 멈출지 여부
		mouseDrag : false,
		touchDrag : false

	});
});
</script>


</head>
<body>


<!-- 영화 홈 배너 -->
<div id="visual_top" class="visual_top visual_theater_detail" style="">
		<div class="inner">
			<div class="slide_wrap full slide_cinema_home_visual">
				<div class="owl-one owl-carousel owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage"
							style="transform: translate3d(-5760px, 0px, 0px); transition: all 0.25s ease 0s; width: 11520px;">

							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1280720.mp4"
										alt="아바타 물의길 판도라의 바다 새로운 세계가 펼쳐진다 12월 대개봉 관람등급미정"></a>
								</div>
							</div>
							<div class="owl-item active" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1280720.mp4"
										alt=""></a>
								</div>
							</div>
							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/boo_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/boo_1280720.mp4"
										alt="극장판 뽀로로와 친구들 바이러스를 없애줘 전체관람가 12월 1일 롯데시네마에서 만나요 네모바이러스의 습격 친구들을 구하라"></a>
								</div>
							</div>

							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1280720.mp4"
										alt="아바타 물의길 판도라의 바다 새로운 세계가 펼쳐진다 12월 대개봉 관람등급미정"></a>
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


<br><br><br><br><br><br><br><br><br><br><br><br>


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