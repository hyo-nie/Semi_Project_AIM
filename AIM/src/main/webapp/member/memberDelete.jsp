<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

  <h1 align="center">회원탈퇴</h1>
  <br>
  <br>
  <fieldset>
    <div align="center">
      <form action="./MemberDeleteAction.aim" name="fr" method="post">
        아이디 <input type="text" name="mb_id"><br>
        <br>
        비밀번호 <input type="text" name="mb_pw" placeholder="비밀번호를 입력하세요."><br>
        <br>
        <input type="submit" value="탈퇴하기">
        <input type="button" value="돌아가기" onclick="history.back();">
      </form>
    </div>
  </fieldset>


<!-- 약관 -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>