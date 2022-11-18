<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - ALL IN MOVIE</title>
<link href="./assets/css/giftstore.css" rel="stylesheet" type="text/css">
<script src="jquery-3.6.1.js"></script>
</head>
<body>
	${productList }
	${cartList }	
	
	<div id="contents" class="gift_store">
	
	
	
	<div class="cart_step_wrap">
		<ul class="cart_step step_unit4">
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
	
	<div class="com_cart_list_wrap">
		<p class="cart_allchecker_wrap">
			<input type="checkbox" id="checkboxall" class="com_custom_all_checkbox com_custom_checkbox" checked="checked">
			<label for="checkboxall">전체선택</label>
			<strong class="com_custom_checkbox_product_name">상품명</strong>
			<strong class="com_custom_checkbox_sel_price">판매금액</strong>
			<strong class="com_custom_checkbox_cnt">수량</strong>
			<strong class="com_custom_checkbox_price">구매금액</strong>
			<strong class="com_custom_checkbox_product_sel">선택</strong>
		</p>
		
   	<c:forEach var="i" begin="0" end="${cartList.size()-1}" step="1">
		<c:set var="cart" value="${cartList[i]}" />
		<c:set var="prdt" value="${productList[i]}" />
        
        <ul class="com_list_style1">
        	<li class="" id="cart_item_idx_886182">    
        	<input type="checkbox" id="checkbox886182" name="checkbox" value="886182" class="com_custom_checkbox" checked="checked">
        		<label for="checkbox886182"></label> 
        		   
        		<a href="" class="product_info_img">        
        			<img src="./upload/${prdt.st_img }" alt="${prdt.st_name }">        
        			<strong class="product_info_name">${prdt.st_name }</strong>        
        			<span class="product_info_origin" id="spanOriginName886182">${prdt.st_text }    
        			</span>    
        		</a> 
        		   
        	<div class="product_info_wrap not_sale">        
        		<span class="product_info_one_price" id="product_info_one_price886182">${prdt.st_price }</span>    
        	</div>    
        	
<!--         	<input type="hidden" id="hid_PKAG_CNT" value="1">     -->
<!--         	<input type="hidden" id="hid_OrderCnt886182" class="goodscnt" value="1">   -->
        		  
        	<div class="product_info_cnt_wrap">        
        		<span class="com_form_count com_form_count886182" id="com_form_count886182">1</span>        
        		<a href="#none" onclick="javascript:" class="com_btn_plus">+</a>        
        		<a href="#none" onclick="javascript:" class="com_btn_minus">-</a>        
        		<a href="#none" onclick="javascript:fn_OrderAmountUpdate(886182);" class="btn_change">변경</a>    
        	</div>  
        	  
        		<span class="product_info_price" id="totalgoodsprice886182"> 
        			${prdt.st_price * cart.c_amount }
        		</span>  
        		  
        		<div class="product_info_btn_wrap">      
        			<a href="#none" onclick="javascript:fn_Buy();">바로구매</a>   
        			<a href="./CartDeleteAction.ct?c_num=${cart.c_num }">삭제</a>         
        			      
        		</div>    
        		</li>
        	</ul>
        	
        	</c:forEach>
        		
<!--         		<a href="#none" class="btn_del_selected" onclick="javascript:fn_SelProductDelete();"> -->
<!--         			선택상품 삭제 -->
<!--         			<span id="spanSelCnt" style="display: inline;">1</span> -->
<!--         		</a> -->


		
        
<!--         <table class="com_cart_total_price_wrap" summary="총 상품 금액, 할인금액을 합산한 총 결제예정 금액 표기"> -->
<%-- 		    <caption>총 결제 예정금액</caption> --%>
<%-- 		    <colgroup> --%>
<%-- 		        <col style="width:30%"> --%>
<%-- 		        <col style="width:36%"> --%>
<%-- 		        <col style="width:34%"> --%>
<%-- 		    </colgroup> --%>
<!-- 		    <thead> -->
<!-- 		        <tr> -->
<!-- 		            <th>총 결제 금액</th> -->
<!-- 		            반복문 돌려보기 -->
<!-- 		        </tr> -->
<!-- 		    </thead> -->
<!-- 		   <tbody> -->
<!-- 		        <tr> -->
<!-- 		            <td> -->
<!-- 		            	<strong> -->
<!-- 		            		<span id="sTot_Sales_Price"> -->
<%-- 		            		<c:set var="totalPrice" value="0" /> --%>
<%-- 							<c:forEach var="i" begin="0" end="${cartList.size()-1 }"> --%>
<%-- 							<c:set var="totalPrice" value="${totalPrice + cartList[i].st_price}" /> --%>
								
<%-- 							</c:forEach> --%>

<%-- 							${totalPrice} --%>
		            		
<!-- 		            		</span> -->
<!-- 		            	</strong> -->
<!-- 		            </td> -->
<!-- 		        </tr> -->
<!-- 		    </tbody> -->
<!-- 		</table> -->


		<div class="com_btn_wrap pT60">
           <a href="./OrderStart.or" class="btn_style0 ">구매하기</a>
           <a href="javascript:history.back();" class="btn_style0 ">돌아가기</a>
		</div>
		
	</div>
</div>
	
</body>
</html>