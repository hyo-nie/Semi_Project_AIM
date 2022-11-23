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
	
	
	<div id="contents" class="contents_customer area__movingbar litype5" style="">
		<div class="title_top">
			<h2 class="tit">단체관람/대관문의 신청 목록</h2>
		</div>
					
		<div class="tab_con ty3">
			<h4 class="hidden">문의 내용 목록</h4>
		
			<table class="tbl_list text_c">
				<caption>문의 내용 목록</caption>
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 15%;">
					<col style="width: auto%;">
					<col style="width: 15%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						
						<th scope="col">신청자명</th>
					
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${RtListAll }">
						<tr>
							<td>${dto.rno }</td>
					
							<td> 
								<c:if test="${dto.r_re_lev > 0}">
									<img src="./level.png" width="${dto.r_re_lev * 10 }">
									<img src="./re.gif">
									
								</c:if>
								<a href="./AdminRentalContent.th?rno=${dto.rno }&pageNum=${pageNum}">${dto.r_name }</a>
							</td>
				
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="brd_paginate">
				<ol>
					<c:if test="${totalCnt != 0}">

							  <!-- 이전 -->
								  <c:if test="${startPage > pageBlock }">
										<a href="./AdminRentalList.th?pageNum=${startPage-pageBlock }">[이전]</a>
									  </c:if>
								 <!-- 페이지 번호(1,2,3....) -->	  
								  <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
      									<a href="./AdminRentalList.th?pageNum=${i }">${i }</a> 
								  </c:forEach>  
								 <!-- 다음 -->	
									  <c:if test="${endPage < pageCount }">
   										<a href="./AdminRentalList.th?pageNum=${startPage+pageBlock }">[다음]</a>
									 </c:if>

					</c:if>
				</ol>
				<button type="button" class="btn_pg_next">다음 페이지로 이동</button>
				<button type="button" class="btn_pg_last">마지막 페이지로 이동</button>
			</div>
		</div>

	</div>

	  
</body>
</html>