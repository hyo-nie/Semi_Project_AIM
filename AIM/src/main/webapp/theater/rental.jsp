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
								placeholder="내용에 개인정보(카드번호, 계좌번호, 주민번호)가 포함되지 않도록 유의하여 입력해주세요."></textarea>
								
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
		
	
			
			<div class="submit">
				<div class="btn_btm_wrap">
					<input type="button" class="btn_col3 ty6" value="취소하기" onclick="location.href='./Main.aim';">
					<input type="button" value="등록" style="background-color:#18315D" class="btn_col2 ty6" onclick="rentalCheck();">
				</div>
			</div>
		</form>
	</div>

	
	
</body>
</html>