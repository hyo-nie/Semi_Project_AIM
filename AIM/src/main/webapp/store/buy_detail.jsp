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
<%-- 	${detailInfo } --%>
	<table>
      <div class="com_cart_list_wrap">
      <h2 style="margin-bottom: 10px;">주문 상세 내역</h2>
      <p class="cart_allchecker_wrap">
<!--          <input type="checkbox" id="checkboxall" class="com_custom_all_checkbox com_custom_checkbox" checked="checked"> -->
<!--          <label for="checkboxall"></label> -->
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
	
	
	<!-- 바코드가 있으니까 여기에 유의사항 같은 거 추가하면 좋을 거 같아..... -->
	<!-- 바코드가 있으니까 여기에 유의사항 같은 거 추가하면 좋을 거 같아..... -->
	<!-- 바코드가 있으니까 여기에 유의사항 같은 거 추가하면 좋을 거 같아..... -->
	<!-- 바코드가 있으니까 여기에 유의사항 같은 거 추가하면 좋을 거 같아..... -->
	
	
	  <div class="com_btn_wrap pT60">
         <a href="#none" class="btn_style0 " onclick="location.href='./StoreMain.st';" style="color:white">스토어 메인</a> 
      </div>
      
      
</article>


	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />


	
</body>
</html>