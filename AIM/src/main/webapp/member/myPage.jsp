<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 본문 -->
<div id="contents" style="margin-top: 120px;">
		<h2 class="h2_memtit">My Page</h2>
		<div class="pb20 area__movingbar litype2">
			<ul class="tab_wrap outer actionmovingbar" style="padding-top:10px;">
				<li class="active">
					<div class="tab_con">
						<div class="vip_top_infor" style="background-color:ghostwhite;">
							<div class="mypage_box">
								<div class="my_info">
									<p class="name">
										<strong>${dto.mb_id}</strong>님은 
										<span class="txt_rank_common" style="background-color:#18315D;">
											<c:choose>
												<c:when test="${dto.mb_grade==1 }">
													SILVER
												</c:when>
												<c:when test="${dto.mb_grade==2 }">
													GOLD
												</c:when>
												<c:when test="${dto.mb_grade==3 }">
													VIP
												</c:when>
												<c:when test="${dto.mb_grade==4 }">
													VVIP
												</c:when>
											</c:choose>
										</span>
										<span class="light">등급입니다.</span>
									</p>
									<div class="next_rank">
										<p>
											회원님의 총 관람횟수는 <em class="font22">${dto.mb_view }</em>회 입니다.<br> 
											회원님의 총 결제금액은 <em class="font22">${dto.mb_pay }</em>원 입니다.
											
										</p>
									</div>
								</div>
								<div class="bx_grade merge2020">
									<div class="area_gauge friendslv" style="margin-bottom:-25px;">
										<div class="gauge" style="width: 0%;"></div>
									</div>
								</div>
							</div>
							<div class="text_c mt30 mb25">
								<a href="./MemberUpdate.aim" style="font-size:15px;">회원정보변경</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="./MemberDelete.aim" style="font-size:15px;">회원탈퇴</a>
							</div>
						</div>

						<div class="benefit_wrap">
							<div class="txt_list_wrap" style="margin-bottom:50px;">
								<h3 class="tit">
									<em style="font-weight:bold;">예매내역 조회</em>
								</h3>
								<div class="list_bdr_box">
									<ul class="list_txt">
										<c:choose>
											<c:when test="${reDTO == null }">
													<h2> 예 매 내 역 이 없 습 니 다 ! </h2>
											</c:when>
											<c:otherwise>
													<img src="${scDTO.poster }" width="200">
													<dl class="dlist_infor">
														<dt style="display: inline; font-size: 25px;">예매번호 | </dt>
														<dd style="display: inline; font-size: 25px;">${reDTO.tkCode }</dd>
														<br>
														<dt style="display: inline; font-size: 25px;">제목 | </dt>
														<dd style="display: inline; font-size: 25px;">${scDTO.movieNm }</dd>
														<br>
														<dt style="display: inline; font-size: 25px;">날짜 및 시간 | </dt>
														<dd style="display: inline; font-size: 25px;">${scDTO.sc_date }, ${scDTO.starttime } ~ ${scDTO.endtime }</dd>
														<br>
														<dt style="display: inline; font-size: 25px;">영화관 | </dt>
														<dd style="display: inline; font-size: 25px;">${scDTO.branch_name } ${scDTO.roomNum }</dd>
														<br>
														<dt style="display: inline; font-size: 25px;">총 인원 | </dt>
														<dd style="display: inline; font-size: 25px;">${reDTO.cusCnt } 명</dd>
														<dt style="display: inline; font-size: 25px;">&nbsp;결제 금액 | </dt>
														<dd style="display: inline; font-size: 25px;"><fmt:formatNumber value="${reDTO.totalPrice }"/> 원</dd>
													</dl>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</div>
							<div class="txt_list_wrap" style="margin-bottom:50px;">
								<h3 class="tit">
									<em style="font-weight:bold;">구매내역 조회</em>
								</h3>
								<div class="list_bdr_box">
									<ul class="list_txt" style="text-align:center;">
										<li>ㅇㅇ</li>
										<li>ㅇㅇ</li>
									</ul>
								</div>
							</div>
							<div class="txt_list_wrap" style="margin-bottom:50px;">
								<h3 class="tit">
									<em style="font-weight:bold;">1:1 문의내역</em>
								</h3>
								<div class="list_bdr_box">
		                  		 <ul class="list_txt" style="text-align:center; font-size:14px;">
									<li>FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.</li>
		                    		<li>1:1 문의글 답변 운영시간 10:00 ~ 19:00</li>
		                    		<li>접수 후 48시간 안에 답변 드리겠습니다.</li>
		                  		</ul>
								<button onclick="location.href='./MyHpList.hp';" 
										style="height:40px; line-height:38px; padding:0 18px; margin:auto; display:block; font-size:13px;">1:1 문의내역</button>
								</div>
								<div>
								</div>
							</div>
							<div class="txt_list_wrap" style="margin-bottom:50px;">
								<h3 class="tit">
									<em style="font-weight:bold;">대관 문의내역</em>
								</h3>
								<div class="list_bdr_box">
									 <ul class="list_txt" style="text-align:center; font-size:14px;">
					                    <li>단체관람 및 대관을 원하시는 고객님께 할인 혜택을 드리고 있습니다.<br>
					                    신청을 원하시거나 문의사항이 있으시면 아래 정보를 입력해주세요.</li>
					                 </ul>
                  					 <button onclick="location.href='./AdminRentalList.th';" 
                          					 style="height:40px; line-height:38px; padding:0 18px; margin:auto; display:block; font-size:13px;">대관 문의내역</button>
								</div>
							</div>
							</div>
						</div>
				</li>
			</ul>
	</div>
</div>




	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>