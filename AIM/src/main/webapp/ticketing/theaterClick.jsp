<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	
	<c:set var="i" value="0"/>
	<c:forEach var="movieDTO" items="${movieList }">
		<c:set var="scDTO" value="${scheduleList.get(i) }"></c:set>
		<input type="hidden" value="${scDTO.branchCd }" id="select_theater_value_ym">
		<li class="" value="${scDTO.branchCd}${movieDTO.movieCd }">
			<a href="#none">
				<div class="group_infor">
					<div class="bx_tit">
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
						<strong class="tit">${movieDTO.movieNm }</strong>
						<c:set var="i" value="${i+1 }"/>
					</div>
				</div>
			</a>
		</li>
	</c:forEach>
	
	
</body>
</html>