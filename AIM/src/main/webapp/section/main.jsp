<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">  -->
<title>Aim - all in movie</title>

<!-- <link rel="stylesheet" type="text/css" href="./section/dragdealer.css">
<link rel="stylesheet" type="text/css" href="./section/component.css">
<script type="text/javascript" async=""
	src="https://ssl.google-analytics.com/ga.js"></script>
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
	

</script> -->

</head>
<body>


<!-- 
	<div class="container">

		<header id="header" class="codrops-header">
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
				<div class="handle">
					<div class="slide current" data-content="content-1"
						style="width: 12.5%;">
							<div class="info">
							<h3 class="animate">테스트 문구입니다.</h3>
							</div>
							<div class="info">
						  <article>
						 <div class="waviy" style="font-size: 50px; padding: 0 0 0 400px; position: fixed;">
						   <span style="--i:1; color: #CD1039;">A</span>
						   <span style="--i:2; color: #F56E6E;">I</span>
						   <span style="--i:3; color: #FF8200;">M</span>
						   <span style="--i:4; color: #FFB432;">-</span>
						   <span style="--i:5; color: #FFD732;">a</span>
						   <span style="--i:6; color: #A8F552;">l</span>
						   <span style="--i:7; color: #64CD3C;">l</span>
						   <span style="--i:7"> </span>
						   <span style="--i:7"> </span>
						   <span style="--i:8; color: #3ED0C8;">i</span>
   						   <span style="--i:9; color: #14D3FF;">n</span>
   						   <span style="--i:9"> </span>
   						   <span style="--i:9"> </span>
   						   <span style="--i:10; color:#0000FF;">m</span>
   						   <span style="--i:11; color:#6464CD;">o</span>
   						   <span style="--i:12; color:#14148C;">v</span>
   						   <span style="--i:13; color:#BC55EF;">i</span>
   						   <span style="--i:14; color:#9400D3;">e</span>
						  </div>
								<aim>
								<div id=container>
								Aim is? 
									<div id=flip>
										<div><div>영화의 모든 것!</div></div>
										<div><div>액션과 판타지까지</div></div>
										<div><div>로맨스? 공포?</div></div>
									</div>
									All In Movies!
								</div>
								</aim>
							</article>
						  </div>

						<button class="content-switch" 
						style="height: 71.2px; width: 138.4px; border: 0px">
						<img alt="start" src="https://ifh.cc/g/Yx81Ww.png"
						style="left:-185px; top:-44px;"> 
						</button>
					</div>

				</div>
			</section>

			<section class="pages">
				<div class="content" data-content="content-1"> -->
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

				<!-- </div>

			</section>
		</div>
	</div>
	/container
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
	For the demo ad only
	<script src="./section/demoad.js"></script> -->


</body>
</html>