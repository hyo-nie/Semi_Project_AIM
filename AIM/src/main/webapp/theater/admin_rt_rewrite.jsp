<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		/* 로그인 제어! 스토어 상품 등록 페이지는 admin(관리자)만 접근 가능 */
			String id = (String) session.getAttribute("mb_id");
			if (id == null || !id.equals("admin")) {
				response.sendRedirect("./Login.aim");
			}
	%>
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp"/>
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp" />
	
	<form action="./AdminRentalReWriteAction.th" method="post">
	
	<input type="hidden" name="rno" value="${param.rno }">
	<input type="hidden" name="pageNum" value="${param.pageNum }">
	<input type="hidden" name="r_re_ref" value="${param.r_re_ref }">
	<input type="hidden" name="r_re_lev" value="${param.r_re_lev }">
	<input type="hidden" name="r_re_seq" value="${param.r_re_seq }">
	
	<input type="hidden" name="branchCd" value="${dto.branchCd }">
	<input type="hidden" name="r_class" value="${dto.r_class }">
	<input type="hidden" name="r_people" value="${dto.r_people }">
	<input type="hidden" name="hopeday" value="${dto.hopeday }">
	<input type="hidden" name="hopestart" value="${dto.hopestart }">
	<input type="hidden" name="hopeend" value="${dto.hopeend }">
	<input type="hidden" name="movieCd" value="${dto.movieCd }">
	<input type="hidden" name="r_tel" value="${dto.r_tel }">
	
	
	<div id="contents">
		<div class="title_top">
			<h2 class="tit">단체관람/대관문의 답글 작성</h2>
		</div>
			<table class="tbl_form">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: auto;">
				</colgroup>
			
	
		
			<tbody>
			
				<tr>
					<th scope="row" class="req1">작성자</th>
					<td>
						<input type="text" name ="r_name">
					</td>
				</tr>
				<tr>
					<th scope="row" class="req1">답변</th>
					<td>
						 <textarea rows="10" cols="20" name="r_text"></textarea>
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