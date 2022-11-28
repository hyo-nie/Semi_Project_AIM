<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function rewrite(){
		if(document.rr.r_name.value == ""){
			alert("작성자를 입력해주세요");
			document.rr.r_name.focus();
			return false;
		}
		if(document.rr.r_text.value == ""){
			alert("답변을 입력해주세요");
			document.rr.r_text.focus();
			return false;
		}
		if(document.rr.r_mb_pw.value == ""){
			alert("비밀번호를 입력해주세요");
			document.rr.r_mb_pw.focus();
			return false;
		}
		if (confirm("등록 하시겠습니까?") == true){
			document.rr.submit();
			alert("답변완료");
		}else{   //취소
		     return false;
		}
	}
</script>
</head>
<body>

	<%
		/* 로그인 제어! 답글작성 페이지는 admin(관리자)만 접근 가능 */
			String id = (String) session.getAttribute("mb_id");
			if (id == null || !id.equals("admin")) {
				response.sendRedirect("./Login.aim");
			}
	%>
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp" />
	
	<br><br><br><br><br><br><br><br><br>
	
	<form action="./AdminRentalReWriteAction.th" method="post" name="rr">
	
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
						<input type="text" name ="r_name" value="[${dto.r_name }]님에 대한 답변">
					</td>
				</tr>
				<tr>
					<th scope="row" class="req1">답변</th>
					<td>
						 <textarea rows="10" cols="20" name="r_text"></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row" class="req1">ID</th>
					<td>
						 <input readonly type="text" name ="r_mb_id" value="${sessionScope.mb_id }">
					</td>
				</tr>
				<tr>
					<th scope="row" class="req1">비밀번호</th>
					<td>
						 <input readonly type="password" name ="r_mb_pw" value="${dto.r_mb_pw }">
					</td>
				</tr>
				
					
			</tbody>
			
		</table>
		<div class="btn_btm_wrap">
			
			<input type="button" value="등록" style="background-color:#18315D" class="btn_col2 ty6" onclick="rewrite();">
		</div>
		</div>
	
	</form>
</body>
</html>