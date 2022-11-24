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
<!--  부트스트랩 관련 소스 - 3줄  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">
// JavaScript 내에서 EL 표현식을 쓸 땐 꼭 양쪽에 따옴표를 붙여주세요!


var IMP = window.IMP;
IMP.init("imp30860234"); 

function requestPay(user_tel) {
      
		var user = "<%=session.getAttribute("mb_id") %>";
		var payAmount = Number(document.getElementById("totalAmountMoney").innerHTML);
		alert(payAmount);
		alert(user);
		
		var itemObj = $(".product_info_name");	
		var itemName = "";
		
// 		if(itemObj.length == 1){
// 			// 한 개인 경우
// 			itemName = $(".product_info_name").eq(0)[0].outerText
// 		}
// 		else{
// 			// 여러 개인 경우
// 			itemName = $(".product_info_name").eq(0)[0].outerText + " 외 " + (itemObj.length-1) + "건"
// 		}
		alert('결제가 되는지......... 왜 안 되는지,,,,,,,,,,,,,,');

      IMP.request_pay({ 
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "${order.o_cnum}",
          name: itemName,
          amount: payAmount,
          // buyer_email: "gildong@gmail.com", 주문자 이메일
          buyer_name: user,
          buyer_tel: user_tel,
      }, function (rsp) {
          if (rsp.success) {
             console.log("결제 성공!");
              // 결제 성공 시 이동하는 페이지(./OrderList.or)
              location.href="./OrderAddAction.or?mb_tel="+user_tel;
              
          } else {
        	  console.log(rsp)
              console.log("결제 실패!");
        	  alert('결제 실패!');
        	  // 결제 실패 시 이동하는 페이지
        	  location.href="./OrderFail.or";
        	  
          }
      });
    }
    
	function requestPay2(user_tel){
// 		alert('requestPay2 호출 완');
		var payAmount = Number(document.getElementById("totalAmountMoney").innerHTML);
		
		var check = $('#check00').prop('checked');
		
		if(check){
			console.log("체크 완료");
 			requestPay(user_tel);
//			location.href="./OrderAddAction.or?mb_tel="+user_tel+"&totalAmountMoney="+payAmount;
			
		} else{
			alert('약관에 모두 동의하셔야 결제가 가능합니다.');
		}
		
		
	}    

</script>

<style>
	#forBlank{
	    width: 38px;
	    height: 50px;
	    float: left;
	}
	
</style>

</head>
<body>

<%-- ${cartList } --%>
<br>
<%-- ${productList } --%>
<br>
<%-- ${member } --%>


<form method="post" name="fr">

	<div id="contents" class="gift_store">
		
		<div class="cart_step_wrap">
			<ul class="cart_step step_unit3">
				<li class="step0"><span>STEP 01</span><strong>장바구니</strong></li>
				<li class="step2 active"><span>STEP 02</span><strong>결제하기</strong></li>
				<li class="step3"><span>STEP 03</span><strong>결제완료</strong></li>
			</ul>
		</div>



		<!-- 장바구니 리스트 구매상품 정보 -->
		<div class="com_cart_list_wrap com_cart_list_wrap1">
			<strong class="com_box_design_title">구매상품 정보</strong>
			<p class="cart_allchecker_wrap " style="width: 1000px;">
				<strong class="com_custom_checkbox_price">상품명</strong> 
				<strong class="com_custom_checkbox_sel_price"> 판매금액</strong> 
				<strong class="com_custom_checkbox_cnt">수량</strong> 
				<strong class="com_custom_checkbox_price"> 구매금액 </strong>
			</p>
			
			
			<ul class="com_list_style1">
            
	            <c:forEach var="i" begin="0" end="${cartList.size() -1}" step="1">
	            <c:set var="totalPrice"/>
				<c:set var="cart" value="${cartList[i]}" />
				<c:set var="prdt" value="${productList[i]}" />
	            <li style="padding-left: 5px;">
	                <div class="product_info_img" style= "width: 280px;">
	                    <img src="./assets/img/${prdt.st_img }" alt="${prdt.st_name}" style= "margin-right: 0px;">
	                    <strong class="product_info_origin">
	                        ${prdt.st_name }
	                     </strong> 
	                     <span class="product_info_origin">
	                        ${prdt.st_text} </span>
	                </div>
	                <div class="product_info_wrap" style= "width: 130px;">
	                    <span class="product_info_one_price" style= "width: 120px;">
	                        <fmt:formatNumber value="${prdt.st_price}"/></span>
	                </div>
	                
	                <div class="product_info_cnt_wrap" style= "width: 200px;">
	                    ${cart.c_amount}
	                </div>
	                
	                <div class="product_info_cnt_wrap">
	                    <fmt:formatNumber value="${prdt.st_price * cart.c_amount}" />원
	                </div>
	                
	                <input type="hidden" name="totalAmount" value="${totalPrice += prdt.st_price * cart.c_amount}"/>
	                
	            </li>
	            </c:forEach>         
            
       		</ul>
        
			<table class="com_cart_total_price_wrap" style="width: 33%;">
