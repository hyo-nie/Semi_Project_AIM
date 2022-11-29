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
<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp"></jsp:include>
</head>
<body>
<style>
.btn_class > input[type='submit'], input[type='button']{margin-top: 20px; 
														color:#fff; 
														background:#18315D; 
														width: 110px; 
														height:40px; 
														margin:5px; 
														border-radius:5px; 
														border:1px solid #fff;}
.class_for_main{border:1px solid #edebeb;
				border-radius:5px; 
				width: 410px;
				height: 365px;
				margin: 0 auto;}


</style>



<div style="padding-top: 245px;">

	<div style="margin-bottom: 20px;">
  		<h1 align="center">회원탈퇴</h1>
	</div>
	
  <fieldset>
    <div class="class_for_main" align="center">
      <form action="./MemberDeleteAction.aim" name="fr" id="mypage" method="post" style="margin-top: 40px;"> 
      		<h4 style="margin-bottom: 10px; margin-right: 145px;">아이디</h4>
	        <input type="text" maxlength="50" name="mb_id" value="${sessionScope.mb_id }" readonly><br>

	    <div style="margin-top: 25px;">
       		<h4 style="margin-bottom: 10px; margin-right: 145px;">비밀번호</h4>
	        <input type="password" maxlength="15" name="mb_pw" placeholder="비밀번호를 입력하세요." ><br>
		</div>
		
		<div class="btn_class" style="margin-top: 55px;">
	        <input type="submit" value="탈퇴하기" class="submit">
	        <input type="button" value="돌아가기" onclick="history.back();">
        </div>
      
      
      </form>
    </div>
  </fieldset>

</div>

<!-- 약관 -->
<jsp:include page="../inc/footer.jsp"/>

</body>
</html>