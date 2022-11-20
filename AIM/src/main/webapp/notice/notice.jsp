<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<div id="contents" class="contents_customer area__movingbar litype5"
		style="">
		<div class="title_top">
			<h2 class="tit">고객센터</h2>
		</div>
		<ul class="tab_wrap outer actionmovingbar">
			
			<li class="active"><button type="button" class="tab_tit"
					style="width: 33.33%; left: 0%;">
					<span>공지사항</span>
				</button>
				<form>
				<div class="tab_con">
					<h3 class="hidden">공지사항</h3>
					<ul class="tab_wrap inner">
						<li class="active">
							<div class="tab_con ty3">
								<h4 class="hidden">전체 공지</h4>
								<fieldset class="search_wrap" id="search_wrap1">
									<legend>전체 공지 검색하기</legend>
									<select id="selectArea1" title="지역 선택" style="display: none;"></select>
									<select id="selectCinema1" title="영화관 선택" style="display: none;"></select>
									<select	class="ty3" title="검색조건 제목 선택" id="selectCondition1">
									<option value="1" selected="">제목</option>
										<option value="2">내용</option>
										<option value="3">제목+내용</option>
										</select>
										<input type="text"placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요"
										id="searchKeyword1" style="width: 580px;">
									<button type="button" class="btn_col2" id="btnSearch1">검색</button>
								</fieldset>
								<table class="tbl_list text_c" summary="공지사항에 대한 표입니다">
									<caption>전체 공지사항 내용</caption>
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
									<c:forEach var="dto" items="${NtListAll }">
										<tr>
											<td><strong class="ico_imp"> ${dto.nt_bno }</strong></td>
											<td>${dto.nt_ }</td>
											<td class="text_l">
												<a href="./NtContent.nt?nt_bno=${dto.nt_bno }&pageNum=${pageNum}">${dto.nt_subject }</a>
											</td>
											<td>${dto.nt_date }</td>
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
									
									<input type="button" value="공지사항 등록하기" onclick="location.href='./notice/ntwrite.jsp';">
									
								</div>
							</div></li>
						
						<script>
							onload();
						</script>
					</ul>
				</div></li>
				</form>
			<li><button type="button" class="tab_tit" style="width: 33.33%; left: 33.33%;" onclick="location.href='./hp/boardhp.jsp';">
					<span>1:1문의</span>
				</button></li>
			<li><button type="button" class="tab_tit" style="width: 33.33%; left: 66.67%;" onclick="location.href='./MyHpList.hp';">
					<span>문의 내용 목록</span>
				</button></li>
		
			<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
		</ul>
	</div>
</body>
</html>