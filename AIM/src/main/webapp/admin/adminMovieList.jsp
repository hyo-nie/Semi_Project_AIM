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
<div id="contents" class="contents_movie_list">
	<h2 class="hidden">영화목록</h2>
		<div class="movie_screen_box">
<!-- 페이지 좌우 여백 틀 -->	


<!-- 페이지 상단 여백 -->
<br><br><br><br><br><br><br><br><br><br><br><br>
<!-- 페이지 상단 여백 -->


<!-- 상단 이름 -->
<div class="movi_pre_list">
<h3 class="tit_type0"><strong class="ty2 eng">AIM</strong> 영화 목록 페이지</h3>
</div>
<!-- 상단 이름 -->


<!-- 페이지 좌우 여백 -->
		</div>
</div>
<!-- 페이지 좌우 여백 -->





<!-- /* hj */ 페이지 상단 여백 표 14칸 ㅜ /* ADMINTABLE2*/   /* ADMINTABLE3*/  -->
	<div class="">
		<table class="tbl_dtalb" >
<%-- 			<colgroup> --%>
<%-- 				<col style="height:10%; overflow-y:scroll;"> --%>
<%-- 			</colgroup> --%>


<thead>
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
</thead>

<tbody>	
			<c:forEach var="dto" items="${adminMovieList }">
			<tr>
				<td scope="col">${dto.movieCd }</td>
				<td scope="col">${dto.movieNm }</td>
				<td scope="col">${dto.openDt }</td>
				<td scope="col">${dto.genreNm }</td>
				<td scope="col">${dto.directors }</td>
				<td scope="col"> <img src="${dto.poster }" width="100" height="100"></td>
				<td scope="col">${dto.audiAcc }</td>
				
				<td scope="col">${dto.bookRating }</td>
				<td scope="col">${dto.watchGradeNm }</td>
				<td scope="col">${dto.showTm }</td>
				<td scope="col">${dto.actors }</td>
				<td scope="col">${dto.contents }</td>
				<td class="hj">${dto.boxrank }</td>
				<td scope="col">
				<a href="./AdminMovieModify.mv?movieCd=${dto.movieCd }">수정</a>
				<br>-<br>
				<a href="./AdminMovieDelete.mv?movieCd=${dto.movieCd }">삭제</a>
				</td>
			</tr>
			</c:forEach>
</tbody>				
		</table>			
		<c:set var="i" value="1"></c:set>
	
		<br><br>
		
		<div align="center">
		<input type="button" value="뒤로가기" onclick="history.back();" style="color:#fff; background:#18315D; width:75px; height:25px; margin:5px; border-radius:5px; border:1px solid #fff;">
		</div>
	</div>
		
		
		
		
	
<!-- 페이지 좌우 여백 -->
<!-- 		</div> -->
<!-- </div> -->
<!-- 페이지 좌우 여백 -->	

<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />	
	
	
	
	
</body>
</html>