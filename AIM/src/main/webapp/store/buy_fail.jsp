<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AIM - ALL IN MOVIE</title>
<link href="./assets/css/giftstore.css" rel="stylesheet" type="text/css">
<script src="jquery-3.6.1.js"></script>
<!-- 제이쿼리 바꿀 예정 -->
<script type="text/javascript">


</script>
</head>
<body>

	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp"/>
	

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp"/>



<!-- 결제 실패 시 보여지는 view -->
<div id="contents" class="gift_store">

    <div class="cart_step_wrap">
        <!-- S case1 -->
        <ul class="cart_step step_unit3">
            <li class="step0"><span>STEP 01</span><strong>장바구니</strong></li>
            <li class="step2"><span>STEP 02</span><strong>결제하기</strong></li>
            <li class="step3 active"><span>STEP 03</span><strong>결제완료</strong></li>
        </ul>
    </div>


    <div class="payment_complete_wrap">
        <div class="payment_complete_contents_wrap">
            <p>
                <strong>상품 결제가 실패되었습니다.</strong>
            </p>
            <br><br><br><br><br>
        </div>
        <p class="com_box_design_olist">
            주문하신 내역의 결제가 실패하였습니다.</p>
        <p class="com_box_design_olist">
            확인 하신 후 다시 결제해주시기 바랍니다.</p>
            
        <div class="com_btn_wrap pT60">
			<a href="./CartList.ct" class="btn_style1">다시 결제 하기</a>
			<!-- 장바구니 페이지로 이동 -->
            <a href="./StoreMain.st" class="btn_style0">스토어 홈</a>
            <!-- 스토어 메인 페이지로 이동 -->
        </div>

    </div>

	</div>




	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />



</body>
</html>