<%-- 				<colgroup> --%>
<%-- 					<col style="width: 400px"> --%>
<%-- 					<col style="width: 0%"> --%>
<%-- 					<col style="width: 0%"> --%>
<%-- 				</colgroup> --%>
				<thead>
					<tr>
						<th>총 결제 예정금액</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td style="height: 60px; line-height: 60px;">
							<strong class="cart_total_price" id="totalAmountMoney" name="o_sum"> </strong>
						</td>
					</tr>
				</tbody>
			</table>
		

			<script>
				var amountObj = document.getElementsByName("totalAmount");
	        	var totalAmount = 0;
	        	
	        	for(var i=0; i<amountObj.length; i++){
	        		totalAmount += Number(amountObj[i].value);
	        	}
        	
				document.getElementById("totalAmountMoney").innerHTML = totalAmount;
			</script>
			
		</div>
		<!-- 장바구니 리스트 구매상품 정보 -->
		
		
		
		<!-- 주문자 정보 확인 -->
		<div class="com_box_design_wrap">
			<strong class="com_box_design_title">주문자 정보 확인</strong>
			<ul class="com_box_design" style="list-style: none; padding: 20px 0 20px;">
				<li><label for="user_info_name"  style="margin-top: 25px;"> 아이디</label> 
				<input type="text" id="user_info_name" placeholder="이름" style="width: 128px" value="<%=session.getAttribute("mb_id") %>" readonly> 
				<label for="user_info_phonenum" style="margin-top: 25px; margin-left: 50px;">휴대전화 번호</label>
					<input type="tel" id="user_info_phonenum" name="o_tel" placeholder="휴대전화 번호" style="width: 228px" value="${member.mb_tel }"></li>
			</ul>
<!-- 			<p class="com_box_design_olist"> -->
				
<!-- 			</p> -->
		</div>
		<!-- 주문자 정보 확인 -->
		
		
		
		
			<!-- 결제 수단 -->
			<div class="com_box_design_wrap">
				<strong class="com_box_design_title">결제 수단</strong>
					<ul class="com_box_design radioCheck" style="list-style: none;">
	            		<li>
	            		<label for="payment_card">
	                		<input type="radio" name="o_pay" id="payment_card">
<!-- 	                		class="com_custom_radio" id="payment_card" value="credit_card" -->
	                		신용카드</label>
	               		</li>
	               		<li>
	               		<label for="payment_kakaopay">
	                		<input type="radio" name="o_pay">
