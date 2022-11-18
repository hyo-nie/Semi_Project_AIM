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
	
	<h1>adminMoiveInsertForm.jsp</h1>
	
	<br><br>
	
	
	
	
	
	
	<form action="./AdminMovieInsertAction.mv" method="post">

		<h3>일별 박스 오피스 순위</h3>
		<br>
		
		<table border="1">
			<tr>
				<th>순위</th>
				<th>제목</th>
				<th>포스터/줄거리/평점(크롤링)</th>
				<th>개봉일</th>
				<th>누적관객수</th>
			</tr>
			
			<c:set var="j" value="1"></c:set>
			<c:forEach var="dto" items="${boxOfficeList }">
			<tr>
				<td>${dto.get("rank") }</td>
				<td>${dto.get("movieNm") }</td>
				<td> 
					<select name="poster${j }">	
						<option>포스터를 선택하세요.</option>
						<c:forEach var="cgv" items="${cgvList }">
							<option value="${cgv.percent},${cgv.image}" >
								${cgv.title }
							</option>
						</c:forEach>
						<c:set var="j" value="${j+1 }"></c:set>
					</select> 
				</td>
				<td>${dto.get("openDt") }</td>
				<td>${dto.get("audiAcc") }</td>
			</tr>
			</c:forEach>
			
		</table>			
		<c:set var="i" value="1"></c:set>
		
		<c:forEach var="dto2" items="${boxOfficeList }">		
			<input type="hidden" name="movieCd${i }" value="${dto2.get('movieCd') }">	
			<input type="hidden" name="audiAcc${i }" value="${dto2.get('audiAcc') }">	
			<input type="hidden" name="rank${i }" value="${dto2.get('rank') }">	
			<c:set var="i" value="${i+1 }"></c:set>
		</c:forEach>
		
		<br><br>
	
		<input type="submit" value="모두 저장">
		<input type="button" value="취소" onclick="history.back();">
		
	</form>
	
	
	
	
	
</body>
</html>