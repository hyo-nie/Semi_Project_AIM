<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - ALL IN MOVIE</title>

<script type="text/javascript">
	function rentalCheck(){
		
		if(document.rt.branchCd.value == ""){
			alert("지점을 선택해주세요");
			return false;
		}
		if(document.rt.r_class.value == ""){
			alert("문의 유형을 선택해주세요");
			return false;
		}
		if(document.rt.r_people.value == ""){
			alert("인원수를 선택해주세요");
			document.rt.r_people.focus();
			return false;
		}
		if(isNaN(document.rt.r_people.value)){
			alert("인원수는 숫자로 입력해주세요");
			document.rt.r_people.focus();
			return false;
		}
		
		if(document.rt.hopeday.value == ""){
			alert("희망일을 선택해주세요");
			document.rt.hopeday.focus();
			return false;
		}
		if(document.rt.hopestart.value == ""){
			alert("희망시간을 선택해주세요");
			document.rt.hopestart.focus();
			return false;
		}
		if(isNaN(document.rt.hopestart.value)){
			alert("희망시간은 숫자로 입력해주세요");
			document.rt.hopestart.focus();
			return false;
		}
		if(document.rt.hopeend.value == ""){
			alert("희망시간을 선택해주세요");
			document.rt.hopeend.focus();
			return false;
		}
		if(isNaN(document.rt.hopeend.value)){
			alert("희망시간은 숫자로 입력해주세요");
			document.rt.hopeend.focus();
			return false;
		}
		if(document.rt.movieCd.value == ""){
			alert("영화를 선택해주세요");
			document.rt.movieCd.focus();
			return false;
		}
		if(document.rt.r_name.value == ""){
			alert("신청자 정보를 입력해주세요");
			document.rt.r_name.focus();
			return false;
		}
		if(document.rt.r_tel.value == ""){
			alert("신청자 정보를 입력해주세요");
			document.rt.r_tel.focus();
			return false;
		}
		if(isNaN(document.rt.r_tel.value)){
			alert("전화번호는 숫자로 입력해주세요");
			document.rt.r_tel.focus();
			return false;
		}
		if(document.rt.r_mb_pw.value == ""){
			alert("신청자 정보를 입력해주세요");
			document.rt.r_mb_pw.focus();
			return false;
		}
		if (confirm("등록 하시겠습니까?") == true){
			document.rt.submit();
			alert("문의내역은 마이페이지에서 확인하실 수 있습니다.");
		}else{   //취소
		     return false;
		}
	}
</script>
</head>
<body>

	<%
		/* 로그인 제어! 회원만 접근 가능 */
			String id = (String) session.getAttribute("mb_id");
			if (id == null) {
				response.sendRedirect("./Login.aim");
			}
	%>
