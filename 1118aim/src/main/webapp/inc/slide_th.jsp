<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>bxSlider</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="./jquery.bxslider.css">
<script>
  $( document ).ready( function() {
    $( '.slider' ).bxSlider( {
      auto: true,
      pause: 3000,
    } );
  } );
</script>
</head>
<body>
	<div class="slider">
		<div>
			<a href="#none"><img
				src="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1920774.jpg"
				data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1280720_1.mp4"
				alt=""></a>
		</div>
		<div>
			<a href="#none"><img
				src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/ST_1920774.jpg"
				data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/ST_1280720.mp4"
				alt=""></a>
		</div>
		<div>
			<a href="#none"><img
				src="https://caching2.lottecinema.co.kr/lotte_image/2022/BB/1103/BB_1280774.jpg"
				data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/BB/1103/BB_1280720.mp4"
				alt="블랙팬서 와칸다 포에버 11월 대개봉 마블의  압도적 블록버스터 두 세계가 충돌한다 관람등급미정"></a>
		</div>
		<div>
			<a href="#none"><img
				src="https://caching2.lottecinema.co.kr/lotte_image/2022/EE/1027/EE_1920774.jpg"
				data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/EE/1027/EE_1280720.mp4"
				alt="창극 기획전 11월 대개봉 15세이상관람가"></a>
		</div>
		<div>
			<a href="#none"><img
				src="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1920774.jpg"
				data-video="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_1280720_1.mp4"
				alt=""></a>
		</div>
	</div>
</body>
</html>