<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.sujeong th {
padding : 18px 15px 18px 15px;
text-align: center;
}

</style>

</head>
<body>
<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp"/>

<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp"/>

<%
	//로그인 제어
	String mb_id = (String)session.getAttribute("mb_id");
	if(mb_id==null || !mb_id.equals("admin")){
		response.sendRedirect("./Main.aim");
		System.out.println("비정상적 접근 발생! IP : "+request.getRemoteAddr());
	}
	%>
	
<br><br><br><br><br><br><br><br><br><br><br>			
<!-- 게시판 -->

	<div id="contents" class="contents_customer area__movingbar litype5" style="">
		<div class="movi_pre_list">
			<h3 class="tit_type0"><strong class="ty2 eng">AIM</strong> 스케줄 등록 리스트</h3>
		</div>
					
		<div class="tab_con ty3">
			<h4 class="hidden">문의 내용 목록</h4>
		
			<table class="tbl_list text_c">
				<caption>문의 내용 목록</caption>
				<colgroup>

					<col style="width: auto%;">

				</colgroup>
				<thead align="center">
					<tr class="sujeong">
						<th scope="col" style="width:71px;">번호</th>						
						<th scope="col">지점</th>
						<th scope="col">날짜</th>
						<th scope="col" style="width:86px;">상영관</th>
						<th scope="col" style="width:286px;">영화명</th>
						<th scope="col">시작시간</th>
						<th scope="col">상영횟수</th>
						<th scope="col">관리</th>
						
					
					</tr>
				</thead>
			
				<tbody>
					
					 <c:forEach var="admins" items="${adminScheList }">
						<tr>
							<td>${admins.scCode }</td>
							<td style="width:90px;">${admins.branch_name }</td>
						    <td style="width:126px;">${admins.sc_date }</td>
						    <td>${admins.roomCd }</td>
						    <td>${admins.movieNm }</td>
						    <td>${admins.starttime }</td>
						    <td>${admins.runcount }</td>
						    <td style="width:106px;">
						    	<a href="./adminScheModify.th?scCode=${admins.scCode }">수정</a>
						    	/
						    	<a href="./AdminScheRemove.th?scCode=${admins.scCode }">삭제</a>
						    </td>
						
					    </tr>
				    </c:forEach>
				</tbody>
			</table>
			<br><br>
			<div class="brd_paginate" align="center">
				<ol>
					<c:if test="${totalCnt !=0 }">
						<!-- 이전 -->
						<c:if test="${startPage > pageBlock }">
							<a href="./AdminScheList.th?pageNum=${startPage-pageBlock }">[이전]</a>

						</c:if>
						
						<!-- 숫자 페이지번호 -->
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<a href="./AdminScheList.th?pageNum=${i }">[${i }]</a>
						</c:forEach>
						
						<!-- 다음 -->
						<c:if test="${endPage < pageCount }">
							<a href="./AdminScheList.th?pageNum=${startPage+pageBlock }">[다음]</a>

						</c:if>
					</c:if>
			
				
				</ol>
			</div>
			
			<br><br><br>
				<div id="table_search" align="center">
					<input type="button" value="스케줄등록" class="btn" style="color:#fff; background:#18315D; width:100px; height:40px; margin:5px; border-radius:5px; border:1px solid #fff;"
						onclick="location.href='./AdminScheAdd.th';" 
					>
				</div>
			
			
		</div>

	</div>
	
	
	
	
	
<!-- 하단배너 -->
<jsp:include page="../inc/loginform_bottom_banner.jsp" />
<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />
</body>
</html>