<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 관리자 추천 영화 정보 등록 페이지</title>

<script type="text/javascript">
	function movieCdCheck(){
		alert('test');
		
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
<jsp:include page="../inc/topbanner.jsp"/>
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


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


<form action="./AdminMovieRecommend.mv" method="post" name="cd" >

		<h3>추천영화 등록 페이지</h3>
		
		<br>
				
		<table border="1">
						<tr>
				<th>영화코드</th>
				<th>영화이름</th>
				<th>개봉일</th>
				<th>장르</th>
				<th>감독</th>
				<th>포스터</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="movieCd">
				</td>
				<td>
					<input type="text" name="movieNm">
				</td>
				<td>
					<input type="text" name="openDt">
				</td>
				<td>
					<input type="text" name="genreNm">
				</td>
				<td>
					<input type="text" name="directors">
				</td>
				<td>
					<input type="text" name="poster">
				</td>
			</tr>
			<tr>
				<th>관람등급</th>
				<th>showTm</th>
				<th>배우</th>
				<th>contents</th>
				<th>box rank</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="watchGradeNm">
				</td>
				<td>
					<input type="text" name="showTm">
				</td>
				<td>
					<input type="text" name="actors">
				</td>
				<td>
					<input type="text" name="contents">
				</td>
				<td>
					<input type="text" name="boxrank">
				</td>
			</tr>
		</table>
		
		
		<br><br>
	
		<input type="button" value="모두 저장" onclick="movieCdCheck();">
		<input type="button" value="취소" onclick="history.back();">
			
</form>


</body>
</html>