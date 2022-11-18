<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./assets/css/owl.carousel.css" rel="stylesheet" type="text/css">
<link href="./assets/css/owl.theme.default.css" rel="stylesheet" type="text/css">
<link href="./assets/css/owl.theme.green.css" rel="stylesheet" type="text/css">
<script src="./assets/css/jquery-3.6.1.js"></script>
<script src="./assets/css/owl.carousel.min.js"></script>


<%--/////////////////////////////////////////////////////////////////////////// --%>

<%--                         작업중입니다.                                      --%>

<%--/////////////////////////////////////////////////////////////////////////// --%>






<!-- bxslider 테스트 -->

<script type="text/javascript">
	$(document).ready(function() {
		var owl = $('.owl-carousel');

		owl.owlCarousel({
			items : 3, // 한번에 보여줄 아이템 수
			loop : true, // 반복여부
			margin : 35, // 오른쪽 간격
			autoplay : true, // 자동재생 여부
			autoplayTimeout : 1800, // 재생간격
			autoplayHoverPause : true
		//마우스오버시 멈출지 여부
		});

		$('.customNextBtn').click(function() {
			owl.trigger('next.owl.carousel');
		})

		$('.customPrevBtn').click(function() {
			owl.trigger('prev.owl.carousel', [ 300 ]);
		})
	});
</script>


<c:set var="today" value="<%=new Date()%>" />
<c:set var="day1" value="<%=new Date(new Date().getTime() +60*60*24*1000*1) %>"/>
<c:set var="day2" value="<%=new Date(new Date().getTime() +60*60*24*1000*2) %>"/>
<c:set var="day3" value="<%=new Date(new Date().getTime() +60*60*24*1000*3) %>"/>
<c:set var="day4" value="<%=new Date(new Date().getTime() +60*60*24*1000*4) %>"/>
<c:set var="day5" value="<%=new Date(new Date().getTime() +60*60*24*1000*5) %>"/>
<c:set var="day6" value="<%=new Date(new Date().getTime() +60*60*24*1000*6) %>"/>
<c:set var="day7" value="<%=new Date(new Date().getTime() +60*60*24*1000*7) %>"/>
<c:set var="day8" value="<%=new Date(new Date().getTime() +60*60*24*1000*8) %>"/>
<c:set var="day9" value="<%=new Date(new Date().getTime() +60*60*24*1000*9) %>"/>
<c:set var="day10" value="<%=new Date(new Date().getTime() +60*60*24*1000*10) %>"/>
<c:set var="day11" value="<%=new Date(new Date().getTime() +60*60*24*1000*11) %>"/>
<c:set var="day12" value="<%=new Date(new Date().getTime() +60*60*24*1000*12) %>"/>
<c:set var="day13" value="<%=new Date(new Date().getTime() +60*60*24*1000*13) %>"/>
<c:set var="day14" value="<%=new Date(new Date().getTime() +60*60*24*1000*14) %>"/>
<c:set var="day15" value="<%=new Date(new Date().getTime() +60*60*24*1000*15) %>"/>
<c:set var="day16" value="<%=new Date(new Date().getTime() +60*60*24*1000*16) %>"/>
<c:set var="day17" value="<%=new Date(new Date().getTime() +60*60*24*1000*17) %>"/>
<c:set var="day18" value="<%=new Date(new Date().getTime() +60*60*24*1000*18) %>"/>
<c:set var="day19" value="<%=new Date(new Date().getTime() +60*60*24*1000*19) %>"/>
<fmt:formatDate var="ymd" pattern="yyyy-MM-dd" value="${today }" />
<fmt:formatDate var="ymd1" pattern="yyyy-MM-dd" value="${day1 }" />
<fmt:formatDate var="ymd2" pattern="yyyy-MM-dd" value="${day2 }" />
<fmt:formatDate var="ymd3" pattern="yyyy-MM-dd" value="${day3 }" />
<fmt:formatDate var="ymd4" pattern="yyyy-MM-dd" value="${day4 }" />
<fmt:formatDate var="ymd5" pattern="yyyy-MM-dd" value="${day5 }" />
<fmt:formatDate var="ymd6" pattern="yyyy-MM-dd" value="${day6 }" />
<fmt:formatDate var="ymd7" pattern="yyyy-MM-dd" value="${day7 }" />
<fmt:formatDate var="ymd8" pattern="yyyy-MM-dd" value="${day8 }" />
<fmt:formatDate var="ymd9" pattern="yyyy-MM-dd" value="${day9 }" />
<fmt:formatDate var="ymd10" pattern="yyyy-MM-dd" value="${day10 }" />
<fmt:formatDate var="ymd11" pattern="yyyy-MM-dd" value="${day11 }" />
<fmt:formatDate var="ymd12" pattern="yyyy-MM-dd" value="${day12 }" />
<fmt:formatDate var="ymd13" pattern="yyyy-MM-dd" value="${day13 }" />
<fmt:formatDate var="ymd14" pattern="yyyy-MM-dd" value="${day14 }" />
<fmt:formatDate var="ymd15" pattern="yyyy-MM-dd" value="${day15 }" />
<fmt:formatDate var="ymd16" pattern="yyyy-MM-dd" value="${day16 }" />
<fmt:formatDate var="ymd17" pattern="yyyy-MM-dd" value="${day17 }" />
<fmt:formatDate var="ymd18" pattern="yyyy-MM-dd" value="${day18 }" />
<fmt:formatDate var="ymd19" pattern="yyyy-MM-dd" value="${day19 }" />






