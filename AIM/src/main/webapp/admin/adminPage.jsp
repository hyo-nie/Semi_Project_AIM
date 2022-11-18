<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../inc/include.jsp" />

</head>
<body>

<jsp:include page="../inc/nav_bar.jsp" />


	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<h1>adminPage.jsp</h1>
	
	<br><br>
	
	
	<form action="">
		<input type="button" value="DB에 영화 정보 저장" onclick="location.href='./AdminMovieInsert.mv'">
		
		<input type="button" value="DB에 영화 목록 조회" onclick="location.href='./AdminMovieList.mv'">
		
		<input type="button" value="DB에 추천 영화 저장" onclick="location.href='./AdminMovieInsert2.mv'">
	</form>
		<br><br><br><br><br><br>
	
	<h2>여긴 스케줄등록하는자리</h2><br>
	<a href="./AdminScheAdd.th">스케줄 등록하기</a><br><br>
	<a href="./AdminScheList.th">관리자 스케줄 리스트</a>
	
	
	
	
</body>
</html>