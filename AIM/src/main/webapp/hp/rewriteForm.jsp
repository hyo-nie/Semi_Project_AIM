<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp"/>
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp" />
	<!-- 사이드 퀵메뉴 -->
	<jsp:include page="../inc/side_quick_menu.jsp" />
	
 <div id="contents" class="contents_customer area__movingbar litype5"
		style="margin-top: 120px;">
		<div class="title_top">
			<h2 class="tit">고객센터</h2>
		</div>
		<ul class="tab_wrap outer actionmovingbar">
			<li>
				<button type="button" class="tab_tit" style="width: 33.33%; left: 0%;" onclick="location.href='./NtList.nt';">
					<span>공지 사항</span>
				</button>
			</li>
			<li><button type="button" class="tab_tit"
					style="width: 33.33%; left: 33.33%;" onclick="location.href='./HpLogin.hp';">
					<span>1:1 문의</span>
				</button></li>
			<li class="active"><button type="button" class="tab_tit"
					style="width: 33.33%; left: 66.67%;">
					<span>문의 내용 목록</span>
				</button>
				<div class="tab_con">
					<h3 class="hidden">문의 내용 목록</h3>
					<ul class="tab_wrap inner">
						<li class="active"><div class="tab_con ty4">
								<h4 class="hidden">문의 내용 목록</h4>
								<form action="./HpReWriteAction.hp?pageNum=${param.pageNum }" method="post">
								<table class="tbl_dtal" summary="문의 내용 목록">
						<caption>문의 내용을 작성해주세요</caption>
						<colgroup>
							<col style="width: 15%;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							
							
							
							<tr>
								<th scope="row" class="req">제목</th>
								<td>
									<div class="bx_textarea">
										<input type="text" class="ty2 w_full" placeholder="제목을 입력해주세요" title="답변 제목입력" name="hp_subject" 
										value="↪ [답변] : [${dto.hp_subject }]">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="req">내용</th>
								<td>
									<div class="bx_textarea">
										<textarea class="ty2" cols="10" rows="10" name="hp_content" 
										title="답변 내용을 입력해주세요">${dto.hp_content } &#10;&#10;&#10;고객센터 답변 : &#10;&#10;&#10;</textarea>
										</p>
								</div></td>
							</tr>
						</tbody>
					</table>

					<input type="hidden" name="mb_id" id="mb_id" value="${mdto.mb_id }">
					<input type="hidden" name="mb_pw" id="mb_pw" value="${mdto.mb_pw }">
					<input type="hidden" name="hp_bno" value="${param.hp_bno }">
					<input type="hidden" name="hp_re_ref" value="${param.hp_re_ref }">
					<input type="hidden" name="hp_re_lev" value="${param.hp_re_lev }">
					<input type="hidden" name="hp_re_seq" value="${param.hp_re_seq }">
					<input type="submit" style="background-color:#18315D" value="작성하기" class="btn_col2 ty6">
					<input type="button" class="btn_col3 ty6" value="문의목록" onclick="location.href='./MyHpList.hp';" >
					</form>
								
								
						
							</div></li>
					</ul>
				</div></li>
		
		<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
		</ul>
	</div>
  	   
  	
  	
  	</table>
</body>
</html>