<%-- 
<fmt:formatDate pattern="EE" var="dd2" value="<%=new Date(new Date().getTime() +60*60*24*1000*1) %>"/>
<fmt:formatDate pattern="EE" var="dd3" value="<%=new Date(new Date().getTime() +60*60*24*1000*2) %>"/>
<fmt:formatDate pattern="EE" var="dd4" value="<%=new Date(new Date().getTime() +60*60*24*1000*3) %>"/>
<fmt:formatDate pattern="EE" var="dd5" value="<%=new Date(new Date().getTime() +60*60*24*1000*4) %>"/>
<fmt:formatDate pattern="EE" var="dd6" value="<%=new Date(new Date().getTime() +60*60*24*1000*5) %>"/>
<fmt:formatDate pattern="EE" var="dd7" value="<%=new Date(new Date().getTime() +60*60*24*1000*6) %>"/>
<fmt:formatDate pattern="yy" value="${today }" var="year" />
<fmt:formatDate pattern="MM" value="${today }" var="mon" />
<fmt:formatDate pattern="dd" value="${today }" var="day" />
<fmt:formatDate pattern="EE" value="${today }" var="dd1" />	 --%>


<%-- 		<%=new Date().getDay() %> day를 요일로 바꾸는 함수가 필요 함수매개변수로 getday정보를 받으면
		if else 나 switch case 가지고 필요한 정보를 return
		https://ngio.co.kr/10075 --%>




<!-- 월 중복일시 span 으로 묶어서 display none 해버리기 -->
<!-- 해당일자 스케줄 없을 씨 db와 정보 비교하여 default 처리 하기 -->
<!--년 월 일 span 으로 묶어서 현재 날짜와 비교 후 css 조정하여 아래배열로 표시 -->
<body>
	<div class="owl-carousel owl-theme owl-loaded">
		<div class="owl-stage-outer">
			<div class="owl-stage">
				<div class="owl-item">
					<a href="#" class="">${ymd }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd1 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd2 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd3 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd4 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd5 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd6 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd7 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd8 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd9 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd10 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd11 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd12 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd13 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd14 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd15 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd16 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd17 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd18 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd19 }</a>
				</div>
				<div class="owl-item">
					<a href="#" class="">${ymd20 }</a>
				</div>
			</div>
		</div>
	</div>









</body>
</html>