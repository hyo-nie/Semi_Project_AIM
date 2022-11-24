<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp"/>
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp" />
	<!-- 사이드 퀵메뉴 -->
	<jsp:include page="../inc/side_quick_menu.jsp" />
</head>
<body>

	<div id="contents" class="contents_customer area__movingbar litype5"
		style="">
		<div class="title_top">
			<h2 class="tit">고객센터</h2>
		</div>
		<ul class="tab_wrap outer actionmovingbar">
			
			<li class="active"><button type="button" class="tab_tit"
					style="width: 33.33%; left: 0%;">
					<span>공지사항</span>
				</button>
				
				<div class="tab_con">
					<h3 class="hidden">공지사항</h3>
					<ul class="tab_wrap inner">
						<li class="active">
							<div class="tab_con ty3">
								<h4 class="hidden">전체 공지</h4>
					<form action="./NtUpdatePro.nt?nt_bno=${dto.nt_bno }&pageNum=${pageNum }" method="post" enctype="multipart/form-data">
						<table class="tbl_list text_c" summary="공지사항에 대한 표입니다">
						<caption>공지 사항을 작성해주세요</caption>
						<colgroup>
							<col style="width: 15%;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="req">제목</th>
								<td>
									<div class="bx_textarea">
										<input type="text" class="ty2 w_full" placeholder="제목을 입력해주세요" 
										title="공지사항 제목입력" name="nt_subject" value="${dto.nt_subject }">
											
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="req">내용</th>
								<td>
									<div class="bx_textarea">
										<textarea class="ty2" cols="10" rows="10" name="nt_content" 
										title="공지사항 내용을 입력해주세요">${dto.nt_content }</textarea>
								</div></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="mb_id" id="mb_id" value="${dto.mb_id }">
					<input type="hidden" name="mb_pw" id="mb_pw" value="${dto.mb_pw }">
					<input type="submit" class="btn_col3 ty6" value="수정하기">
					<a href="./NtList.nt" class="btn_col2 ty6">공지사항 목록</a>
								</form>
								
							</div></li>
						
					</ul>
				</div></li>
				
			<li><button type="button" class="tab_tit" style="width: 33.33%; left: 33.33%;" onclick="location.href='./hp/boardhp.jsp';">
					<span>1:1문의</span>
				</button></li>
			<li><button type="button" class="tab_tit" style="width: 33.33%; left: 66.67%;" onclick="location.href='./MyHpList.hp';">
					<span>문의 내용 목록</span>
				</button></li>
		
			<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
		</ul>
	</div>
</body>
</html>