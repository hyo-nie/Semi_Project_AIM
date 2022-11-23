<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:if test="${scheduleList.size() != 0 }">
		<c:set var="i" value="0"></c:set>
		<c:forEach var="scList" items="${scheduleList }">
		<li class="" value="${scList.branchCd }${scList.movieCd}">
			<a role="button" 
				<c:choose>
					<c:when test="${mb_id == null }">
						onclick="scClick();"
					</c:when>
					<c:otherwise>
						href="./SelectSeat.tk?scCode=${scList.scCode }"
					</c:otherwise>
				</c:choose>>
				<dl>
					<dt>상영시간</dt>
					<dd class="time">
						<strong>${scList.starttime }</strong>
						<div class="tooltip">임 시 값</div>
					</dd>
					<dt>잔여석</dt>
					<dd class="seat">
						<strong>${currentSeatArr.get(i) }</strong> / 80
						<c:set var="i" value="${i+1 }"></c:set>
					</dd>
					<dt>상영관</dt>
					<dd class="hall">1관</dd>
				</dl>
			</a>
		</li>
		</c:forEach>
	</c:if>
	
</body>
</html>