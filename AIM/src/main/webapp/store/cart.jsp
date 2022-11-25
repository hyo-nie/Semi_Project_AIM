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
<script src="jquery-3.6.1.min.js"></script>
</head>
<script>

	// 아이템 개수 변경
	function changeItemAmount(object, index, st_price, c_amount ,mode){
		var test = "${cartList}";
		
		var countTag = $(".com_form_count").eq(index)[0].innerHTML;
		var nowAmount = Number(countTag);
		
		// 개수 변경 
		if(mode == "plus"){
			$(".com_form_count").eq(index)[0].innerHTML = ++nowAmount;
		}
		else{
			$(".com_form_count").eq(index)[0].innerHTML = --nowAmount;
		}
		
		// 가격 변경
		$(".product_info_price").eq(index)[0].innerHTML = nowAmount * st_price;
		
	}
	
	function saveChangeInfo(c_num, index){
		// 상품 변경 개수
		var countTag = $(".com_form_count").eq(index)[0].innerHTML;
		
		$.ajax({
			  url: "./CartAmountChangeAction.ct?c_num="+c_num+"&change_amount="+countTag,
			}).done(function() {
			  console.log("수량 변경 완");
			});
	}

</script>
<style>
	#forBlank{
	    width: 43px;
	    height: 50px;
	    float: left;
	}
	
</style>
<body>
	<%-- ${productList }
	${cartList }	 --%>
	
	
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp"/>
	

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp"/>
	
	
	
	<div id="contents" class="gift_store">
	
	<div class="cart_step_wrap">
		<ul class="cart_step step_unit4" style="margin-left: -65px;">
			<li class="step0 active">
				<span>STEP 01</span>
				<strong>장바구니</strong>
			</li>
			<li class="step2 ">
				<span>STEP 02</span>
				<strong>결제하기</strong>
			</li>
			<li class="step3">
				<span>STEP 03</span>
				<strong>결제완료</strong>
			</li>
		</ul>
	</div>
	
	<%
		if(request.getAttribute("productList").toString().equals("[]") || request.getAttribute("cartList").toString().equals("[]")){
			System.out.println("장바구니에 정보 없음!");
	%>		
		<div class="com_cart_list_wrap">
				<p class="cart_allchecker_wrap">
<!-- 					<input type="checkbox" id="checkboxall" class="com_custom_all_checkbox com_custom_checkbox" checked="checked"> -->
<!-- 					<label for="checkboxall">전체선택</label> -->
					<strong class="com_custom_checkbox_product_name">상품명</strong>
					<strong class="com_custom_checkbox_sel_price" style="margin-left: 22px;">판매금액</strong>
					<strong class="com_custom_checkbox_cnt">수량</strong>
					<strong class="com_custom_checkbox_price">구매금액</strong>
					<strong class="com_custom_checkbox_product_sel">선택</strong>
				</p>			
			
			
			<div style="text-align: center; margin-top: 50px;">
				장바구니가 비어있습니다!
			</div>
			
			<div class="com_btn_wrap pT60">
				<a href="./StoreMain.st" class="btn_style0 " style="color: white;">스토어 메인</a>
			</div>
	<%	
		}
		else{
			System.out.println("장바구니에 상품이 있음!");
	%>		
	<div class="com_cart_list_wrap">
		<p class="cart_allchecker_wrap">
<!-- 			<input type="checkbox" id="checkboxall" class="com_custom_all_checkbox com_custom_checkbox" checked="checked"> -->
<!-- 			<label for="checkboxall">전체선택</label> -->
			<strong class="com_custom_checkbox_product_name">상품명</strong>
			<strong class="com_custom_checkbox_sel_price" style="margin-left: 22px;">판매금액</strong>
			<strong class="com_custom_checkbox_cnt">수량</strong>
			<strong class="com_custom_checkbox_price" style="margin-left: 16px;">구매금액</strong>
			<strong class="com_custom_checkbox_product_sel">선택</strong>
		</p>
		
   	<c:forEach var="i" begin="0" end="${cartList.size()-1}" step="1">
		<c:set var="cart" value="${cartList[i]}" />
		<c:set var="prdt" value="${productList[i]}" />
        
        <ul class="com_list_style1" style="border-width: 0px;">
        	<li class="" id="cart_item_idx_886182">    
<!--          	<input type="checkbox" id="checkbox886182" name="checkbox" value="886182" class="com_custom_checkbox" checked="checked">
 -->        		
 				<span id="forBlank"></span>
 				<label for="checkbox886182"></label> 
        		   
        		<a class="product_info_img">        
        			<img src="./assets/img/${prdt.st_img }" alt="${prdt.st_name }">        
        			<strong class="product_info_name">${prdt.st_name }</strong>        
        			<span class="product_info_origin" id="spanOriginName886182" >${prdt.st_text }    
        			</span>    
        		</a> 
        		   
        	<div class="product_info_wrap not_sale">        
        		<span class="product_info_one_price" id="product_info_one_price886182" style="margin-top: -15px;">
        		<fmt:formatNumber value="${prdt.st_price}"/>
        		</span>    
        	</div>    
        		  
        	<div class="product_info_cnt_wrap" style="margin-top: 15px; margin-left: 15px; width: 165px;">      
        		<span class="com_form_count com_form_count886182" id="com_form_count886182">${cart.c_amount}</span>  
        		<!-- changeItemAmount(object, index, st_price, c_amount ,mode) -->  
        		<a href="#none" onclick='javascript:changeItemAmount(this, ${i}, ${prdt.st_price }, ${cart.c_amount},  "plus")' class="com_btn_plus">+</a>        
        		<a href="#none" onclick='javascript:changeItemAmount(this, ${i}, ${prdt.st_price }, ${cart.c_amount}, "minus")' class="com_btn_minus">-</a>        
        		<a href="#none" onclick="javascript:saveChangeInfo(${cart.c_num}, ${i})" class="btn_change" style="text-decoration-line: none;">변경</a>    
        	</div>  
        	  
        		<span class="product_info_price" id="totalgoodsprice886182" style="margin-top: 17px;"> 
        			<fmt:formatNumber value="${prdt.st_price * cart.c_amount }"/>
        		</span>  
        		  
        		<div class="product_info_btn_wrap">      
<!--         			<a href="#none" onclick="javascript:fn_Buy();">바로구매</a>    -->
        			<a href="./CartDeleteAction.ct?c_num=${cart.c_num }" style="text-decoration-line: none;">삭제</a>         
        			      
        		</div>    
        		</li>
        	</ul>
        	
        	</c:forEach>


		<div class="com_btn_wrap pT60">
           <a href="./OrderStart.or" class="btn_style0 " style="color:#FFF; text-decoration-line: none;">구매하기</a>
           <a href="javascript:history.back();" class="btn_style0 " style="color:#FFF; text-decoration-line: none;">돌아가기</a>
		</div>
		
			<% 	
		}
	%>
		
		
		
	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />	
		
		
		
	</div>
</div>
	
</body>
</html>