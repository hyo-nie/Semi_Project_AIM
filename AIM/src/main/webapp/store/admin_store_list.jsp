<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.util.List"%>
<%@page import="com.aim.store.db.AdminStoreDAO"%>
<%@page import="com.aim.store.db.StoreDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AIM - 스토어 상품 리스트</title>
<link href="./assets/css/common.css" rel="stylesheet" type="text/css">
<link href="./assets/css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<%-- ${adminStoreList } --%>
	<!-- 정보 확인 완료 -->
	
	<%
		AdminStoreDAO dao = new AdminStoreDAO();
		List list = dao.getAdminStoreList();
		int count = list.size();
		
/////////////////////////////////////////////////////////////////////////////////////////////////////
// 페이징 처리 (1)

// 한 페이지에 보여줄 글의 개수
int pageSize = 5;		// 한 번에 5개씩만 보여줄 것

// 현 페이지가 몇 번째 페이지인지 확인
String pageNum = request.getParameter("pageNum");
if(pageNum == null){
pageNum = "1";

}

// 시작행 번호를 계산하기	1	6	11	16.... (한 페이지에 글이 5개씩이니까!)
int currentPage = Integer.parseInt(pageNum);		// parseInt()의 기능은 String타입의 숫자를 int타입으로 변환해줌
int startRow = (currentPage-1) * pageSize + 1;

// 끝행 번호를 계산하기		5	10	15	20....
int endRow = currentPage * pageSize;
	
	%>


	<div id="contents" class="contents_event_home">
		<div class="title_top">
			<h2 class="tit">스토어 상품 리스트</h2>
		</div>
	</div>

	<table class="tbl_list text_c">
		<caption>스토어 상품 리스트</caption>
		<colgroup>
			<col style="width: 10%;">
			<col style="width: 15%;">
			<col style="width: auto;">
			<col style="width: 15%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">카테고리</th>
				<th scope="col">이미지</th>
				<th scope="col">상품명</th>
				<th scope="col">가격</th>
				<th scope="col">구성</th>
				<th scope="col">관리</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="dto" items="${adminStoreList}">
				<tr>
					<td>${dto.st_num}</td>
					<td>${dto.category_name }</td>
					<td>
						<img src="./assets/img/${dto.st_img }" width="200" height="200">
					</td>
					<td>${dto.st_name }</td>
					<td>
						<fmt:formatNumber value="${dto.st_price }"/>원
					</td>
					<td>${dto.st_text }</td>
					<td>
						<a href="./AdminStoreModify.ad?st_num=${dto.st_num }">수정</a>
						/
						<a href="./AdminStoreDel.ad?st_num=${dto.st_num }">삭제</a>
					</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>


		<!-- 페이징 처리는 추후 구현할 예정 -->
		<!-- boardProject의 boardList.jsp 참고 -->
<%
		/////////////////////////////////////////////////////////////////////////////////////////////
		// 페이징 처리(2)
		
		if(count != 0){		// 글이 하나라도 있을 때
				// 총 페이지 = 글 개수(총량) / 페이지 당 출력	
				//	=> 만약, 나머지가 있을 때 페이지 1개를 추가
				
				// 전체 페이지 수
				int pageCount = (count / pageSize) + (count % pageSize == 0? 0:1); // 삼항연산자..... 이게 모지
																	// A? t:f
				// 한 화면에 보여줄 페이지 수
				int pageBlock = 3;
				
				// 페이지 블럭의 시작번호		1~10page 사이의 글을 보고 있으면 제일 첫 번째 번호는 1임! 
				//								11~20page 사이의 글을 보고 있으면? 11
				int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
				
				// 페이지 블럭의 끝번호
				int endPage = startPage + pageBlock - 1;
				
				if(endPage > pageCount){
					endPage = pageCount;
				}
				
				// [이전]
				if(startPage > pageBlock){
					%>
						<a href="boardList.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
					<%
				}
				
				// 숫자 (페이지링크) 1,2,3,..... 
				for(int i = startPage; i <= endPage ; i++){
					%> 
						<a href="boardList.jsp?pageNum=<%=i %>"><%=i %></a>	
					<% 
				}
				
				// [다음]
				if(endPage < pageCount){
					%>
						<a href="boardList.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
					<%
				}
		}
		
		/////////////////////////////////////////////////////////////////////////////////////////////
		%>


</body>
</html>