<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:if test="${scheduleList.size() != 0 }">
		<c:forEach var="scList" items="${scheduleList }">
		<li class="" value="${scList.branchCd }${scList.movieCd}">
			<a role="button" href="./SelectSeat.tk?scCode=${scList.scCode }" onclick="scClick();">
				<dl>
					<dt>상영시간</dt>
					<dd class="time">
						<strong>${scList.starttime }</strong>
						<div class="tooltip">임 시 값</div>
					</dd>
					<dt>잔여석</dt>
					<dd class="seat">
						<strong>100</strong> / 100
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