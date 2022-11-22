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
	var cnt = 0;
	var seatNo = [];
	var adultCnt = 0;
	var childCnt = 0;
	var seniorCnt = 0;
	var totalPrice = 0;
	
	$(document).ready(function(){
		
		// 좌석 선택 관련 jquery
		$('.seat_area a').click(function(){
			
			// 좌석이 예매된 좌석일 떄
			if( $(this).attr('class') == "sel p0 no_select" ) {
				alert('이미 예매된 좌석입니다');
				
			// 좌석이 예매가능한 좌석일 떄
			} else {
				
// 				alert('좌석 클릭');
				// 좌석클릭시 선택한 좌석이면 선택해제
				if ( $(this).attr('class') == 'sel p0 on') {
					$(this).attr('class','sel p0');
					cnt--;
// 					alert('선택한 좌석 수 : ' + cnt);
					
					for (var i = 0; i < seatNo.length; i++) {
						if (seatNo[i] == $(this).attr('data-seat')) {
							seatNo.splice(i,1);
							i--;
						} 
					}
// 					alert('선택한 좌석들 : ' + seatNo);
					
				// 좌석클릭시 선택좌석으로
				} else {
					// 좌석 선택시 선택인원수와 좌석 선택수가 같으면
					if ((adultCnt + childCnt + seniorCnt) == 0) {
						alert('인원을 선택해주세요');
					} else {
						if (cnt == (adultCnt + childCnt + seniorCnt)) {
							alert('더 이상 선택할 수 없습니다!')
						} else {
							$(this).attr('class','sel p0 on');
							cnt++;
		// 					alert('선택한 좌석 수 : ' + cnt);
		// 					alert('좌석 번호 : ' + $(this).attr('data-seat'));
							seatNo.push($(this).attr('data-seat'));
		// 					alert('선택한 좌석들 : ' + seatNo);
						}
					}
				}
			}
			
		});
		
		// 인원 선택 관련 jquery
		// 성인 인원수 관련
		$('#person_10 button').click(function(){
// 			alert('성인 인원수 클릭');
// 			alert($(this).val());
			if ($(this).val() == 'Minus/10' ) {
// 				alert('-선택')
				if (adultCnt == 0) {
					alert('0명 이하로 선택할 수 없습니다!');
				} else {
					adultCnt--;
					$('#txt_num1').html(adultCnt);
					totalPrice = (13000*adultCnt) + (9000*childCnt) + (7000*seniorCnt);
					$('#totalPrice_ym').html(totalPrice);
				}
				
			} else if ($(this).val() == 'Plus/10' ) {
// 				alert('+선택')
				if (adultCnt + childCnt + seniorCnt == 6) {
					alert('6명 이상 선택할 수 없습니다!');
				} else {
					adultCnt++;
					$('#txt_num1').html(adultCnt);
					totalPrice = (13000*adultCnt) + (9000*childCnt) + (7000*seniorCnt);
					$('#totalPrice_ym').html(totalPrice);
				}
			}
		});
		// 성인 인원수 관련
		
		// 아이 인원수 관련
		$('#person_20 button').click(function(){
// 			alert('아이 인원수 클릭');
			
			if ($(this).val() == 'Minus/20' ) {
// 				alert('-선택')
				if (childCnt == 0) {
					alert('0명 이하로 선택할 수 없습니다!');
				} else {
					childCnt--;
					$('#txt_num2').html(childCnt);
					totalPrice = (13000*adultCnt) + (9000*childCnt) + (7000*seniorCnt);
					$('#totalPrice_ym').html(totalPrice);
				}
				
			} else if ($(this).val() == 'Plus/20' ) {
// 				alert('+선택')
				if (adultCnt + childCnt + seniorCnt == 6) {
					alert('6명 이상 선택할 수 없습니다!');
				} else {
					childCnt++;
					$('#txt_num2').html(childCnt);
					totalPrice = (13000*adultCnt) + (9000*childCnt) + (7000*seniorCnt);
					$('#totalPrice_ym').html(totalPrice);
				}
			}
		});
		// 아이 인원수 관련
		
		// 우대 인원수 관련
		$('#person_12 button').click(function(){
// 			alert('우대 인원수 클릭');
			
			if ($(this).val() == 'Minus/12' ) {
// 				alert('-선택')
				if (seniorCnt == 0) {
					alert('0명 이하로 선택할 수 없습니다!');
				} else {
					seniorCnt--;
					$('#txt_num3').html(seniorCnt);
					totalPrice = (13000*adultCnt) + (9000*childCnt) + (7000*seniorCnt);
					$('#totalPrice_ym').html(totalPrice);
				}
				
			} else if ($(this).val() == 'Plus/12' ) {
// 				alert('+선택')
				if (adultCnt + childCnt + seniorCnt == 6) {
					alert('6명 이상 선택할 수 없습니다!');
				} else {
					seniorCnt++;
					$('#txt_num3').html(seniorCnt);
					totalPrice = (13000*adultCnt) + (9000*childCnt) + (7000*seniorCnt);
					$('#totalPrice_ym').html(totalPrice);
				}
			}
		});
		// 우대 인원수 관련
		
	});
		
		
		
	
	function pay() {
// 		alert('결 제 버 튼 클 릭!');
		if (adultCnt + childCnt + seniorCnt == 0) {
			alert('인원을 선택하세요!');
		} else if (adultCnt + childCnt + seniorCnt != cnt) {
			alert('좌석을 선택하세요!')
		} else {
			location.href="./TicketingOrder.tk?scCode="+document.getElementById('scCode_ym').value+"&seatNo="+seatNo+"&adultCnt="+adultCnt+"&childCnt="+childCnt+"&seniorCnt="+seniorCnt;
		}
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


	<div id="PersonSeatContents"></div>
	<div id="contents" class="contents_full contents_reserve">

		<div class="wrap_reserve">
			<h2 class="hidden">예매하기</h2>
			<div id="PersonSeatHeader" class="section_step_tit">
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
					
					<li class="step02 active"><a href="#reserveStep02"><strong
							class="tit"><span>02</span><br>인원/좌석</strong>
							<div class="bx_con">
								<dl>
									<dt>선택한 인원</dt>
									<dd>
										<span id="preview_person_info"></span>
									</dd>
									<dt>선택한 좌석</dt>
									<dd class="seat_list">
										<span id="preview_seat_info"></span>
									</dd>
								</dl>
							</div></a>
					</li>
					
					<li class="step03">
						<a style="cursor: default;">
							<strong class="tit"><span>03</span><br>결제</strong>
							<div class="bx_con">
								<dl>
									<dt>티켓금액</dt>
									<dd>0원</dd>
									<dt>할인금액</dt>
									<dd>0원</dd>
									<dt>총합계</dt>
									<dd>0원</dd>
								</dl>
							</div>
						</a>
					</li>
					<li>
						<a style="cursor: default;">
							<strong class="tit">
								<span>04</span>
								<br>결제완료</strong>
						</a>
					</li>
				</ul>
			</div>









			<div id="reserveStep01" class="section_step_con step01">
				<h3 class="hidden">상영시간</h3>
			</div>


			
			<!-- 좌석선택 시작 -->
			
			<div id="reserveStep02" class="section_step_con step02 active">
				<h3 class="hidden">인원/좌석</h3>
				<!--<div id="PersonSeatHeader"></div>-->

				
				<div class="article article_seat">
					<div class="group_top">
						<h4 class="tit">인원/좌석 선택</h4>
						<p class="txt" id="txtPeopleMaxcount">인원은 최대 6명까지 선택 가능합니다.</p>
					</div>
					<div class="inner">



						<!-- 스 케 줄 정 보 출 력 시 작 -->
						<div id="PersonSeatCount">
							<div class="select_num_people_wrap">
								<h5 class="hidden">인원선택</h5>
								<div class="movie_infor">
									<h6 class="hidden">예매 정보</h6>
									<span class="thm"><img
										src=${scDTO.poster }></span>
									<div class="group_infor">
										<div class="bx_tit">
											<span class=
												<c:if test="${scDTO.watchGradeNm.equals('12세이상관람가') }">
													"ic_grade gr_12"
												</c:if>
												<c:if test="${scDTO.watchGradeNm.equals('15세이상관람가') }">
													"ic_grade gr_15"
												</c:if>
												<c:if test="${scDTO.watchGradeNm.equals('18세이상관람가') }">
													"ic_grade gr_18"
												</c:if>
												<c:if test="${scDTO.watchGradeNm.equals('전체관람가') }">
													"ic_grade gr_all"
												</c:if>>
											</span>
											<strong>${scDTO.movieNm }</strong>
										</div>
										<dl>
											<dt>일시</dt>
											<dd class="sub_info1">
												${scDTO.sc_date }<em></em><span class="time">${scDTO.starttime } ~ ${scDTO.endtime }</span>
											</dd>
											<dt>영화관</dt>
											<dd class="sub_info1">${scDTO.branch_name } · ${scDTO.roomNum }</dd>
										</dl>
									</div>
								</div>
								
								<!-- 인원수 선택 -->
								<div class="count_people">
									<h6 class="hidden">인원선택</h6>
									<ul id="customer_ym">
										<li id="person_10" data-code="10" data-peple="성인" data-count="0">
											<strong class="tit">성인</strong>
											<span class="bx_num">
												<button class="btn_mins" id="Minus|10" value="Minus/10">감소</button>
												<div class="txt_num" id="txt_num1">0</div>
												<button class="btn_plus" id="Plus|10" value="Plus/10">증가</button>
											</span>
										</li>
										<li id="person_20" data-code="20" data-peple="청소년" data-count="0">
											<strong class="tit">청소년</strong>
											<span class="bx_num">
												<button class="btn_mins" id="Minus|20" value="Minus/20">감소</button>
												<div class="txt_num"  id="txt_num2">0</div>
												<button class="btn_plus" id="Plus|20" value="Plus/20">증가</button>
											</span>
										</li>
										<li id="person_12" data-code="12" data-peple="시니어" data-count="0">
											<strong class="tit">경로/우대</strong>
											<span class="bx_num">
												<button class="btn_mins" id="Minus|12" value="Minus/12">감소</button>
												<div class="txt_num"  id="txt_num3">0</div>
												<button class="btn_plus" id="Plus|12" value="Plus/12">증가</button>
											</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- 스 케 줄 정 보 출 력 끝 -->


						
						<!-- 좌 석 고 르 는 곳 -->
						<div class="select_seat_wrap">
							<h5 class="hidden">좌석선택</h5>
							<div class="top_txt_info">
								<p id="ticketMessageInfo">인원을 선택하세요.</p>
							</div>
							<div id="PersonSeatSelect"></div>

							<div id="container" class="seat_wrap">
								<article class="mseat_wrap">
									<div class="mseat_inner">

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
													<div class="meat_door_pos" id="scrollWrap">
														<div class="mseat_hidden">

															<span class="title_screen1">SCREEN</span>

															<div class="showMap">
																<div class="floor_bx seatSet1">
																	
																	
																	<!-- 좌 석 정 보 띄 우 는 곳 -->
																	
																	<div class="seat_area"
																		style="margin-top: 30px; width: 348.304px; height: 274.615px;">
																		
																		
																		<!-- 링크클릭시 자바스크립트 함수 실행 -->
																		<c:set var="seat" value="${seatList }"></c:set>
																		<c:set var="seatIndex" value="0"></c:set>
																		<c:forEach var="i" begin="0" end="7" step="1">
																		<span class="seat_tit" style="left: -30px; top: ${i*40}px">${seatRow.get(i) }</span>
																			<c:forEach var="j" begin="0" end="9" step="1">
																				<!-- no_select 특성 : 선택 좌석 -->
																				<!-- 일반석 class="sel  p0" -->
																				<a href="javascript:seatClick();" class="sel p0 <c:if test="${seat.get(seatIndex).equals('1') }">no_select</c:if>" 
																				block-code="p0" data-seat="${seatIndex }" seat-statuscode="0" seat-code="1A01" 
																					<c:choose>
																						<c:when test="${j < 3 }">
																							style="left: ${(j*30)}px;
																						</c:when>
																						<c:when test="${j < 7 }">
																							style="left: ${(j*30)+20}px;
																						</c:when>
																						<c:otherwise>
																							style="left: ${(j*30)+40}px;
																						</c:otherwise>
																					</c:choose>
																					 top: ${i*40 }px;">
																						<span class="f1" style="top: 0px;">${j+1 }</span>
																					<c:set var="seatIndex" value="${seatIndex+1 }"></c:set>
																				</a>
																			</c:forEach>
																		</c:forEach>
																			
																	</div>
																	<!-- 좌 석 정 보 띄 우 는 곳 -->
																	
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
											
										</div>
									</div>
								</article>
							</div>
						</div>
						<!-- 좌 석 고 르 는 곳 -->


						<!-- 결 제 버 튼 시 작 -->
						<div id="PersonSeatSummery">
							<div class="select_seat_result">
								<div class="group_lft">
									<dl class="total_price">
										<dt>총 합계</dt>
										<dd>
											<strong id="totalPrice_ym">0</strong>원
										</dd>
									</dl>
								</div>
								<div class="group_rgt">
									<a href="javascript:pay();" class="btn_col1" id="link_rpay">결제하기</a>
								</div>
							</div>
						</div>
						<!-- 결 제 버 튼 끝 -->
						
					</div>
				</div>

			</div>



			<div id="reserveStep03" class="section_step_con step03 ">
				<h3 class="hidden">결제</h3>

			</div>



			<div id="reserveStep04" class="section_step_con step04 ">
				<h3 class="hidden">결제완료</h3>

			</div>

		</div>

	</div>

</body>




<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />


</body>
</html>