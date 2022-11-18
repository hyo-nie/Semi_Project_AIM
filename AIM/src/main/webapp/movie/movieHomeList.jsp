<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 상위 배너 -->
<jsp:include page="../inc/topbanner.jsp"/>

</head>
<body>

<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp" />

<br><br><br><br><br><br><br><br><br><br><br><br>

<h2>MovieHomeList.jsp</h2>

<table border="1">
  <tr>
    <td>포스터</td>
    <td>영화명</td>
    <td>관람등급</td>
    <td>상세정보클릭버튼</td>
  </tr> 

  <c:forEach var="movie" items="${movieList }" >
    <tr>
      <td onclick="location.href='./MovieDetail.mv?movieCd=${movie.movieCd}';">${movie.poster }</td>
      <td>${movie.movieNm }</td>
      <td>${movie.watchGradeNm }</td>
      <td onclick="location.href='./MovieDetail.mv?movieCd=${movie.movieCd}';">상세정보</td>
    </tr> 
   </c:forEach>
</table>



</body>
</html>