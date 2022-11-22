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

	<jsp:include page="../inc/include.jsp" />
	
	<jsp:include page="../inc/login_nav_bar.jsp"></jsp:include>

   <!-- 구매자 주문목록페이지  -->
<%-- ${orderList} --%>
   <article>
      <table>
      

      <div class="com_cart_list_wrap">
      <h1>주문목록</h1>
      <p class="cart_allchecker_wrap">
         <strong class="com_custom_checkbox_sel_price">주문번호</strong>
         <strong class="com_custom_checkbox_product_name" style= "width: 250px;">상품명</strong>
         <strong class="com_custom_checkbox_price" style= "width: 170px;">수량</strong>
<!--          <strong class="com_custom_checkbox_cnt">결제방법</strong> --> <!-- 이게 꼭 구매자의 buyList에 있어야 할 필요는 없을듯? -->
         <strong class="com_custom_checkbox_price">주문금액</strong>
         <strong class="com_custom_checkbox_product_sel">주문일시</strong>
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

<c:forEach var="i" begin="0" end="${orderList.size()-1 }" step="1">
	<c:set var="totalPrice"/>
	<c:set var="odt" value="${orderList[i] }" />
<li>
  <div class="product_info_wrap" style= "width: 180px;">
  <span class="product_info_one_origin">
  <strong class="product_info_product"> 
  <a href="./OrderDetail.or?o_cnum=${odt.o_cnum }" style= "width; 180pxl">${odt.o_cnum }</a> 
  </strong> 
  </span>
  </div>
  <div class="product_info_cnt_wrap" style= "margin-top: 0px; width: 248px;"> ${odt.o_name } 외 ${odt.o_amount -1}건 </div>
  <div class="product_info_cnt_wrap" style= "margin-top: 0px; padding-right: 100px;"> ${odt.o_amount } </div>
<%--   <div class="product_info_cnt_wrap"> ${odt.o_pay } </div> --%>
    <div class="product_info_cnt_wrap" style= "margin-top: 0px; padding-right: 70px;">
       <fmt:formatNumber value="${odt.o_sum}" />
    </div>
    <div class="product_info_cnt_wrap" style= "width: 268px; margin-bottom: 20px; margin-top: 0px;">${odt.o_pdate }</div>
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