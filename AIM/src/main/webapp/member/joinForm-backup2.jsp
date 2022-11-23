<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - Sign Up</title>
<!-- 상위 배너 -->
<jsp:include page="../inc/topbanner.jsp"/>
<!-- 각종 요소 -->
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<jsp:include page="../inc/include.jsp" />
<!-- 헤더/네비 -->
<jsp:include page="../inc/login_nav_bar.jsp" />


<!-- /////////////////////////////////////////////////////////////////// -->
<!-- RADIO 버튼 css 문제로 보이지 않아 수정후에 성별선택버튼 활성화 예정 -->
<!-- 페이지 css작업 예정입니다.                                          -->
<!-- /////////////////////////////////////////////////////////////////// -->






<script type="text/javascript">

	function checkID(){
		alert('아이디 중복체크 시작');
		
		if(document.fr.mb_id.value == ""){
			alert('id를 입력해주세요');
			document.fr.mb_id.focus();
			return;
		}
		
		var inputID = document.fr.mb_id.value;
		
		window.open("./IdCheck.aim?inputID="+inputID,"","width=400, height=400, top=400, left=400");	
	}	
	
	function checkNick(){
		alert('닉네임 중복체크 시작');
		
		if(document.fr.mb_nick.value == ""){
			alert('닉네임을 입력해주세요');
			document.fr.mb_nick.focus();
			return;
	}
		var inputNick = document.fr.mb_nick.value;
		
		window.open("./NickCheck.aim?inputNick="+inputNick,"","width=400, height=400, top=400, left=400");	
	}	

	
	function chk(){
		var mb_id = $("#mb_id").val();
		var mb_pw = $("#mb_pw").val();
		var mb_pw2 = $("#mb_pw2").val();
		var mb_name = $("#mb_name").val();
		var mb_nick = $("#mb_nick").val();
		var mb_birth1 = $("#mb_birth1").val();
		var mb_birth2 = $("#mb_birth3").val();
		var mb_birth2 = $("#mb_birth3").val();
		var mb_gender = $("#mb_gender").val();
		var mb_tel = $("#mb_tel").val();
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		// 대문자,소문자,숫자,특수기호 포함 최소 8글자 여부
		// 특수기호는 "#?!@$%^&*-" 만 사용가능 필요시 추가하면 됍니다.
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		// 한글포함여부
		if(document.fr.mb_id.value == ""){
			alert('id를 입력해주세요');
			document.fr.mb_id.focus();
			return false;
		}
		if (hangulcheck.test(mb_id)){
			alert("아이디에 한글을 사용 할 수 없습니다.")
			document.fr.mb_id.focus();
			return false;
		} 
		if (mb_id.length < 4 || mb_id.length > 12){
			alert("아이디를 4글자~12글자 사이로 입력하세요")
			document.fr.mb_id.focus();
			return false;
		} 
		if (mb_pw == "") {
			alert("비밀번호를 입력하세요.");
			document.fr.mb_pw.focus();
			return false;
		} 
		if (hangulcheck.test(mb_pw)) {
			alert("비밀번호에 한글을 사용 할 수 없습니다.");
			document.fr.mb_pw.focus();
			return false;
		} 
		if (mb_pw.length < 8 || mb_pw.length > 20){
			alert("비밀번호를 8글자~20글자 사이로 입력해주세요");
			document.fr.mb_pw.focus();
			return false;
		} 
		if (false === reg.test(mb_pw)) {
			alert('비밀번호는 숫자/대문자/소문자/특수문자를 최소 1개이상 모두 포함해야 합니다.');
			document.fr.mb_pw.focus();
			return false;
		} 
		if (/(\w)\1\1/.test(mb_pw)) {
			// \1 추가/제거하면 반복횟수 +- 1
			alert('비밀번호에 같은 문자를 3번 이상 사용하실 수 없습니다.');
			document.fr.mb_pw.focus();
			return false;
		} 
		if (mb_pw.search(mb_id) > -1) {
			alert("비밀번호에 아이디가 포함되었습니다.");
			document.fr.mb_pw.focus();
			return false;
		} 
		// pw check 
		if (mb_pw == mb_pw2) {
			// 일치시에는 문구 출력하지 않음
		} else {
			alert("비밀번호가 일치하지 않습니다.")
			return false;
		}
		if (mb_name == ""){
			alert('이름을 입력해주세요');
			document.fr.mb_name.focus();
			return false;
		} 
		if (mb_nick == ""){
			alert('별명을 입력해 주세요');
			document.fr.mb_nick.focus();
			return false;
		} 
		if (mb_birth1 == ""){
			alert('년도를 선택해 주세요');
			document.fr.mb_birth1.focus();
			return false;
		} 
		if (mb_birth2 == ""){
			alert('월을 선택해 주세요');
			document.fr.mb_birth2.focus();
			return false;
		} 
		if (mb_birth3 == ""){
			alert('일을 선택해 주세요');
			document.fr.mb_birth3.focus();
			return false;
		} 
/* 		if (mb_gender1 == "" && mb_gender2 == ""){
			alert('성별을 선택해 주세요');
			document.fr.mb_gender.focus();
			return false;
		}  */
		if (mb_tel == ""){
			alert('휴대전화번호를 입력해 주세요');
			document.fr.mb_tel.focus();
			return false;
		} 
		

		alert("회원가입이 완료되었습니다");
		document.fr.submit();
	}


