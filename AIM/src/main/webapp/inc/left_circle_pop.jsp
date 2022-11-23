<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc/include.jsp" />
<script>
$(function() {
	$("#hidepop").on("click", function() {
		
		$("#pop").hide();
		return false;
	});

});

</script>
</head>
<body>

		
		
    <div id="pop" class="banner_side_wrap"
		style="top: 700px;">
		<div class="banner_01" style="top: 485px;">
			<a
				href="#" target=""><img
				src="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_145145.png"
				alt="아빠타"></a>
			<button id="hidepop" class="btn_close" >광고 닫기</button>
		</div>
		</div>
		
		
		</body>
		</html>