<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 - 롯데시네마</title>
</head>
<body>

	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp"/>
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp"/>
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp"/>

	<!-- step01 -->
	<div id="contents" class="contents_full contents_reserve"
		style="margin-top: 120px;">
		<div class="wrap_reserve">
			<h2 class="hidden">예매하기</h2>
			<div class="section_step_tit">
				<ul>
					<li class="active step01"><a href="#reserveStep01"><strong
							class="tit"><span>01</span><br>상영시간</strong>
						<div class="bx_con">
								<dl>
									<dt>선택한 영화 제목</dt>
									<dd></dd>
									<dt>선택한 상영관</dt>
									<dd></dd>
									<dt>선택한 상영 날짜</dt>
									<dd>2022-11-09(오늘)</dd>
									<dt>선택한 시간</dt>
									<dd></dd>
								</dl>
							</div></a></li>
					<li class="disabled"><a style="cursor: default;"><strong
							class="tit"><span>02</span><br>인원/좌석</strong></a></li>
					<li class="disabled"><a style="cursor: default;"><strong
							class="tit"><span>03</span><br>결제</strong></a></li>
					<li class="disabled"><a style="cursor: default;"><strong
							class="tit"><span>04</span><br>결제완료</strong></a></li>
				</ul>
			</div>
			<div id="reserveStep01" class="section_step_con step01 active">
				<h3 class="hidden">상영시간</h3>
				<div class="article article_cinema area__movingbar litype2">
					<div class="group_top">
						<h4 class="tit">영화관</h4>
					</div>
					<div class="inner">
						<ul class="tab_wrap outer actionmovingbar">
							<li class="active"><button type="button" class="tab_tit"
									style="width: 50%; left: 0%;">
									<span>전체</span>
								</button>
								<div class="tab_con">
									<h5 class="hidden">전체</h5>
									<div class="cinema_select_wrap cinemaSelect basicCinema">
										<ul>
											<li class="depth1"><a href="#none">MY 영화관<em>(0)</em></a>
											<div class="depth2" style="display: none;">
													<div
														class="mCustomScrollbar _mCS_10 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_10"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_10_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<div class="bx_notice">
																	<p class="txt">로그인 후 이용해 주세요.</p>
																	<a
																		href="https://www.lottecinema.co.kr/NLCHS/Member/Login?hidUrlReferrer=https%3A%2F%2Fwww.lottecinema.co.kr%2FNLCHS%2FTicketing"
																		class="btn_col3 ty3 rnd">로그인</a>
																</div>
															</div>
														</div>
														<div id="mCSB_10_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_10_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_10_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px; height: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1 active"><a href="#none" title="선택됨">서울<em>(23)</em></a>
											<div class="depth2" style="display: block;">
													<div
														class="mCustomScrollbar basicCinemaScroll _mCS_1 mCS-autoHide"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_1"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: none;" tabindex="0">
															<div id="mCSB_1_container" class="mCSB_container"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">가산디지털</a></li>
																	<li class=""><a href="#none">가양</a></li>
																	<li class=""><a href="#none">강동</a></li>
																	<li class=""><a href="#none">건대입구</a></li>
																	<li class=""><a href="#none">김포공항</a></li>
																	<li class=""><a href="#none">노원</a></li>
																	<li class=""><a href="#none">도곡</a></li>
																	<li class=""><a href="#none">독산</a></li>
																	<li class=""><a href="#none">브로드웨이(신사)</a></li>
																	<li class=""><a href="#none">서울대입구</a></li>
																	<li class=""><a href="#none">수락산</a></li>
																	<li class=""><a href="#none">수유</a></li>
																	<li class=""><a href="#none">신도림</a></li>
																	<li class=""><a href="#none">신림</a></li>
																	<li class=""><a href="#none">에비뉴엘(명동)</a></li>
																	<li class=""><a href="#none">영등포</a></li>
																	<li class=""><a href="#none">용산</a></li>
																	<li class=""><a href="#none">월드타워</a></li>
																	<li class=""><a href="#none">은평(롯데몰)</a></li>
																	<li class=""><a href="#none">중랑</a></li>
																	<li class=""><a href="#none">청량리</a></li>
																	<li class=""><a href="#none">합정</a></li>
																	<li class=""><a href="#none">홍대입구</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_1_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: block;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; display: block; height: 624px; max-height: 719px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">경기/인천<em>(48)</em></a>
											<div class="depth2" style="display: none;">
													<div
														class="mCustomScrollbar basicCinemaScroll _mCS_2 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_2"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_2_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">광교아울렛</a></li>
																	<li class=""><a href="#none">광명(광명사거리)</a></li>
																	<li class=""><a href="#none">광명아울렛</a></li>
																	<li class=""><a href="#none">광주터미널</a></li>
																	<li class=""><a href="#none">구리아울렛</a></li>
																	<li class=""><a href="#none">동탄</a></li>
																	<li class=""><a href="#none">라페스타</a></li>
																	<li class=""><a href="#none">마석</a></li>
																	<li class=""><a href="#none">별내</a></li>
																	<li class=""><a href="#none">병점</a></li>
																	<li class=""><a href="#none">부천(신중동역)</a></li>
																	<li class=""><a href="#none">부천역</a></li>
																	<li class=""><a href="#none">부평</a></li>
																	<li class=""><a href="#none">부평갈산</a></li>
																	<li class=""><a href="#none">부평역사</a></li>
																	<li class=""><a href="#none">북수원(천천동)</a></li>
																	<li class=""><a href="#none">산본피트인</a></li>
																	<li class=""><a href="#none">서수원</a></li>
																	<li class=""><a href="#none">성남중앙(신흥역)</a></li>
																	<li class=""><a href="#none">센트럴락</a></li>
																	<li class=""><a href="#none">송탄</a></li>
																	<li class=""><a href="#none">수원(수원역)</a></li>
																	<li class=""><a href="#none">수지</a></li>
																	<li class=""><a href="#none">시화(정왕역)</a></li>
																	<li class=""><a href="#none">시흥장현</a></li>
																	<li class=""><a href="#none">안산</a></li>
																	<li class=""><a href="#none">안산고잔</a></li>
																	<li class=""><a href="#none">안성</a></li>
																	<li class=""><a href="#none">안양(안양역)</a></li>
																	<li class=""><a href="#none">안양일번가</a></li>
																	<li class=""><a href="#none">양주고읍</a></li>
																	<li class=""><a href="#none">영종하늘도시</a></li>
																	<li class=""><a href="#none">오산(원동)</a></li>
																	<li class=""><a href="#none">용인기흥</a></li>
																	<li class=""><a href="#none">용인역북</a></li>
																	<li class=""><a href="#none">위례</a></li>
																	<li class=""><a href="#none">의정부민락</a></li>
																	<li class=""><a href="#none">인덕원</a></li>
																	<li class=""><a href="#none">인천아시아드</a></li>
																	<li class=""><a href="#none">인천터미널</a></li>
																	<li class=""><a href="#none">주엽</a></li>
																	<li class=""><a href="#none">진접</a></li>
																	<li class=""><a href="#none">파주운정</a></li>
																	<li class=""><a href="#none">판교(창조경제밸리)</a></li>
																	<li class=""><a href="#none">평촌(범계역)</a></li>
																	<li class=""><a href="#none">평택비전(뉴코아)</a></li>
																	<li class=""><a href="#none">하남미사</a></li>
																	<li class=""><a href="#none">향남</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_2_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_2_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_2_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px; display: block; height: 299px; max-height: 719px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">충청/대전<em>(11)</em></a>
											<div class="depth2" style="display: none;">
													<div
														class="mCustomScrollbar basicCinemaScroll _mCS_3 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_3"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_3_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">당진</a></li>
																	<li class=""><a href="#none">대전(백화점)</a></li>
																	<li class=""><a href="#none">대전관저</a></li>
																	<li class=""><a href="#none">대전둔산(월평동)</a></li>
																	<li class=""><a href="#none">대전센트럴</a></li>
																	<li class=""><a href="#none">서산</a></li>
																	<li class=""><a href="#none">서청주(아울렛)</a></li>
																	<li class=""><a href="#none">아산터미널</a></li>
																	<li class=""><a href="#none">천안불당</a></li>
																	<li class=""><a href="#none">청주용암</a></li>
																	<li class=""><a href="#none">충주(모다아울렛)</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_3_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_3_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_3_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">전라/광주<em>(10)</em></a>
											<div class="depth2" style="display: none;">
													<div
														class="mCustomScrollbar basicCinemaScroll _mCS_4 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_4"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_4_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">광주(백화점)</a></li>
																	<li class=""><a href="#none">광주광산</a></li>
																	<li class=""><a href="#none">군산나운</a></li>
																	<li class=""><a href="#none">군산몰</a></li>
																	<li class=""><a href="#none">수완(아울렛)</a></li>
																	<li class=""><a href="#none">익산모현</a></li>
																	<li class=""><a href="#none">전주(백화점)</a></li>
																	<li class=""><a href="#none">전주송천</a></li>
																	<li class=""><a href="#none">전주평화</a></li>
																	<li class=""><a href="#none">충장로</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_4_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_4_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_4_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">경북/대구<em>(17)</em></a>
											<div class="depth2" style="display: none;">
													<div
														class="mCustomScrollbar basicCinemaScroll _mCS_5 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_5"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_5_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">경주</a></li>
																	<li class=""><a href="#none">경주황성</a></li>
																	<li class=""><a href="#none">구미공단</a></li>
																	<li class=""><a href="#none">대구광장</a></li>
																	<li class=""><a href="#none">대구율하</a></li>
																	<li class=""><a href="#none">대구현풍</a></li>
																	<li class=""><a href="#none">동성로</a></li>
																	<li class=""><a href="#none">상인</a></li>
																	<li class=""><a href="#none">상주</a></li>
																	<li class=""><a href="#none">성서</a></li>
																	<li class=""><a href="#none">영주</a></li>
																	<li class=""><a href="#none">영천</a></li>
																	<li class=""><a href="#none">포항</a></li>
																	<li class=""><a href="#none">프리미엄구미센트럴</a></li>
																	<li class=""><a href="#none">프리미엄만경</a></li>
																	<li class=""><a href="#none">프리미엄안동</a></li>
																	<li class=""><a href="#none">프리미엄칠곡</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_5_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_5_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_5_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">경남/부산/울산<em>(26)</em></a>
											<div class="depth2" style="display: none;">
													<div
														class="mCustomScrollbar basicCinemaScroll _mCS_6 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_6"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_6_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">거창</a></li>
																	<li class=""><a href="#none">광복</a></li>
																	<li class=""><a href="#none">김해부원</a></li>
																	<li class=""><a href="#none">김해아울렛(장유)</a></li>
																	<li class=""><a href="#none">대영</a></li>
																	<li class=""><a href="#none">동래</a></li>
																	<li class=""><a href="#none">동부산아울렛</a></li>
																	<li class=""><a href="#none">드라이브 오시리아</a></li>
																	<li class=""><a href="#none">마산(합성동)</a></li>
																	<li class=""><a href="#none">부산명지</a></li>
																	<li class=""><a href="#none">부산본점</a></li>
																	<li class=""><a href="#none">사천</a></li>
																	<li class=""><a href="#none">서면(전포동)</a></li>
																	<li class=""><a href="#none">센텀시티</a></li>
																	<li class=""><a href="#none">양산물금</a></li>
																	<li class=""><a href="#none">엠비씨네(진주)</a></li>
																	<li class=""><a href="#none">오투(부산대)</a></li>
																	<li class=""><a href="#none">울산(백화점)</a></li>
																	<li class=""><a href="#none">울산성남</a></li>
																	<li class=""><a href="#none">진주혁신(롯데몰)</a></li>
																	<li class=""><a href="#none">진해</a></li>
																	<li class=""><a href="#none">창원</a></li>
																	<li class=""><a href="#none">통영</a></li>
																	<li class=""><a href="#none">프리미엄경남대</a></li>
																	<li class=""><a href="#none">프리미엄진주(중안)</a></li>
																	<li class=""><a href="#none">프리미엄해운대(장산역)</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_6_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_6_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_6_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">강원<em>(5)</em></a>
											<div class="depth2" style="display: none;">
													<div
														class="mCustomScrollbar basicCinemaScroll _mCS_7 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_7"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_7_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">남원주</a></li>
																	<li class=""><a href="#none">동해</a></li>
																	<li class=""><a href="#none">속초</a></li>
																	<li class=""><a href="#none">원주무실</a></li>
																	<li class=""><a href="#none">춘천</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_7_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_7_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_7_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">제주<em>(3)</em></a>
											<div class="depth2" style="display: none;">
													<div
														class="mCustomScrollbar basicCinemaScroll _mCS_8 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_8"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_8_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">서귀포</a></li>
																	<li class=""><a href="#none">제주삼화지구</a></li>
																	<li class=""><a href="#none">제주아라</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_8_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_8_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_8_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
										</ul>
									</div>
								</div></li>
							<li><button type="button" class="tab_tit"
									style="width: 50%; left: 50%;">
									<span>스페셜관</span>
								</button>
								<div class="tab_con">
									<h5 class="hidden">전체</h5>
									<div class="cinema_select_wrap cinemaSelect">
										<ul>
											<li class="depth1 active"><a href="#none">샤롯데<em>(11)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_11 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_11"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: none;" tabindex="0">
															<div id="mCSB_11_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">월드타워</a></li>
																	<li class=""><a href="#none">동탄</a></li>
																	<li class=""><a href="#none">건대입구</a></li>
																	<li class=""><a href="#none">에비뉴엘(명동)</a></li>
																	<li class=""><a href="#none">김포공항</a></li>
																	<li class=""><a href="#none">안산</a></li>
																	<li class=""><a href="#none">평촌(범계역)</a></li>
																	<li class=""><a href="#none">광주(백화점)</a></li>
																	<li class=""><a href="#none">동성로</a></li>
																	<li class=""><a href="#none">광복</a></li>
																	<li class=""><a href="#none">센텀시티</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_11_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_11_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_11_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">수퍼플렉스 G<em>(1)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_12 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_12"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_12_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">월드타워</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_12_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_12_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_12_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">수퍼 S<em>(4)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_13 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_13"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_13_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">월드타워</a></li>
																	<li class=""><a href="#none">건대입구</a></li>
																	<li class=""><a href="#none">천안불당</a></li>
																	<li class=""><a href="#none">센텀시티</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_13_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_13_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_13_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">수퍼플렉스<em>(9)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_14 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_14"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_14_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">원주무실</a></li>
																	<li class=""><a href="#none">수지</a></li>
																	<li class=""><a href="#none">파주운정</a></li>
																	<li class=""><a href="#none">은평(롯데몰)</a></li>
																	<li class=""><a href="#none">청주용암</a></li>
																	<li class=""><a href="#none">광명아울렛</a></li>
																	<li class=""><a href="#none">상인</a></li>
																	<li class=""><a href="#none">광복</a></li>
																	<li class=""><a href="#none">수원(수원역)</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_14_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_14_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_14_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">수퍼 4D<em>(11)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_15 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_15"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_15_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">월드타워</a></li>
																	<li class=""><a href="#none">가산디지털</a></li>
																	<li class=""><a href="#none">광복</a></li>
																	<li class=""><a href="#none">김포공항</a></li>
																	<li class=""><a href="#none">노원</a></li>
																	<li class=""><a href="#none">서청주(아울렛)</a></li>
																	<li class=""><a href="#none">수완(아울렛)</a></li>
																	<li class=""><a href="#none">수원(수원역)</a></li>
																	<li class=""><a href="#none">울산(백화점)</a></li>
																	<li class=""><a href="#none">청량리</a></li>
																	<li class=""><a href="#none">평촌(범계역)</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_15_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_15_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_15_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">컬러리움<em>(1)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_16 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_16"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_16_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">수원(수원역)</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_16_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_16_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_16_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">씨네살롱<em>(1)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_17 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_17"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_17_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">도곡</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_17_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_17_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_17_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">씨네패밀리<em>(1)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_18 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_18"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_18_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">월드타워</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_18_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_18_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_18_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">씨네커플<em>(28)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_19 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_19"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_19_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">시흥장현</a></li>
																	<li class=""><a href="#none">사천</a></li>
																	<li class=""><a href="#none">도곡</a></li>
																	<li class=""><a href="#none">홍대입구</a></li>
																	<li class=""><a href="#none">부평역사</a></li>
																	<li class=""><a href="#none">수원(수원역)</a></li>
																	<li class=""><a href="#none">북수원(천천동)</a></li>
																	<li class=""><a href="#none">대전관저</a></li>
																	<li class=""><a href="#none">원주무실</a></li>
																	<li class=""><a href="#none">은평(롯데몰)</a></li>
																	<li class=""><a href="#none">대영</a></li>
																	<li class=""><a href="#none">파주운정</a></li>
																	<li class=""><a href="#none">인천아시아드</a></li>
																	<li class=""><a href="#none">향남</a></li>
																	<li class=""><a href="#none">인천터미널</a></li>
																	<li class=""><a href="#none">청주용암</a></li>
																	<li class=""><a href="#none">군산나운</a></li>
																	<li class=""><a href="#none">제주삼화지구</a></li>
																	<li class=""><a href="#none">의정부민락</a></li>
																	<li class=""><a href="#none">진주혁신(롯데몰)</a></li>
																	<li class=""><a href="#none">합정</a></li>
																	<li class=""><a href="#none">오투(부산대)</a></li>
																	<li class=""><a href="#none">상인</a></li>
																	<li class=""><a href="#none">서산</a></li>
																	<li class=""><a href="#none">월드타워</a></li>
																	<li class=""><a href="#none">광복</a></li>
																	<li class=""><a href="#none">부산본점</a></li>
																	<li class=""><a href="#none">충장로</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_19_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_19_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_19_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">씨네비즈<em>(5)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_20 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_20"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_20_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">월드타워</a></li>
																	<li class=""><a href="#none">서청주(아울렛)</a></li>
																	<li class=""><a href="#none">안양(안양역)</a></li>
																	<li class=""><a href="#none">울산(백화점)</a></li>
																	<li class=""><a href="#none">대구율하</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_20_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_20_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_20_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
											<li class="depth1"><a href="#none">씨네컴포트(리클라이너)<em>(20)</em></a>
											<div class="depth2">
													<div
														class="mCustomScrollbar _mCS_21 mCS-autoHide mCS_no_scrollbar"
														data-mcs-theme="minimal-dark"
														style="position: relative; overflow: visible;">
														<div id="mCSB_21"
															class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
															style="max-height: 753px;" tabindex="0">
															<div id="mCSB_21_container"
																class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
																style="position: relative; top: 0; left: 0;" dir="ltr">
																<ul>
																	<li class=""><a href="#none">당진</a></li>
																	<li class=""><a href="#none">대전센트럴</a></li>
																	<li class=""><a href="#none">대전관저</a></li>
																	<li class=""><a href="#none">부평갈산</a></li>
																	<li class=""><a href="#none">시흥장현</a></li>
																	<li class=""><a href="#none">천안불당</a></li>
																	<li class=""><a href="#none">전주송천</a></li>
																	<li class=""><a href="#none">동탄</a></li>
																	<li class=""><a href="#none">판교(창조경제밸리)</a></li>
																	<li class=""><a href="#none">춘천</a></li>
																	<li class=""><a href="#none">중랑</a></li>
																	<li class=""><a href="#none">사천</a></li>
																	<li class=""><a href="#none">부산명지</a></li>
																	<li class=""><a href="#none">제주삼화지구</a></li>
																	<li class=""><a href="#none">제주아라</a></li>
																	<li class=""><a href="#none">용인역북</a></li>
																	<li class=""><a href="#none">성남중앙(신흥역)</a></li>
																	<li class=""><a href="#none">수지</a></li>
																	<li class=""><a href="#none">원주무실</a></li>
																	<li class=""><a href="#none">영주</a></li>
																</ul>
															</div>
														</div>
														<div id="mCSB_21_scrollbar_vertical"
															class="mCSB_scrollTools mCSB_21_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
															style="display: none;">
															<div class="mCSB_draggerContainer">
																<div id="mCSB_21_dragger_vertical" class="mCSB_dragger"
																	style="position: absolute; min-height: 50px; top: 0px;">
																	<div class="mCSB_dragger_bar"
																		style="line-height: 50px;"></div>
																</div>
																<div class="mCSB_draggerRail"></div>
															</div>
														</div>
													</div>
												</div></li>
										</ul>
									</div>
								</div></li>
							<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
						</ul>
					</div>
				</div>
				<div class="article article_movie">
					<div class="group_top">
						<h4 class="tit movie_name">영화 선택</h4>
					</div>
					<div class="inner">
						<div class="list_filter">
							<select title="영화 정렬 방법 선택"><option value="A">예매순</option>
								<option value="B">관객순</option>
								<option value="C">평점순</option>
								<option value="D">예정작</option></select>
							<div class="bx_btn_view">
								<span class="hidden">목록 보기 방식</span>
								<ul>
									<li><button type="button"
											class="btn_view_txt viewTxt active">텍스트형</button></li>
									<li><button type="button" class="btn_view_thm viewThm">썸네일형</button></li>
								</ul>
							</div>
						</div>
						<div class="movie_select_wrap list movieSelect">
							<div class="mCustomScrollbar movieScroll _mCS_9 mCS-autoHide"
								data-mcs-theme="minimal-dark"
								style="position: relative; overflow: visible;">
								<div id="mCSB_9"
									class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
									tabindex="0" style="max-height: none;">
									<div id="mCSB_9_container" class="mCSB_container"
										style="position: relative; top: 0; left: 0;" dir="ltr">
										<ul>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>1</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/18944_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">블랙 팬서: 와칸다 포에버</strong>
														</div>
														
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>2</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19117_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">동감</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>5.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>0.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.16</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>3</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19009_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">자백</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>4.2%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.4</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.26</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>4</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19184_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">데시벨</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>3.7%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>0.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.16</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>5</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19143_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">내 친한 친구의 아침식사</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>3.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>0.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.10</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>6</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/18983_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">에브리씽 에브리웨어 올 앳 원스</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>1.2%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>8.9</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.12</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>7</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202012/16508_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">인생은 아름다워</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.5%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.6</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.09.28</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>8</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19051_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">리멤버</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.3%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.4</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.26</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>9</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202209/18967_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_all">0세 관람가</span><strong
																class="tit">극장판 짱구는 못말려: 수수께끼! 꽃피는 천하떡잎학교</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.3%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.6</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.09.28</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>10</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/18939_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_all">0세 관람가</span><strong
																class="tit">아인보: 아마존의 전설</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.1%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>8.9</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.26</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>11</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/18991_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">블랙 아담</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.1%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.19</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>12</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202111/18026_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_all">0세 관람가</span><strong
																class="tit">태일이</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.1%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.8</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2021.12.01</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>13</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19180_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">미시즈 해리스 파리에 가다</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.1%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.4</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.02</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>14</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19134_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">가재가 노래하는 곳</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.1%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.5</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.02</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>15</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202209/18938_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">공조2: 인터내셔날</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.1%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.5</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.09.07</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>16</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19167_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">죽어도 자이언츠</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.1%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.5</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.27</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>17</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19191_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">같은 속옷을 입는 두 여자</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>0.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.10</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>18</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19154_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">알카라스의 여름</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.1</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.03</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>19</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19218_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">에브리띵 윌 체인지</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>10.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.09</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>20</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202209/18969_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">정직한 후보2</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>8.7</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.09.28</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>21</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19123_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">피가로~피가로~피가로</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>0.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.10</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>22</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19213_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_all">0세 관람가</span><strong
																class="tit">창극 춘향</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>10.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.03</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>23</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19108_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">첫번째 아이</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>0.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.10</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>24</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202111/17888_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_all">0세 관람가</span><strong
																class="tit">귀토-토끼의 팔란</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.6</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2021.11.11</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>25</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19070_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">수프와 이데올로기</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>10.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.20</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>26</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202202/18364_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">창극 변강쇠 점 찍고 옹녀</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.7</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.02.03</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>27</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19069_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_12">12세 관람가</span><strong
																class="tit">초선</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>7.5</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.03</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>28</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19011_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_18">18세 관람가</span><strong
																class="tit">스마일</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>8.8</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.06</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>29</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202209/18943_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">9명의 번역가</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.1</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.09.14</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>30</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19125_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_all">0세 관람가</span><strong
																class="tit">걸리버 리턴즈</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>8.4</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.03</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>31</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202209/18980_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_all">0세 관람가</span><strong
																class="tit">고고다이노 극장판: 얼음공룡의 비밀</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.2</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.05</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>32</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19068_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">나를 죽여줘</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>9.2</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.19</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>33</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19027_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_all">0세 관람가</span><strong
																class="tit">바커스: 고양이를 조심해!</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>10.0</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.27</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>34</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19161_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">분노의 추격자</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>8.6</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.03</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>35</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19169_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">블랙 사이트</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>7.6</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.02</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>36</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19127_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">옆집사람</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>4.5</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.03</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>37</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19046_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">오펀: 천사의 탄생</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>8.6</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.12</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>38</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202210/19076_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">캐릭터</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>8.7</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.10.19</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
											<li class=""><a href="#none"><div class="bx_thm">
														<span class="rank"><span class="hidden">순위</span><strong>39</strong></span><img
															src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202211/19219_101_1.jpg"
															alt="포스터" class="mCS_img_loaded">
													</div>
													<div class="group_infor">
														<div class="bx_tit">
															<span class="ic_grade gr_15">15세 관람가</span><strong
																class="tit">탑</strong>
														</div>
														<dl>
															<dt>예매율</dt>
															<dd>
																<strong>0.0%</strong>
															</dd>
															<dt class="side">
																<span class="txt_ic_score ty1"><em>평점</em></span>
															</dt>
															<dd>
																<span class="txt_ic_score ty1"><strong>8.3</strong></span>
															</dd>
															<dt>개봉일</dt>
															<dd>2022.11.03</dd>
															<dt class="side day">d -day</dt>
															<dd>
																<strong class="expired"></strong>
															</dd>
														</dl>
													</div></a></li>
										</ul>
									</div>
								</div>
								<div id="mCSB_9_scrollbar_vertical"
									class="mCSB_scrollTools mCSB_9_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
									style="display: block;">
									<div class="mCSB_draggerContainer">
										<div id="mCSB_9_dragger_vertical" class="mCSB_dragger"
											style="position: absolute; min-height: 50px; display: block; height: 275px; max-height: 720px; top: 0px;">
											<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
										</div>
										<div class="mCSB_draggerRail"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="article article_time area__movingbar litype6">
					<div class="group_top">
						<h4 class="tit">2022-11-09(오늘)</h4>
					</div>
					<div class="inner">
						<div class="date_select_wrap dateReserveWrap">
							<div class="slide_wrap slide_reserve_date">
								<ul class="owl-carousel owl-loaded owl-drag">
									<div class="owl-stage-outer">
										<div class="owl-stage"
											style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1470px;">
											<div class="owl-item active" style="width: 52.5px;">
												<li class="item"><strong class="month">11월</strong><span
													class="date"><label><input type="radio"
															name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-09" data-isplaydate="Y"
															data-playweek="오늘" checked=""><strong>9</strong><em>오늘</em></label></span></li>
											</div>
											<div class="owl-item active" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-10" data-isplaydate="Y"
															data-playweek="목"><strong>10</strong><em>목</em></label></span></li>
											</div>
											<div class="owl-item active" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-11" data-isplaydate="Y"
															data-playweek="금"><strong>11</strong><em>금</em></label></span></li>
											</div>
											<div class="owl-item active" style="width: 52.5px;">
												<li class="item"><span class="date sat"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-12" data-isplaydate="Y"
															data-playweek="토"><strong>12</strong><em>토</em></label></span></li>
											</div>
											<div class="owl-item active" style="width: 52.5px;">
												<li class="item"><span class="date sun"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-13" data-isplaydate="Y"
															data-playweek="일"><strong>13</strong><em>일</em></label></span></li>
											</div>
											<div class="owl-item active" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-14" data-isplaydate="Y"
															data-playweek="월"><strong>14</strong><em>월</em></label></span></li>
											</div>
											<div class="owl-item active" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-15" data-isplaydate="Y"
															data-playweek="화"><strong>15</strong><em>화</em></label></span></li>
											</div>
											<div class="owl-item active" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-16" data-isplaydate="Y"
															data-playweek="수"><strong>16</strong><em>수</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-17" data-isplaydate="Y"
															data-playweek="목"><strong>17</strong><em>목</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-18" data-isplaydate="Y"
															data-playweek="금"><strong>18</strong><em>금</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date sat"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-19" data-isplaydate="Y"
															data-playweek="토"><strong>19</strong><em>토</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date sun"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-20" data-isplaydate="Y"
															data-playweek="일"><strong>20</strong><em>일</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-21" data-isplaydate="Y"
															data-playweek="월"><strong>21</strong><em>월</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-22" data-isplaydate="Y"
															data-playweek="화"><strong>22</strong><em>화</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-23" data-isplaydate="Y"
															data-playweek="수"><strong>23</strong><em>수</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date"><label><input
															type="radio" name="radioDate1" data-displayyn="Y"
															data-playdate="2022-11-24" data-isplaydate="Y"
															data-playweek="목"><strong>24</strong><em>목</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-11-25" data-isplaydate="N"
															data-playweek="금"><strong>25</strong><em>금</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date sat disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-11-26" data-isplaydate="N"
															data-playweek="토"><strong>26</strong><em>토</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date sun disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-11-27" data-isplaydate="N"
															data-playweek="일"><strong>27</strong><em>일</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-11-28" data-isplaydate="N"
															data-playweek="월"><strong>28</strong><em>월</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-11-29" data-isplaydate="N"
															data-playweek="화"><strong>29</strong><em>화</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-11-30" data-isplaydate="N"
															data-playweek="수"><strong>30</strong><em>수</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><strong class="month">12월</strong><span
													class="date disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-12-01" data-isplaydate="N"
															data-playweek="목"><strong>1</strong><em>목</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-12-02" data-isplaydate="N"
															data-playweek="금"><strong>2</strong><em>금</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date sat disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-12-03" data-isplaydate="N"
															data-playweek="토"><strong>3</strong><em>토</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date sun disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-12-04" data-isplaydate="N"
															data-playweek="일"><strong>4</strong><em>일</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-12-05" data-isplaydate="N"
															data-playweek="월"><strong>5</strong><em>월</em></label></span></li>
											</div>
											<div class="owl-item" style="width: 52.5px;">
												<li class="item"><span class="date disabled"><label><input
															type="radio" name="radioDate1" data-displayyn="N"
															data-playdate="2022-12-06" data-isplaydate="N"
															data-playweek="화"><strong>6</strong><em>화</em></label></span></li>
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
								</ul>
							</div>
						</div>
						<ul class="tab_wrap outer sml actionmovingbar">
							<li class="active"><button type="button" class="tab_tit"
									style="width: 16.6667%; left: 0%;">
									<span>전체</span>
								</button>
								<div class="tab_con ty5">
									<h5 class="hidden">전체</h5>
									<div
										class="mCustomScrollbar timeScroll _mCS_22 mCS-autoHide mCS_no_scrollbar"
										data-mcs-theme="minimal-dark"
										style="position: relative; overflow: visible;">
										<div id="mCSB_22"
											class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
											style="max-height: none;" tabindex="0">
											<div id="mCSB_22_container"
												class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
												style="position: relative; top: 0; left: 0;" dir="ltr">
												<div class="bx_notice">
													<p>조회 가능한 상영시간이 없습니다.</p>
													<p>조건을 변경해주세요.</p>
												</div>
											</div>
										</div>
										<div id="mCSB_22_scrollbar_vertical"
											class="mCSB_scrollTools mCSB_22_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
											style="display: none;">
											<div class="mCSB_draggerContainer">
												<div id="mCSB_22_dragger_vertical" class="mCSB_dragger"
													style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
													<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
												</div>
												<div class="mCSB_draggerRail"></div>
											</div>
										</div>
									</div>
								</div></li>
							<li><button type="button" class="tab_tit"
									style="width: 16.6667%; left: 16.6667%;">
									<span>스페셜관</span>
								</button>
								<div class="tab_con ty5">
									<h5 class="hidden">스페셜관</h5>
									<div
										class="mCustomScrollbar timeScroll _mCS_23 mCS-autoHide mCS_no_scrollbar"
										data-mcs-theme="minimal-dark"
										style="position: relative; overflow: visible;">
										<div id="mCSB_23"
											class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
											style="max-height: none;" tabindex="0">
											<div id="mCSB_23_container"
												class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
												style="position: relative; top: 0; left: 0;" dir="ltr">
												<div class="bx_notice">
													<p>조회 가능한 상영시간이 없습니다.</p>
													<p>조건을 변경해주세요.</p>
												</div>
											</div>
										</div>
										<div id="mCSB_23_scrollbar_vertical"
											class="mCSB_scrollTools mCSB_23_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
											style="display: none;">
											<div class="mCSB_draggerContainer">
												<div id="mCSB_23_dragger_vertical" class="mCSB_dragger"
													style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
													<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
												</div>
												<div class="mCSB_draggerRail"></div>
											</div>
										</div>
									</div>
								</div></li>
							<li><button type="button" class="tab_tit"
									style="width: 16.6667%; left: 33.3333%;">
									<span>Atmos</span>
								</button>
								<div class="tab_con ty5">
									<h5 class="hidden">Atmos</h5>
									<div
										class="mCustomScrollbar timeScroll _mCS_24 mCS-autoHide mCS_no_scrollbar"
										data-mcs-theme="minimal-dark"
										style="position: relative; overflow: visible;">
										<div id="mCSB_24"
											class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
											style="max-height: none;" tabindex="0">
											<div id="mCSB_24_container"
												class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
												style="position: relative; top: 0; left: 0;" dir="ltr">
												<div class="bx_notice">
													<p>조회 가능한 상영시간이 없습니다.</p>
													<p>조건을 변경해주세요.</p>
												</div>
											</div>
										</div>
										<div id="mCSB_24_scrollbar_vertical"
											class="mCSB_scrollTools mCSB_24_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
											style="display: none;">
											<div class="mCSB_draggerContainer">
												<div id="mCSB_24_dragger_vertical" class="mCSB_dragger"
													style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
													<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
												</div>
												<div class="mCSB_draggerRail"></div>
											</div>
										</div>
									</div>
								</div></li>
							<li><button type="button" class="tab_tit"
									style="width: 16.6667%; left: 50%;">
									<span>13시 이후</span>
								</button>
								<div class="tab_con ty5">
									<h5 class="hidden">13시 이후</h5>
									<div
										class="mCustomScrollbar timeScroll _mCS_25 mCS-autoHide mCS_no_scrollbar"
										data-mcs-theme="minimal-dark"
										style="position: relative; overflow: visible;">
										<div id="mCSB_25"
											class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
											style="max-height: none;" tabindex="0">
											<div id="mCSB_25_container"
												class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
												style="position: relative; top: 0; left: 0;" dir="ltr">
												<div class="bx_notice">
													<p>조회 가능한 상영시간이 없습니다.</p>
													<p>조건을 변경해주세요.</p>
												</div>
											</div>
										</div>
										<div id="mCSB_25_scrollbar_vertical"
											class="mCSB_scrollTools mCSB_25_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
											style="display: none;">
											<div class="mCSB_draggerContainer">
												<div id="mCSB_25_dragger_vertical" class="mCSB_dragger"
													style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
													<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
												</div>
												<div class="mCSB_draggerRail"></div>
											</div>
										</div>
									</div>
								</div></li>
							<li><button type="button" class="tab_tit"
									style="width: 16.6667%; left: 66.6667%;">
									<span>19시 이후</span>
								</button>
								<div class="tab_con ty5">
									<h5 class="hidden">19시 이후</h5>
									<div
										class="mCustomScrollbar timeScroll _mCS_26 mCS-autoHide mCS_no_scrollbar"
										data-mcs-theme="minimal-dark"
										style="position: relative; overflow: visible;">
										<div id="mCSB_26"
											class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
											style="max-height: none;" tabindex="0">
											<div id="mCSB_26_container"
												class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
												style="position: relative; top: 0; left: 0;" dir="ltr">
												<div class="bx_notice">
													<p>조회 가능한 상영시간이 없습니다.</p>
													<p>조건을 변경해주세요.</p>
												</div>
											</div>
										</div>
										<div id="mCSB_26_scrollbar_vertical"
											class="mCSB_scrollTools mCSB_26_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
											style="display: none;">
											<div class="mCSB_draggerContainer">
												<div id="mCSB_26_dragger_vertical" class="mCSB_dragger"
													style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
													<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
												</div>
												<div class="mCSB_draggerRail"></div>
											</div>
										</div>
									</div>
								</div></li>
							<li><button type="button" class="tab_tit"
									style="width: 16.6667%; left: 83.3333%;">
									<span>심야</span>
								</button>
								<div class="tab_con ty5">
									<h5 class="hidden">심야</h5>
									<div
										class="mCustomScrollbar timeScroll _mCS_27 mCS-autoHide mCS_no_scrollbar"
										data-mcs-theme="minimal-dark"
										style="position: relative; overflow: visible;">
										<div id="mCSB_27"
											class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
											style="max-height: none;" tabindex="0">
											<div id="mCSB_27_container"
												class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
												style="position: relative; top: 0; left: 0;" dir="ltr">
												<div class="bx_notice">
													<p>조회 가능한 상영시간이 없습니다.</p>
													<p>조건을 변경해주세요.</p>
												</div>
											</div>
										</div>
										<div id="mCSB_27_scrollbar_vertical"
											class="mCSB_scrollTools mCSB_27_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
											style="display: none;">
											<div class="mCSB_draggerContainer">
												<div id="mCSB_27_dragger_vertical" class="mCSB_dragger"
													style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
													<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
												</div>
												<div class="mCSB_draggerRail"></div>
											</div>
										</div>
									</div>
								</div></li>
							<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- popup : 예매/step01 -->
    <div id="layerReserveStep01" class="layer_wrap layer_reserve layer_reserve01_sum2">
        <div class="layer_header">
            <h4 class="hidden">예매 내용 확인 팝업</h4>
            <div id="stepOnePopupHeaderScreen">
            </div>
            <button type="button" class="btn_close" onclick="closeScreenLayer()">팝업 닫기</button>
        </div>
        <div class="layer_contents">
            <div class="seat_infor_sum">
                <div class="group_top" id="stepOnePopupContentsSeatCount">
                </div>
                <div class="group_con screen_preview_box">
                    <div class="screen_preview_con">
                        <div class="screen_info cineCont">
                            <!-- 개발영역 -->
                            <div class="smallScreen">
                                <span class="title_screen1">SCREEN</span>
                                <!-- 미니맵 -->
                                <div class="minimap" id="stepOnePopupMiniMap">
                                </div>
                                <!-- //미니맵 -->
                            </div>
                            <!-- //개발영역 -->
                        </div>
                    </div>
                </div>
                <div class="group_btm" id="stepOnePopupContentsMsg">

                </div>
            </div>
            <div class="btn_btm_wrap" id="stepOnePopupContentsButton">

            </div>
        </div>
    </div>
    <!-- //popup : 예매/step01 -->

    <!-- popup : 드라이브 영화관 선택시 -->
	<div id="layerGetMobTicket" class="layer_wrap layer_fin_get_mobticket">
		<strong class="hidden">레이어 팝업 시작</strong>
		<div class="layer_header">
			<h1 class="tit pt20"><img src="/NLCHS/Content/images/payment/pop_driveosiria_1.png" alt="롯데시네마 DRIVE OSIRA" /></h1>
			<button type="button" class="btn_close btnCloseLayer CloseLayerSaving">팝업 닫기</button>
		</div>
		<div class="layer_contents">
			<div class="box_driveosia">
				<img src="/NLCHS/Content/images/payment/pop_driveosiria_2.png" alt="1인 차량 1대" />
				<p class="desc">
					DRIVE OSIRIA는 '기장읍 시랑리 287'에<br />
					위치한 자동차극장 입니다.
				</p>
			</div>
			<div class="box_driveosia_desc">
				<p class="text_c">
					예매 시 <span class="txt_color01">1인은 차량 1대</span>이며<br />
					지정좌석 예매가 아닌<br />
					선착순 입차 순으로 관람석이 지정됩니다.
				</p>
			</div>
			<div class="btn_btm_wrap ty1">
				<button type="button" class="btn_col2 ty6 btnCloseLayer">확인</button>
			</div>
		</div>
		<strong class="hidden txtTabIndex" tabindex="0">레이어 팝업 끝</strong>
	</div>
	<!-- //popup : 드라이브 영화관 선택시 -->


