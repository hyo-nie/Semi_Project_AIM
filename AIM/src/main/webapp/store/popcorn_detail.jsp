<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - ALL IN MOVIE</title>
<link href="./assets/css/giftstore.css" rel="stylesheet" type="text/css">
<script src="jquery-3.6.1.min.js"></script>
<!-- 제이쿼리 버전 바꾸기! -->
<script type="text/javascript">
		
		var defaultCnt = 1;
		
		function downCnt(){		
			if(defaultCnt>1){	// defaultCnt가 0보다 큰 1이면 --; -> 0으로 값이 변하므로 X
				defaultCnt--;
				document.getElementById("showCnt").innerHTML = defaultCnt;
				
				var Totalprice = document.getElementById("spnSalePrice").innerHTML * defaultCnt;				
				document.getElementById("spantotalprice").innerHTML = Totalprice.toLocaleString('ko-KR');
				document.getElementById("total_payment").innerHTML = Totalprice.toLocaleString('ko-KR');
				
			} else{
				alert('1개 이상 구매 가능합니다!');
			}
			
		}
		
		function upCnt(){
			if(defaultCnt<10){
				defaultCnt++;
				document.getElementById("showCnt").innerHTML = defaultCnt;
				
				var Totalprice = Number(document.getElementById("spnSalePrice").innerHTML) * defaultCnt;
					
				document.getElementById("spantotalprice").innerHTML = Totalprice.toLocaleString('ko-KR');
				document.getElementById("total_payment").innerHTML = Totalprice.toLocaleString('ko-KR');
				
			} else{
				alert('장바구니에는 최대 10개까지 담을 수 있습니다!');
			}

		}

		function goCart(){
			var isMove = confirm("장바구니에 등록되었습니다! 확인 하시겠습니까?");
			var amount = document.getElementById("showCnt").innerHTML;
			
			if(isMove){
			
				document.fr.action="./CartAddAction.ct?c_amount="+amount;
				document.fr.isMove.value = isMove; // true
				document.fr.submit();
				
			}  
			else{
				
				 var queryString = $("form[name=fr]").serialize() ;
				
				 $.ajax({
					 	type : 'post',
					 	data : queryString,
			            url:"./CartAddAction.ct?c_amount="+amount,
			            success:function(data){
			                console.log("카트 들어갔다 나옴");
			            }
			        }) 
			}
		}
		
		function buyNow(){
			// ./OrderStart.or
			
			alert('확인');
			
// 			var queryString = $("form[name=fr]").serialize() ;
			
// 			 $.ajax({
// 				 	type : 'post',
// 				 	data : queryString,
// 		            url:"./OrderStart.or",
// 		            success:function(data){
// 		                console.log("orderStartAction 페이지로 이동");
// 		                window.location.href = "./store/buy.jsp";
// 		            }
// 		        }) 
			// var isMove = confirm("장바구니에 등록되었습니다! 확인 하시겠습니까?");
			var amount = document.getElementById("showCnt").innerHTML;
			var isMove = confirm("더이상 쇼핑하지 않고 바로 결제하시겠습니까?");
			
			if(isMove){
				document.fr.action="./OrderNowAction.or?c_amount="+amount;
				document.fr.isMove.value = isMove; // true
				document.fr.submit();
				
			}  
			
			
		}

		
		
</script>

</head>
<body>

${dto }

	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp"/>


	<form action="" method="post" name="fr">
	<input type="hidden" name="st_num" value="${dto.st_num }">
	<input type="hidden" name="isMove" value="">
	<input type="hidden" name="st_name" value="${dto.st_name }">
