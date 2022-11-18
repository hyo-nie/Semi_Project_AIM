<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aim - all in movie</title>

<link rel="stylesheet" type="text/css" href="./section/dragdealer.css">
 <link rel="stylesheet" type="text/css" href="./section/component.css"> 
<!-- <script type="text/javascript" async=""
	src="https://ssl.google-analytics.com/ga.js"></script> -->
<script src="./section/modernizr.custom.js"></script>

<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-7243260-2' ]);
	_gaq.push([ '_trackPageview' ]);
	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>

</head>
<body>
	<div class="container">
		<div class="codrops-top clearfix">

		</div>
		<header id="header" class="codrops-header">
			<h1>AIM - all in movie</h1>
			<span class="message">This mobile version does not have the
				slideshow switch</span>
			<button class="slider-switch">Switch view</button>
		</header>
		<div id="overlay" class="overlay hide">
			<div class="info">
				<h2>Demo interactions</h2>
				<span class="info-drag">Drag Sliders</span> <span class="info-keys">Use
					Arrows</span> <span class="info-switch">Switch view</span>
				<button>Got it!</button>
			</div>
		</div>
		<div id="slideshow" class="dragslider">
			<section class="img-dragger img-dragger-large dragdealer">
				<div class="handle"
					style="width: 800%; transform: translate3d(0px, 0px, 0px);">
					<div class="slide current" data-content="content-1"
						style="width: 12.5%;">
						<div class="img-wrap">
							<img src="img/1.jpg" alt="img1">
						</div>

							Lorem Waldy<span>Distilling design ideas and other
								interesting topics</span>

						<button class="content-switch">Read more</button>
					</div>

				</div>
			</section>

			<section class="pages">
				<div class="content" data-content="content-1">
					<!-- 각종 요소 -->
					<jsp:include page="../inc/include.jsp" />
					<!-- 상위 배너 -->
					<jsp:include page="../inc/topbanner.jsp" />
					<!-- 헤더/네비 -->
					<jsp:include page="../inc/nav_bar.jsp" />
					<!-- 영화슬라이더 -->
					<jsp:include page="../inc/slide_mv.jsp" />
					<!-- 바디 -->
					<jsp:include page="../inc/body.jsp" />
					<!-- 약관 -->
					<jsp:include page="../inc/footer.jsp" />

				</div>
				
			</section>
		</div>
	</div>
	<!-- /container -->
	<script src="./section/dragdealer.js"></script>
	<script src="./section/classie.js"></script>
	<script src="./section/dragslideshow.js"></script>
	<script>
			(function() {

				var overlay = document.getElementById( 'overlay' ),
					overlayClose = overlay.querySelector( 'button' ),
					header = document.getElementById( 'header' )
					switchBtnn = header.querySelector( 'button.slider-switch' ),
					toggleBtnn = function() {
						if( slideshow.isFullscreen ) {
							classie.add( switchBtnn, 'view-maxi' );
						}
						else {
							classie.remove( switchBtnn, 'view-maxi' );
						}
					},
					toggleCtrls = function() {
						if( !slideshow.isContent ) {
							classie.add( header, 'hide' );
						}
					},
					toggleCompleteCtrls = function() {
						if( !slideshow.isContent ) {
							classie.remove( header, 'hide' );
						}
					},
					slideshow = new DragSlideshow( document.getElementById( 'slideshow' ), { 
						// toggle between fullscreen and minimized slideshow
						onToggle : toggleBtnn,
						// toggle the main image and the content view
						onToggleContent : toggleCtrls,
						// toggle the main image and the content view (triggered after the animation ends)
						onToggleContentComplete : toggleCompleteCtrls
					}),
					toggleSlideshow = function() {
						slideshow.toggle();
						toggleBtnn();
					},
					closeOverlay = function() {
						classie.add( overlay, 'hide' );
					};

				// toggle between fullscreen and small slideshow
				switchBtnn.addEventListener( 'click', toggleSlideshow );
				// close overlay
				overlayClose.addEventListener( 'click', closeOverlay );

			}());
		</script>
	<!-- For the demo ad only -->
	<script src="./section/demoad.js"></script>


</body>
</html>