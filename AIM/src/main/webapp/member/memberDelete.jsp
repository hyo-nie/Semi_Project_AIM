<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 회원 탈퇴</title>

<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp" />
<!-- 상위 배너 -->
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
      <form action="./MemberDeleteAction.aim" name="fr" id="mypage" method="post" >
        아이디 <input type="text" maxlength="50" name="mb_id" value="${sessionScope.mb_id }" readonly><br>
        <br>
        비밀번호 <input type="password" maxlength="15" name="mb_pw" placeholder="비밀번호를 입력하세요." ><br>
        <br>
        <input type="submit" value="탈퇴하기" class="submit" style="color:#fff; background:#18315D; width:75px; height:25px; margin:5px; border-radius:5px; border:1px solid #fff;">
        <input type="button" value="돌아가기" onclick="history.back();" style="color:#fff; background:#18315D; width:75px; height:25px; margin:5px; border-radius:5px; border:1px solid #fff;">
      </form>
    </div>
  </fieldset>


<!-- 약관 -->
<jsp:include page="../inc/footer.jsp"/>

</body>
</html>