<!-- 	                		 class="com_custom_radio kakaopay" id="payment_kakaopay" value="kakaopay" -->
	                    	<img src="./assets/img/btn_kakaopay.png" alt="kakaopay">
	               			</label>
	           			 </li>
					</ul>
				
				
			<!-- 약관 -->		
			<div class="com_agree_wrap">
				<p class="com_list_style1_title">
					<input type="checkbox" id="check00" class="com_all_checker">
					<label for="check00" style="width:350px">주문정보/결제 대행 서비스 약관 모두 동의</label>
				</p>
			
				<div class="accordion-flush" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        기프티콘 구매 동의
				      </button>
				    </h2>
				    
				    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        상품 결제, CS처리 등을 이해 수신자로부터 AIM에 수신자의 휴대전화번호를 제공하는 것에 대한 적합한 동의를 받습니다.
				      </div>
				    </div>
				 </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        개인정보 제공 및 위탁안내
				      </button>
				    </h2>
				    
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        <strong>[개인정보의 제3자 제공 동의]</strong><br>
						1. AIM은 이용자의 개인정보를 본 개인정보처리방침에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이 동 범위를 초과하여 이용하거나 이용자의 개인 정보를 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
						<br>
						· 이용자가 사전에 동의한 경우<br>
						· 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
						<br>
						2. 회사의 서비스 이행을 위하여 개인정보를 제3자에게 제공하고 있는 경우는 다음과 같습니다.
						<br>
						   제공 목적 : 신용카드 결제
						<br>
						- 제공 받는 자
						<br>
						· 카드사: 국민, 비씨, 롯데, 삼성, NH농협, 현대, KEB하나, 신한<br>
						· 은행: 신한, SC제일, 씨티, KEB하나, 농협, 기업, 국민, 대구, 부산, 경남, 우리<br>
						· 부가통신사업자(VAN사): 한국정보통신(KICC), KIS정보통신, NICE정보통신, (주)스마트로, 한국신용카드결제(주), VP(주)<br>
						· 전자지급결제대행업자: KG이니시스<br>
						-제공 정보<br>
						· 결제정보 (카드번호,고객명, 생년월일,전화번호 등) (비씨카드: IP포함)
						<br>
						-보유 및 이용기간
						<br>
						· 개인정보는 원칙적으로 개인 정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다
						<br>
						(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관)
						<br>
						
<!-- 						8) 제공 목적 : 포인트 결제 -->
<!-- 						<br> -->
<!-- 						-제공받는 자 -->
<!-- 						<br> -->
<!-- 						· OK캐쉬백: SK마케팅앤컴퍼니㈜ -->
<!-- 						· 에코마일리지: BC카드, 서울시<br> -->
<!-- 						-제공 정보㈜<br> -->
						
<!-- 						· 결제정보(포인트 카드번호, 카드비밀번호, 고객명 등) -->
<!-- 						<br> -->
<!-- 						-보유 및 이용기간 -->
<!-- 						<br> -->
<!-- 						· 개인정보는 원칙적으로 개인 정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다 -->
<!-- 						<br> -->
<!-- 						(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관) -->
<!-- 						<br> -->
						
<!-- 						9) 제공 목적 : 상품권 결제 -->
<!-- 						<br> -->
<!-- 						-제공받는 자 -->
<!-- 						<br> -->
<!-- 						· 해피머니상품권: 해피머니아이엔씨<br> -->
<!-- 						· 도서문화상품권: 북앤라이프<br> -->
<!-- 						· 문화상품권: 컬쳐랜드<br> -->
<!-- 						-제공 정보<br> -->
						
<!-- 						· 결제정보(구매자 ID, 비밀번호, 상품권번호 등) (컬쳐랜드, 해피머니아이엔씨 : IP포함) -->
<!-- 						<br> -->
<!-- 						-보유 및 이용기간 -->
<!-- 						<br> -->
<!-- 						· 개인정보는 원칙적으로 개인 정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다 -->
<!-- 						<br> -->
<!-- 						(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관) -->
<!-- 						<br> -->
						
<!-- 						10) 제공 목적 : 현금영수증 발행<br> -->
						
<!-- 						-제공받는 자 -->
<!-- 						<br> -->
<!-- 						· 국세청<br> -->
						
<!-- 						-제공 정보<br> -->
						
<!-- 						· 고유식별정보, 휴대폰번호, 카드번호, 고객명 등<br> -->
						
<!-- 						-보유 및 이용기간<br> -->
						
