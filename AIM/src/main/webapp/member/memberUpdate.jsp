<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 회원 정보 수정</title>
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
      <form action="./MemberUpdatePro.aim" name="fr" method="post" onsubmit="return check();">
        아이디 <input type="text" name="mb_id" value="${dto.mb_id }" readonly><br>
        <br>
        비밀번호 <input type="text" name="mb_pw" placeholder="비밀번호를 입력하세요."><br>
        <br>
        이름 <input type="text" name="mb_name" value="${dto.mb_name }" ><br>
        <br>
        닉네임 <input type="text" name="mb_nick" value="${dto.mb_nick }" ><br>
        <br>
        전화번호 <input type="text" name="mb_tel" value="${dto.mb_tel }" ><br>
        <br>
        <input type="submit" value="변경하기">
        <input type="button" value="돌아가기" onclick="history.back();">
      </form>
    </div>
  </fieldset>
  
  <br><br><br><br><br>
	${dto.mb_id }




<!-- 약관 -->
<jsp:include page="../inc/footer.jsp"/>

</body>
</html>