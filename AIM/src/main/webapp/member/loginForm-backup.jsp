<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function ckLogin(){
		if(document.loginfr.mb_id.value==""){
			alert('아이디를 입력해주세요!');
			return false;
		}
		if(document.loginfr.mb_pw.value==""){
			alert('비밀번호를 입력해주세요!');
			return false;
		}
	}
		
</script>

<meta charset="UTF-8">
<title>AIM - Login</title>
</head>
<body>
	
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp"/>
	
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
	
	<h1 align="center">LOGIN</h1>
	<br>
	<br>
	<fieldset>
	<div align="center">
		<form action="./LoginAction.aim" method="post" name="loginfr" onsubmit="return ckLogin()">
		<div>
			<input type="text" name="mb_id" maxlength="12" placeholder="아이디"> <br><br>
			<!-- 아이디를 입력할 수 있는 최대 길이 12 -->
			<input type="password" name="mb_pw" maxlength="16" placeholder="비밀번호">
			<!-- 비밀번호를 입력할 수 있는 최대 길이 16 -->
		</div>
		<br>
		<div>
			<input type="checkbox" name="아이디저장" id="saveId">
			<label for="saveId">아이디 저장</label>
			<!-- 제이쿼리로 쿠키 이용해서 구현할 예쩡.... 제이쿼리가 기억이 안 나요.............. -->
		</div>
		<br>
		<div>
			<input type="submit" value="로그인">
		</div>
		<br>
		<div>
			<!-- 맵핑 후 가상주소로 바꿀 예정 -->
			<a href="./FindId.aim">아이디 찾기</a> |
			<a href="./FindPw.aim">비밀번호 찾기</a> |
			<a href="./Join.aim">회원가입</a>
		</div>
		</form> 
	</div>
	</fieldset>
</body>
</html>