<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 예매</title>

<jsp:include page="../inc/include.jsp" />
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">
	var IMP = window.IMP;   // 생략 가능
	IMP.init("imp43027525"); // 예: imp00000000 
	var seatNo = "${seatNo}";
	var tkCode = "${tkCode}";
	var seatArr = "${seatArr}";
	var totalCnt = "${adultCnt+childCnt+seniorCnt}";
	var totalPrice = "${adultCnt*13000 + childCnt*9000 + seniorCnt*7000 }";
	a
    function requestPay() {
        IMP.request_pay({ 
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: "YM_TEST19",   //주문번호, 고유값(PK) 여야 한다(디비에 저장); ${tkCode}사용 예정, 현재 임시값
            name: "${scDTO.movieNm}",
            amount: 100,	// 숫자타입
            buyer_email: "email",
            buyer_name: "홍길동",
            buyer_tel: "010-4242-4242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
        }, function (rsp) { // callback, (위의 로직이 모두 실행되고 나서 실행되는 함수)
            if (rsp.success) {
                // 결제 성공 시 로직,
                alert('결제 성공!')
                location.href="./OrderSuccess.tk?seatNo="+seatNo+"&scCode="+${scDTO.scCode}+"&tkCode="+tkCode+"&totalCnt="+totalCnt+"&totalPrice="+totalPrice;
            } else {
                // 결제 실패 시 로직,
                alert('결제 실패!')
                console.log(rsp);
            }
        });
      }
	
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
		<div id="contents" class="contents_full contents_reserve" style="">
			<div class="wrap_reserve ">
				<h2 class="hidden">예매하기</h2>
				<div class="section_step_tit">
					<ul>
						<li hidden="true" id="scCode_ym" value="${scDTO.scCode }">스케줄코드</li>
						<li class="step01 prev">
							<a href="#reserveStep01">
								<strong class="tit"><span>01</span><br>상영시간</strong>
								<div class="bx_con">
								
									<!-- 선택한 스케쥴 정보 출력 -->
										<dl>
											<dt>선택한 영화 제목</dt>
											<dd>${scDTO.movieNm }</dd>
											<dt>선택한 상영관</dt>
											<dd>${scDTO.branch_name } ${scDTO.roomNum }</dd>
											<dt>선택한 상영 날짜</dt>
											<dd>${scDTO.sc_date }</dd>
											<dt>선택한 시간</dt>
											<dd>${scDTO.starttime } ~ ${scDTO.endtime }</dd>
										</dl>
									<!-- 선택한 스케쥴 정보 출력 -->
									
								</div>
							</a>
						</li>
						<li class="step02 prev">
							<a href="#">
								<strong class="tit">
									<span>02</span><br>인원/좌석
								</strong>
								<div class="bx_con">
									<dl>
										<dt>선택한 인원</dt>
										<dd>
											성인 ${adultCnt }, 청소년 ${childCnt }, 우대 ${seniorCnt }
										</dd>
										<dt>선택한 좌석</dt>
										<dd>
											<c:forEach var="seat" items="${seatArr }">
												${seat } 											
											</c:forEach>
										</dd>
									</dl>
								</div>
							</a>
						</li>
						<li class="step03 active"><a href="#"><strong class="tit"><span>03</span><br>결제</strong>
							<div class="bx_con">
									<dl>
										<dt>티켓금액</dt>
										<dd> <fmt:formatNumber value="${adultCnt*13000 + childCnt*9000 + seniorCnt*7000 }"/>원</dd>
										<dt>할인금액</dt>
										<dd>0원</dd>
										<dt>총합계</dt>
										<dd> <fmt:formatNumber value="${adultCnt*13000 + childCnt*9000 + seniorCnt*7000 }"/>원</dd>
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
								<span class="thm">
									<img src="${scDTO.poster }" alt="${scDTO.movieNm }">
								</span>
								<strong class="tit">
									<span
										class="ic_grade gr_12">
									</span>&nbsp;
									${scDTO.movieNm }
								</strong>
								<dl class="dlist_infor">
									<dt>일시</dt>
									<dd>
										<strong>${scDTO.sc_date } | ${scDTO.starttime } ~ ${scDTO.endtime }</strong>
									</dd>
									<dt>영화관</dt>
									<dd>${scDTO.branch_name } ${scDTO.roomNum }</dd>
									<dt>인원</dt>
									<dd>성인 ${adultCnt }, 청소년 ${childCnt }, 경로/우대 ${seniorCnt }</dd>
								</dl>
							</div>
							<div class="seat_infor">
								<dl class="dlist_infor">
									<dt>좌석</dt>
									<dd>
										<strong>
											<c:forEach var="seat" items="${seatArr }">
												${seat } 											
											</c:forEach>
										</strong>
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
											
											
											<!-- 할인 / 포인트 -->
											<h3 class="tit_payment">할인/포인트</h3>
											<div class="tab_wrap3 reset selected">
												<div class="tab_tit case2">
													<ul>
														<li>
															<button class="active">등급 할인 </button>
														</li>
														<li>
															<button class="">회원 등급 (나중에 수정)</button>
														</li>
													</ul>
												</div>
											</div>
											<div class="wrap_coupon">
												<div class="bx_cate">
													<ul class="list_pay_item cate4">
														<li id="point_admission">
															<button class="">
																관람권<span class="txt_cnt">0</span>
															</button>
														</li>
														<li id="point_discount">
															<button class="">
																기프트카드<span class="txt_cnt">0</span>
															</button>
														</li>
													</ul>
												</div>
											</div>
											<div class="toggle_wrap no couplechk" style="display: none;"></div>
										</div>
										
										
										
										<!-- 결제수단 - 일단 신용카드 구현 후 나중에 생각 -->
										<div class="group_payment">
											<h5 class="tit_payment">최종 결제수단</h5>
											<div class="bx_cate">
												<ul class="list_pay_item cate6">
													<li><button type="button" class="cate1 ">신용카드</button></li>
													<!-- <li><button type="button" class="cate2 ">엘페이</button></li>
													<li><button type="button" class="cate3 ">간편결제</button></li>
													<li><button type="button" class="cate4 ty2 ">휴대폰</button></li> -->
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
							</div>
							<div class="payment_sum_wrap">
								<dl>
									<dt>상품금액</dt>
									<dd>
										<strong><fmt:formatNumber value="${adultCnt*12000 + childCnt*9000 + seniorCnt*7000 }"/></strong>원
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
										총<strong><fmt:formatNumber value="${adultCnt*12000 + childCnt*9000 + seniorCnt*7000 }"/></strong>원
									</dd>
								</dl>
								<a href="javascript:requestPay();" class="btn_col1 btn_confirm">결제하기</a>
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