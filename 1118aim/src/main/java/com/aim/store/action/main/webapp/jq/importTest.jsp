<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript">
		var IMP = window.IMP;   // 생략 가능
		IMP.init("imp30860234"); // 예: imp00000000 
	
		function api_start() {
		      // IMP.request_pay(param, callback) 결제창 호출
		      
		      /* var goodsName = document.getElementById("menu").value;
		      var goodsAmount = document.getElementById("amount").value;
		       */
		      console.log(goodsName + " : "+  goodsAmount);
		      
		      IMP.request_pay({ // param
		          pg: "html5_inicis",
		          pay_method: "card",
		          merchant_uid: "ORD20180131-0000025",
		          name: "밥",
		          amount: 20000,
		          buyer_email: "gildong@gmail.com",
		          buyer_name: "홍길동",
		          buyer_tel: "010-4242-4242",
		          buyer_addr: "서울특별시 강남구 신사동",
		          buyer_postcode: "01181"
		      }, function (rsp) { // callback
		          if (rsp.success) {
		             console.log("success");
		          } else {
		        	  console.log(rsp)
		              console.log("fail");
		          }
		      });
		    }
		
	</script>

</head>
<body>
			<!--  주문번호(merchant_uid) 생성 시 유의사항
			주문번호는 결제창 요청 시 항상 고유 값으로 채번 되어야 합니다.
			결제 완료 이후 결제 위변조 대사 작업시 주문번호를 이용하여 검증이 필요하므로 
			주문번호는 가맹점 서버에서 고유하게(unique)채번하여 DB 상에 저장해주세요 -->


		<h1>importTest.jsp</h1>

		<button onclick="api_start()">결제하기</button> <!-- 결제하기 버튼 생성 -->


</body>
</html>