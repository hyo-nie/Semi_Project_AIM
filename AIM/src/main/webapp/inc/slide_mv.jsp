<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<jsp:include page="../inc/include.jsp" />
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
			items : 5, // 한번에 보여줄 아이템 수
			loop : true, // 반복여부
			margin : 20, // 오른쪽 간격
			autoplay : true, // 자동재생 여부
			autoplayTimeout : 2500, // 재생간격
			autoplayHoverPause : false, //마우스오버시 멈출지 여부
			mouseDrag : true,
			touchDrag : true

		});
	});
</script>
<c:set var="today" value="<%=new Date()%>" />
<fmt:formatDate var="md" pattern="MM.dd" value="${today }" />
<fmt:formatDate var="hms" pattern="HH:mm" value="${today }" />
<div id="sub_section">
	<div id="visualAd" class="visual_top visual_main">
		<div class="inner">
			<div class="slide_wrap slide_main_visual">
				<div class="owl-one owl-carousel owl-loaded owl-drag">
					<!-- 오울 로딩 -->
					<div class="owl-stage-outer">
						<!-- 오울 -->
						<div class="owl-stage"
							style="transform: translate3d(-7680px, 0px, 0px); transition: all 0.25s ease 0s; width: 21120px;">
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/CC/CC_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/CC/CC_1280720.mp4"
										alt="크리스마스 캐럴 12월 7일 대개봉 핏빛으로 물든 크리스마스 피할 수 없는 폭력의 시작 박진영 김영민 김동휘 송건희 허동원 감독 김성수 청소년관람불가"></a>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1280720.mp4"
										alt="아바타 물의길 판도라의 바다 새로운 세계가 펼쳐진다 12월 대개봉 관람등급미정"></a>
								</div>
							</div>
							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1280720.mp4"
										alt="스트레인지 월드 절찬상영중 전체관람가 겨울왕국 엔칸토 제작진"></a>
								</div>
							</div>

							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/CC/CC_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/CC/CC_1280720.mp4"
										alt="크리스마스 캐럴 12월 7일 대개봉 핏빛으로 물든 크리스마스 피할 수 없는 폭력의 시작 박진영 김영민 김동휘 송건희 허동원 감독 김성수 청소년관람불가"></a>
								</div>
							</div>

							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1280720.mp4"
										alt="아바타 물의길 판도라의 바다 새로운 세계가 펼쳐진다 12월 대개봉 관람등급미정"></a>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1280720.mp4"
										alt="스트레인지 월드 절찬상영중 전체관람가 겨울왕국 엔칸토 제작진"></a>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/CC/CC_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/CC/CC_1280720.mp4"
										alt="크리스마스 캐럴 12월 7일 대개봉 핏빛으로 물든 크리스마스 피할 수 없는 폭력의 시작 박진영 김영민 김동휘 송건희 허동원 감독 김성수 청소년관람불가"></a>
								</div>
							</div>
						</div>
					</div>
					<div class="owl-nav" style="width: 695px; margin-left: -347.5px;">
						<button type="button" role="presentation" class="owl-prev">
							<span aria-label="Previous">‹</span>
						</button>
						<button type="button" role="presentation" class="owl-next">
							<span aria-label="Next">›</span>
						</button>
					</div>
					<div class="owl-dots">
						<button role="button" class="owl-dot active">
							<span></span>
						</button>
						<button role="button" class="owl-dot">
							<span></span>
						</button>
						<button role="button" class="owl-dot">
							<span></span>
						</button>
						<button role="button" class="owl-dot">
							<span></span>
						</button>
					</div>
				</div>
				<div class="bx_ctrl" style="left: 66px;">
					<button class="play active">슬라이드 자동재생</button>
					<button class="stop">슬라이드 일시정지</button>
				</div>
			</div>
		</div>
	</div>
	<div id="contents" class="contents_main">
		<div class="movi_current_list">
			<span class="movi_info_txt"><a href="./MovieList.mv"><em
					class="now">${md }&nbsp; ${hms }</em>&nbsp;기준</a></span>
			<ul class="tab_wrap outer lft">
				<li class="active">
					<div class="tab_con">
						<h3 class="hidden"></h3>
						<div class="main_movie_list">
							<div class="slide_wrap slide_main_movie">
								<div class="owl-two owl-carousel owl-loaded owl-drag">
									<div class="owl-stage-outer">
										<div class="owl-stage"
											style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 4378px;">
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19162_101_1.jpg"
															alt="올빼미"><em class="num_info">1</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">올빼미</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>53.0%</em></span><span
															class="remain_info">D--1</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/18944_101_1.jpg"
															alt="블랙 팬서: 와칸다 포에버"><em class="num_info">2</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">블랙 팬서: 와칸다 포에버</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>9.4%</em></span><span
															class="star_info" style="cursor: pointer;">8.6</span><span
															class="heart_info"><button type="button"
																	class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19184_101_1.jpg"
															alt="데시벨"><em class="num_info">3</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">데시벨</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>8.0%</em></span><span
															class="star_info" style="cursor: pointer;">9</span><span
															class="heart_info"><button type="button"
																	class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19217_101_1.jpg"
															alt="스트레인지 월드"><em class="num_info">4</em><span
															class="ic_grade gr_all">전체</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">스트레인지 월드</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>6.8%</em></span><span
															class="remain_info">D--1</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching2.lottecinema.co.kr/lotte_image/2022/Samsungfire/1004/Samsungfire_184262.png"
															alt=""><em class="num_info">AD</em></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -14px;">
																<a
																	href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_33&amp;adgroupid=adg_lottecinema_20221031_41&amp;adid=adi_lottecinema_20221031_41"
																	target="_blank" class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19117_101_1.jpg"
															alt="동감"><em class="num_info">5</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">동감</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>6.4%</em></span><span
															class="star_info" style="cursor: pointer;">8.9</span><span
															class="heart_info"><button type="button"
																	class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19216_101_1.jpg"
															alt="압꾸정"><em class="num_info">6</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">압꾸정</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>2.2%</em></span><span
															class="remain_info">D-7</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19202_101_1.jpg"
															alt="아마겟돈 타임"><em class="num_info">7</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">아마겟돈 타임</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>1.8%</em></span><span
															class="remain_info">D--1</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/18983_101_1.jpg"
															alt="에브리씽 에브리웨어 올 앳 원스"><em class="num_info">8</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">에브리씽 에브리웨어 올 앳 원스</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>1.4%</em></span><span
															class="star_info" style="cursor: pointer;">8.7</span><span
															class="heart_info"><button type="button"
																	class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202212/19239_101_1.jpg"
															alt="극장판 뽀로로와 친구들: 바이러스를 없애줘!"><em class="num_info">9</em><span
															class="ic_grade gr_all">전체</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">극장판 뽀로로와 친구들: 바이러스를 없애줘!</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>1.0%</em></span><span
															class="remain_info">D-8</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19073_101_1.jpg"
															alt="원피스 필름 레드"><em class="num_info">10</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">원피스 필름 레드</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.9%</em></span><span
															class="remain_info">D-7</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19179_101_1.jpg"
															alt="놈이 우리 안에 있다"><em class="num_info">11</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">놈이 우리 안에 있다</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.6%</em></span><span
															class="remain_info">D--1</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19155_101_1.jpg"
															alt="폴: 600미터"><em class="num_info">12</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">폴: 600미터</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.6%</em></span><span
															class="star_info" style="cursor: pointer;">9.1</span><span
															class="heart_info"><button type="button"
																	class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19223_101_1.jpg"
															alt="본즈 앤 올"><em class="num_info">13</em><span
															class="ic_grade gr_18">청불</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">본즈 앤 올</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.4%</em></span><span
															class="remain_info">D-7</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19254_101_1.jpg"
															alt="그녀가 말했다"><em class="num_info">14</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">그녀가 말했다</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.3%</em></span><span
															class="remain_info">D-7</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202209/18967_101_1.jpg"
															alt="극장판 짱구는 못말려: 수수께끼! 꽃피는 천하떡잎학교"><em
															class="num_info">15</em><span class="ic_grade gr_all">전체</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">극장판 짱구는 못말려: 수수께끼! 꽃피는
															천하떡잎학교</strong><span class="sub_info1"><span
															class="rate_info">예매율&nbsp;<em>0.3%</em></span><span
															class="star_info" style="cursor: pointer;">9.5</span><span
															class="heart_info"><button type="button"
																	class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19009_101_1.jpg"
															alt="자백"><em class="num_info">16</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">자백</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.3%</em></span><span
															class="star_info" style="cursor: pointer;">9.3</span><span
															class="heart_info"><button type="button"
																	class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item active"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19221_101_1.jpg"
															alt="세이레"><em class="num_info">17</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">세이레</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.2%</em></span><span
															class="remain_info">D-1</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item active"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202012/16508_101_1.jpg"
															alt="인생은 아름다워"><em class="num_info">18</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">인생은 아름다워</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.2%</em></span><span
															class="star_info" style="cursor: pointer;">9.5</span><span
															class="heart_info"><button type="button"
																	class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item active"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202212/19225_101_1.jpg"
															alt="양성인간"><em class="num_info">19</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">양성인간</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.1%</em></span><span
															class="remain_info">D-8</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item active"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19256_101_1.jpg"
															alt="오늘 밤, 세계에서 이 사랑이 사라진다 해도"><em class="num_info">20</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">오늘 밤, 세계에서 이 사랑이 사라진다 해도</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.1%</em></span><span
															class="remain_info">D-7</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item active"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19260_101_1.jpg"
															alt="한산 리덕스"><em class="num_info">21</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">한산 리덕스</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.1%</em></span><span
															class="star_info" style="cursor: pointer;">9.5</span><span
															class="heart_info"><button type="button"
																	class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="owl-nav">
										<button type="button" role="presentation"
											class="owl-prev disabled">
											<span aria-label="Previous">‹</span>
										</button>
										<button type="button" role="presentation" class="owl-next">
											<span aria-label="Next">›</span>
										</button>
									</div>
									<div class="owl-dots disabled"></div>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="main_cont_wrap notice">
			<div class="sec_tit">공지사항</div>
			<div class="rolling_menu_wrap">
				<ul class="rollings" style="top: -30px;">
					<li><a href="http://localhost:8080/AIM/NtContent.nt?nt_bno=1&pageNum=1" title="">A.I.M 개인정보처리방침 개정 안내</a></li>
					<li><a href="http://localhost:8080/AIM/NtContent.nt?nt_bno=2&pageNum=1" title="">회원약관 및 개인정보처리방침 개정 안내</a></li>
					<li><a href="http://localhost:8080/AIM/NtContent.nt?nt_bno=4&pageNum=1" title="">A.I.M 영상정보처리기기 운영 및 관리방침 개정 안내</a></li>
					<li><a href="http://localhost:8080/AIM/NtContent.nt?nt_bno=5&pageNum=1" title="">시스템 점검 안내</a></li>
					<li><a href="http://localhost:8080/AIM/NtContent.nt?nt_bno=6&pageNum=1" title="">공지사항 상세내용 푸시(알림) 서비스 점검 안내</a></li>
					<li><a href="http://localhost:8080/AIM/NtContent.nt?nt_bno=7&pageNum=1" title="">A.I.M &lt;방역패스&gt; 적용 해제 안내</a></li>
				</ul>
			</div>
		</div>

		<!-- store/event -->
		<div class="main_cont_wrap premiere">
			<div class="sec_tit" style="font-size: 22px; margin-top: 40px;">AIM's
				pick</div>
			<ul class="premiere_wrap">
				<li><div class="store" style="margin-top: 5px; border: 1px;">
						<br> <span class="span1"
							style="margin: 120px; color: darkslategray; font-size: 14px;">AIM
							콤보</span>
						<table>
							<tr>
								<td class="img"><a
									href="http://localhost:8081/AIM/PopcornDetail.st?st_num=6">
										<img class="img1" src="./assets/img/AIM콤보.jpg"
										style="height: 200px; margin-top: 35px; margin-bottom: 30px;">
								</a></td>
							</tr>
						</table>
					</div>
				<li><div class="store" style="margin-top: 5px; border: 1px;">
						<br> <span class="span2"
							style="margin: 105px; color: darkslategray; font-size: 14px;">AIM
							기프트카드</span>
						<table>
							<tr>
								<td class="img"><a
									href="http://localhost:8081/AIM/PopcornDetail.st?st_num=2">
										<img class="img1" src="./assets/img/3만원.jpg"
										style="width: 260px; height: 180px; margin-top: 40px; margin-bottom: 30px;">
								</a></td>
							</tr>
						</table>
					</div></li>
				<li><div class="store" style="margin-top: 5px; border: 1px;">
						<br> <span class="span3"
							style="margin: 105px; color: darkslategray; font-size: 14px;">AIM
							관람권</span>
						<table>
							<tr>
								<td class="img"><a
									href="http://localhost:8081/AIM/PopcornDetail.st?st_num=5">
										<img class="img1" src="./assets/img/2인.jpg"
										style="width: 260px; height: 180px; margin-top: 40px; margin-bottom: 30px;">
								</a></td>
							</tr>
						</table>
					</div></li>

			</ul>
			<button type="button" class="btn_txt_more ty2"
				style="font-size: 13px;" onclick="location.href='./StoreMain.st'">더보기</button>
		</div>


		<div class="main_cont_wrap premiere">
			<div class="sec_tit" style="font-size: 22px;">시사회/무대인사</div>
			<ul class="premiere_wrap">
				<li><a href="#none"><img
						src="https://caching.lottecinema.co.kr//Media/Event/f5eb4d354c194fa3b68d3a5facac9703.jpg"
						alt="[오늘 밤, 세계에서] 스페셜 상영회" style="margin-top: 5px;"></a></li>
				<li><a href="#none"><img
						src="https://caching.lottecinema.co.kr//Media/Event/10125de1b57e42769ebcec0ede7837a9.jpg"
						alt="<동감> 2주차 무대인사" style="margin-top: 5px;"></a></li>
				<li><a href="#none"><img
						src="https://caching.lottecinema.co.kr//Media/Event/e7a59bf03baf4980b33d58c33c5635cd.jpg"
						alt="롯데시네마와 함께하는 올빼미 개봉주 무대인사 안내" style="margin-top: 5px;"></a></li>
			</ul>
		</div>

		<!-- 		<div class="mid_menu_wrap">
			<a href="#none" class="mid_itm" title=""> <img
				src="https://caching.lottecinema.co.kr//Media/WebAdmin/3423e358b74d49d5b12867c7d9c6f6a8.png"
				alt="할인안내"></a> <a href="#none" class="mid_itm" title=""> <img
				src="https://caching.lottecinema.co.kr//Media/WebAdmin/16b056e5e6a04c609b94a5c21e786d3b.png"
				alt="포인트"></a> <a href="#none" class="mid_itm" title=""> <img
				src="https://caching.lottecinema.co.kr//Media/WebAdmin/9fd4a77cd6a44a39aa35d07e5bb8a010.png"
				alt="멤버십"></a> <a href="#none" class="mid_itm" title=""> <img
				src="https://caching.lottecinema.co.kr//Media/WebAdmin/3633088df0644062b53cd88b34067895.png"
				alt="틴틴클럽"></a> <a href="#none" class="mid_itm" title=""> <img
				src="https://caching.lottecinema.co.kr//Media/WebAdmin/9c4e2721ecdd488d86df6d27e3c2a000.png"
				alt="bravo 브라보클럽"></a>
		</div> -->

	</div>
</div>