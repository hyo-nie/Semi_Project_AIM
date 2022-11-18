<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<article>
		<h1>${sessionScope.mb_id }님의 장바구니</h1>

		<div>
			<table>
					<tr>
						<td> 번호 </td>
						<td> 이미지 </td>
						<td> 상품명 </td>
						<td> 상품가격 </td>
						<td> 수량 </td>
						<td> 총 금액 </td>
						<td> 관리 </td>
					</tr>
					
				<c:forEach var="i" begin="0" end="${cartList.size()-1}" step="1">
					<c:set var="cart" value="${cartList[i]}" />
					<c:set var="prdt" value="${productList[i]}" />
					<tr>
						<td> ${cart.c_num } </td>
						<td>
							<img src="./upload/${prdt.st_img}" alt="${prdt.st_img}">
						</td>
						<td> ${prdt.st_name } </td>
						<td> ${prdt.st_price } </td>
						<td> ${cart.c_amount } </td>
						<td> ${prdt.st_price * cart.c_amount } </td>
						<td>
							<a href="./CartDeleteAction.ct?c_num=${cart.c_num }">삭제</a>
						</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		
		<div>
			<input type="button" value="구매하기" onclick="location.href='./OrderStart.or';"> 
			<input type="button" value="계속 쇼핑하기" onclick="location.href='./StoreMain.st';">

		</div>
		
	</article>

<c:set var="totalPrice" value="0" />
<c:foreach var="list" items="${productList }">
<c:set var="totalPrice" value=${totalPrice + list.st_price} />

화면출력

</c:foreach>

${totalPrice}

int totalPrice = 0;

for(int i = 0; i < list.length(); i++){
	totalPrice += list(i).price;
	
}


</body>
</html>