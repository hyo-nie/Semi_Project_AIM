<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 극장</title>
<jsp:include page="../inc/include.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		$('#datesel a').click(function() {
			$('#schedule li').remove();

			$ajax({
				url : "./dateClick.th",
				data : {
					sc_date : $(this).val()
				},
				success : function(data) {
					$('#schedule').append(data);
				},
				error : function() {
					alert('실패!')
				}
			});
		});
	});
</script>
<%-- owl 조작 --%>
<script type="text/javascript">
	$(document).ready(function() {

		$('.owl-one').owlCarousel({
			items : 1, // 한번에 보여줄 아이템 수
			loop : true, // 반복여부
			margin : 0, // 오른쪽 간격
			autoplay : true, // 자동재생 여부
			autoplayTimeout : 5000, // 재생간격
			autoplayHoverPause : false, //마우스오버시 멈출지 여부
			mouseDrag : false,
			touchDrag : false

		});
		$('.owl-two').owlCarousel({
			items : 10, // 한번에 보여줄 아이템 수
			loop : false, // 반복여부
			margin : 20, // 오른쪽 간격
			autoplay : false, // 자동재생 여부
			autoplayTimeout : 2500, // 재생간격
			autoplayHoverPause : false, //마우스오버시 멈출지 여부
			mouseDrag : false,
			touchDrag : false

		});
	});
</script>
<%-- 관람등급안내 --%>
<script>
	$(function() {
		$("#showBtn").on("click", function() {

			$("#text").show();
			return false;
		});

	});
	$(function() {
		$("#hideBtn").on("click", function() {

			$("#text").hide();
			return false;
		});

	});
	$(function() {
		$("#maps").on("click", function() {

			$(".maps2").attr('class', 'maps1')
			return false;
		});

	});
	$(function() {
		$("#maphide").on("click", function() {

			$(".maps1").attr('class', 'maps2')
			return false;
		});

	});
 	$(function() {
		$("#public").on("click", function() {

			$(".public2").attr('class', 'public1')
			return false;
		});

	});
	$(function() {
		$("#public2").on("click", function() {

			$(".public1").attr('class', 'public2')
			return false;
		});

	}); 
</script>

</head>

