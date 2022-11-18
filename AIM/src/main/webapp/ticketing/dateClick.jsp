<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	
	<c:if test="${movieList.size() != 0 }">
		<c:set var="movieDTO" value="${movieList.get(i) }"/>
			<input type="hidden" value="${movieDTO.movieCd }" id="select_movie_value_ym">
			<!-- 영화 정보 (ajax 구현), 등급, 제목 -->
			<span class=
				<c:if test="${movieDTO.watchGradeNm.equals('12세이상관람가') }">
					"ic_grade gr_12"
				</c:if>
				<c:if test="${movieDTO.watchGradeNm.equals('15세이상관람가') }">
					"ic_grade gr_15"
				</c:if>
				<c:if test="${movieDTO.watchGradeNm.equals('18세이상관람가') }">
					"ic_grade gr_18"
				</c:if>
				<c:if test="${movieDTO.watchGradeNm.equals('전체관람가') }">
					"ic_grade gr_all"
				</c:if>>
			</span>
			<strong>${movieDTO.movieNm }</strong>
	</c:if>
	
</body>
</html>