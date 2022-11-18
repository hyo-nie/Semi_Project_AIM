<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM (All In Movie!) - 고객센터</title>
</head>
<body>
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp"/>
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp" />
	<!-- 사이드 퀵메뉴 -->
	<jsp:include page="../inc/side_quick_menu.jsp" />


	<div id="contents" class="contents_customer area__movingbar litype5" style="">
		<div class="title_top">
			<h2 class="tit">고객센터 - 문의 내용 목록</h2>
		</div>
		<ul class="tab_wrap outer actionmovingbar">
			<li><button type="button" class="tab_tit" style="width: 50%; left: 0%;" onclick="location.href='./HpLoginAction.hp';">
					<span>1:1문의</span>
				</button></li>
			<li class="active"><button type="button" class="tab_tit" style="width: 50%; left: 50%;">
					<span>문의 내용 목록</span>
				</button>
				<div class="tab_con">
					<ul class="tab_wrap inner">
						<li class="active">
						<button type="button" class="tab_tit" id="1" style="left: 0px; margin-left: 217.391px;"></button>
							<div class="tab_con ty3">
								<h4 class="hidden">문의 내용 목록</h4>
							
								<table class="tbl_list text_c">
									<caption>문의 내용 목록</caption>
									<colgroup>
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col style="width: auto;">
										<col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">구분</th>
											<th scope="col">제목</th>
											<th scope="col">등록일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="dto" items="${HpListAll }">
										<tr>
											<td>${dto.hp_bno }</td>
											<td>${dto.hp_class }</td>
											<td> 
												<a href="./MyHpContent.hp?hp_bno=${dto.hp_bno }&pageNum=${pageNum}">${dto.hp_subject }</a>
											</td>
											<td>${dto.hp_date }</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								
								<div class="brd_paginate">
									<ol>
										<c:if test="${totalCnt != 0}">
	  
	  									  <!-- 이전 -->
	  										  <c:if test="${startPage > pageBlock }">
	    										<a href="./MyHpList.hp?pageNum=${startPage-pageBlock }">[이전]</a>
	   										  </c:if>
	   									 <!-- 페이지 번호(1,2,3....) -->	  
	  										  <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
	          									<a href="./MyHpList.hp?pageNum=${i }">${i }</a> 
	  										  </c:forEach>  
	    								 <!-- 다음 -->	
	    									  <c:if test="${endPage < pageCount }">
	       										<a href="./MyHpList.hp?pageNum=${startPage+pageBlock }">[다음]</a>
	   										 </c:if>
	
										</c:if>
									</ol>
									<button type="button" class="btn_pg_next">다음 페이지로 이동</button>
									<button type="button" class="btn_pg_last">마지막 페이지로 이동</button>
								</div>
							</div></li>
						
						<script>
							onload();
						</script>
					</ul>
				</div></li>
			
		
			
			<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
		</ul>
	</div>
	  <div id="footer_section" class="footer">
		<div class="inner">
			<ul class="f_menu">
				<li><a
					href="https://www.lottecinema.co.kr/NLCHS/Etc/MemberClause"
					title="회원약관" target="_self">회원약관</a></li>
				<li><a
					href="https://www.lottecinema.co.kr/NLCHS/Etc/IndividualInfomationHandlingPolicy"
					title="개인정보처리방침" target="_self"><strong>개인정보처리방침</strong></a></li>
				<li><a
					href="https://www.lottecinema.co.kr/NLCHS/Etc/EmailCollectionRefusal"
					title="이메일무단수집거부" target="_self">이메일무단수집거부</a></li>
				<li><a
					href="https://www.lottecinema.co.kr/NLCHS/Etc/ElectronicManagementPolicy"
					title="영상정보처리기기 운영 및 관리방침" target="_self">영상정보처리기기 운영 및 관리방침</a></li>
			</ul>
		</div>
		
	</div>
</body>
</html>