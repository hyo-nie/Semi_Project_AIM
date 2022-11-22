<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재상영작</title>
<jsp:include page="../inc/include.jsp" />
<script type="text/javascript">
	$(document).ready(function(){
			if ($('#orderFlag_sy').val() == "bookRating") {
				$('#2n').css({
				'color':'black',
				});
			} else if ($('#orderFlag_sy').val() == "openDt") {
				$('#3n').css({
					'color':'black',
					});
			} else {
				$('#1n').css({
					'color':'black',
					});
			}
	});

	
</script>

<style type="text/css">

.movie_screen_box .button {font-size:14px; color: maroon;}
.movie_screen_box .button1 {font-size:14px; color: #666;}
</style>
</head>
<body>
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp" />
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp" />
	<br><br><br><br>
	<div id="contents" class="contents_movie_list">
	<br><br><br><br><br><br><br><br><br>
		<h2 class="hidden">영화목록</h2>
		<div class="movie_screen_box">
			<ul class="tab_btn_type1">
				<li class="active"><button type="button"><span>현재 상영작</span></button></li>
			</ul>
				<input type="hidden" value="${param.orderFlag }" id="orderFlag_sy">
			<ul class="list_lnk" id="movietype1_sy">
		        <li id="btncl"><a id="1n" href="./MovieList.mv?orderFlag=boxrank" class="button1">인기순</a></li>
		        <li id="btncl"><a id="2n" href="./MovieList.mv?orderFlag=bookRating" class="button1" >예매순</a></li>
		        <li id="btncl"><a id="3n" href="./MovieList.mv?orderFlag=openDt" class="button1">개봉일순</a></li>
			</ul>
			
			<ul class="movie_list type2">
			 <c:set var="rank" value="1"></c:set>
			  <c:forEach var="movie" items="${movieList }">
				<li class="screen_add_box"><div class="top_info">
				    <div class="postercl">  
							<span class="poster_info">
							<a href="./MovieDetail.mv?movieCd=${movie.movieCd}">
							 <figure>
								<img src="${movie.poster }"	alt="영화명">
								<figcaption>상세정보</figcaption>
							 </figure>	
							</a>
								<em class="num_info">${rank }</em>
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
				    </div> 
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
							<span class="rate_info"><em>예매율 ${movie.bookRating }%</em></span><br>
							<button onclick="location.href='./Ticketing.tk?movieCd=${movie.movieCd}';" style="color:#fff; background:#18315D; width:75px; height:25px; margin:5px; border-radius:5px;">예매</button>
							<br>
						</span>
					</div>
				</li>
			   <c:set var="rank" value="${rank+1 }"></c:set>
			  </c:forEach>	
			</ul>
		</div>
	</div>


	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>