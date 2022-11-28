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

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	
	<h1 align="center">아이디 찾기</h1><br><br>	
	
	<div align="center">
	<p style="font-size:20px;">회원님의 아이디는 <em style="font-color:#ED4C6B;">${mb_id }</em> 입니다. </p><br><br>
	
	<input type="button" value="로그인하기" onclick="location.href='./Login.aim';" style="color:#fff; background:#18315D; width:80px; height:25px; margin:5px; border-radius:5px; border:1px solid #fff;">
	<input type="button" value="비밀번호 찾기" onclick="location.href='./FindPw.aim'" style="color:#fff; background:#18315D; width:80px; height:25px; margin:5px; border-radius:5px; border:1px solid #fff;">
	<!-- 비밀번호 찾기 버튼 -->
	</div>
	<!-- 약관 -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>