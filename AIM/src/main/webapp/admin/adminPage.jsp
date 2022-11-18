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
	
	
	
	
	
</body>
</html>