<body>
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




	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp" />
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp" />
	<!-- 슬라이더 -->
	<div id="visual_top" class="visual_top visual_theater_detail" style="">
		<div class="inner">
			<div class="slide_wrap full slide_cinema_home_visual">
				<div class="owl-one owl-carousel owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage"
							style="transform: translate3d(-5760px, 0px, 0px); transition: all 0.25s ease 0s; width: 11520px;">
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1280720.mp4"
										alt=""></a>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/boo_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/boo_1280720.mp4"
										alt="극장판 뽀로로와 친구들 바이러스를 없애줘 전체관람가 12월 1일 롯데시네마에서 만나요 네모바이러스의 습격 친구들을 구하라"></a>
								</div>
							</div>
							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/PR/PR_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/PR/PR_1280720.mp4"
										alt=""></a>
								</div>
							</div>
							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1280720.mp4"
										alt="아바타 물의길 판도라의 바다 새로운 세계가 펼쳐진다 12월 대개봉 관람등급미정"></a>
								</div>
							</div>
							<div class="owl-item active" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1280720.mp4"
										alt=""></a>
								</div>
							</div>
							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/boo_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/boo_1280720.mp4"
										alt="극장판 뽀로로와 친구들 바이러스를 없애줘 전체관람가 12월 1일 롯데시네마에서 만나요 네모바이러스의 습격 친구들을 구하라"></a>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/PR/PR_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/PR/PR_1280720.mp4"
										alt=""></a>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1920420.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1280720.mp4"
										alt="아바타 물의길 판도라의 바다 새로운 세계가 펼쳐진다 12월 대개봉 관람등급미정"></a>
								</div>
							</div>
						</div>
					</div>
					<div class="owl-nav" style="width: 2378px; margin-left: -1189px;">
						<button type="button" role="presentation" class="owl-prev">
							<span aria-label="Previous">‹</span>
						</button>
						<button type="button" role="presentation" class="owl-next">
							<span aria-label="Next">›</span>
						</button>
					</div>
					<div class="owl-dots">
						<button role="button" class="owl-dot">
							<span></span>
						</button>
						<button role="button" class="owl-dot active" style="">
							<span></span>
						</button>
					</div>
				</div>
				<div class="bx_ctrl" style="left: 990px;">
					<button class="play active">슬라이드 자동재생</button>
					<button class="stop">슬라이드 일시정지</button>
				</div>
			</div>
		</div>
	</div>



	<!-- 사이드 퀵메뉴 -->
	<jsp:include page="../inc/side_quick_menu.jsp" />
	<!--사이드 원 팝업창 -->
	<jsp:include page="../inc/left_circle_pop.jsp" />

	<div id="contents"
		class="contents_theater_detail area__movingbar litype2">
		<div class="theater_top_wrap">
			<div class="theater_tit">
				<h3 class="tit">${dto.branch_name}</h3>

				<button type="button" class="btnToggle btn_col4 ty3 mr10">
					<span id="cinemalike" class="ico_heart ty2"><em>관심등록</em></span>MY
					영화관
				</button>
				<button type="button" class="btnToggle btn_col4 ty3">
					<span class="icon_groupvisit"></span> 단체/대관문의
				</button>
			</div>
			<div class="info_wrap">
				<dl class="theater_info">
					<dt>총 상영관 수</dt>
					<dd>3개관</dd>
					<dt>총 좌석수</dt>
					<dd>300석</dd>
					<dt class="adr">주소</dt>
					<dd class="adr">${dto.branch_addr }</dd>
				</dl>

				<ul class="pop_wrap">
					<li><a id="public" title="레이어팝업 열기"><img
							src="https://www.lottecinema.co.kr/NLCHS/Content/images/icon/location_subway_40.png"
							alt="대중교통 안내"><span>대중교통 안내</span></a></li>
					<li><a id="car" title="레이어팝업 열기"><img
							src="https://www.lottecinema.co.kr/NLCHS/Content/images/icon/location_car_40.png"
							alt="자가용/주차안내"><span>자가용/주차안내</span></a></li>
					<li><a id="maps" title="레이어팝업 열기" target="_blank"><img
							src="https://www.lottecinema.co.kr/NLCHS/Content/images/icon/location_map_40.png"
							alt="지도보기"><span>지도보기</span></a></li>
				</ul>
				<!-- 지도 -->
				<div class="maps2" id="maps"
					style="width: 445px; height: 350px; left: 53.5%; top: -11%; margin-left: -250; z-index: 10; position: absolute; overflow: hidden;">
					<p class="pp">${dto.branch_addr }</p>
					<button class="maphide" id="maphide">지도 닫기</button>
					<div id="map"
						style="width: 445px; height: 326px; left: 0%; top: 7%; margin-left: -250; position: absolute;">

					</div>
				</div>
 				<!-- 대중교통 -->
 				 <div class="public2" id="public1"
					style="width: 445px; height: 350px; left: 53.5%; top: -11%; margin-left: -250; z-index: 9; position: absolute; ">
					<p class="pp">${dto.branch_addr }</p>
					<button class="maphide" id="public2">지도 닫기</button> 
					<div style="width: 445px; height: 326px; left: 0%; top: 7%; margin-left: -250; position: absolute;">

					</div> 
				</div>   

				<div class="notice_wrap_emp"></div>
			</div>
			<div class="rcm_wrap">
				<div class="rcm_txt_wrap">
					<div class="rcm_txt">
						<strong>${dto.branch_name}</strong>에서 <br> <span>블랙
							팬서: 와칸다 포에버</span><br> 어떠세요 ?
					</div>
					<div class="rcm_info">
						<dt>블랙 팬서: 와칸다 포에버</dt>
						<dd>
							예매율 <span>71.3%</span>
						</dd>
						<dd>
							<span class="txt_ic_score ty1"><em>평점</em> <strong>8.6</strong></span>
						</dd>
					</div>
					<div class="btn_wrap">
						<button class="btn_share">공유</button>
						<div id="layerShare" class="layer_wrap layer_share"></div>
						<button type="button" id="presetlike"
							class="btnToggle btn_heart ty2">관심등록</button>
						<a href="./Ticketing.tk" class="btn_col1 ty3 rnd">프리셋예매</a>
					</div>
					<div class="thm">
						<a
							href="https://www.lottecinema.co.kr/NLCHS/Movie/MovieDetailView?movie=18944"
							title="영화상세페이지로 이동"><img
							src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/18944_101_1.jpg"
							alt="블랙 팬서: 와칸다 포에버"></a>
					</div>
				</div>
			</div>
		</div>
		<ul class="tab_wrap outer actionmovingbar">
			<li class="active"><button id="dates" type="button"
					class="tab_tit" style="width: 50%; left: 0%;">
					<span>상영시간표</span>
				</button>
				<div class="tab_con ty5" id="timeTable" style="zoom: 1;">
					<h4 class="hidden">상영시간표</h4>
					<div class="date_select_wrap datetheaterWrap">
						<div class="slide_wrap slide_reserve_date_wide">
							<ul id="datesel" class="owl-two owl-carousel owl-loaded owl-drag">
								<div class="owl-stage-outer">
									<!-- 날짜선택 -->
									<div class="owl-stage"
										style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1881px;">
										<div class="owl-item active" style="width: 67.143px;">
											<li class="item"><span class="date disabled"><label><input
														type="radio" name="radioDate1" disabled="disabled"><strong>${yd }</strong><em>${ye }</em></label></span></li>
										</div>
										<c:forEach var="date" items="${dateList }">

											<div class="owl-item active" style="width: 67.143px;">
												<li class="item"><strong class="month">${m }월</strong><span
													class="date"><label> <input type="radio"
															name="radioDate1" checked=""> <a
															href="./branch.th?branchCd=${date.branchCd }&date=${ymd}#dates"><strong>${d }</strong><em>오늘</em></a></label></span></li>
											</div>
											<div class="owl-item active" style="width: 67.143px;">
												<li class="item"><span class="date"><label>
															<input type="radio" name="radioDate1"><a
															href="./branch.th?branchCd=${date.branchCd }&date=${ymd1}#dates"><strong>${d1 }</strong><em>${e1 }</em></a>
													</label></span></li>
											</div>
											<div class="owl-item active" style="width: 67.143px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1"><a
															href="./branch.th?branchCd=${date.branchCd }&date=${ymd2}#dates"><strong>${d2 }</strong><em>${e2 }</em></a></label></span></li>
											</div>
											<div class="owl-item active" style="width: 67.143px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1"><a
															href="./branch.th?branchCd=${date.branchCd }&date=${ymd3}#dates"><strong>${d3 }</strong><em>${e3 }</em></a></label></span></li>
											</div>
											<div class="owl-item active" style="width: 67.143px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1"><a
															href="./branch.th?branchCd=${date.branchCd }&date=${ymd4}#dates"><strong>${d4 }</strong><em>${e4 }</em></a></label></span></li>
											</div>
											<div class="owl-item active" style="width: 67.143px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1"><a
															href="./branch.th?branchCd=${date.branchCd }&date=${ymd5}#dates"><strong>${d5 }</strong><em>${e5 }</em></a></label></span></li>
											</div>
											<div class="owl-item active" style="width: 67.143px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1"><a
															href="./branch.th?branchCd=${date.branchCd }&date=${ymd6}#dates"><strong>${d6 }</strong><em>${e6 }</em></a></label></span></li>
											</div>
											<div class="owl-item active" style="width: 67.143px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1"><a
															href="./branch.th?branchCd=${date.branchCd }&date=${ymd7}#dates"><strong>${d7 }</strong><em>${e7 }</em></a></label></span></li>
											</div>
											<div class="owl-item active" style="width: 67.143px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1"><a
															href="./branch.th?branchCd=${date.branchCd }&date=${ymd8}#dates"><strong>${d8 }</strong><em>${e8 }</em></a></label></span></li>
											</div>
										</c:forEach>
									</div>
								</div>
							</ul>
						</div>
					</div>
					<div class="movie_grade_wrap">
						<span class="txt_grade gr_all">전체 관람가</span><span
							class="txt_grade gr_12">만 12세 이상 관람가</span><span
							class="txt_grade gr_15">만 15세 이상 관람가</span><span
							class="txt_grade gr_18">청소년 관람불가</span>
						<button type="button" class="btn_txt_notice" title="레이어팝업 열기"
							id="showBtn">관람등급안내</button>

					</div>

				</div></li>
			<li class=""><button type="button" class="tab_tit"
					style="width: 50%; left: 50%;">
					<span>요금안내</span>
				</button>
				<div class="tab_con ty2">
					<h4 class="hidden">요금안내</h4>
					<ul class="tab_wrap outer lft sml">
						<li class="active"><button type="button" class="tab_tit"
								style="left: 0px; width: 48px;">
								<span>일반관</span>
							</button>
							<div class="tab_con ty2">
								<h4 class="hidden">일반관</h4>
								<div class="th_price_wrap">
									<div>
										<div class="th_price_tit">
											<h5 class="tit">2D 씨네컴포트(리클라이너)</h5>
											<p>단, 공휴일은 주말요금 반영</p>
										</div>
										<table class="th_price_table"
											summary="2D 씨네컴포트(리클라이너) 영화관 요금에 대한 내용입니다.">
											<caption>2D 영화관 요금</caption>
											<colgroup>
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: auto;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: auto;">
											</colgroup>
											<thead>
												<tr>
													<th colspan="7">주중<span>(월~목)</span></th>
													<th colspan="7">주말<span>(금~일)</span></th>
												</tr>
											</thead>
											<tbody>
												<tr class="price_tabletoptitle">
													<th class="txtleft">구분</th>
													<th>성인</th>
													<th>청소년</th>
													<th>시니어</th>
													<th>장애인</th>
													<th>어린이</th>
													<th>&nbsp;</th>
													<th class="txtleft">구분</th>
													<th>성인</th>
													<th>청소년</th>
													<th>시니어</th>
													<th>장애인</th>
													<th>어린이</th>
													<th>&nbsp;</th>
												</tr>
												<tr>
													<th>조조</th>
													<td>13,000</td>
													<td>11,000</td>
													<td>10,000</td>
													<td>8,000</td>
													<td>-</td>
													<td>&nbsp;</td>
													<th>조조</th>
													<td>14,000</td>
													<td>11,000</td>
													<td>10,000</td>
													<td>8,000</td>
													<td>-</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<th>일반</th>
													<td>15,000</td>
													<td>12,000</td>
													<td>11,000</td>
													<td>8,000</td>
													<td>-</td>
													<td>&nbsp;</td>
													<th>일반</th>
													<td>16,000</td>
													<td>13,000</td>
													<td>12,000</td>
													<td>8,000</td>
													<td>-</td>
													<td>&nbsp;</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div>
										<div class="th_price_tit">
											<h5 class="tit">2D 일반석</h5>
											<p>단, 공휴일은 주말요금 반영</p>
										</div>
										<table class="th_price_table"
											summary="2D 일반석 영화관 요금에 대한 내용입니다.">
											<caption>2D 영화관 요금</caption>
											<colgroup>
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: auto;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: auto;">
											</colgroup>
											<thead>
												<tr>
													<th colspan="7">주중<span>(월~목)</span></th>
													<th colspan="7">주말<span>(금~일)</span></th>
												</tr>
											</thead>
											<tbody>
												<tr class="price_tabletoptitle">
													<th class="txtleft">구분</th>
													<th>성인</th>
													<th>청소년</th>
													<th>시니어</th>
													<th>장애인</th>
													<th>어린이</th>
													<th>&nbsp;</th>
													<th class="txtleft">구분</th>
													<th>성인</th>
													<th>청소년</th>
													<th>시니어</th>
													<th>장애인</th>
													<th>어린이</th>
													<th>&nbsp;</th>
												</tr>
												<tr>
													<th>조조</th>
													<td>10,000</td>
													<td>8,000</td>
													<td>7,000</td>
													<td>5,000</td>
													<td>-</td>
													<td>&nbsp;</td>
													<th>조조</th>
													<td>11,000</td>
													<td>8,000</td>
													<td>7,000</td>
													<td>5,000</td>
													<td>-</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<th>일반</th>
													<td>12,000</td>
													<td>10,000</td>
													<td>7,000</td>
													<td>5,000</td>
													<td>-</td>
													<td>&nbsp;</td>
													<th>일반</th>
													<td>14,000</td>
													<td>10,000</td>
													<td>7,000</td>
													<td>5,000</td>
													<td>-</td>
													<td>&nbsp;</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div>
										<div class="th_price_tit">
											<h5 class="tit">3D</h5>
											<p>단, 공휴일은 주말요금 반영</p>
										</div>
										<table class="th_price_table" summary="3D  영화관 요금에 대한 내용입니다.">
											<caption>2D 영화관 요금</caption>
											<colgroup>
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: auto;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: auto;">
											</colgroup>
											<thead>
												<tr>
													<th colspan="7">주중<span>(월~목)</span></th>
													<th colspan="7">주말<span>(금~일)</span></th>
												</tr>
											</thead>
											<tbody>
												<tr class="price_tabletoptitle">
													<th class="txtleft">구분</th>
													<th>성인</th>
													<th>청소년</th>
													<th>시니어</th>
													<th>장애인</th>
													<th>어린이</th>
													<th>&nbsp;</th>
													<th class="txtleft">구분</th>
													<th>성인</th>
													<th>청소년</th>
													<th>시니어</th>
													<th>장애인</th>
													<th>어린이</th>
													<th>&nbsp;</th>
												</tr>
												<tr>
													<th>조조</th>
													<td>11,000</td>
													<td>10,000</td>
													<td>10,000</td>
													<td>8,000</td>
													<td>-</td>
													<td>&nbsp;</td>
													<th>조조</th>
													<td>12,000</td>
													<td>10,000</td>
													<td>10,000</td>
													<td>8,000</td>
													<td>-</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<th>일반</th>
													<td>13,000</td>
													<td>12,000</td>
													<td>10,000</td>
													<td>8,000</td>
													<td>-</td>
													<td>&nbsp;</td>
													<th>일반</th>
													<td>15,000</td>
													<td>12,000</td>
													<td>10,000</td>
													<td>8,000</td>
													<td>-</td>
													<td>&nbsp;</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div>
										<div class="th_price_tit">
											<h5 class="tit">3D 씨네컴포트(리클라이너)</h5>
											<p>단, 공휴일은 주말요금 반영</p>
										</div>
										<table class="th_price_table"
											summary="3D 씨네컴포트(리클라이너) 영화관 요금에 대한 내용입니다.">
											<caption>2D 영화관 요금</caption>
											<colgroup>
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: auto;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: 7%;">
												<col style="width: auto;">
											</colgroup>
											<thead>
												<tr>
													<th colspan="7">주중<span>(월~목)</span></th>
													<th colspan="7">주말<span>(금~일)</span></th>
												</tr>
											</thead>
											<tbody>
												<tr class="price_tabletoptitle">
													<th class="txtleft">구분</th>
													<th>성인</th>
													<th>청소년</th>
													<th>시니어</th>
													<th>장애인</th>
													<th>어린이</th>
													<th>&nbsp;</th>
													<th class="txtleft">구분</th>
													<th>성인</th>
													<th>청소년</th>
													<th>시니어</th>
													<th>장애인</th>
													<th>어린이</th>
													<th>&nbsp;</th>
												</tr>
												<tr>
													<th>조조</th>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>&nbsp;</td>
													<th>조조</th>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<th>일반</th>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>&nbsp;</td>
													<th>일반</th>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>&nbsp;</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="th_price_info_wrap">
										<div class="bx_para">
											<strong class="tit">[각 시간대별 기준]</strong>
											<ul class="list_txt">
												<li>조조 : 09시 59시</li>
												<li>일반 : 10시 00시</li>
											</ul>

											<strong class="tit">[요일 구분 기준]</strong>
											<ul class="list_txt">
												<li>주중 : 월~목</li>
												<li>주말 : 금~일(단,공휴일은 주말요금이 적용됩니다)</li>
											</ul>

											<strong class="tit">[청소년 할인]</strong>
											<ul class="list_txt">
												<li>만 4세이상~만 18세 미만의 학생 또는 청소년(어린이)</li>
											</ul>

											<strong class="tit">[장애 우대할인]</strong>
											<ul class="list_txt">
												<li>현장에서 복지카드를 소지한 장애인(장애의 정도가 심한 장애인 : 동반 1인까지 적용(기존
													1~3등급) / 장애의 정도가 심하지 않은 장애인 : 본인에 한함(기존 4~6등급)</li>
											</ul>
										</div>
									</div>
								</div>
							</div></li>
						<li class=""><button type="button" class="tab_tit"
								style="left: 48px; width: 60px;">
								<span>스페셜관</span>
							</button>
							<div class="tab_con">
								<h4 class="hidden">스페셜관</h4>
								<div class="nonCinemaSpecialText">해당 영화관에는 스페셜관이 없습니다.</div>
								<div style="margin-bottom: 5px;"></div>
								<div class="th_price_wrap">
									<div class="th_price_info_wrap">
										<div class="bx_para">
											<strong class="tit">[각 시간대별 기준]</strong>
											<ul class="list_txt">
												<li>조조 : 09시 59시</li>
												<li>일반 : 10시 00시</li>
											</ul>

											<strong class="tit">[요일 구분 기준]</strong>
											<ul class="list_txt">
												<li>주중 : 월~목</li>
												<li>주말 : 금~일(단,공휴일은 주말요금이 적용됩니다)</li>
											</ul>

											<strong class="tit">[청소년 할인]</strong>
											<ul class="list_txt">
												<li>만 4세이상~만 18세 미만의 학생 또는 청소년(어린이)</li>
											</ul>

											<strong class="tit">[장애 우대할인]</strong>
											<ul class="list_txt">
												<li>현장에서 복지카드를 소지한 장애인(장애의 정도가 심한 장애인 : 동반 1인까지 적용(기존
													1~3등급) / 장애의 정도가 심하지 않은 장애인 : 본인에 한함(기존 4~6등급)</li>
											</ul>
										</div>
									</div>
								</div>
							</div></li>
					</ul>
				</div></li>
		</ul>
		<div id="text" hidden="" class="llayer_wrap layer_movie_grade">
			<strong class="hidden">레이어 팝업 시작</strong>
			<div class="layer_header">
				<h4 class="tit" style="text-align: center; padding-bottom: 10px;">관람등급
					안내</h4>
				<button id="hideBtn" type="button"></button>
			</div>
			<div class="layer_contents">
				<table class="tbl_dtal" summary="이벤트 당첨자에 대한 내용입니다.">
					<caption>이벤트 당첨자</caption>
					<colgroup>
						<col style="width: 40%;">
						<col style="width: auto;">
					</colgroup>
					<thead>
						<tr>
							<th class="text_c">등급명</th>
							<th class="text_c">설명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="txt_grade gr_all">전체 관람가</span></td>
							<td>모든 연령의 관람객이 관람할 수 있는 영화</td>
						</tr>
						<tr>
							<td><span class="txt_grade gr_12">만 12세 이상 관람가</span></td>
							<td>만 12세 미만의 관람객은 관람할 수 없는 영화<br>부모 및 보호자 동반 시 관람 가능
							</td>
						</tr>
						<tr>
							<td><span class="txt_grade gr_15">만 15세 이상 관람가</span></td>
							<td>만 15세 미만의 관람객은 관람할 수 없는 영화<br>부모 및 보호자 동반 시 관람 가능
							</td>
						</tr>
						<tr>
							<td><span class="txt_grade gr_18">청소년 관람불가</span></td>
							<td>만 18세 미만의 관람객은 관람할 수 없는 영화<br>보호자 동반과 관계없이 초중고 재학
								중인 청소년 및 영유아 관람 불가
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<strong class="hidden txtTabIndex" tabindex="0">레이어 팝업 끝</strong>
		</div>
		<%-- 작업공간 --%>

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
										href="./SeatSelect.th?scCode=${fsche.scCode}"
										role="button">
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


	</div>


	<div id="layerMovieTrailer" class="layer_wrap ty2 layer_movie_trailer"></div>

	<div id="layerLocationPublic" class="layer_wrap layer_location_public"></div>
	<div id="layerLocationCar" class="layer_wrap layer_location_car"></div>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c915430ac4edcd6aa694ae234c0de27"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(${dto.branch_longitude}, ${dto.branch_latitude}), // 지도의 중심좌표
			draggable : true,
			// draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		var markerPosition  = new kakao.maps.LatLng(${dto.branch_longitude}, ${dto.branch_latitude}); 
		// 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
		function setDraggable(draggable) {
			// 마우스 드래그로 지도 이동 가능여부를 설정합니다
			map.setDraggable(draggable);
			
		}
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);
	</script>




	<!-- 하단배너 -->
	<jsp:include page="../inc/loginform_bottom_banner.jsp" />
	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />





</body>
</html>