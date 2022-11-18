<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 예매</title>

<jsp:include page="../inc/include.jsp" />
<script type="text/javascript">
	$(document).ready(function(){
		
	
	});
</script>




</head>
<body>
	<!-- 각종 요소 -->
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp" />
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp" />


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<div id="loading" class="hidden"></div>



	



	<div id="divMinimap" class="screen_preview_con" style="display: none;">
		<div class="screen_info cineCont">
			<div class="smallScreen">
				<span class="title_screen1">SCREEN</span>
				<div class="minimap"></div>
			</div>
		</div>
	</div>


	<div id="sub_section">
		<div id="contents" class="contents_full contents_reserve" style="">
			<div class="wrap_reserve ">
				<h2 class="hidden">예매하기</h2>
				<div class="section_step_tit">
					<ul>
						<li class="step01 prev"><a href="#"><strong class="tit"><span>01</span><br>상영시간</strong>
							<div class="bx_con">
									<dl>
										<dt>선택한 영화 제목</dt>
										<dd>블랙 팬서: 와칸다 포에버(디지털)</dd>
										<dt>선택한 상영관</dt>
										<dd>강동 10관 레이저영사기</dd>
										<dt>선택한 상영 날짜</dt>
										<dd>2022-11-18 (금)</dd>
										<dt>선택한 시간</dt>
										<dd>13:50 ~ 16:41</dd>
									</dl>
								</div></a></li>
						<li class="step02 prev"><a href="#"><strong class="tit"><span>02</span><br>인원/좌석</strong>
							<div class="bx_con">
									<dl>
										<dt>선택한 인원</dt>
										<dd>성인2</dd>
										<dt>선택한 좌석</dt>
										<dd>L9, L10</dd>
									</dl>
								</div></a></li>
						<li class="step03 active"><a href="#"><strong class="tit"><span>03</span><br>결제</strong>
							<div class="bx_con">
									<dl>
										<dt>티켓금액</dt>
										<dd>30,000원</dd>
										<dt>할인금액</dt>
										<dd>0원</dd>
										<dt>총합계</dt>
										<dd>30,000원</dd>
									</dl>
								</div></a></li>
						<li><a href="#" style="cursor: default;"><strong
								class="tit"><span>04</span><br>결제완료</strong></a></li>
					</ul>
				</div>
				<div id="reserveStep01" class="section_step_con step01 ">
					<h3 class="hidden">상영시간</h3>
				</div>
				<div id="reserveStep02" class="section_step_con step02 ">
					<h3 class="hidden">인원/좌석</h3>
				</div>
				<div id="reserveStep03" class="section_step_con step03 active">
					<h3 class="hidden">결제</h3>
					<div class="article article_sum_infor">
						<div class="group_top">
							<h4 class="tit">예매정보</h4>
						</div>
						<div class="inner">
							<div class="movie_infor new2020">
								<span class="thm"><img
									src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/18944_104_1.jpg"
									alt="블랙 팬서: 와칸다 포에버"></span><strong class="tit"><span
									class="ic_grade gr_12"></span>&nbsp;블랙 팬서: 와칸다 포에버(디지털)</strong>
								<dl class="dlist_infor">
									<dt>일시</dt>
									<dd>
										<strong>2022-11-18 (금) 13:50 ~ 16:41</strong>
									</dd>
									<dt>영화관</dt>
									<dd>강동 10관 레이저영사기 - 2D</dd>
									<dt>인원</dt>
									<dd>성인2</dd>
								</dl>
							</div>
							<div class="seat_infor">
								<dl class="dlist_infor">
									<dt>좌석</dt>
									<dd>
										<strong>L9, L10</strong>
									</dd>
								</dl>
							</div>
						</div>
					</div>
					<div class="article article_pay_method">
						<div class="group_top">
							<h4 class="tit">결제수단</h4>
							<button type="button" class="btn_txt_reset">초기화</button>
						</div>
						<div class="inner">
							<div
								class="mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar"
								data-mcs-theme="minimal-dark"
								style="position: relative; overflow: visible;">
								<div id="mCSB_1"
									class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
									style="max-height: none;" tabindex="0">
									<div id="mCSB_1_container"
										class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
										style="position: relative; top: 0; left: 0;" dir="ltr">
										<div class="group_discount" style="display: block;">
											<h3 class="tit_payment">할인/포인트</h3>
											<div class="tab_wrap3 reset selected">
												<div class="tab_tit case2">
													<ul>
														<li><button class="active">
																L.POINT <strong class="point">조회</strong>
															</button></li>
														<li><button class="">L.POINT 카드번호</button></li>
													</ul>
												</div>
											</div>
											<div class="wrap_coupon">
												<div class="bx_cate">
													<ul class="list_pay_item cate4">
														<li id="point_vip"><button class="">
																VIP/Friends<span class="txt_cnt">0</span>
															</button></li>
														<li id="point_admission"><button class="">
																관람권<span class="txt_cnt">0</span>
															</button></li>
														<li id="point_discount"><button class="">
																할인권<span class="txt_cnt">0</span>
															</button></li>
														<li class="mline" id="point_etc"><button class="">제휴포인트/할인</button></li>
													</ul>
												</div>
											</div>
											<div class="toggle_wrap no couplechk" style="display: none;"></div>
										</div>
										<div class="group_payment">
											<h5 class="tit_payment">최종 결제수단</h5>
											<div class="bx_cate">
												<ul class="list_pay_item cate6">
													<li><button type="button" class="cate1 ">신용카드</button></li>
													<li><button type="button" class="cate2 ">엘페이</button></li>
													<li><button type="button" class="cate3 ">간편결제</button></li>
													<li><button type="button" class="cate4 ty2 ">휴대폰</button></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div id="mCSB_1_scrollbar_vertical"
									class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
									style="display: none;">
									<div class="mCSB_draggerContainer">
										<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
											style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
											<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
										</div>
										<div class="mCSB_draggerRail"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="article article_payment">
						<div class="group_top">
							<h4 class="tit">결제하기</h4>
						</div>
						<div class="inner">
							<div class="select_item_wrap">
								<div class="group_item active">
									<div class="bx_item">
										<input type="checkbox" id="chkSavingPoint" checked=""><label
											for="chkSavingPoint" class="ty2">L.POINT 적립</label>
										<div class="tooltip_box">
											<button class="ic_question">?</button>
											<div class="tooltip">
												<strong>L.POINT 적립 안내</strong>
												<ul class="list_txt">
													<li>ID적립은 로그인 ID로 자동 적립 됩니다.</li>
													<li>카드번호적립은 결제 후 LPOINT 카드 번호를 직접 입력하여, 적립이 가능합니다.</li>
													<li>L.PAY로 결제하시면, L.PAY 가입 시 인증한 L.POINT ID로 적립됩니다.</li>
													<li>롯데시네마 관람권 구매, 제휴 모바일 쿠폰사용에 대한 건은 포인트가 적립되지 않습니다.</li>
													<li>포인트별 적립내용은 다음과 같습니다.</li>
													<li>L.POINT : L.POINT 카드 또는 롯데 신용카드 번호 입력시 회원등급에 따라 차등
														적립 됩니다. 단, 미등록 카드번호 입력시 결제금액의 0.1%가 적립됩니다.</li>
												</ul>
												<button class="btn_close">닫기</button>
											</div>
										</div>
										<div class="area_rdo">
											<span><input type="radio" id="rdoSavingLPointId"
												value="ID" checked=""><label for="rdoSavingLPointId">ID적립</label></span><span><input
												type="radio" id="rdoSavingLPointNum" value="CARD"><label
												for="rdoSavingLPointNum">카드번호 적립</label></span>
										</div>
									</div>
								</div>
							</div>
							<div class="payment_sum_wrap">
								<dl>
									<dt>상품금액</dt>
									<dd>
										<strong>30,000</strong>원
									</dd>
								</dl>
								<dl>
									<dt>할인금액</dt>
									<dd>
										-<strong>0</strong>원
									</dd>
								</dl>
								<dl>
									<dt>결제금액</dt>
									<dd>
										총<strong>30,000</strong>원
									</dd>
								</dl>
								<a href="#none" class="btn_col1 btn_confirm">결제하기</a>
							</div>
						</div>
					</div>
				</div>
				<div id="reserveStep04" class="section_step_con step04 ">
					<h3 class="hidden">결제완료</h3>
				</div>
			</div>
		</div>
	</div>




</body>







<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />


</body>
</html>