<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 관리자 영화 API 등록 페이지</title>

<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp"/>
<!-- 상위 배너 -->
<jsp:include page="../inc/topbanner.jsp"/>
<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp"/>

</head>
<body>

	<%
	//로그인 제어
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
<h3 class="tit_type0"><strong class="ty2 eng">AIM</strong> API 영화 정보 (일별 박스오피스 순위)</h3>
</div>
<!-- 상단 이름 -->
	

	<form action="./AdminMovieInsertAction.mv" method="post">
		
		<table border="1" class="tbl_listb text_c" >
				<colgroup>
			<col style="width: auto; height: 70px;">
		</colgroup>
			<tr>
				<th scope="col">순위</th>
				<th scope="col">제목</th>
				<th scope="col">포스터/줄거리/평점(크롤링)</th>
				<th scope="col">개봉일</th>
				<th scope="col">누적관객수</th>
			</tr>
			
			<c:set var="j" value="1"></c:set>
			<c:forEach var="dto" items="${boxOfficeList }">
			<tr>
				<td>${dto.get("rank") }</td>
				<td>${dto.get("movieNm") }</td>
				<td> 
					<select name="poster${j }">	
						<option>포스터를 선택하세요.</option>
						<c:forEach var="cgv" items="${cgvList }">
							<option value="${cgv.percent},${cgv.image},${cgv.content}">
								${cgv.title }
							</option>
						</c:forEach>
						<c:set var="j" value="${j+1 }"></c:set>
					</select> 
				</td>
				<td>${dto.get("openDt") }</td>
				<td>${dto.get("audiAcc") }</td>
			</tr>
			</c:forEach>
			
		</table>			
		<c:set var="i" value="1"></c:set>
		
		<c:forEach var="dto2" items="${boxOfficeList }">		
			<input type="hidden" name="movieCd${i }" value="${dto2.get('movieCd') }">	
			<input type="hidden" name="audiAcc${i }" value="${dto2.get('audiAcc') }">	
			<input type="hidden" name="rank${i }" value="${dto2.get('rank') }">	
			<c:set var="i" value="${i+1 }"></c:set>
		</c:forEach>
		
		<br><br>
	<div align="center">
		<input type="submit" value="모두 저장" style="color:#fff; background:#18315D; width:75px; height:25px; margin:5px; border-radius:5px; border:1px solid #fff;">
		<input type="button" value="취소" onclick="history.back();" style="color:#fff; background:#18315D; width:75px; height:25px; margin:5px; border-radius:5px; border:1px solid #fff;">
	</div>
	</form>
	
	
	
<!-- 페이지 좌우 여백 -->
		</div>
</div>
<!-- 페이지 좌우 여백 -->	

<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />	
	
	
</body>
</html>