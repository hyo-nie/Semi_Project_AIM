<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function pwCheck(){
		if(document.sc.r_mb_pw.value == ""){
			alert("비밀번호를 입력하세요");
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
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp" />
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp" />
	
	<br><br><br><br><br><br><br>
	
	<form action="./AdminPwCheckAction.th?rno=${param.rno }&pageNum=${param.pageNum }" method="post" name="rc">
	<input type="hidden" name="r_mb_id" value="${sessionScope.mb_id }">
	<div id="contents">
		<div class="title_top">
			<h2 class="tit">문의글 비밀번호 확인</h2>
		</div>
			<table class="tbl_form">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: auto;">
				</colgroup>

			<tbody>
	
				<tr>
					<th scope="row" class="req1">비밀번호</th>
					<td>
						<input type="password" name ="r_mb_pw">
						
					</td>
				</tr>
				
			</tbody>
		</table>
			<div class="btn_btm_wrap">
				<a href="#" class="btn_col3 ty6">취소</a>
				<input type="submit" value="비밀번호 확인" class="btn_col2 ty6" onclick='pwCheck();'>
			</div>
			
		</div>
	
	</form>
</body>
</html>