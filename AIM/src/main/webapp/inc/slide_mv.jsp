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
				<div class="owl-one owl-carousel owl-loaded owl-drag"> <!-- 오울 로딩 -->
					<div class="owl-stage-outer"> <!-- 오울 -->
						<div class="owl-stage" 
							style="transform: translate3d(-3840px, 0px, 0px); transition: all 0.25s ease 0s; width: 11520px;"><!-- 오울 -->
							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1280720_1.mp4"
										alt=""></a>
								</div>
							</div>
							<div class="owl-item" style="width: 1920px;">
								<div class="item">
									<a href="#none"><img
										src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1108/ST_1920774.jpg"
										data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1110/ST_1280720.mp4"
										alt=""></a>
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
			<span class="movi_info_txt"><a
				href="./MovieList.mv"><em class="now">${md }&nbsp;
						${hms }</em>&nbsp;기준</a></span> 
			 <ul class="tab_wrap outer lft">
				<li class="active"><button type="button" class="tab_tit"
						style="left: 0px; width: 20px;">
						<span></span>
					</button>
					<div class="tab_con">
						<h3 class="hidden"></h3>
						<div class="main_movie_list">
							<div class="slide_wrap slide_main_movie">
								<div class="owl-two owl-carousel owl-loaded owl-drag">
									<div class="owl-stage-outer">
										<div class="owl-stage"
											style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 4378px;">
											<div class="owl-item active"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/18944_101_1.jpg"
															alt="블랙 팬서: 와칸다 포에버"><em class="num_info">1</em><span
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
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>74.6%</em></span><span
															class="remain_info">D-2</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item active"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19009_101_1.jpg"
															alt="자백"><em class="num_info">2</em><span
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
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>5.6%</em></span><span
															class="star_info" style="cursor: pointer;">9.2</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/18983_101_1.jpg"
															alt="에브리씽 에브리웨어 올 앳 원스"><em class="num_info">3</em><span
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
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>2.7%</em></span><span
															class="star_info" style="cursor: pointer;">8.4</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19051_101_1.jpg"
															alt="리멤버"><em class="num_info">4</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">리멤버</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>2.4%</em></span><span
															class="star_info" style="cursor: pointer;">9.2</span><span
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
															src="https://caching2.lottecinema.co.kr/lotte_image/2022/EE/1027/EE_184262.jpg"
															alt="창극 기획전 11월 대개봉 15세이상관람가"><em class="num_info">AD</em></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -14px;">
																<a
																	href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_33&amp;adgroupid=adg_lottecinema_20221025_38&amp;adid=adi_lottecinema_20221025_53"
																	target="" class="btn_col3 ty3">상세정보</a>
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202012/16508_101_1.jpg"
															alt="인생은 아름다워"><em class="num_info">5</em><span
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
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>1.3%</em></span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202209/18967_101_1.jpg"
															alt="극장판 짱구는 못말려: 수수께끼! 꽃피는 천하떡잎학교"><em
															class="num_info">6</em><span class="ic_grade gr_all">전체</span></span>
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
															class="rate_info">예매율&nbsp;<em>1.0%</em></span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/18991_101_1.jpg"
															alt="블랙 아담"><em class="num_info">7</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">블랙 아담</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>1.0%</em></span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19180_101_1.jpg"
															alt="미시즈 해리스 파리에 가다"><em class="num_info">8</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">미시즈 해리스 파리에 가다</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.7%</em></span><span
															class="star_info" style="cursor: pointer;">9.3</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19108_101_1.jpg"
															alt="첫번째 아이"><em class="num_info">9</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">첫번째 아이</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.7%</em></span><span
															class="remain_info">D-3</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19143_101_1.jpg"
															alt="내 친한 친구의 아침식사"><em class="num_info">10</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">내 친한 친구의 아침식사</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.5%</em></span><span
															class="remain_info">D-3</span><span class="heart_info"><button
																	type="button" class="btn_heart_rnd ">관심등록</button></span></span>
													</div>
												</div>
											</div>
											<div class="owl-item"
												style="width: 184px; margin-right: 15px;">
												<div class="item">
													<div class="top_info">
														<span class="poster_info"><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202209/18938_101_1.jpg"
															alt="공조2: 인터내셔날"><em class="num_info">11</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">공조2: 인터내셔날</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.5%</em></span><span
															class="star_info" style="cursor: pointer;">9.4</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19134_101_1.jpg"
															alt="가재가 노래하는 곳"><em class="num_info">12</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">가재가 노래하는 곳</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.4%</em></span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19169_101_1.jpg"
															alt="블랙 사이트"><em class="num_info">13</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">블랙 사이트</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.1%</em></span><span
															class="star_info" style="cursor: pointer;">6.5</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19167_101_1.jpg"
															alt="죽어도 자이언츠"><em class="num_info">14</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">죽어도 자이언츠</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.1%</em></span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19154_101_1.jpg"
															alt="알카라스의 여름"><em class="num_info">15</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">알카라스의 여름</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.1%</em></span><span
															class="star_info" style="cursor: pointer;">8.4</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202111/17888_101_1.jpg"
															alt="귀토-토끼의 팔란"><em class="num_info">16</em><span
															class="ic_grade gr_all">전체</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">귀토-토끼의 팔란</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.0%</em></span><span
															class="star_info" style="cursor: pointer;">9.6</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19161_101_1.jpg"
															alt="분노의 추격자"><em class="num_info">17</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">분노의 추격자</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.0%</em></span><span
															class="star_info" style="cursor: pointer;">8</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19046_101_1.jpg"
															alt="오펀: 천사의 탄생"><em class="num_info">18</em><span
															class="ic_grade gr_15">15</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">오펀: 천사의 탄생</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.0%</em></span><span
															class="star_info" style="cursor: pointer;">8</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19213_101_1.jpg"
															alt="창극 춘향"><em class="num_info">19</em><span
															class="ic_grade gr_all">전체</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">창극 춘향</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.0%</em></span><span
															class="star_info" style="cursor: pointer;">10</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/18939_101_1.jpg"
															alt="아인보: 아마존의 전설"><em class="num_info">20</em><span
															class="ic_grade gr_all">전체</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">아인보: 아마존의 전설</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.0%</em></span><span
															class="star_info" style="cursor: pointer;">8.2</span><span
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
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19069_101_1.jpg"
															alt="초선"><em class="num_info">21</em><span
															class="ic_grade gr_12">12</span></span>
														<div class="over_box">
															<div class="inner" style="margin-top: -33px;">
																<a href="#" class="btn_col3 ty3">예매하기</a><a href="#none"
																	class="btn_col3 ty3">상세정보</a>
															</div>
														</div>
													</div>
													<div class="btm_info">
														<strong class="tit_info">초선</strong><span
															class="sub_info1"><span class="rate_info">예매율&nbsp;<em>0.0%</em></span><span
															class="star_info" style="cursor: pointer;">7.5</span><span
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
					</div></li>
			</ul> 
		</div>

 		<div class="main_cont_wrap notice">
			<div class="sec_tit">공지사항</div>
			<div class="rolling_menu_wrap">
				<ul class="rolling_menu" style="top: -30px;">
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
					<li><a href="#none" title="">2D 일반 관람권 활용 스페셜관 이용 안내 </a></li>
					<li><a href="#none" title="">V3 백신 엔진 악성코드 오진 안내</a></li>
					<li><a href="#none" title="">롯데시네마 영구VIP 서비스 종료 안내</a></li>
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
					<li><a href="#none" title="">영화관람권 가격 변경 안내</a></li>
				</ul>
			</div>
			
		</div> 
	</div>
</div>