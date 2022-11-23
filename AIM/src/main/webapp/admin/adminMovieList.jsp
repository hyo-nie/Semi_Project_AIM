<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 관리자 영화 정보 조회 페이지</title>

<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp"/>
<!-- 상위 배너 -->
<jsp:include page="../inc/topbanner.jsp"/>
<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp"/>

</head>
<body>

	<%
	// admin 전용 페이지 로그인 제어
	String mb_id = (String)session.getAttribute("mb_id");
	if(mb_id==null || !mb_id.equals("admin")){
		response.sendRedirect("./Login.aim");
		System.out.println("비정상적 접근 발생! IP : "+request.getRemoteAddr());
	}
	%>


	
<!-- 페이지 좌우 여백 틀 -->
<!-- <div id="contents" class="contents_movie_list"> -->
<!-- 	<h2 class="hidden">영화목록</h2> -->
<!-- 		<div class="movie_screen_box"> -->
<!-- 페이지 좌우 여백 틀 -->	


<!-- 페이지 상단 여백 -->
<br><br><br><br><br><br><br><br><br><br><br><br>
<!-- 페이지 상단 여백 표 14칸 ㅜ -->
	
		<table border="1">
			<tr>
				<th>movieCd</th>
				<th>movieNm</th>
				<th>openDt</th>
				<th>genreNm</th>
				<th>directors</th>
				<th>poster</th>
				<th>audiAcc</th>
				<th>bookRating</th>
				<th>watchGradeNm</th>
				<th>showTm</th>
				<th class="actors_ym">actors</th>
				<th>contents</th>
				<th>boxrank</th>
				<th>관리</th>
			</tr>
			
			<c:forEach var="dto" items="${adminMovieList }">
			<tr>
				<td>${dto.movieCd }</td>
				<td>${dto.movieNm }</td>
				<td>${dto.openDt }</td>
				<td>${dto.genreNm }</td>
				<td>${dto.directors }</td>
				<td> <img src="${dto.poster }" width="100" height="100"></td>
				<td>${dto.audiAcc }</td>
				<td>${dto.bookRating }</td>
				<td>${dto.watchGradeNm }</td>
				<td>${dto.showTm }</td>
				<td>${dto.actors }</td>
				<td>${dto.contents }</td>
				<td>${dto.boxrank }</td>
				<td>
				<a href="./AdminMovieModify.mv?movieCd=${dto.movieCd }">수정</a>
				/
				<a href="./AdminMovieDelete.mv?movieCd=${dto.movieCd }">삭제</a>
				</td>
			</tr>
			</c:forEach>
			
		</table>			
		<c:set var="i" value="1"></c:set>
	
	
		<input type="button" value="뒤로가기" onclick="history.back();">
		
		
	
<!-- 페이지 좌우 여백 -->
<!-- 		</div> -->
<!-- </div> -->
<!-- 페이지 좌우 여백 -->	

<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />	
	
	
	
	
</body>
</html>