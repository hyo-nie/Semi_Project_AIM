<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AIM (All In Movie!) - 고객센터</title>
<script type="text/javascript">
	function pwCheck(){
		if(document.hp.mb_pw.value == ""){
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
	<!-- 사이드 퀵메뉴 -->
	<jsp:include page="../inc/side_quick_menu.jsp" />

	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp" />
	
	<br><br><br><br><br><br><br><br><br>
	
	<form action="./HpPwCheckAction.hp?hp_bno=${param.hp_bno }&pageNum=${param.pageNum }" method="post" name="hp">
	<input type="hidden" name="mb_id" value="${sessionScope.mb_id }">
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
						<input type="password" name ="mb_pw">
						
					</td>
				</tr>
				
			</tbody>
		</table>
			<div class="btn_btm_wrap">
				<a href="./MyHpList.hp" class="btn_col3 ty6">공지 목록</a>
				<input type="submit" style="background-color:#18315D" value="비밀번호 확인" class="btn_col2 ty6" onclick='pwCheck();'>
			</div>
			
		</div>
	
	</form>
	<!-- 푸터 -->
	<jsp:include page="../inc/footer.jsp" />
	
</body>
</html>