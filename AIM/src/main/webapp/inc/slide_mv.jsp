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
							style="transform: translate3d(-3840px, 0px, 0px); transition: all 0.25s ease 0s; width: 11520px;">
							<!-- 오울 -->
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/boo_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/boo_1280720.mp4"
										alt="극장판 뽀로로와 친구들 바이러스를 없애줘 전체관람가 12월 1일 롯데시네마에서 만나요 네모바이러스의 습격 친구들을 구하라"></a>
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
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1280720.mp4"
										alt=""></a>
								</div>
							</div>
							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/PR/PR_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/PR/PR_1280720.mp4"
										alt="프레이 포 더 데블 12월 7일 대개봉 15세이상관람가 애나벨 인시디어스 제작진"></a>
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
							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/boo_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/boo_1280720.mp4"
										alt="극장판 뽀로로와 친구들 바이러스를 없애줘 전체관람가 12월 1일 롯데시네마에서 만나요 네모바이러스의 습격 친구들을 구하라"></a>
								</div>
							</div>
							<div class="owl-item active" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1280720.mp4"
										alt=""></a>
								</div>
							</div>
							<div class="owl-item cloned" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/PR/PR_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/PR/PR_1280720.mp4"
										alt="프레이 포 더 데블 12월 7일 대개봉 15세이상관람가 애나벨 인시디어스 제작진"></a>
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


		<!-- store/event -->
		<div class="main_cont_wrap premiere">
			<div class="sec_tit">AIM 스토어</div>
			<ul class="premiere_wrap">
				<li><div class="store">
						<br> <span class="span1">AIM 기프트카드</span>
						<button onclick="giftcard">더보기</button>
						<dl>
							<table>
								<tr>
									<dt>
									<td class="img"><a href=""><img class="img1"
											src="./assets/img/giftcard.png" width="150px" height="80px"></a></td>
									<td class="name">AIM 기프트카드<br>10000원
									</td>
									</dt>
								</tr>
								<tr>
									<dt>
									<td class="img"><a href=""><img class="img1"
											src="./assets/img/giftcard.png" width="150px" height="80px"></a></td>
									<td class="name">AIM 기프트카드<br>20000원
									</td>
									</dt>
								</tr>
								<tr>
									<dt>
									<td class="img"><a href=""><img class="img1"
											src="./assets/img/giftcard.png" width="150px" height="80px"></a></td>
									<td class="name">AIM 기프트카드<br>30000원
									</td>
									</dt>
								</tr>
							</table>
						</dl>
					</div>
				<li><div class="store">
						<br> <span class="span2">AIM 관람권</span>
						<button onclick="ticket">더보기</button>
						<dl>
							<table>
								<tr>
									<dt>
									<td class="img"><a href=""><img class="img1"
											src="./assets/img/ticket.png" width="150px" height="80px"></a></td>
									<td class="name">AIM 1인관람권<br>13000원
									</td>
									</dt>
								</tr>
								<tr>
									<dt>
									<td class="img"><a href=""><img class="img1"
											src="./assets/img/ticket.png" width="150px" height="80px"></a></td>
									<td class="name">AIM 2인관람권<br>25000원
									</td>
									</dt>
								</tr>
								<tr>
									<dt>
									<td class="img"><a href=""><img class="img1"
											src="./assets/img/ticket.png" width="150px" height="80px"></a></td>
									<td class="name">AIM 3인관람권<br>33000원
									</td>
									</dt>
								</tr>
							</table>
						</dl>
					</div></li>
				<li><div class="store">
						<br> <span class="span3">AIM 콤보</span>
						<button onclick="combo">더보기</button>
						<dl>
							<table>
								<tr>
									<dt>
									<td class="img"><a href=""><img class="img1"
											src="./assets/img/popcon.png" width="150px" height="80px"></a></td>
									<td class="name">AIM 콤보<br>10000원
									</td>
									</dt>
								</tr>
								<tr>
									<dt>
									<td class="img"><a href=""><img class="img1"
											src="./assets/img/popcon.png" width="150px" height="80px"></a></td>
									<td class="name">AIM 스몰콤보<br>7000원
									</td>
									</dt>
								</tr>
								<tr>
									<dt>
									<td class="img"><a href=""><img class="img1"
											src="./assets/img/popcon.png" width="150px" height="80px"></a></td>
									<td class="name">AIM 커플콤보<br>15000원
									</td>
									</dt>
								</tr>
							</table>
						</dl>
					</div></li>

			</ul>
			<button type="button" class="btn_txt_more ty2">더보기</button>
		</div>


		<div class="main_cont_wrap premiere">
			<div class="sec_tit">시사회/무대인사</div>
			<ul class="premiere_wrap">
				<li><a href="#none"><img
						src="https://caching.lottecinema.co.kr//Media/Event/f5eb4d354c194fa3b68d3a5facac9703.jpg"
						alt="[오늘 밤, 세계에서] 스페셜 상영회"></a></li>
				<li><a href="#none"><img
						src="https://caching.lottecinema.co.kr//Media/Event/10125de1b57e42769ebcec0ede7837a9.jpg"
						alt="<동감> 2주차 무대인사"></a></li>
				<li><a href="#none"><img
						src="https://caching.lottecinema.co.kr//Media/Event/e7a59bf03baf4980b33d58c33c5635cd.jpg"
						alt="롯데시네마와 함께하는 올빼미 개봉주 무대인사 안내

