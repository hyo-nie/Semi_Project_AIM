<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간편회원 정보입력 &lt; 회원가입</title>

<!-- css/script -->
<jsp:include page="../inc/join_include.jsp"/>

<%--
id/name code
아이디 : mb_id
패스워드 : mb_pw
패스워드체크 : mb_pw2
이름 : mb_name
닉네임 : mb_nick
이메일 : mb_email
생년월일 : mb_birth1, mb_birth2, mb_birth3
전화번호
ex ) skt / 010 / 0000 / 0000
      a     b     c      d
     a : mb_tel1
     b : mb_tel2
     c : mb_tel3
     d : mb_tel4

마케팅정보수신 여부 - db 사용여부 회의필요
개인정보 유효기간 - db 사용여부 회의필요

 --%>

<!-- function  -->
<script src="./assets/css/jquery-3.6.1.js"></script>
<script type="text/javascript">
	
	// 아이디 중복체크(ajax)
	
	$(document).ready(function(){
		
		$('#mb_id').focusout(function(){
			let userId = $('#mb_id').val();
			
			$.ajax({
				url : "./IdCheckAjax.aim",
				type : "post",
				data : {userId: userId},
				dataType : 'json',
				success : function(result){
					if(result == 0){
						$("#checkId_ym").html('사용할 수 없는 아이디입니다.');
						$("#checkId_ym").attr('color','red');
					} else{
						$("#checkId_ym").html('사용할 수 있는 아이디입니다.');
						$("#checkId_ym").attr('color','green');
					} 
				},
				error : function(){
					alert("서버요청실패");
				}
			});
			
		});
		
	});
	




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
		var mb_tel1 = $('#mb_tel1').val();
		var mb_tel2 = $('#mb_tel2').val();
		var mb_tel3 = $('#mb_tel3').val();
		var mb_tel4 = $('#mb_tel4').val();
		var mb_nick = $('mb_nick').val();

		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		// 대문자,소문자,숫자,특수기호 포함 최소 8글자 여부
		// 특수기호는 "#?!@$%^&*-" 만 사용가능 필요시 추가하면 됍니다.
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		// 한글포함여부
		
 		if (mb_id == ""){
			alert('아이디를 입력해주세요');
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
// 		if (/(\w)\1\1/.test(mb_pw)) {
// 			// \1 추가/제거하면 반복횟수 +- 1
// 			alert('비밀번호에 같은 문자를 3번 이상 사용하실 수 없습니다.');
// 			document.fr.mb_pw.focus();
// 			return false;
// 		} 
		if (mb_pw.search(mb_id) > -1) {
			alert("비밀번호에 아이디가 포함되었습니다.");
			document.fr.mb_pw.focus();
			return false;
		} 

		if (mb_pw == mb_pw2) {
			// 일치시에는 문구 출력하지 않음
		} else {
			alert("비밀번호가 일치하지 않습니다.")
			return false;
		}
		if (mb_tel1 == ""){
			alert('통신사를 선택해주세요');
			document.fr.mb_tel1.focus();
			return false;
		} 
		if (mb_tel2 == ""){
			alert('전화번호 앞자리를 선택해주세요');
			document.fr.mb_tel2.focus();
			return false;
		} 
		if (mb_tel3 == ""){
			alert('전화번호를 입력해주세요');
			document.fr.mb_tel3.focus();
			return false;
		} 
		if (mb_tel4 == ""){
			alert('전화번호를 입력해주세요');
			document.fr.mb_tel4.focus();
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

		 

		alert("회원가입이 완료되었습니다");
		document.fr.submit();
	}
	
	

	
	
	


	</script>
</head>
<body>
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

<form action="./JoinAction.aim" method="post" name="fr" id="join">
<!-- mast body -->
<div id="mast-body">
	<div class="container">
		<!-- toparea -->
		<div class="toparea">
			<h2 class="title">AIM 회원가입<!-- 회원가입 --></h2>   
			<div class="step __2">
				<div class="step-desc">짠! 벌써<br>마지막 단계에요!<!-- 짠! 벌써<br>마지막 단계에요! --></div>
			</div>
		</div>
		<!-- //toparea -->

		<!-- contents -->
		<div class="contents">
			<!-- section : 정보입력 -->
			<div class="section __half">
				<h3 class="subject __underline">
					<em>회원정보입력<!-- 회원정보입력 -->
						<span class="__require-info __point-color"><small>*는 필수입력 항목입니다.<!-- *는 필수입력 항목입니다. --></small></span>
					</em>
				</h3>
				<!-- 아이디 -->
				
				<div class="row _none" id="div-cstNm">
					<div class="col-md">
						<label for="cstNm"><em class="__point-color">*</em>아이디<!-- 아이디 --></label>
					</div>
					<div class="col-md">
						<div class="form-wrap __normal">
							<div class="ui-input">
								<input type="text" id="mb_id" name="mb_id" title="아이디를 입력해주세요." maxlength="12"> <!-- 아이디를 입력해주세요 -->
								<span class="placeholder">영문으로 입력해주세요.<!-- 한글 또는 영문으로 입력해주세요. --></span>
								<font id="checkId_ym" size="2"></font>
							</div>
						</div>
					</div>
				</div>
				<!-- 아이디 -->
				<div class="section rowgroup" id="div-elcAdd">
					<!-- 이름 -->
					<div class="row">
						<div class="col-md">
							<label for="elcAdd"><em class="__point-color">*</em>이름<!-- 본인 이름 --></label>
						</div>
						<div class="col-md">
							<div class="form-wrap __normal __x1">
								<div class="inner">
									<div class="ui-input">
										<input type="text" id="mb_name" name="mb_name" title="이름을 입력해주세요." class="" maxlength="10"><!-- 이름을 입력해주세요. -->
										<span class="placeholder">이름을 입력해주세요.<!-- 이름을 입력해주세요. --></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 닉네임 -->
					<div class="row">
						<div class="col-md">
							<label for="ctfMg"><em class="__point-color">*</em>닉네임<!-- 닉네임 --></label>
						</div>
						<div class="col-md">
							<div class="form-wrap __normal __x1">
								<div class="inner">
									<div class="ui-input">
										<input type="text" id="mb_nick" name="mb_nick" maxlength="10" title="닉네임을 입력해주세요." class=""><!-- 닉네임을 입력해주세요. -->
										<span class="placeholder">닉네임을 입력해주세요.<!-- 닉네임을 입력해주세요. --></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 이메일 -->
				<div class="row _none" id="div-cstNm">
					<div class="col-md">
						<label for="cstNm"><em class="__point-color"></em>이메일<!-- 이메일 --></label>
					</div>
					<div class="col-md">
						<div class="form-wrap __normal">
							<div class="ui-input">
								<input type="text" id="mb_email" name="mb_email" title="이메일을 입력해주세요." maxlength="20"> <!-- 이메일 입력해주세요 -->
								<span class="placeholder">이메일을 입력해주세요.<!-- 이메일을 입력해주세요. --></span>
							</div>
						</div>
					</div>
				</div>
				<!-- 이메일 -->
				<!-- 비밀번호 -->
				<div class="row" id="div-pswd">
					<div class="col-md">
						<label for="onlCstPswd"><em class="__point-color">*</em>비밀번호<!-- 비밀번호 --></label>
						<!-- SSO페이지 수정 비밀번호규칙 안내문구 추가 MYENG 3.26 -->
						<div class="tooltip-container">
			              <button type="button" class="tooltip-trigger" onclick="$(this).parent().toggleClass('active');">설명보기</button>
			              <div class="tooltip-content">
			                <p class="tooltip-title"><b>비밀번호 입력 시 아래 규칙을 참고해주세요!</b></p>
			                <p>1. 비밀번호는 영문자,숫자,특수기호의 조합으로 <b>8~15자리</b>를 사용해야합니다.</p>
			                <p>2. 특수기호는 <b>? = . *  [ # ? ! @ $ % ^ & * -</b> 만 사용 가능합니다.</p>
<!-- 			                <p>3. 연속된 문자열을 <b>3자 이상</b> 사용할 수 없습니다.</p> -->
<!-- 			                <p>4. 동일한 문자열을 <b>3자 이상</b> 사용할 수 없습니다.</p> -->
			                <p>5. <b>아이디가 포함된</b> 비밀번호를 사용할 수 없습니다.</p>
			              </div>
			            </div>
					</div>
					<div class="col-md">
						<div class="form-wrap __normal">
							<div class="inner">
								<div class="ui-input">
									<input type="password" id="mb_pw" name="mb_pw" title="비밀번호를 입력해주세요." maxlength="20" class="" aria-autocomplete="list">
									<span class="placeholder">비밀번호를 입력해주세요.<!-- 비밀번호를 입력해주세요. --></span>
								</div>
							</div>
							<span class="__point-color"><small>8-20자리의 대소문자/숫자/특수기호를 함께 입력해주세요.<!-- 8-20자리의 대소문자/숫자/특수기호를 함께 입력해주세요. --></small></span>
							<div class="inner">
								<div class="ui-input">
									<input type="password" id="mb_pw2" name="mb_pw2" title="입력하신 비밀번호를 다시 한번 입력해주세요." maxlength="20">
									<span class="placeholder">입력하신 비밀번호를 다시 한번 입력해주세요.<!-- 입력하신 비밀번호를 다시 한번 입력해주세요. --></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 휴대폰 번호 -->
				<div class="row" id="div-mblNo">
					<div class="col-md">
						<label for="tcccDc"><em class="__point-color">*</em>휴대폰 번호<!-- 휴대폰 번호 --></label>
					</div>
					<div class="col-md">
						<div class="form-wrap __mobile __telecom">
							<div class="inner"> 
								<select title="통신사" id="mb_tel1" name="mb_tel1" class="ui-select"><!-- 통신사 -->
									
										<option value="1">SKT</option>
									
										<option value="2">KT</option>
									
										<option value="3">LGU+</option>
									
										<option value="4">SKT알뜰폰</option>
									
										<option value="5">KT알뜰폰</option>
									
										<option value="6">LGU+알뜰폰</option>
									
										<option value="9">ETC</option>
									
								</select>
								<select title="통신사번호" id="mb_tel2" name="mb_tel2" class="ui-select"><!-- 통신사번호 -->
									<option value="">선택<!-- 선택 --></option>
									
										<option value="010">010</option>
									
										<option value="011">011</option>
									
										<option value="016">016</option>
									
										<option value="017">017</option>
									
										<option value="018">018</option>
									
										<option value="019">019</option>
									
								</select>
								<div class="ui-input">
									<input id="mb_tel3" name="mb_tel3" type="tel" onkeydown="return fnNumOnly(event);" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" style="ime-mode:disabled;" maxlength="4" title="휴대폰 번호 중간자리"><!-- 휴대폰 번호 중간자리 -->
								</div>
								<div class="ui-input">
									<input id="mb_tel4" name="mb_tel4" type="tel" onkeydown="return fnNumOnly(event);" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" style="ime-mode:disabled;" maxlength="4" title="휴대폰 번호 뒷자리"><!-- 휴대폰 번호 뒷자리 -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 생년월일 -->
				<div class="row" id="div-bird">
					<div class="col-md">
						<label for="birthday-y"><em class="__point-color">*</em>생년월일<!-- 생년월일 --></label>
					</div>
					<div class="col-md">
						<div class="form-wrap __date ui-check-date">
							<select id="mb_birth1" name="mb_birth1" class="ui-select" title="년도" data-default-option="년도" data-unit="y"><option value="">년도</option><option value="2022">2022</option><option value="2021">2021</option><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option></select>
							<select id="mb_birth2" name="mb_birth2" class="ui-select" title="월" data-default-option="월" data-unit="m"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
							<select id="mb_birth3" name="mb_birth3" class="ui-select" title="일" data-default-option="일" data-unit="d"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
						</div>
					</div>
				</div>        
			</div>
			<!-- //section -->

			<!-- section : 마케팅정보수신동의 -->
			<div class="section __half __expiry" id="div-cstMrktRcvYn">     
				<h3 class="subject __underline">
					<em>마케팅 정보 수신동의<!-- 마케팅 정보 수신동의 --></em>
				</h3>
				<div class="ui-check __toggle">
					<input type="checkbox" id="all-agreement" data-trigger="#marketing-agreement" class="ui-allchk-btn ui-allchk-group1" data-separator-number="1">
					<label for="all-agreement">전체동의<!-- 전체동의 --></label>
				</div>
				<div class="row ui-allchk-wrap ui-allchk-group1" id="marketing-agreement" data-separator-number="1">
					<div class="col-md">
						<div class="form-wrap __agreement">
							<!-- 제휴사 유효기간 설정 loop -->
							<div class="row" id="div-mbMrktRcvYn">    
								<div class="col-md">
									<label id="txt-lpointNm">수신방법</label>
								</div>
								<div class="col-md">
									<div class="ui-check">
										<input type="checkbox" id="mbMlRcvYn" name="mbMlRcvYn" class="ui-allchk-el ui-allchk-group1" data-separator-number="1">
										<label for="mbMlRcvYn" title="E-Mail">카카오톡<!-- 까톡~ --></label>
									</div>
									<div class="ui-check">
										<input type="checkbox" id="mbSmsRcvYn" name="mbSmsRcvYn" class="ui-allchk-el ui-allchk-group1" data-separator-number="1">
										<label for="mbSmsRcvYn" title="SMS">SMS<!-- SMS --></label>
									</div>

									<div class="description">
										<p>미 체크 시 마케팅 정보를 발송하지 않습니다.
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //section -->
<!-- 		<p>개인정보 유효기간은 고객님께서 해당 사이트를 탈퇴 시 파기됩니다.</p> -->
				</div>

			<!-- btn -->
			<div class="btn-area __center">
				<button type="button" class="ui-button __square-large __black" onclick="fnBack();">이전<!-- 이전 --></button>
				<button type="button" class="ui-button __square-large __point-color" id="delaychk" 
				onclick="chk();" style="background:#18315d;">다음<!-- 다음 --></button>
			</div>
		</div>
	</div>
</div>
</form>



<!-- Footer -->



<!-- 약관 -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>