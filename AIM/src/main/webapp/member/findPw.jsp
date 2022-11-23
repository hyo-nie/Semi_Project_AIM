<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
</head>
<body>
	<script>
		function check() {
			if (document.fr.id.value == "") {
				alert('아이디를 입력하세요!');
				document.fr.mb_id.focus();
				return;
			}

			if (document.fr.tel.value == "") {
				alert('전화번호를 입력하세요!');
				return;
			}

		}
	</script>


	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp" />
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp"></jsp:include>

	<!-- 보기안좋아서 임시방편입니다 -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 보기안좋아서 임시방편입니다 -->


	<h1 align="center">비밀번호 찾기</h1>
	<br>

	<fieldset>
		<div align="center">
			<form action="./FindPwAction.aim" method="post" name="fr"
				onSubmit="check()">
				<div>
					아 이 디 : <input type="text" name="mb_id" placeholder="아이디를 입력하세요."
						required="required">
				</div>
				<br>
				<div>
					전화번호 : <input type="text" name="mb_tel" placeholder="전화번호를 입력하세요."
						required="required">
				</div>
				<br>
				<div>
					<input type="submit" value="비밀번호 찾기"> <input type="button"
						name="cancle" value="돌아가기" onclick="history.back();">
				</div>
			</form>
		</div>
	</fieldset>
	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>