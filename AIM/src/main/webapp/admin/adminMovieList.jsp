<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../inc/include.jsp" />

</head>
<body>

<jsp:include page="../inc/nav_bar.jsp" />


	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<h1>adminMoiveList.jsp</h1>
	
	<br><br>
	
		<table border="1">
			<tr>
				<th>movieCd</th>
				<th>movieNm</th>
				<th>openDt</th>
				<th>genreNm</th>
				<th>directors</th>
				<th>poster</th>
				<th>audiAcc</th>
				<th>bookRating</th>
				<th>watchGradeNm</th>
				<th>showTm</th>
				<th class="actors_ym">actors</th>
				<th>contents</th>
				<th>boxrank</th>
			</tr>
			
			<c:forEach var="dto" items="${adminMovieList }">
			<tr>
				<td>${dto.movieCd }</td>
				<td>${dto.movieNm }</td>
				<td>${dto.openDt }</td>
				<td>${dto.genreNm }</td>
				<td>${dto.directors }</td>
				<td> <img src="${dto.poster }" width="100" height="100"></td>
				<td>${dto.audiAcc }</td>
				<td>${dto.bookRating }</td>
				<td>${dto.watchGradeNm }</td>
				<td>${dto.showTm }</td>
				<td>${dto.actors }</td>
				<td>${dto.contents }</td>
				<td>${dto.boxrank }</td>
			</tr>
			</c:forEach>
			
		</table>			
		<c:set var="i" value="1"></c:set>
	
	
		<input type="button" value="뒤로가기" onclick="history.back();">
		
		
	
	
	
	
	
</body>
</html>