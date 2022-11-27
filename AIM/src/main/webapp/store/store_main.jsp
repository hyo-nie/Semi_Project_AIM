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
<script src="jquery-3.6.1.js"></script>
<!-- 제이쿼리 바꿀 예정 -->
<script type="text/javascript">




</script>

<!--  장바구니 버튼을 위한 CSS -->
<style>
	#floatMenu{
		width: 70px;
		height: 70px;
	    padding: 5px;
	    z-index: 100;			
	    position: fixed;
	    bottom: 30px;
	    right: 30px;
	    background-image: url(./assets/img/bg_cartBtn.png);
	    background-color: lightgray;
	    background-size: cover;
	    border-radius: 30%
	}
</style>

</head>
<body>

<%-- ${gc_list } --%>
<%-- ${pop_list } --%>

	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp"/>
	

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp"/>


	<div class="category_product_list_wrap">
	    <strong class="category_product_list_title">
	    	<b>STORE</b>
	    	<span>
	    		All In Movie, 영화의 모든 것
	    		<div style="float: right;">
	    		<a href="./CartList.ct">
	    			<img src="./assets/img/bg_cartBtn.png" alt="장바구니">
	    		</a>
	    		</div>
	    	</span>
	    </strong>
  	</div>
  	
  	<a href="./CartList.ct">
  		<div id="floatMenu"></div>
  	</a>
  	
  	<div class="category_product_wrap">
  		<c:set var="size" value="3"/>
		<c:set var="num" value="0"/>
  	
		<ul class="category_product_list">
		
	  		<!-- 추천상품 파트 -->
	        <li>
	          <strong class="category_product_title" style="font-size: 23px; font-family: inherit;">추천상품
	          <a href="./AimPick.st" class="btn_category_product">더보기</a>
	          </strong>          
	          
	          <ul class="category_product_inner_list">
	          	<li class=" ">
					<a href="./PopcornDetail.st?st_num=${Combo.st_num}" class="btn_category_product">              
					<span class="best_product_img_wrap">
						<img src="./assets/img/${Combo.st_img }" alt="${Combo.st_name }"></span>              
					<span class="best_product_text_wrap">                 
						<span class="best_product_text_title">${Combo.st_name }</span>                  
						<span class="best_product_text_name">${Combo.st_text }</span>                  
						<span class="best_product_sale_price_wrap">                  
						<span class="store_deatail_source_price">
							<fmt:formatNumber value="${Combo.st_price}"/>
						</span>                  
					</span>
	              	</span>
	          		</a>
	          	</li>
	          	
	          	<li class=" ">
					<a href="./GiftcardDetail.st?st_num=${ticket.st_num}" class="btn_category_product">              
					<span class="best_product_img_wrap" style="width: 220px; height: 183px;">
						<img src="./assets/img/${ticket.st_img}" alt="${ticket.st_name }" style="margin-top: 26px;"></span>              
					<span class="best_product_text_wrap">                 
						<span class="best_product_text_title">${ticket.st_name }</span>                  
						<span class="best_product_text_name">${ticket.st_text }</span>                  
						<span class="best_product_sale_price_wrap">                  
						<span class="store_deatail_source_price">
							<fmt:formatNumber value="${ticket.st_price}"/>
						</span>                  
					</span>
	              	</span>
	          		</a>
	          	</li>
	          	
	          	<li class=" ">
					<a href="./GiftcardDetail.st?st_num=${giftCard.st_num}" class="btn_category_product">              
					<span class="best_product_img_wrap" style="width: 220px; height: 183px;">
						<img src="./assets/img/${giftCard.st_img }" alt="${giftCard.st_name }" style="margin-top: 26px;"></span>              
					<span class="best_product_text_wrap">                 
						<span class="best_product_text_title">${giftCard.st_name }</span>                  
						<span class="best_product_text_name">${giftCard.st_text }</span>                  
						<span class="best_product_sale_price_wrap">                  
						<span class="store_deatail_source_price">
							<fmt:formatNumber value="${giftCard.st_price}"/>
						</span>                  
					</span>
	              	</span>
	          		</a>
	          	</li>
	          </ul>
			</li>
		</ul>
	          
	    <br><br>
	          
	  	<ul class="category_product_list">
	  		<!-- 영화관람권 / 기트프카드 파트 -->
	        <li>
	          <strong class="category_product_title" style="font-size: 23px; font-family: inherit;">영화관람권 / 기프트카드
	          <a href="./GiftcardList.st" class="btn_category_product">더보기</a> </strong>          
	          
	          <ul class="category_product_inner_list">   
	             <c:forEach var="i" begin="1" end="3" step="1">
		        	<c:if test="${num < size}">
		        	<c:set var="giftlist" value="${gc_list[i] }"/>
			          <li class=" ">
							<a href="./GiftcardDetail.st?st_num=${giftlist.st_num }" class="btn_category_product">              
							<span class="best_product_img_wrap" style="width: 220px; height: 183px;">
								<img src="./assets/img/${giftlist.st_img }" alt="${giftlist.st_img }" style="margin-top: 26px;"></span>  
								           
							<span class="best_product_text_wrap">                 
								<span class="best_product_text_title">${giftlist.st_name }</span>                  
								<span class="best_product_text_name">${giftlist.st_text }</span>                  
								<span class="best_product_sale_price_wrap">                  
								<span class="store_deatail_source_price"><fmt:formatNumber value="${giftlist.st_price}"/></span>                  
							</span>
			              </span>
			          </a>
			          </li>
			       </c:if>
	          	</c:forEach>
			          </ul>
			          </li>
	          </ul>
	          
		 <br><br>
	      
	      
	      <ul class="category_product_list">
	        <!-- 팝콘/음료/굿즈 파트 -->
	        
			  <li>
			    <strong class="category_product_title" style="font-size: 23px; font-family: inherit;">팝콘/음료/굿즈
			    	<a href="./PopcornList.st" class="btn_category_product">더보기</a> </strong>  
			          <!-- giftstore.css 517-->
			             
			    <ul class="category_product_inner_list">      
			      <c:forEach var="i" begin="1" end="3" step="1">
		        	<c:if test="${num < size}">
		        	<c:set var="poplist" value="${pop_list[i] }"/>
			          <li class=" ">
							<a href="./PopcornDetail.st?st_num=${poplist.st_num }" class="btn_category_product">              
							<span class="best_product_img_wrap">
								<img src="./assets/img/${poplist.st_img }" width="300" alt="${poplist.st_img }"></span>     
	
							<span class="best_product_text_wrap">                 
								<span class="best_product_text_title">${poplist.st_name }</span>                  
								<span class="best_product_text_name">${poplist.st_text }</span>                  
								<span class="best_product_sale_price_wrap">                  
								<span class="store_deatail_source_price"><fmt:formatNumber value="${poplist.st_price }"/></span>                  
							</span>
			              </span>
			          </a>
			          </li>
			       </c:if>
	          	</c:forEach>
			          </ul>
	
			  </li>

      </ul>
          
          
	</div>
	
	
	
	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />




</body>
</html>