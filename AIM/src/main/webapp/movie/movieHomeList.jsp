<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 상위 배너 -->
<jsp:include page="../inc/topbanner.jsp"/>

<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp" />

<div id="visual_top" class="visual_top visual_movie_home" style="margin-top: 120px;">
	<div class="inner">
		<div class="slide_wrap slide_visual_movie_home">
			<div class="owl-carousel owl-loaded owl-drag">
				<div class="owl-stage-outer">
					<div class="owl-stage" style="transform: translate3d(-5760px, 0px, 0px); transition: all 0.25s ease 0s; width: 11520px;">
						<div class="owl-item cloned" style="width: 1920px;">
							<div class="item">
								<a href="#none">
									<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1108/ST_1920420.jpg" data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1110/ST_1280720.mp4" alt="">
								</a>
							</div>
						</div>
						<div class="owl-item cloned" style="width: 1920px;">
							<div class="item">
								<a href="#none">
									<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1920420.jpg" data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1280720_1.mp4" alt="">
								</a>
							</div>
						</div>
						<div class="owl-item" style="width: 1920px;">
							<div class="item">
								<a href="#none">
									<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1108/ST_1920420.jpg" data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1110/ST_1280720.mp4" alt="">
								</a>
							</div>
						</div>
						<div class="owl-item active" style="width: 1920px;">
							<div class="item">
								<a href="#none">
									<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1920420.jpg" data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1280720_1.mp4" alt="">
								</a>
							</div>
						</div>
						<div class="owl-item cloned" style="width: 1920px;">
							<div class="item">
								<a href="#none">
									<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1108/ST_1920420.jpg" data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1110/ST_1280720.mp4" alt="">
								</a>
							</div>
						</div>
						<div class="owl-item cloned" style="width: 1920px;">
							<div class="item">
								<a href="#none">
									<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1920420.jpg" data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1280720_1.mp4" alt="">
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="owl-nav" style="width: 999px; margin-left: -499.5px;">
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
					<button role="button" class="owl-dot active">
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

</head>
<body>

<br><br><br><br><br><br><br><br><br><br><br><br>

<h2>MovieHomeList.jsp</h2>

<table border="1">
  <tr>
    <td>포스터</td>
    <td>영화명</td>
    <td>관람등급</td>
    <td>상세정보클릭버튼</td>
  </tr> 

  <c:forEach var="movie" items="${movieList }" >
    <tr>
      <td onclick="location.href='./MovieDetail.mv?movieCd=${movie.movieCd}';">${movie.poster }</td>
      <td>${movie.movieNm }</td>
      <td>${movie.watchGradeNm }</td>
      <td onclick="location.href='./MovieDetail.mv?movieCd=${movie.movieCd}';">상세정보</td>
    </tr> 
   </c:forEach>
</table>



<div id="contents" class="contents_movie_list">
		<h2 class="hidden">영화목록</h2>
		<div class="movie_screen_box">
			<ul class="tab_btn_type1">
				<li class="active"><button type="button"><span>AIM's 추천 영화</span></button></li>
			</ul>

			
			<ul class="movie_list type2">
			  <c:forEach var="movie" items="${movieList }">
				<li class="screen_add_box"><div class="top_info">
						<span class="poster_info">
						<a href="./MovieDetail.mv?movieCd=${movie.movieCd}">
							<img src="${movie.poster }"	alt="영화명"></a>
							<em class="num_info">${movie.boxrank }</em>
							<span class=
								<c:if test="${movie.watchGradeNm.equals('12세이상관람가') }">
									"ic_grade gr_12"
								</c:if>
								<c:if test="${movie.watchGradeNm.equals('15세이상관람가') }">
									"ic_grade gr_15"
								</c:if>
								<c:if test="${movie.watchGradeNm.equals('18세이상관람가') }">
									"ic_grade gr_18"
								</c:if>
								<c:if test="${movie.watchGradeNm.equals('전체관람가') }">
									"ic_grade gr_all"
								</c:if>>
							</span>
					 	</span>
 						<div class="over_box"> 
							<div class="inner" style="margin-top: -33px;"> 
								<a href="./Ticketing.tk?movieCd=${movie.movieCd}"
 									class="btn_col3 ty3">예매하기</a> 
								<a href="./MovieDetail.mv?movieCd=${movie.movieCd}"
 									class="btn_col3 ty3">상세정보</a> 
 							</div>
 						</div>
					</div>
					<div class="btm_info">
						<strong class="tit_info">${movie.movieNm }</strong>
						<span class="sub_info1">
							<span class="rate_info"><em>예매율 ${movie.bookRating }%</em></span>
						</span>
					</div>
				</li>
			  </c:forEach>	
			</ul>
		</div>
	</div>


</body>
</html>