<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function roomCdChange(e){
		var roomCd_seomyeon = ["","1","2","3"];
		var roomCd_haewoondae = ["","4","5","6"];
		var roomCd_daeyeon = ["","7","8","9"];
		var roomCd_sasang = ["","10","11","12"];
		var roomCd_dongrae = ["","13","14","15"];
		var target = document.getElementById("room");
		
		if(e.value == "1") var d = roomCd_seomyeon;
		else if(e.value == "2") var d = roomCd_haewoondae;
		else if(e.value == "3") var d = roomCd_daeyeon;
		else if(e.value == "4") var d = roomCd_sasang;
		else if(e.value == "5") var d = roomCd_dongrae;
		
		target.options.length = 0;
		
		for(x in d){
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
	function scheCheck(){
		if(document.sc.branchCd.value == ""){
			alert("지점을 선택해주세요");
			return false;
		}
		if(document.sc.sc_date.value == ""){
			alert("날짜를 선택해주세요");
			document.sc.sc_date.focus();
			return false;
		}
		if(document.sc.roomCd.value == ""){
			alert("상영관을 선택해주세요");
			document.sc.roomCd.focus();
			return false;
		}
		if(document.sc.movieCd.value == ""){
			alert("영화를 선택해주세요");
			document.sc.movieCd.focus();
			return false;
		}
		if(document.sc.starttime.value == ""){
			alert("상영시간을 선택해주세요");
			document.sc.starttime.focus();
			return false;
		}
		if(document.sc.endtime.value == ""){
			alert("상영종료시간을 선택해주세요");
			document.sc.endtime.focus();
			return false;
		}
		if(document.sc.runcount.value == ""){
			alert("상영횟수를 입력해주세요");
			document.sc.runcount.focus();
			return false;
		}
		if(isNaN(document.sc.runcount.value)){
			alert("상영횟수는 숫자로 입력해주세요");
			document.sc.runcount.focus();
			return false;
		}
		 if (confirm("등록 하시겠습니까?") == true){    //확인
			 document.sc.submit();
		 }else{   //취소
		     return false;
		 }		
	}
</script>
</head>
<body>
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp"/>

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp"/>
	
	<%
	//로그인 제어
	String mb_id = (String)session.getAttribute("mb_id");
	if(mb_id==null || !mb_id.equals("admin")){
		response.sendRedirect("./Main.aim");
		System.out.println("비정상적 접근 발생! IP : "+request.getRemoteAddr());
	}
	%>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- 게시판 -->
	<article>



	<form action ="./AdminScheAddAction.th" method="post" name="sc" >
		<div id="contents">
			<div class="movi_pre_list">
				<h3 class="tit_type0"><strong class="ty2 eng">AIM</strong> 스케줄 등록</h3>
			</div>
				<table class="tbl_form">
					<colgroup>
						<col style="width: 15%;">
						<col style="width: auto;">
					</colgroup>
				
		
			
				<tbody>
					<tr>
						<th scope="row" class="req1">지점</th>
						<td>
							<select title="영화관 선택" name="branchCd" onchange="roomCdChange(this)">
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
						<th scope="row" class="req1">날짜</th>
						<td>
							<input type="date"
						         name="sc_date"
						         value="${today }">
						</td>
					</tr>
					
					
						
					<tr>
						<th scope="row" class="req1">상영관</th>
						<td>
							<select name="roomCd" id="room">
							<option value="" selected disabled hidden>상영관선택</option>
							</select>
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
					
						<th scope="row" class="req1">상영시간</th>
						<td>
							<select title="상영시간 선택" name="starttime">
								<option value="" selected disabled hidden>상영시간 선택</option>
								<option value="09:00">09:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row" class="req1">상영종료시간</th>
						<td>
							<select title="상영시간 선택" name="endtime">
								<option value="" selected disabled hidden>상영종료시간 선택</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row" class="req1">상영횟수</th>
						<td>
							<input type="text" name="runcount">
						</td>
					</tr>
						
				</tbody>
			</table>
				<div class="btn_btm_wrap" align="center">
						<input type="button" class="btn_col3 ty6" value="취소하기" onclick="location.href='./AdminPage.aim';">
					<input type="button" value="등록" style="background-color:#18315D" class="btn_col2 ty6" onclick="scheCheck();">
				</div>
				
		</div>
	
	</form>
		<div class="clear"></div>
			<div id="page_control">
		</div>
	</article>
	<!-- 게시판 -->

	<!-- 하단배너 -->
	<jsp:include page="../inc/loginform_bottom_banner.jsp" />
	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>