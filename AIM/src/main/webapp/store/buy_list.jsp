<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - ALL IN MOVIE</title>
<link href="./assets/css/giftstore.css" rel="stylesheet" type="text/css">
<script src="jquery-3.6.1.js"></script>
</head>
<body>
${orderList }
	<article>
		<h1>주문목록</h1>
		<table>
			<tr>
				<th class="">주문번호</th>
				<th class="">상품명</th>
				<th class="">결제방법</th>
				<th class="">주문금액</th>
				<th class="">주문일시</th>
			</tr>
			
			
			<c:forEach var="odList" items="${orderList }">
			<tr>
				<td>
					<!-- 주문 상세페이지로 이동 -->
					<a href="./OrderDetail.or?o_cnum=${odList.o_cnum}">${odList.o_cnum}</a>
				</td>
 				<td>${odList.o_name }</td>			
 				<td>${odList.o_pay }</td>
 				<td><fmt:formatNumber value="${odList.o_sum }"/>원</td>
 				<td>${odList.o_pdate }</td>
			</tr>
			</c:forEach>
			</table>
		<div>
			<input type="button" value="돌아가기" onclick="location.href='./StoreMain.st';"> <!-- main으로 연결해야함 -->

		</div>
	</article>
</body>
</html>