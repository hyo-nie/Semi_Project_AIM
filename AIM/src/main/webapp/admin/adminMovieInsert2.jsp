<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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


</head>

<jsp:include page="../inc/include.jsp" />

<body>

<jsp:include page="../inc/nav_bar.jsp" />

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