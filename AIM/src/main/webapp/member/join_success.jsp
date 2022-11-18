<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입 완료 &lt; 회원가입</title>
<!-- css/script -->
<jsp:include page="../inc/join_include.jsp" />

</head>


<!-- header -->

<div id="mast-head">
	<div class="container">
		<h1 class="bi">
			<a href="./Main.aim" onclick="return fnWindowOpen(this.href);"
				target="_blank"><img src="https://ifh.cc/g/RGtYO5.png"
				alt="AIM홈페이지"></a>
		</h1>
	</div>
</div>
<!-- //header -->


	<!-- mast body -->
	<div id="mast-body">
		<div class="container">
			<!-- top area -->
			<div class="toparea">
				<h2 class="title">
					AIM 회원가입
					<!-- 회원가입 -->
				</h2>
				<div class="headline __success" id="headlineSuc">
					<br>회원가입을 축하합니다!
					<br>서비스 이용을 위해<br>다시 로그인을 해주세요.
					<!-- 서비스 이용을 위해<br>다시 로그인을 해주세요. -->
				</div>
			</div>
			<!-- //top area -->
			<!-- contents -->
			<div class="contents">
				<!-- section : 약관처리결과 -->
				<div class="section __half __opt-in">

				<!-- btn -->
				<div class="btn-area">
					<button type="button" class="ui-button __dot"
						onclick="location.href='./Login.aim'">
						로그인 <em>하기</em>
						<!-- 로그인 <em>하기</em> -->
					</button>
				</div>
			</div>
			<!-- //contents -->
		</div>
	</div>
	</div>
	<!-- //mast body -->





<!-- 약관 -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>