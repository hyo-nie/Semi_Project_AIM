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


	<div id="sub_section">
		<div id="contents" class="contents_full contents_reserve">
			<div class="wrap_reserve ">
				<h2 class="hidden">결제완료</h2>
				<div class="section_step_tit">
					<ul>
						<li class="step01 prev"><a href="#"><strong class="tit"><span>01</span><br>상영시간</strong>
							<div class="bx_con">
									<dl>
										<dt>선택한 영화 제목</dt>
										<dd>극장판 짱구는 못말려: 수수께끼! 꽃피는 천하떡잎학교(2D더빙)</dd>
										<dt>선택한 상영관</dt>
										<dd>가양1관 세스코안심존 / 씨네컴포트(리클라이너)</dd>
										<dt>선택한 상영 날짜</dt>
										<dd>2022-11-24 (목 )</dd>
										<dt>선택한 시간</dt>
										<dd>09:30 ~ 11:24</dd>
									</dl>
								</div></a></li>
						<li class="step02 prev"><a href="#"><strong class="tit"><span>02</span><br>인원/좌석</strong>
							<div class="bx_con">
									<dl>
										<dt>선택한 인원</dt>
										<dd>청소년1</dd>
										<dt>선택한 좌석</dt>
										<dd>A7</dd>
									</dl>
								</div></a></li>
						<li class="step03 prev"><a href="#"><strong class="tit"><span>03</span><br>결제</strong>
							<div class="bx_con">
									<dl>
										<dt>티켓금액</dt>
										<dd>8,000원</dd>
										<dt>할인금액</dt>
										<dd>0원</dd>
										<dt>총합계</dt>
										<dd>8,000원</dd>
									</dl>
								</div></a></li>
						<li class="step04 active"><a href="#"><strong class="tit"><span>04</span><br>결제완료</strong></a></li>
					</ul>
				</div>
				<div id="reserveStep01" class="section_step_con step01 ">
					<h3 class="hidden">상영시간</h3>
				</div>
				<div id="reserveStep02" class="section_step_con step02 ">
					<h3 class="hidden">인원/좌석</h3>
				</div>
				<div id="reserveStep03" class="section_step_con step03 ">
					<h3 class="hidden">결제</h3>
				</div>
				<div id="reserveStep04" class="section_step_con step04 active">
					<h3 class="hidden">결제완료</h3>
					<div class="article article_payment_fin ">
						<div class="group_top">
							<h4 class="tit">결제완료</h4>
						</div>
						<div class="inner">
							<div class="payment_fin_wrap">
								<div class="top_notice_ic ty1">
									<strong>주영민 회원님, 결제가 성공적으로 완료되었습니다.</strong>
								</div>
								<div class="reserve_result_wrap">
									<div class="infor_wrap">
										<div class="bx_thm">
											<img
												src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202209/18967_102_1.jpg"
												alt="짱구는 못말려: 수수께끼! 꽃피는 천하떡잎학교">
										</div>
										<div class="group_infor">
											<dl>
												<dt>예매번호</dt>
												<dd>
													<strong class="txt_num">31359251</strong>
												</dd>
											</dl>
											<dl>
												<dt>상영일시</dt>
												<dd>
													2022-11-24 (목 )<span>09:30 ~ 11:24</span>
												</dd>
												<dt>상영관</dt>
												<dd>가양1관 세스코안심존 / 씨네컴포트(리클라이너)</dd>
												<dt>관람인원</dt>
												<dd>청소년1</dd>
												<dt>좌석</dt>
												<dd>A7</dd>
											</dl>
											<button type="button" class="btn_col1 ty5">휴대폰으로
												바로티켓 받기</button>
										</div>
									</div>
									<div class="payment_wrap new2020">
										<div class="group_price case1">
											<dl>
												<dt>주문금액</dt>
												<dd>
													<strong>8,000</strong>원
												</dd>
											</dl>
										</div>
										<div class="group_price case2">
											<dl class="minus">
												<dt>할인금액</dt>
												<dd>
													<strong>0</strong>원
												</dd>
											</dl>
										</div>
										<div class="group_price case3">
											<dl>
												<dt>총 결제 금액</dt>
												<dd>
													<strong>8,000</strong>원
												</dd>
											</dl>
											<div class="pay_method">
												<dl class="sml">
													<dt>결제방법</dt>
													<dd>
														<span class="txt_card1 ty1">신용카드</span>
													</dd>
													<dt>카드번호</dt>
													<dd class="sml last">카카오페이 온라인</dd>
												</dl>
											</div>
										</div>
									</div>
								</div>
								<ul class="list_txt sml">
									<li><strong>온라인 예매 및 추가상품 구매 취소는 상영 시작 20분 전까지
											온라인에서 가능합니다.</strong></li>
									<li><strong>상영시작 20분전 이후 부터는 영화관 현장에서만 취소 가능합니다.</strong></li>
									<li><strong>반드시 전체 취소만 가능하며, 예매나 추가상품중 부분 취소는
											불가능합니다.</strong></li>
									<li><strong>추가상품 수령 완료 시 예매 및 상품 취소 모두 불가능합니다.</strong></li>
									<li><strong>포토티켓 발권 완료 시 환불은 발권된 포토티켓 모두 지참 후 해당
											영화관에서만 가능합니다.</strong></li>
									<li><strong>무대인사, 스페셜상영회, GV, 라이브뷰잉 등 특별 상영 회차의
											예매 취소는 상영전일 23시 59분 59초까지만 취소 가능합니다.</strong></li>
									<li>적립 예정 L.POINT는 영화 관람 다음 날 적립 됩니다.</li>
									<li>예고편 상영 등 사정에 의해 본 영화 시작이 10여분 정도 차이 날 수 있습니다.</li>
									<li>개인정보 보호 정책에 따라 주민번호로 예매 티켓을 찾을 수 없습니다. 꼭 예매번호를 확인해
										주세요.</li>
									<li>스토어에서 구매한 상품은 마이페이지 &gt; 예매/구매 내역에서 확인 및 사용할 수 있습니다.</li>
								</ul>
								<div class="btn_btm_wrap mb50 pb50">
									<a href="#none" class="btn_col3 ty5">결제내역</a><a href="#none"
										class="btn_col2 ty5">스토어 바로가기</a><a href="#none"
										class="btn_col1 ty5">홈으로 바로가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>




<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />


</body>
</html>