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


	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp"/>
	

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp"/>


<article>

	<table>
      <div class="com_cart_list_wrap" style="margin-top: 45px;">
      <h3 style="margin-bottom: 10px;">주문 상세 내역</h3>
      <p class="cart_allchecker_wrap">
         <strong class="com_custom_checkbox_product_name" style="width: 250px;">상품명</strong>
         <strong class="com_custom_checkbox_price" style="width: 100px;">수량</strong>
         <strong class="com_custom_checkbox_price" style="width: 220px;">주문금액</strong>
		 <strong class="com_custom_checkbox_price" style="width: 220px; margin-left:45px;">바코드</strong>
      </p>
               
               
		<ul class="com_list_style1">

		<c:forEach var="i" begin="0" end="${detailInfo.size()-1 }" step="1">
			<c:set var="totalPrice"/>
			<c:set var="dti" value="${detailInfo[i] }" />
			<li>
				 <div class="product_info_wrap" >
				  	<span class="product_info_one_origin"></span>
				 </div>
	 			
	 			 <div class="product_info_cnt_wrap" style= "margin-top: 30px; padding-left: 100px; width: 200px;"> 
	 			 	${dti.o_name } 
				 </div>
				 
	  			<div class="product_info_cnt_wrap" style="width: 100px; margin-top: 30px; padding-left: 116px;"> 
	  				${dti.o_amount } 
	  			</div>
	 			<img src="./assets/img/바코드.png" width="350" height="100" alt="${dti.o_name }" style="margin-left: 125px; margin-top:-15px">
	    
	   			<div class="product_info_cnt_wrap" style= "margin-top: 30px;">
		 			<span style="margin-left: 82px;">
	       				<fmt:formatNumber value="${dti.o_sum}" />
	     			</span>
	   			</div>
			</li>
		</c:forEach>
		</ul>
    </div>
	</table>
	
		<div class="category_product_detail_wrap">  
		<dl class="category_product_detail_dlist" style="margin-top: -5px;">         	
			<dt><b>이용안내</b></dt> 	
			 <dd>
				• AIM 상품바코드는 AIM 오프라인에서 사용 가능한 기프티콘입니다.<br>
				• 구매한 상품에 해당하는 바코드를 AIM극장의 매점,매표,키오스크에 제시해주시면 사용할 수 있으며, 최소 100원이상 사용 가능합니다.<br> 
				• 기프티콘의 유효기간은 구매일로부터 5년입니다<br>
				&nbsp;
			 </dd>
	
			<dt><b>취소/환불</b></dt> 
			<dd>
				• AIM 온라인 스토어에서 구매한 상품은 구매 후 14일 내 전액 구매(결제) 취소 가능합니다.<br> •
				단, 구매 후 기프티콘을 사용한 이력이 있을 경우 구매 결제 취소가 불가합니다<br>
				• 결제취소/환불 방법<br> 
				- 결제취소는 고객센터로 연락바랍니다.<br>
				- 단, 환불 금액은 구매액을 기준으로 ‘구매한 금액’을 기준으로 사용한 비율에 따라 계산하여 남은 비율의 금액을 환불합니다.<br>
				• 이용/환불 문의 : AIM고객센터(1544-1122)<br> 
				• 상담 가능 시간 : 평일 09:00~18:00, 토/일/공휴일 휴무
			</dd>
	
		</dl>
	</div>
	
	  <div class="com_btn_wrap pT60">
         <a href="#none" class="btn_style0 " onclick="location.href='./StoreMain.st';" style="color:white">스토어 메인</a> 
      </div>
      
      
</article>


	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />


	
</body>
</html>