<!-- //step01 -->

<script src="/NLCHS/Scripts/Dist/TicketingIndex.bundle.js?v=202211090741"></script>
<script type="text/javascript">
    function closeScreenLayer() {
        //$("#stepOnePopupMiniMap").empty();
        closeLayer();
        $(".tempZindex").css({ "z-index": "inherit" }).removeClass("tempZindex");
        if ($(this).hasClass("CloseLayerSaving") == true) {
            $(".article_payment_fin > .inner").animate({ "margin-right": "0" }, "fast", function () {
                $(".article_payment_fin").removeClass("side");
            });
        }
    }
</script>


    


    
    <div id="banner_reserve_section" class="banner_reserve_wrap">
    </div>
    <div id="banner_side_section" class="banner_side_wrap"></div>
    <div id="banner_section" class="banner_wrap"></div>
    <div id="footer_section" class="footer"></div>
    
    
    

    



    <script src="/NLCHS/Scripts/Dist/Pagination.bundle.js?v=202211091939"></script>
    <script src="/NLCHS/Scripts/Dist/LayoutTopOfTop.bundle.js"></script>
    <script src="/NLCHS/Scripts/Dist/LayoutSkipNav.bundle.js?v=202211091939"></script>
    <script src="/NLCHS/Scripts/Dist/LayoutHeaderMenu.bundle.js?v=202211091939"></script>
    <script src="/NLCHS/Scripts/Dist/LayoutBanner.bundle.js?v=202211091939"></script>
    <script src="/NLCHS/Scripts/Dist/LayoutFooter.bundle.js?v=202211091939"></script>
    
    <script src="/NLCHS/Scripts/Dist/LayoutBannerReserve.bundle.js?v=202211091939"></script>

    
    
    

    <script>
        if (document.readyState == "complete") {
            document.getElementById("loading").classList.remove('loader');
            document.getElementById("loading").classList.remove('loader-bouncing');
            document.getElementById("loading").classList.remove('is-active');
        }

                                    //document.addEventListener('readystatechange', event => {
                                    //    if (event.target.readyState === "complete") {
                                    //        document.getElementById("loading").classList.remove('loader');
                                    //        document.getElementById("loading").classList.remove('loader-bouncing');
                                    //        document.getElementById("loading").classList.remove('is-active');
                                    //    }
                                    //});
    </script>
</body>
</html>



	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp"/>

</body>
</html>