<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp" />
	
	<br><br><br><br><br><br><br><br><br><br><br><br>

	<div id="contents">
		<div class="con_tit ty2">
			<h3 class="tit">단체관람/대관문의</h3>
		</div>
		<form action="./RentalAddAction.th" method="post" name="rt">
			<input type="hidden" name="r_mb_id" value="${sessionScope.mb_id }">
			<table class="tbl_form">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: auto;">
				</colgroup>
			
	
		
				<tbody>
					<tr>
						<th scope="row" class="req1">영화관</th>
						<td>
							<select title="영화관 선택" name="branchCd">
							<option value="" selected disabled hidden>영화관선택</option>
								<option value="1">서면점</option>
								<option value="2">해운대점</option>
								<option value="3">대연점</option>
								<option value="4">사상점</option>
								<option value="5">동래점</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th scope="row" class="req1">분류</th>
						<td>
	
							<select title="단체대관" name="r_class">
								<option value="" selected disabled hidden>분류</option>
								<option value="group">단체관람</option>
								<option value="rent">대관</option>
				
							</select>
						</td>
					</tr>
					
					
						
					<tr>
						<th scope="row" class="req1">인원수</th>
						<td>
							<input type="text" name ="r_people" maxlength="2">
							<span>명</span>
							
						</td>
					</tr>
					<tr>
						<th scope="row" class="req1">희망일</th>
						<td>
							<input type="date" name="hopeday" value="${today }">
						</td>
					</tr>
					<tr>
						<th scope="row" class="req1">희망시간</th>
						<td>
							<input type="text" title="시작시간" name="hopestart" maxlength="2"> 시 ~ 
							<input type="text" title="끝나는시간" name="hopeend" maxlength="2"> 시 사이
						</td>
					</tr>
					<tr>
						<th scope="row" class="req1">영화</th>
						<td>
							<select name="movieCd">
							<option value="" selected disabled hidden>영화 선택</option>
								<c:forEach var="movie" items="${movieList }">
									<option value="${movie.movieCd}" >
										${movie.movieNm }
									</option>
								</c:forEach>
	
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row" class="req1">내용</th>
						<td>
							<div class="bx_textarea">
								<textarea class="ty2" cols="10" rows="10" name="r_text"  id="hp_content"
								placeholder="내용 및 첨부파일에 개인정보(카드번호, 계좌번호, 주민번호)가 포함되지 않도록 유의하여 입력해주세요."></textarea>
								
							</div>
						
					
						</td>
					</tr>
						
				</tbody>
			</table>
		
			<div class="con_tit ty2">
				<h3 class="tit">신청자 정보</h3>
			</div>
			<table class="tbl_form">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: auto;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="req1">성명</th>
						<td>
							<input type="text" name="r_name" value="${memberInfo.mb_name}">
						</td>
					</tr>
					<tr>
						<th scope="row" class="req1">전화번호</th>
						<td>
							<input type="text" name="r_tel" value="${memberInfo.mb_tel}">
						</td>
					</tr>
					<tr>
						<th scope="row" class="req1">비밀번호</th>
						<td>
							<input type="password" name="r_mb_pw">
						</td>
					</tr>
				</tbody>
			</table>
		
		
		
		
			<div class="con_tit ty2">
				<h4 class="tit">개인정보 수집에 대한 동의</h4>
				<div class="group_rgt">
					<p class="txt_form"> 문의를 통해 아래의 개인정보를 수집합니다. 수집된 개인정보는 문의 외 목적으로 사용하지 않습니다. </p>
				</div>
			</div>
		<div class="privacy_wrap">
			<div class="txtarea">
				<a class="focus_textarea" href="javascript:void(0);">개인정보의 수집목적 및 항목</a><br>
					① 수집 목적 : 원활한 고객 상담, 불편사항 및 문의사항 관련 의사소통 경로 확보<br>
					② 수집 항목<br>
					*필수입력사항<br>
					- 이용자 식별을 위한 항목 : 성명, 연락처, 이메일, 아이디(로그인 시 수집)<br>
					<span class="color_red"><br>
					개인정보의 보유 및 이용기간<br>
					입력하신 개인정보는 소비자 보호에 관한 법률 등 관계 법률에 의해 다음과 같이 보유합니다.<br>
					보유기간 : 문의접수 후 처리 완료시점으로 부터 3년</span><br><br>
					※ 1:1문의 서비스 제공을 위한 최소한의 개인정보이며 거부할 수 있습니다. 다만, 수집에 동의하지 않을 경우 서비스 이용이 제한됩니다
			</div>
			<div class="bx_inp" id="hp_agree">
				<input type="radio" name="hp_agree" id="radio10">
					<label for="radio10">동의 </label>
				<input type="radio" name="hp_agree" id="radio11" checked>
					<label for="radio11">동의하지않음</label>
			</div>
			<div class="submit">
				<div class="btn_btm_wrap">
					<a href="#none" class="btn_col3 ty6">취소</a>
					<input type="button" value="등록" class="btn_col2 ty6" onclick="rentalCheck();">
				</div>
			</div>
		</form>
	</div>

	
	
</body>
</html>