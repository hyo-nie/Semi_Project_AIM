<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재상영작</title>
</head>
<body>
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp" />
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp" />
	<br><br><br><br>
	<div id="contents" class="contents_movie_list">
		<h2 class="hidden">영화목록</h2>
		<div class="movie_screen_box">
			<ul class="tab_btn_type1">
				<li class="active"><button type="button"><span>현재 상영작</span></button></li>
			</ul>
			<ul class="list_lnk" id="movietype1">
				<li class="on"><a href="javascript:void(0)" role="button">예매순</a></li>
				<li><a href="javascript:void(0)" role="button">개봉일순</a></li>
				<li><a href="javascript:void(0)" role="button">관람평 많은순</a></li>
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


	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>