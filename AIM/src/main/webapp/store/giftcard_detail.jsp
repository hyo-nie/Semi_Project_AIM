<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		
		// 확인용!
		function buyNow2(){
			var queryString = $("form[name=fr]").serialize();
			var amount = document.getElementById("showCnt").innerHTML;
			
			 $.ajax({
				 	type : 'post',
				 	data : queryString,
		            url:"./CartAddAction.ct?c_amount="+amount+"&buyNow=Y",
		            success:function(data){
		               location.href="./OrderStart.or";
		            }
		        }) 
		}


		
</script>
</head>
<body>

${dto }

	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp"/>

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp"/>


	<form action ="" method="post" name="fr">
	<input type="hidden" name="st_num" value="${dto.st_num }">
	<input type="hidden" name="isMove" value="">
	<input type="hidden" name="st_name" value="${dto.st_name }">
	

	<div class="category_product_detail_wrap">   
		<strong class="category_product_detail_title">${dto.st_name }</strong> 
	
		<div class="category_product_detail_contents">        
	 	<div class="category_product_detail_contents_img_wrap">
	              <ul class="bxslider">
	              <li><img src="./assets/img/${dto.st_img }" alt="${dto.st_name }"></li> 	
	              <!-- src="${dto.st_name }" 로 바꿀 예정 -->               
	               </ul>
	           		</div>           
	           <div class="category_product_detail_contents_wrap">               
					<p class="category_product_detail_sale_price_wrap">    
		          	 	<span class="store_deatail_sale_price" id="spnSalePrice" style="visibility: hidden;">${dto.st_price }</span>
		          	 	<span class="store_deatail_sale_price"></span>
	          	 	</p>               
	          	 	
          	 	<dl class="category_product_detail_add_info">                  
            		<dt><b>상품구성</b></dt>                  
             			<dd>${dto.st_text }</dd>                 
               		<dt><b>유효기간</b></dt>               
               			<dd>구매일로부터 6개월 이내</dd>              
               		<dt><b>사용 극장</b></dt>                 
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
	              			 <p class="com_form_total_price">총 구매금액<span class="com_total_price0 com_product_total_price" id="total_payment"><fmt:formatNumber value="${dto.st_price}"/></span></p>               	
	               		</div>                
	               </div>               
	               
	               <div class="category_product_detail_btn_wrap"> 
						<a href="javascript:goCart();" class="btn_cart">장바구니</a>               
						<a href="javascript:buyNow2();">구매하기</a>               
	               </div> 
	                         
			</div>      
			</div>
		
		<dl class="category_product_detail_dlist">         	
			<dt><b>이용안내</b></dt> 	
			 <dd>
				• AIM 기프트카드는 일정 금액권을 구매 후 AIM 오프라인에서 사용 가능한 선불 카드입니다.<br>
				• 스토어를 통해 원하는 금액(최대 5만원)만큼 충전해서 선물하실 수 있습니다.<br> 
				• 구매한 기프트카드는, AIM극장의 매점,매표,키오스크에서 사용할 수 있으며, 최소 100원이상 사용 가능합니다.<br> 
				- AIM 홈페이지에서 결제수단으로 사용 가능합니다. <br>
				• 기프트카드의 유효기간은 구매일로부터 5년입니다<br>
				&nbsp;
			 </dd>
	
			<dt><b>취소/환불</b></dt> 
			<dd>
				• AIM 온라인 스토어에서 구매한 기프트카드는 구매 후 14일 내 전액 구매(결제) 취소 가능합니다.<br> •
				단, 구매 후 기프트카드를 사용한 이력이 있을 경우 구매 결제 취소가 불가합니다<br>
				• 결제취소/환불 방법<br> 
				- 결제취소는 고객센터로 연락바랍니다.<br>
				- 단, 충전 취소 요청 시 해당 기프트카드의 잔액이 충전한 금액보다 적을 경우 충전 결제 취소가 불가합니다.<br> 
				- 잔액 환불은 최종 구매 후 합계 잔액 기준 60% 이상 사용 시 신청 가능합니다.<br> 
				- 단, 환불 금액은 구매액을 기준으로 ‘구매한 금액’을 기준으로 사용한 비율에 따라 계산하여 남은 비율의 금액을 환불합니다.<br>
				• 이용/환불 문의 : AIM고객센터(1544-1122)<br> 
				• 상담 가능 시간 : 평일 09:00~18:00, 토/일/공휴일 휴무
			</dd>
	
		</dl>
		
		</div>	
	</form>
	
	
</body>
</html>