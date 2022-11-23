<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  function check(){
	  if(document.fr.pw.value==""){
		  alert('비밀번호를 입력하세요');
		  document.fr.pw.focus();
		  return false;
	  }
	  alert('회원정보가 변경되었습니다');
  }
</script>

<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp" />
<!-- 상위 배너 -->
<jsp:include page="../inc/topbanner.jsp"/>
<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp"></jsp:include>
</head>
<body>
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
  
  <h1 align="center">회원정보변경</h1>
  <br>
  <br>
  <fieldset>
    <div align="center">
      <form action="./MemberUpdateAction.aim" name="fr" method="post" onsubmit="return check();">
        아이디 <input type="text" name="mb_id" readonly><br>
        <br>
        비밀번호 <input type="text" name="mb_pw" placeholder="비밀번호를 입력하세요."><br>
        <br>
        이름 <input type="text" name="mb_name" ><br>
        <br>
        닉네임 <input type="text" name="mb_nick" ><br>
        <br>
        전화번호 <input type="text" name="mb_tel" ><br>
        <br>
        <input type="submit" value="변경하기">
        <input type="button" value="돌아가기" onclick="history.back();">
      </form>
    </div>
  </fieldset>





<!-- 약관 -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>