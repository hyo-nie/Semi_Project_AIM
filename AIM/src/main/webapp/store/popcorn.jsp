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

</head>
<body>

	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp"/>

<%-- ${popcornList} 정보 넘어오는 거 확인했음! 나중에 지우기 --%>
		
		
		
		
		
		
		<div id="contents" class="gift_store">
		
		<div class="category_product_list_wrap">
			<strong class="category_product_list_title">
				팝콘 / 음료 / 굿즈
			</strong>
		
		<c:set var="size" value="${popcornList.size() }"/>
		<c:set var="col" value="4"/>
		<c:set var="row" value="${Math.ceil(size/col)}"/>
		<c:set var="num" value="0"/>		
		
			<ul class="com_list_style">
			<c:forEach begin="1" end="${row }" step="1">
				<c:forEach var="i" begin="1" end="${col }" step="1">
					<c:if test="${num < size }">
					<c:set var="popcorn" value="${popcornList[num] }"/>
						<li class="">
							<a href="./PopcornDetail.st?st_num=${popcorn.st_num}" class="btn_category_product"> 
							<span class="com_list_img_wrap">
								<img src="./upload/${popcorn.st_img }" alt="${popcorn.st_name }"></span> 
								<span class="com_list_text_wrap"> 
								<span class="com_list_text_title">${popcorn.st_name }</span> 
								<span class="com_list_text_name">${popcorn.st_text }</span> 
								<span class="com_list_sale_price_wrap"> 
								<span class="store_deatail_source_price"><fmt:formatNumber value="${popcorn.st_price }"/>원</span>
								</span>
								</span>
							</a> 
						</li>
					<c:set var="num" value="${num+1}"/>
					</c:if>
				</c:forEach>
			</c:forEach>
			</ul>
			<c:if test="${mb_id.equals('admin')}">
				<input type="button" value="상품등록" onclick="location.href='./AdminStoreAdd.ad';">
				<input type="button" value="상품리스트" onclick="location.href='./AdminStoreList.ad';">
				<!-- 버튼 css 추후 적용 -->
			</c:if>
		</div>
</div>


	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>