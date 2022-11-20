<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../inc/include.jsp" />
<script>
$(function() {
	$("#hideban").on("click", function() {
		
		$("#main_top_of_top_banner").hide();
		return false;
	});

});

</script>



<div id="main_top_of_top_banner" class="banner_top_wrap banner_type01"
	style="background-color: rgb(63, 69, 69);">
	<div class="inner">
		<a href="#" target="">
			<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/BB/1102/BB_98080.jpg"
				alt="와칸다포에뻐">
		</a>
		<button id="hideban" class="btn_close"></button>
	</div>
</div>

<!-- 배너 링크 변경시 배경색깔 같이 변경할 것 -->