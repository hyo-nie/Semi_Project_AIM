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
<script type="text/javascript">

function deleteChk(st_num){
		if(confirm("상품을 삭제하시겠습니까?")){
			location.href="./AdminStoreDel.ad?st_num="+st_num;
					
		} else{
			return;
		}
	}

</script>
</head>
<body>

	
	
	
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp"/>

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp"/>



	<div id="contents" class="contents_event_home">
		<div class="movi_pre_list">
			<h3 class="tit_type0" style="margin-top: 50px;"><strong class="ty2 eng">AIM</strong> 스토어 상품 등록</h3>
		</div>
	</div>


	<table class="tbl_list text_c" style="width: 1100px; margin: 0 auto;">
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
						<a href='javascript:deleteChk("${dto.st_num}")'>삭제</a>

					</td>
				</tr>
			</c:forEach>
		
		
		</tbody>
		
	
	</table>

	
	<div class="btn_btm_wrap">
		<a href="./AdminStoreAdd.ad" class="btn_col3 ty6">상품 등록</a>
		<a href="./StoreMain.st" class="btn_col3 ty6">스토어 메인</a>
	</div>





	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />
	

</body>
</html>