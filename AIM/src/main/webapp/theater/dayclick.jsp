<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
				<li class="">
			<div class="time_select_wrap ty2 timeSelect">
				<c:forEach var="fmovie" items="${fmovieName }" >
				<div class="list_tit">
				<c:choose>
					<c:when test="${fmovie.watchGradeNm eq '12세이상관람가' }">
					<span class="ic_grade gr_12">12</span>
					</c:when>
					<c:when test="${fmovie.watchGradeNm eq '15세이상관람가' }">
					<span class="ic_grade gr_15">15</span>
					</c:when>
					<c:when test="${fmovie.watchGradeNm eq '청소년관람불가' }">
					<span class="ic_grade gr_18">18</span>
					</c:when>
					<c:otherwise>
					<span class="ic_grade gr_all">All</span>
					</c:otherwise>
				</c:choose>
					<p>${fmovie.movieNm }</p>
				</div>
<!-- 				<ul class="list_hall mt20" style="margin-bottom: 5px;">
					<li>2D</li>
				</ul> -->
				<ul  class="list_time">
				<c:forEach var="fsche" items="${scheduleFirst }" >
				<c:if test="${fmovie.movieNm eq fsche.movieNm }">
						<li class="" >
						<a href="./SeatSelect.th?branchCd=${fsche.branchCd }&date=${fsche.sc_date}&movie=${fsche.movieCd}&time=${fsche.starttime}" role="button">
							<dl>
								<dt>상영시간</dt>
									<dd class="time">
										<strong>
											${fsche.starttime}</strong>									
										<div class="tooltip">종료 : </div>
									</dd>
								<dt>잔여석</dt>
									<dd class="seat">
										<strong>146</strong> / 162
									</dd>
								<dt>상영관</dt>
									<dd class="hall">${fsche.roomCd}관</dd>
							</dl>
							</a>
						</li>
					</c:if>
					</c:forEach>
					</ul>
				</c:forEach>
				</div>
				    </li>
</body>
</html>