<!-- 						· 개인정보는 원칙적으로 개인 정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다 -->
<!-- 						<br> -->
<!-- 						(단, 다른 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관) -->
<!-- 				     	 <br> -->
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				        전자금융거래 이용약관
				      </button>
				    </h2>
				    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        <strong>[전자금융거래 기본약관]</strong> <br>
							제1조 (목적) <br> 
							이 약관은 AIM(이하 '회사'라 합니다)이 제공하는 전자지급결제대행서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.
							<br><br> 
							제2조 (용어의 정의)
							<br>
							이 약관에서 정하는 용어의 정의는 다음과 같습니다.
							<br>
							1.'전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
							<br>
							2.'전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
							<br>
							3.'이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
							<br>
							4.'접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
							<br>
							5.'거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
							<br>
							6.'오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
							<br>
							<br>
							제3조 (약관의 명시 및 변경)
							<br>
							1. 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
							<br>
							2. 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
							<br>
							3. 회사가 약관을 변경하는 때에는 그 시행일 1개월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.
							<br>
							<br>
							제4조 (전자지급결제대행서비스의 종류)
							<br>
							회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
							<br>
							1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
							<br>
<!-- 							2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다. -->
<!-- 							<br> -->
<!-- 							3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 하는 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다. -->
<!-- 							<br> -->
<!-- 							4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스'등이 있습니다. -->
<!-- 							<br> -->
<!-- 							<br> -->
							제5조 (이용시간)
							<br>
							1. 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 및 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
							<br>
							2. 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시 없이 서비스를 중단할 수 있습니다.
							<br>
							<br>
							제6조 (선불전자지급수단의 환급)
							<br>
							1. 이용자는 보유 중인 선불전자지급수단에 대해 회사에 요구할 경우 구매 선불 전액을 환급 받을 수 있습니다.
							<br>
							2. 회원은 회사에서 정한 기한 및 이용방법에 따라 선불전자지급수단을 이용할 수 있으며, 회사는 환급 등 구체적인 사항을 개별 선불전자지급수단의 고객센터 페이지를 통해 안내합니다.
							<br>
							<br>
							제7조 (이용시간)
							<br>
							1. 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 및 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
							<br>
							2. 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다.
							<br>
							다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시 없이 서비스를 중단할 수 있습니다.
							<br>
							<br>
							제8조 (접근매체의 선정과 사용 및 관리)
							<br>
							1. 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
							<br>
							2. 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
							<br>
							3. 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
							<br>
							4. 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
							<br>
							<br>
							제9조 (거래내용의 확인)
							<br>
							1. 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다.
							<br>
							2. 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보, 회사가 전자금융거래의 대가로 받은 수수료, 이용자의 출금 동의에 관한 사항, 전자금융거래의 신청 및 조건의 변경에 관한 사항과 해당 전자금융 거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용 시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 합니다.
							<br>
							3. 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
							<br>
							주소 : 부산광역시 부산진구
							<br>
							전화 : 051-000-0000
							<br>
							이메일 : itwill@aim.com
							<br>
							<br>
							제10조 (오류의 정정 등)
							<br>
							1. 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
							<br>
							2. 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려드립니다.
							<br>
							<br>
							제11조 (회사의 책임)
							<br>
							1. 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다.
							<br>
							다만 이용자가 제6조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
							<br>
							2. 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.
							<br>
							다만 본 조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
							<br>
							3. 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제2조제1항제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.
							<br>
							<br>
							제12조 (전자지급거래계약의 효력)
							<br>
							1. 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.
							<br>
							2. 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.
							<br>
							<br>
							제13조 (거래지시의 철회)
							<br>
							1. 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 거래지시를 철회할 수 있습니다.
							<br>
							2. 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.
							<br>
							3. 이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법에 따라 결제대금을 반환 받을 수 있습니다.
							<br><br>
							
							제14조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
							<br>
							1. 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
							<br>
							2. 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제7조 제2항에서 정한 바에 따릅니다.
							<br><br>
							
							제15조 (전자금융거래정보의 제공금지)
							<br>
							1. 회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다.
							<br>
							<br>
							제16조 (분쟁처리 및 분쟁조정)
							<br>
							1. 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
							<br>
							담당자 : 통신과금서비스 담당부서장
							<br>
							전화 : 051-3333-3333
							<br>
							이메일 : aim@aim.com
							<br>
							2. 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
							<br>
							3. 이용자는 제2항에 따른 회사의 분쟁처리결과에 대하여 이의가 있을 경우에는 금융감독원 금융분쟁조정위원회, 한국소비자원 소비자분쟁조정위원회 등을 통하여 회사의 전자금융거래서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
							<br><br>
							
							제17조 (회사의 안정성 확보 의무)
							<br>
							1. 회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
							<br><br>
							
							제18조 (약관 외 준칙 및 관할)
							<br>
							1. 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
							<br>
							2. 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
							<br><br>
							
							부칙<제 1호, 2006.12.26>
							<br>
							본 약관은 2007년 1월 1일부터 시행한다.
							<br>
							부칙<제 2호, 2011.05.02>
							<br>
							본 약관은 2011년 06월 20일부터 시행한다. (제 8조 2항 일부 개정)
							<br>
							부칙<제 3호, 2014.11.26>
							<br>
							본 약관은 2014년 12월 9일부터 시행한다.
							<br>
							부칙<제 4호, 2017.9.21>
							<br>
							본 약관은 2017년 10월 12일부터 시행한다.
							<br>
							부칙<제 5호, 2022.9.19>
							<br>
							본 약관은 2022년 09월 19일부터 시행한다.			      
						</div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingFour">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
				        개인정보 수집 이용약관
				      </button>
				    </h2>
				    
				    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
						<strong>[개인정보의 수집 및 이용에 대한 동의]</strong> <br>
						AIM은 이용자의 개인정보를 중요시하며, 『전자금융거래법』, 『개인정보보호법』, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『전자상거래 등에서의 소비자보호에 관한 법률』, 『특정금융거래정보의 보고 및 이용 등에 관한 법률』 등을 준수하며 관련 법령에 의거한 개인정보처리방침을 정하여 이용자 권익을 보호하고 있습니다.
						<br>
						1. 회사는 전자금융거래서비스를 제공함에 있어서 취득한 정보를 이용자의 동의를 얻지 않고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 않습니다. 다만, 업무상 이용자 정보를 제3자에게 위탁할 경우 홈페이지(www.cjolivenetworks.co.kr)을 통해 이용자에게 고지합니다.
						<br>
						2. 수집하는 개인정보 항목
						<br>
						회사는 전자금융업자로서 고객 확인 및 검증, 결제내역 조회, 고객상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
						<br>
						
						<strong>[필수항목]</strong>
						<br>
						신원 확인 및 고객 검증을 위한 수집 정보
						<br>
						· 개인 및 개인사업자 : 고객ID, 이용자의 이름, 생년월일, 성별, 실명번호, 주소, 연락처<br>
						· 영리법인의 경우 : 실지명의, 업종, 본점 및 사업장의 소재지, 연락처, 대표자의 성명, 생년월일 및 국적<br>
						· 비영리법인 그 밖의 단체의 경우 : 실지명의, 설립목적, 주된 사무소의 소재지, 연락처, 대표자의 성명, 생년월일 및 국적<br>
						· 외국인 및 외국단체의 경우 : 제1호 내지 제3호의 규정에 의한 분류에 따른 각 해당 사항, 국적, 국내의 거소 또는 사무소의 소재지<br>
						고위험 거래 대상으로 분류 시 개인정보 추가 수집 내역
						<br>
						· 개인 : 직업 또는 업종(개인사업자), 거래의 목적, 거래자금의 원천, 기타 자금세탁 우려를 해소하기 위해 필요하다고 판단한 사항으로 회사가 별도 고지한 정보유형<br>
						· 법인 : 회사에 관한 기본정보(법인정보, 상장정보, 사업체 설립일, 홈페이지/이메일 등) 거래자금의 원천, 거래의 목적, 기타 자금세탁 우려를 해소하기 위해 필요하다고 판단한 사항으로 회사가 별도 고지한 정보유형
						<br>
						결제내역 조회, 고객상담, 서비스 신청 등을 위한 수집 정보
						<br>
						· 신용카드 : 카드번호, 유효기간 (결제방식에 따라 수집정보가 상이할 수 있습니다.)<br>
