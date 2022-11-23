<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - ALL IN MOVIE</title>
</head>
<body>
<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp" />
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp" />
	
	<br><br><br><br><br><br><br>
	
<form action="./RentalAddAction.th" method="post">
	
	<div id="contents">
		<div class="title_top">
			<h2 class="tit">단체관람/대관문의</h2>
		</div>
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
						
						<input type="text" name="r_text" >
				
					</td>
				</tr>
					
			</tbody>
		</table>
		
		<div class="title_top">
			<h2 class="tit">신청자 정보</h2>
		</div>
		<table>
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
			</tbody>
		</table>
			<div class="btn_btm_wrap">
				<a href="#none" class="btn_col3 ty6">취소</a>
				<input type="submit" value="등록" class="btn_col2 ty6">
			</div>
			
		</div>
	
	</form>
</body>
</html>