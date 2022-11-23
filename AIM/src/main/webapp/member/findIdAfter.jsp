<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp"></jsp:include>

	<!-- 보기안좋아서 임시방편입니다 -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 보기안좋아서 임시방편입니다 -->


	
	<h1 align="center">아이디 찾기</h1><br><br>	
	
	<div align="center">
	<p>회원님의 아이디는 ${mb_id } 입니다. </p><br><br>
	
	<input type="button" value="로그인하기" onclick="location.href='./Login.aim';">
	<input type="button" value="비밀번호 찾기" onclick="location.href='./FindPw.aim'">
	<!-- 비밀번호 찾기 버튼 -->
	</div>
	<!-- 약관 -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>