<!-- 						· 휴대전화 : 통신사명, 휴대전화번호<br> -->
<!-- 						· 계좌이체 : 은행명, 계좌번호<br> -->
<!-- 						· 가상계좌 : 은행명, 입금자명 (환불시, 추가로 은행명, 계좌번호, 예금주 정보를 수집합니다.)<br> -->
<!-- 						· 문화상품권 : 컬처랜드 아이디<br> -->
<!-- 						· 도서문화상품권 : 북앤라이프 아이디<br> -->
<!-- 						· 현금영수증 : 고유식별정보 또는 휴대폰번호 또는 카드번호<br> -->
						<br>
						※ 서비스 이용과정중에서 아래와 같은 정보들이 자동으로 생성되어 수집됩니다.
						<br>
						(IP Address, 서비스접속일시)
						<br>
						3. 개인정보 수집방법
						<br>
						· 회사의 결제서비스 이용 시<br>
						· 결제내역 조회 및 고객 응대 입력 시<br>
						<br>
						4. 개인정보의 수집 및 이용목적
						<br>
						회사가 이용자의 개인정보를 수집, 이용하는 목적은 아래와 같습니다.
						<br>
						1) 이용자가 구매한 재화나 용역의 대금 결제<br>
						2) 이용자가 결제한 거래의 취소 또는 환불<br>
						3) 이용자가 결제한 거래의 청구 및 수납<br>
						4) 이용자가 수납한 거래 대금의 정산<br>
						5) 이용자가 결제한 거래의 내역을 요청하는 경우 응대 및 확인<br>
						6) 통신과금서비스 이용이 불가능한 이용자와 불량, 불법 이용자의 부정 이용 방지<br>
						7) 특정금융거래정보의 보고 및 이용 등에 관한 법률 제5조의2 및 동법 시행령 제10조의4에 따른 고객확인의무 이행 및 의심거래 보고
						<br>
						5. 개인정보의 보유 및 이용기간
						<br>
						회사가 이용자의 개인정보를 수집, 이용하는 목적은 아래와 같습니다. 회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 및 지체 없이 해당 정보를 파기합니다. 단, 『개인정보보호법』 및 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 아래와 같이 법령에서 정한 일정한 기간 동안 보관합니다.
						<br>
						· 계약 또는 청약철회 등에 관한 기록
						<br>
						보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
						<br>
						<strong>보존 기간 : 5년</strong>
						<br>
						· 대금결제 및 재화 등의 공급에 관한 기록
						<br>
						보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
						<br>
						<strong>보존 기간 : 5년</strong>
						<br>
						· 전자금융 거래에 관한 기록
						<br>
						보존 이유 : 전자금융거래법
						<br>
						<strong>보존 기간 : 5년</strong>
						<br>
						· 소비자의 불만 또는 분쟁처리에 관한 기록
						<br>
						보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
						<br>
						<strong>보존 기간 : 3년</strong>
						<br>
						· 웹사이트 방문기록
						<br>
						보존 이유 : 통신비밀보호법
						<br>
						<strong>보존 기간 : 3개월</strong>
						<br>
						· 신원 확인 및 고객 검증 등을 위한 기록
						<br>
						보존 이유 : 특정금융거래정보의 보고 및 이용 등에 관한 법률 및 동법 시행령
						<br>
						<strong>보존 기간 : 5년</strong>
						<br>
						6. 개인정보의 파기절차 및 방법
						<br>
						회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.
						<br>
						· 파기절차
						<br>
						회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 데이터베이스(DB)로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(5. 보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다.
						<br>
						별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.
						<br>
						· 파기방법
						<br>
						전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.			      
						</div>
				    </div>
				  </div>
				</div>
			<!-- 약관 -->	
			</div>
			
			<div class="com_btn_wrap pT40">
				<!--   <input type="button" onClick="api_start()" />-->
<!-- 				<a href="javascript:requestPay()" class="btn_style0">결제하기</a> -->
 				<a href='javascript:requestPay2("${member.mb_tel}")' class="btn_style0">결제하기</a> 
				<a href="./CartList.ct" class="btn_style0" style="color:white">돌아가기</a> 
			</div>
		</div>
		</div>


</form>

	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>