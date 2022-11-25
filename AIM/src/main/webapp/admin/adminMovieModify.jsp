<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 관리자 영화 정보 수정 페이지</title>

<script type="text/javascript">
	function movieCdCheck(){
		if(document.cd.movieCd.value == ""){
			alert('영화코드를 입력하세요');
			document.cd.movieCd.focus();
			return false;
		} else
		document.cd.submit();
	}
</script>

<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp"/>
<!-- 상위 배너 -->
<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp"/>

</head>
<body>

	<%
	//로그인 제어
	String mb_id = (String)session.getAttribute("mb_id");
	if(mb_id==null || !mb_id.equals("admin")){
		response.sendRedirect("./Login.aim");
		System.out.println("비정상적 접근 발생! IP : "+request.getRemoteAddr());
	}
	%>

	
<!-- 페이지 좌우 여백 틀 -->
<div id="contents" class="contents_movie_list">
	<h2 class="hidden">영화목록</h2>
		<div class="movie_screen_box">
<!-- 페이지 좌우 여백 틀 -->	


<!-- 페이지 상단 여백 -->
<br><br><br><br><br><br><br><br><br><br><br><br>
<!-- 페이지 상단 여백 -->



<!-- 상단 이름 -->
<div class="movi_pre_list">
<h3 class="tit_type0"><strong class="ty2 eng">AIM</strong> 영화 정보 수정 페이지</h3>
</div>
<!-- 상단 이름 -->


<form action="./AdminMovieModifyPro.mv" method="post" name="cd" >
<!-- 내용시작	 -->
			<table class="tbl_lista text_c">

			<tr>
				<th>영화코드</th>
				<th><input type="text" name="movieCd" value="${dto.movieCd }"></th>
				<th>영화이름</th>
				<th><input type="text" name="movieNm" value="${dto.movieNm }"></th>
				<th>개봉일</th>
				<th><input type="text" name="openDt" value="${dto.openDt }"></th>
			</tr>
			<tr>
				<th>장르</th>
				<th><input type="text" name="genreNm" value="${dto.genreNm }"></th>
				<th>감독</th>
				<th><input type="text" name="directors" value="${dto.directors }"></th>
				<th>포스터</th>
				<th><input type="text" name="poster" value="${dto.poster }"></th>
			</tr>
			<tr>
				<th>관람등급</th>
				<th><input type="text" name="watchGradeNm" value="${dto.watchGradeNm }"></th>
				<th>showTm</th>
				<th><input type="text" name="showTm" value="${dto.showTm }"></th>
				<th>배우</th>
				<th><input type="text" name="actors" value="${dto.actors }"></th>
			</tr>
			<tr>
				<th>contents</th>
				<th><input type="text" name="contents" value="${dto.contents }"></th>
				<th>box rank</th>
				<th><input type="text" name="boxrank" value="${dto.boxrank }"></th>
			</tr>
		</table>

		<br><br>
	<div align="center">
		<input class="btn" type="button" value="모두 저장" onclick="movieCdCheck();" style="color:#fff; background:#18315D; width:100px; height:40px; margin:5px; border-radius:5px; border:1px solid #fff;"> 
		<input class="btn" type="button" value="취소" onclick="history.back();" style="color:#fff; background:#8C8C8C; width:100px; height:40px; margin:5px; border-radius:5px; border:1px solid #fff;">
	</div>	
</form>
<!-- 내용끝	 -->


	
<!-- 페이지 좌우 여백 -->
		</div>
</div>
<!-- 페이지 좌우 여백 -->	

<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />





</body>
</html>