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
				<form action="./NtAdminLoginAction.nt" method="post" >
				<div class="tab_con">
					<h3 class="hidden">공지사항</h3>
					<ul class="tab_wrap inner">
						<li class="active">
							<div class="tab_con ty3">
								<h4 class="hidden">전체 공지</h4>
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
											<th scope="col" style="text-align:center">번호</th>
											<th scope="col" style="text-align:center">작성자</th>
											<th scope="col" style="text-align:center">제목</th>
											<th scope="col" style="text-align:center">등록일</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="dto" items="${NtListAll }">
										<tr>
											<td><strong class="ico_imp"> ${dto.nt_bno }</strong></td>
											<td>${dto.mb_id }</td>
											<td class="text_l" style="text-align:left">
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
									
									<input type="hidden" name="mb_id" id="mb_id" value="${dto.mb_id }">
									<input type="hidden" name="mb_pw" id="mb_pw" value="${dto.mb_pw }">
									<c:if test="${mb_id.equals('admin') }">
										<input type="submit" style="background-color:#18315D" value="공지사항 올리기" class="btn_col2 ty6">
									</c:if>
									
									
								</div>
							</div></li>
						
						<script>
							onload();
						</script>
					</ul>
				</div>
				</form>
				</li>
			<li><button type="button" class="tab_tit" style="width: 33.33%; left: 33.33%;" onclick="location.href='./HpLogin.hp';">
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