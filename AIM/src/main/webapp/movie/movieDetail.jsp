<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보</title>
</head>
<body>


	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp" />
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp" />
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div id="contents"
		class="contents_movie_detail area__movingbar litype2">
		<h2 class="hidden">영화</h2>
		<h3 class="hidden">영화 상세정보</h3>
		
		
		<div class="detail_top_wrap new22">
			<div class="poster_info">
				<img src="${dto.poster }"
					alt="블랙 팬서: 와칸다 포에버">
			</div>
			<div class="tit_info">
				<span class=
                <c:if test="${dto.watchGradeNm.equals('12세이상관람가') }">
                  "ic_grade gr_12"
                </c:if>
                <c:if test="${dto.watchGradeNm.equals('15세이상관람가') }">
                  "ic_grade gr_15"
                </c:if>
                <c:if test="${dto.watchGradeNm.equals('18세이상관람가') }">
                  "ic_grade gr_18"
                </c:if>
                <c:if test="${dto.watchGradeNm.equals('전체관람가') }">
                  "ic_grade gr_all"
                </c:if>> </span>
				<strong>${dto.movieNm }</strong>
			</div>
			<ul class="detail_info1">
				<li class="sub_info1" style="cursor: pointer;"></li>
				<li class="sub_info2"><em>예매율 1위 </em><strong>${dto.bookRating }% </strong></li>
				<li class="sub_info3"><em>누적관객수</em><strong><fmt:formatNumber value="${dto.audiAcc }"/> 
						<em>명</em> <span class="date_info"> </span>
				</strong></li>
			</ul>
			<ul class="detail_info2">
				<li class="sub_info1"><em>장르</em>
					<strong><em>${dto.genreNm }</em>
					<em>${dto.openDt } 개봉</em>
					<em class="time_info">${dto.showTm }분</em></strong>
				</li>
				<li class="sub_info2"><em>감독</em><strong class="line_type">${dto.directors}</strong></li>
				<li class="sub_info3"><em>출연</em><strong class="line_type">${dto.actors }</strong></li>
			</ul>
			
			<div class="movie_detail_aside_menu type2">
				<ul>
					<li class="area_reserve" style="float:right;">
					<a href="./Ticketing.tk?movieCd=${movie.movieCd}"
						class="btn_col1 ty7 rnd">예매하기</a></li>
				</ul>
			</div>
		</div>
		<ul class="tab_wrap outer moviedetailbar actionmovingbar new22">
			<li class="active"><button type="button" class="tab_tit"
					style="width: 1000px; left: 50%; margin-left: -490px;">
					<span>영화정보</span>
				</button>
				<div class="tab_con">
					<h4 class="hidden">영화정보</h4>
					<div class="movi_tab_info1">
						<div class="left_con">
							<strong class="tit_info">시놉시스</strong>
								<p class="txt_info">
									<span> ${dto.contents } </span>
								</p>
						</div>
					</div>
				</div>
			</li>
		</ul>
		
		  <ul>
			<li><button type="button" class="tab_tit"
					style="width: 1000px; height:50px; left: 50%; margin-left: 0px;">
					<span style="font-size:18px" >평점 및 관람평 (${requestScope.cnt })</span></button>
				<div class="tab_con">
					<h4 class="hidden">평점 및 관람평</h4>
					<div class="wrap_reviewstarscore starReg" id="movie_review_box">
						<div class="star_score_box ">
							<br><h4 class="h4_tit">평점 · 관람평 작성</h4><br>
						</div>
						
						
						<form action="./ReviewWrite.mv?movieCd=${dto.movieCd }" method="post">
							<div class="movi_review_box" style="width: 1000px; left: 50%; margin-left: 0px;">
								<div class="review_write_box" style="width:860px;">
									<textarea id="txtComment" name="review_sy" "
										placeholder="평점 및 영화 관람평을 작성해주세요. 주제와 무관한 리뷰 또는 스포일러는 표시제한 또는 삭제될 수 있습니다. 
작성하신 평점 및 관람평은 AIM 홈페이지, SNS 등에 인용될 수 있습니다."
										title="관람평 작성"></textarea>
									<span class="byte_info"><strong class="byte">0</strong>/<em>220</em></span>
								</div>
	<!-- 							<button type="submit" id="btnComment" class="btn_submit">관람평 작성</button> -->
								<input type="submit" id="btnComment" class="btn_submit" value="관람평 작성" style="width:139px; background:#18315D;">
							</div>
						</form>
						
						
					</div>
					<div class="movi_review_list">
						<h5 class="hidden">관람평 목록</h5>
						<div class="review_top">
							<span class="tit"><span class="txt_ic_score">
							<span class="starimg" style="color:gray;">관람객 관람평</span></span></span>
							<div class="wrap_sort_right">
								<span class="total_num" style="color:gray;">총 <em>${requestScope.cnt }</em>건</span>
 							
							</div>
						</div>

							<ul class="review_con_list" id="review_con_list1"></ul>
							<ul class="review_con_list" id="review_con_list2">
							<c:forEach var="redto" items="${reviewListAll }">
							<li>
								<c:choose>
									<c:when test="${redto.mb_grade==1 }">
										<span class="img_info"><img src="./assets/img/silver.png" alt="silver"></span>
									</c:when>
									<c:when test="${redto.mb_grade==2 }">
										<span class="img_info"><img src="./assets/img/gold.png" alt="gold"></span>
									</c:when>
									<c:when test="${redto.mb_grade==3 }">
										<span class="img_info"><img src="./assets/img/vip.png" alt="vip"></span>
									</c:when>
									<c:when test="${redto.mb_grade==4 }">
										<span class="img_info"><img src="./assets/img/vvip.png" alt="vvip"></span>
									</c:when>
								</c:choose> 
								
							<span class="img_info">
							</span>
								<div class="top_info"><span class="name">${redto.mb_nick }</span>
								<span class="txt_ic_score">
									<span class="stargradebg">
										<span class="blindbg grade7">
											<span class="stargradecolor "></span>
										</span>
									</span>
								</span>
								<span class="date_info" style="float:right; color:gray;">
								<fmt:formatDate value="${redto.date}" pattern="yyyy.MM.dd"/></span></div>
								<div class="review_info">${redto.review }</div>
								<div class="btm_info">
									<div class="edit_review"><em></em></div>
								</div>
							</li>
							</c:forEach> 
							</ul>
<!-- 						<button type="button" class="btn_txt_more" id="btn_review_more"> -->
<!-- 							<span>펼쳐보기</span> -->
<!-- 						</button> -->
					</div>
					<div class="list_bdr_box">
						<h3 class="title txt_caution2">유의사항</h3>
						<ul class="list_txt">
							<li>관람평은 관람 내역당 1회만 작성 가능하며, 상영종료된 영화의 관람평은 작성 불가합니다.</li>
							<li>작성하신 관람평은 마이페이지 &gt; MY무비로그 &gt; 내가 본 영화에서 확인하실 수 있습니다.</li>
							<li>부적절한 내용을 포함한 리뷰의 경우 임의로 삭제될 수 있습니다.</li>
							<li>수정/삭제 후 재등록 시에는 포인트 적립이 되지 않습니다.</li>
							<li>작성하신 리뷰는 AIM 마케팅에 사용될 수 있습니다.</li>
						</ul>
					</div>
				</div>
			</li>
			<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
		  </ul>
	</div>

	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />


</body>
</html>