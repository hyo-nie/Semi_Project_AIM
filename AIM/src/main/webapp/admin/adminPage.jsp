<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM - 관리자 페이지</title>

<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp"/>
<!-- 상위 배너 -->
<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp"/>

</head>
<body>

	<%
	// admin 전용 페이지 로그인 제어
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



<!-- 	스토어에서 쌔빈 코드 -->	<!-- css : /* ADMINPAGE ==== , /* ADMINPAGE */:x -->
<!-- 	<div id="contents" class="contents_admin_home"> -->
<!-- 		<div class="title_top"> -->
<!-- 			<h2 class="tit01"><strong class="tit02">AIM </strong> 관리자 페이지</h2> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 상단 이름 -->
<div class="movi_pre_list">
<h3 class="tit_type0"><strong class="ty2 eng">AIM</strong> 관리자 페이지</h3>
</div>
<!-- 상단 이름 -->

<!-- 내용 시작 css: /* ADMINTABLE*/ -->
	<table class="tbl_lista text_c">
		<colgroup>
			<col style="width: 33%;">
			<col style="width: 33%;">
<%-- 			<col style="width: auto;"> --%>
			<col style="width: 33%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">영화</th>
				<th scope="col">영화관</th>
				<th scope="col">스토어</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td><a class="tit_info" href="./AdminMovieInsert.mv">API로 영화 정보 저장</a></td>
					<td><a href="./AdminScheAdd.th">스케줄 등록하기</a></td>
					<td><a class="tit_info" href="./AdminStoreAdd.ad">스토어 상품 등록</a></td>
				</tr>		
				<tr>
					<td><a class="tit_info" href="./AdminMovieList.mv">등록 영화 LIST</a></td>
					<td><a href="./AdminScheList.th">관리자 스케줄 LIST</a></td>
					<td><a class="tit_info" href="./AdminStoreList.ad">스토어 등록 상품 LIST</a></td>
				</tr>	
				<tr>
					<td><a class="tit_info" href="./AdminMovieInsert2.mv">추천영화 정보 저장</a></td>
					<td><a href="./AdminRentalList.th">관리자 대관문의 리스트</a></td>
					<td></td>
				</tr>
		</tbody>
	</table>
<!-- 내용 끝 -->
<!-- 	스토어에서 쌔빈 코드 -->



	
<!-- 페이지 좌우 여백 -->
		</div>
</div>
<!-- 페이지 좌우 여백 -->	

<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />
	
</body>
</html>