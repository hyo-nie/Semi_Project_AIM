<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../inc/include.jsp"/>


<%--/////////////////////////////////////////////////////////////////////////// --%>

<%--                         작업중입니다.                                      --%>

<%--/////////////////////////////////////////////////////////////////////////// --%>






<!-- bxslider 테스트 -->

<script type="text/javascript">

</script>


<!--  날짜값 오늘 ~ 20일뒤 까지 변수 생성 -->
	<c:set var="today" value="<%=new Date()%>" />
	<c:set var="yesterday"
		value="<%=new Date(new Date().getTime() - 60 * 60 * 24 * 1000 * 1)%>" />
	<c:set var="day1"
		value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 1)%>" />
	<c:set var="day2"
		value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 2)%>" />
	<c:set var="day3"
		value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 3)%>" />
	<c:set var="day4"
		value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 4)%>" />
	<c:set var="day5"
		value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 5)%>" />
	<c:set var="day6"
		value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 6)%>" />
	<c:set var="day7"
		value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 7)%>" />
	<c:set var="day8"
		value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 8)%>" />
	<!-- // sc_date db값과 비교하기 위한 날짜값 (ex : 2022-11-11) -->
	<fmt:formatDate var="ymd" pattern="yyyy-MM-dd" value="${today }" />
	<fmt:formatDate var="ymd1" pattern="yyyy-MM-dd" value="${day1 }" />
	<fmt:formatDate var="ymd2" pattern="yyyy-MM-dd" value="${day2 }" />
	<fmt:formatDate var="ymd3" pattern="yyyy-MM-dd" value="${day3 }" />
	<fmt:formatDate var="ymd4" pattern="yyyy-MM-dd" value="${day4 }" />
	<fmt:formatDate var="ymd5" pattern="yyyy-MM-dd" value="${day5 }" />
	<fmt:formatDate var="ymd6" pattern="yyyy-MM-dd" value="${day6 }" />
	<fmt:formatDate var="ymd7" pattern="yyyy-MM-dd" value="${day7 }" />
	<fmt:formatDate var="ymd8" pattern="yyyy-MM-dd" value="${day8 }" />

	<!-- // owl-carousel 슬라이더에 사용될 일자 타입 변수 -->
	<fmt:formatDate var="m" pattern="MM" value="${today }" />
	<fmt:formatDate var="yd" pattern="dd" value="${yesterday }" />
	<fmt:formatDate var="d" pattern="dd" value="${today }" />
	<fmt:formatDate var="d1" pattern="dd" value="${day1 }" />
	<fmt:formatDate var="d2" pattern="dd" value="${day2 }" />
	<fmt:formatDate var="d3" pattern="dd" value="${day3 }" />
	<fmt:formatDate var="d4" pattern="dd" value="${day4 }" />
	<fmt:formatDate var="d5" pattern="dd" value="${day5 }" />
	<fmt:formatDate var="d6" pattern="dd" value="${day6 }" />
	<fmt:formatDate var="d7" pattern="dd" value="${day7 }" />
	<fmt:formatDate var="d8" pattern="dd" value="${day8 }" />
	<!-- // owl-carousel 슬라이더에 사용될 요일 타입 변수 -->
	<fmt:formatDate var="ye" pattern="E" value="${yesterday }" />
	<fmt:formatDate var="e" pattern="E" value="${today }" />
	<fmt:formatDate var="e1" pattern="E" value="${day1 }" />
	<fmt:formatDate var="e2" pattern="E" value="${day2 }" />
	<fmt:formatDate var="e3" pattern="E" value="${day3 }" />
	<fmt:formatDate var="e4" pattern="E" value="${day4 }" />
	<fmt:formatDate var="e5" pattern="E" value="${day5 }" />
	<fmt:formatDate var="e6" pattern="E" value="${day6 }" />
	<fmt:formatDate var="e7" pattern="E" value="${day7 }" />
	<fmt:formatDate var="e8" pattern="E" value="${day8 }" />




<!-- 월 중복일시 span 으로 묶어서 display none 해버리기 -->
<!-- 해당일자 스케줄 없을 씨 db와 정보 비교하여 default 처리 하기 -->
<!--년 월 일 span 으로 묶어서 현재 날짜와 비교 후 css 조정하여 아래배열로 표시 -->
<body>
			<ul id="schedule">
			<li class="">
				<div class="time_select_wrap ty2 timeSelect">
					<c:forEach var="fmovie" items="${fmovieName }">
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
						<ul class="list_time">
							<c:forEach var="fsche" items="${scheduleFirst }">
								<c:if test="${fmovie.movieNm eq fsche.movieNm }">
									<li class=""><a
										href="./SelectSeat.tk?scCode=${fsche.scCode}" onclick="alert('좌석을 선택해주세요');" role="button">
											<dl>
												<dt>상영시간</dt>
												<dd class="time">
													<strong> ${fsche.starttime}</strong>
													<div class="tooltip">종료 :</div>
												</dd>
												<dt>잔여석</dt>
												<dd class="seat">
													<strong>146</strong> / 162
												</dd>
												<dt>상영관</dt>
												<dd class="hall">${fsche.roomCd}관</dd>
											</dl>
									</a></li>
								</c:if>
							</c:forEach>
						</ul>



					</c:forEach>

				</div>
			</li>
		</ul>








</body>
</html>