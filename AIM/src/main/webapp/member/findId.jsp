<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  function id_serch() {
	  var fr = document.idfindscreen;
	  
	  if(document.fr.mb_name.value=="") {
		  alert('이름을 입력해주세요');
		  document.fr.mb_name.focus();
		  return;
	  }
	  
	  if(document.fr.mb_tel.value=="") {
		  alert('휴대폰번호를 입력해주세요');
		  document.fr.mb_tel.focus();
		  return;
	  }
	  
	  document.fr.submit();
  }
</script>
</head>
<body>

	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp"/>
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


	<h1 align="center">아이디찾기</h1>
	<br>
	<br>
	<fieldset>
		<div align="center">
			<form action="./FindIdAction.aim" name="fr" method="post">
				이 &nbsp;&nbsp;&nbsp; 름 <input type="text" name="mb_name" placeholder="이름을 입력하세요."><br>
				<br>
				전화번호 <input type="text" name="mb_tel" placeholder="전화번호를 입력하세요."><br>
				<br>
				<input type="button" name="enter" value="아이디 찾기" onclick="id_serch();" >
				<input type="button" name="cancle" value="돌아가기" onclick="history.back();">
			</form>
		</div>
	</fieldset>
<!-- 약관 -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>