<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp" />
<!-- 상위 배너 -->
<jsp:include page="../inc/topbanner.jsp" />
<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp" />
</head>
<body>
	
<br><br><br><br><br>
<!-- 본문 -->
<div id="contents" style="margin-top: 120px;">
	<h2 class="h2_memtit">멤버십</h2>
	<div class="pb20 area__movingbar litype2">
		<ul class="tab_wrap outer actionmovingbar">
			<li class="active">
				<button type="button" class="tab_tit" style="width: 100%; left: 0%;">
					<span>My Page</span>
				</button>
				<div class="tab_con">
						<div class="vip_top_infor">
							<div class="mypage_box">
								<div class="my_info">
									<p class="name">
										<strong>송이님은</strong> <span class="txt_rank_common">일반</span>
										<span class="light">등급입니다.</span>
									</p>
									<div class="next_rank">
										<p>
											1분기 Lv.1까지 <em class="font22">40,000원 남았어요!</em>
										</p>
										<button type="button" class="btn_txt_list"
											title="레이어팝업 열기" id="btnAcc">적립내역</button>
									</div>
								</div>
								<div class="bx_grade merge2020">
									<div class="area_gauge friendslv">
										<div class="gauge" style="width: 0%;"></div>
									</div>
								</div>
							</div>
							<div class="text_c mt30 mb25">
								<a href="#none" title="레이어팝업 열기"
									class="btn_col10 ty5 rnd pl40 pr40" style="width:120px;">회원정보수정</a>
							</div>
						</div>
						
						<div class="benefit_wrap">
							<div class="txt_list_wrap">
								<h3 class="tit">
									<em>예매내역 조회</em> 
								</h3>
								<div class="list_bdr_box">
									<ul class="list_txt">
										<li>ㅇㅇ</li>
										<li>ㅇㅇ</li>
									</ul>
								</div>
							</div>
							<div class="txt_list_wrap">
								<h3 class="tit">
									<em>구매내역 조회</em> 
								</h3>
								<div class="list_bdr_box">
									<ul class="list_txt">
										<li>ㅇㅇ</li>
										<li>ㅇㅇ</li>
									</ul>
								</div>
							</div>
							<div class="txt_list_wrap">
								<h3 class="tit">
									<em>1:1 문의내역</em>
								</h3>
								<div class="list_bdr_box">
									<ul class="list_txt">
										<li>ㅇㅇ</li>
									</ul>
								</div>
							</div>
						</div>
				</div></li>
			</ul>
			</div>
			</div>
				
						
						



</body>
</html>