</script>

<style type="text/css">
.left {
	width : 50px;
	height : 20px;
}


</style>


</head>
<body>
<div id="member_join" class="member_join_wrap">
	<div class="contents_inner">
		<div class="join_box">
			<form action="./JoinAction.aim" method="post" name="fr" id="join">
				<div class="join_input_box">
					<div class="title" >
						회원가입 페이지
					</div>
					<div class="inp_box">
						<div class="input">
							<label>아이디 :</label> 
							<input type="text" id="mb_id" name="mb_id" class="mb_id"
									maxlength="12"> <input type="button" name="IdCheck"
									value="ID중복확인" onclick="checkID()">
							<label>비밀번호 : </label> 
							<input type="password" name="mb_pw" id="mb_pw">
			
							<label>비밀번호 확인 : </label>
							<input type="password" name="mb_pw2" id="mb_pw2">
			
							<label>이름 : </label>
							<input type="text" name="mb_name" id="mb_name">
							<label>별명 : </label><input type="text" name="mb_nick" id="mb_nick">
							<input type="button" name="NickCheck" value="닉네임중복확인"
									onclick="checkNick()">
							<label>생년월일 : </label> 
							<label>전화번호 : </label> <input type="tel" name="mb_tel" id="mb_tel"> 

				<div class="select">
					<input type="radio" name="SMS" value="동의" checked> SMS 동의 
					<input type="radio" name="SMS" value="비동의"> SMS 비동의
					<select name="mb_birth1" id="mb_birth1">
					<option>년</option>
					<c:forEach var="y" begin="2000" end="2014" step="1">
						<option value="${y }">${y }년</option>
					</c:forEach>
					</select> <select name="mb_birth2" id="mb_bireth2">
					<option>월</option>
					<c:forEach var="m" begin="1" end="12" step="1">
						<option value="${m }">${m }월</option>
					</c:forEach>
					</select> <select name="mb_birth3" id="mb_birth3">
					<option>일</option>
					<c:forEach var="d" begin="1" end="31" step="1">
					<option value="${d }">${d }일</option>
					</c:forEach>
					</select>
				</div>
					<div class="submit">						
					<input type="button" value="회원가입" onclick="chk()">
					<input type="button" value="돌아가기" onclick="location.href='./Login.aim';">
					</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
	           <!--  추후 적용 -->
				 <!-- <label> 성별 : </label> <input type="radio"
				name="mb_gender" value="남" id="mb_gender1">남
				 <input type="radio"
				name="mb_gender" value="여" id="mb_gender2">여 -->
	
	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>
