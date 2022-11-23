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
	style="background-color: rgb(98, 181, 254);">
	<div class="inner">
		<a
			href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_32&amp;adgroupid=adg_lottecinema_20221111_23&amp;adid=adi_lottecinema_20221111_30"
			target=""><img
			src="https://caching2.lottecinema.co.kr/lotte_image/2022/boo/1121/boo_98080.jpg"
			alt="극장판 뽀로로와 친구들 바이러스를 없애줘 전체관람가 12월 1일 롯데시네마에서 만나요"></a>
		<button class="btn_close">닫기</button>
	</div>
</div>

<!-- 배너 링크 변경시 배경색깔 같이 변경할 것 -->