스크린에서 눈 뗄 수 없는 118분의 긴장감
올빼미
개봉주 무대인사 안내
참석자는 아래 상세 스케줄을 확인하세요


11/26(토)	
롯데시네마 청량리	
1관	13:50	시영 시	안태진 감독, 류준열, 최무성, 박명훈, 김성철, 조윤서
4관	14:00	시영 시	안태진 감독, 류준열, 최무성, 박명훈, 김성철, 조윤서
5관	12:00	종영 시	안태진 감독, 류준열, 최무성, 박명훈, 김성철, 조윤서

롯데시네마 건대	
5관	16:40	시영 시	안태진 감독, 류준열, 최무성, 박명훈, 김성철, 조윤서
4관	14:40	종영 시	안태진 감독, 류준열, 최무성, 박명훈, 김성철, 조윤서
6관	14:50	종영 시	안태진 감독, 류준열, 최무성, 박명훈, 김성철, 조윤서

롯데시네마 월드타워	
5관	15:50	종영 시	안태진 감독, 류준열, 최무성, 박명훈, 김성철, 조윤서
8관	16:00	종영 시	안태진 감독, 류준열, 최무성, 박명훈, 김성철, 조윤서
20관	16:10	종영 시	안태진 감독, 류준열, 최무성, 박명훈, 김성철, 조윤서
5관	18:25	시영 시	안태진 감독, 류준열, 최무성, 박명훈, 김성철, 조윤서

유의사항 
-본 행사는 사정에 의해 예고 없이 변경/취소 될 수 있습니다. 
-본행사는 마스크 미착용 시 입장이 불가능합니다. 
-발열 및 호흡기 질환 증세가 있으실 경우 본인과 관람객을 위해 이용을 자제해주시기 바랍니다. 

올빼미 11월 23일 극장 개봉 "></a></li>
			</ul>
			<button type="button" class="btn_txt_more ty2">더보기</button>
		</div>
		<div class="main_cont_wrap notice">
			<div class="sec_tit">공지사항</div>
			<div class="rolling_menu_wrap">
				<ul class="rollings" style="top: -30px;">
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
					<li><a href="#none" title="">2D 일반 관람권 활용 스페셜관 이용 안내 </a></li>
					<li><a href="#none" title="">V3 백신 엔진 악성코드 오진 안내</a></li>
					<li><a href="#none" title="">AIM 영구VIP 서비스 종료 안내</a></li>
				</ul>
			</div>
		</div>
		<div class="mid_menu_wrap">
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
		</div>

	</div>
</div>