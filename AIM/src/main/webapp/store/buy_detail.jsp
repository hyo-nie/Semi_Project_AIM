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

<article>
<%-- 	${detailInfo } --%>
	<table>
      <div class="com_cart_list_wrap">
      <h1>주문 상세 내역</h1>
      <p class="cart_allchecker_wrap">
         <input type="checkbox" id="checkboxall" class="com_custom_all_checkbox com_custom_checkbox" checked="checked">
         <label for="checkboxall"></label>
         <strong class="com_custom_checkbox_product_name">상품명</strong>
         <strong class="com_custom_checkbox_price">수량</strong>
         <strong class="com_custom_checkbox_price">주문금액</strong>
<!--          <strong class="com_custom_checkbox_product_sel">환불여부</strong> -->
      </p>
               
<%--                <c:set var="refund" value="환불가능"/>                --%>
<%--                <c:choose> --%>
<%--                   <c:when test="${dto.o_refund == 0 }"> --%>
<%--                      <c:set var="refund" value="환불불가"/>    --%>
<%--                   </c:when> --%>
<%--                   <c:when test="${dto.o_refund == 1 }"> --%>
<%--                      <c:set var="refund" value="환불가능"/>    --%>
<%--                   </c:when>                                                 --%>
<%--                </c:choose> --%>
               
<ul class="com_list_style1">

<c:forEach var="i" begin="0" end="${detailInfo.size()-1 }" step="1">
	<c:set var="totalPrice"/>
	<c:set var="dti" value="${detailInfo[i] }" />
<li>
  <div class="product_info_wrap" >
  <span class="product_info_one_origin">
  </span>
  </div>
  <div class="product_info_cnt_wrap" style= "margin-top: 0px; margin-bottom: 20px; padding-left: 90px; padding-right: 180px;"> ${dti.o_name } 
          <img src="./assets/img/바코드.png" width="400" height="150" alt="${dti.o_name }">
  </div>
  <div class="product_info_cnt_wrap" style= "margin-top: 0px; width: auto; padding-left: 60px;"> ${dti.o_amount } </div>
    <div class="product_info_cnt_wrap" style= "margin-top: 0px;">
	 <span>
       <fmt:formatNumber value="${dti.o_sum}" />
     </span>
    </div>
</li>
</c:forEach>
</ul>
            </div>
	</table>
	  <div class="com_btn_wrap pT60">
         <a href="#none" class="btn_style0 " onclick="location.href='./Main.aim';">돌아가기</a> 
      </div>
</article>

	
</body>
</html>