<%-- 	<input type="hidden" name="price" value="${dto.st_price }"}> --%>
<%-- 	<input type="hidden" name="text" value="${dto.st_text }"> --%>
	
	<div class="category_product_detail_wrap">   
	<strong class="category_product_detail_title">${dto.st_name }</strong> 

	<div class="category_product_detail_contents">        
 	<div class="category_product_detail_contents_img_wrap">
              <ul class="bxslider">
              <li>
              	<img src="./assets/img/${dto.st_img }" alt="${dto.st_name }" name="img">
              </li> 	               
               </ul>
           		</div>           
           <div class="category_product_detail_contents_wrap">               
				<p class="category_product_detail_sale_price_wrap">    
	          	 	<span class="store_deatail_sale_price" id="spnSalePrice">${dto.st_price }</span>
	          	 	<span class="store_deatail_sale_price">원</span>
          	 	</p>               
          	 	
          	 	<dl class="category_product_detail_add_info">                  
            		<dt>상품구성</dt>                  
             			<dd>${dto.st_text }</dd>                 
               		<dt>유효기간</dt>               
               			<dd>구매일로부터 6개월 이내</dd>              
               		<dt>사용 극장</dt>                 
                		<dd>전 극장 사용 가능</dd>              
               </dl>    
                          
               <div class="category_product_detail_price_wrap">                   
					<div class="com_form_number">                      
	               		<a href="#none" onclick="javascript:downCnt()" class="com_btn_minus">-</a>    
	               		<span class="com_form_count com_form_count0" id="showCnt">1</span>                      
	              		<a href="#none" onclick="javascript:upCnt()" class="com_btn_plus">+</a>   
	               		<span class="com_total_price" id="spantotalprice"><fmt:formatNumber value="${dto.st_price }"/></span>               	
					</div>               	
					<div class="category_product_detail_total_price">               		
              			 <p class="com_form_total_price">
              			 	총 구매금액
              			 	<span class="com_total_price0 com_product_total_price" id="total_payment">
              			 		<fmt:formatNumber value="${dto.st_price}"/>
              			 	</span>
              			 </p>               	
               		</div>                
               </div>               
               
               <div class="category_product_detail_btn_wrap"> 
					<a href="javascript:goCart();" class="btn_cart">장바구니</a>               
					<a href="javascript:buyNow();">구매하기</a>               
               </div> 
                         
		</div>      
		</div>
		
		<dl class="category_product_detail_dlist">         	
			<dt><b>이용안내</b></dt>         	
			<dd>
			<p>
			• 극장 사정에 따라 일부 메뉴 제공이 어려울 수 있습니다.<br>
			• 해당 기프트콘은 오프라인 매점에서 실제 상품으로 교환할 수 있는 온라인 상품권입니다.<br>
			• 구매 후 전송받으신 기프트콘은,<br>
			사용가능한 AIM의 매점에서 지정된 해당 상품으로만 교환이 가능합니다.<br>
			(사용가능 AIM는 '상품교환'에서 확인 가능하며, 추가 상품을 포함하여 구매 시 지점에 따라 사용이 불가 할 수 있으니 발송되는 기프트콘의 정보를 확인해주시기 바랍니다.)<br>
			해당 상품 내에서 팝콘 맛 혹은 사이즈 변경 시 추가 비용 발생합니다.<br>
			교환 완료한 상품의 환불 및 반품은 불가합니다.<br>
			• 유효기간 연장을 신청하는 경우,<br>
			유효기간은 발급일로부터 5년 이내 횟수 제한 없이 기간 연장 가능하며, 1회 연장 시 3개월(92일) 단위로 유효기간이 연장됩니다.&nbsp;&nbsp;<br>
			단, 이벤트 경품 및 프로모션 상품의 경우 유효기간 연장이 불가할 수 있습니다.<br>
			유효기간 만료 이후에는 결제금액의 90% 환불이 가능합니다.&nbsp;&nbsp;<br>
			• 상기 이미지는 실제와 다를 수 있습니다.</p></dd>         	
			
			<dt><b>취소/환불</b></dt>         	
			<dd>
			<p>• 구매자는 최초 유효기간 이내에 결제금액의 100%에 대해 결제취소/환불이 가능하며, 최초 유효기간 만료 후에는 수신자가 결제금액의 90%에 대해 환불 요청 가능합니다.<br>
			• 단, 이미 사용된 기프트콘에 대해서는 결제취소/환불 신청이 불가합니다.&nbsp;<br>
			• 결제취소/환불 방법<br>
			결제취소는 &gt; 마이페이지 &gt; 결제내역조회 &gt; 스토어 or 홈페이지 &gt; My AIM &gt; 스토어 &gt; 결제내역의 해당 주문 상세내역에서 가능합니다.<br>
			<!-- 경로 바꿀 예정 -->
			(기프트콘은 구매일로부터 60일 이내 결제취소 가능하며, 카드 결제취소 가능 기간이 경과하였을 경우, 고객센터로 연락주시면 됩니다)<br>
			환불은 웹 &gt; MY &gt; 기프트콘 or 홈페이지 &gt; My AIM &gt; 스토어 &gt; 내 기프트콘에서 환불을 원하는 기프트콘 등록 후 진행 가능합니다.<br>
			• AIM고객센터 1544-1122</p></dd>        
		
		</dl>	
		
		
		
		</div>
		</form>
		
</body>
</html>