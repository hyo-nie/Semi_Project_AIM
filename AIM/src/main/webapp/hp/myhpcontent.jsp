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
				<form action="./HpAdminLoginAction.hp?hp_bno=${dto.hp_bno}&pageNum=${pageNum }&hp_re_ref=${dto.hp_re_ref }&hp_re_seq=${dto.hp_re_seq}&hp_re_lev=${dto.hp_re_lev }"
					method="post">
				<div class="tab_con">
					<h3 class="hidden">문의 내용 목록</h3>
					<ul class="tab_wrap inner">
						<li class="active"><div class="tab_con ty4">
								<h4 class="hidden">문의 내용 목록</h4>
								
								<table class="tbl_dtal" summary="문의 내용 목록">
									<caption>문의 내용 목록</caption>
									<colgroup>
										<col style="width: auto;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" name="hp_subject">${dto.hp_subject }</th>
										</tr>
									</thead>
									<tbody>
										<tr class="tb_info">
											<td>
													<span class="tit">작성자</span>
													<span class="cont">${dto.mb_id }</span>
													<span class="tit">등록일</span>
													<span class="cont">${dto.hp_date }</span>
													<span class="tit">글번호</span>
													<span class="cont">${requestScope.dto.hp_bno }</span>
											</td>
										</tr>
										<tr class="tb_content" >
											<td><div id="divNoticeContents" >
												<p> 
													<font size ="3" face="맑은 고딕">
														문의 종류 : ${dto.hp_select }
														<c:set var="hp_select" value="분류선택"/>
														<c:forEach var="dto" items="${HpList }">
															<c:choose>
																<c:when test="${dto.hp_select == 0 }">
																	<c:set var="hp_select" value="분류선택"/>
																</c:when>
																<c:when test="${dto.o_status == 1 }">
																	<c:set var="hp_select" value="영화관"/>
																</c:when>
																<c:when test="${dto.o_status == 2 }">
																	<c:set var="hp_select" value="영화"/>
																</c:when>
																<c:when test="${dto.o_status == 3 }">
																	<c:set var="hp_select" value="멤버십"/>
																</c:when>
																<c:when test="${dto.o_status == 4 }">
																	<c:set var="hp_select" value="예매/결제"/>
																</c:when>
																<c:when test="${dto.o_status == 5 }">
																	<c:set var="hp_select" value="이벤트"/>
																</c:when>
																<c:when test="${dto.o_status == 6 }">
																	<c:set var="hp_select" value="홈페이지/모바일"/>
																</c:when>
																<c:when test="${dto.o_status == 7 }">
																	<c:set var="hp_select" value="개인정보"/>
																</c:when>
															</c:choose>
														</c:forEach>
													</font>
												</p>
												<p> 
													<font size="3" face="맑은 고딕">
														문의 사항 : 
														<br>
													</font>
													<font size="2" face="맑은 고딕">
														${dto.hp_content }	
													</font>
												</p>
												</div>
											</td>
										</tr>
										<tr class="tb_link">
											<td>
											<span class="tb_next"></span>
											</td>
										</tr>
									</tbody>
								
								</table>
									 <input type="hidden" name="mb_id" id="mb_id" value="${mdto.mb_id }">
									 <input type="hidden" name="mb_pw" id="mb_pw" value="${mdto.mb_pw }">
									
									
									<div class="btn_btm_wrap">
									 <input type="button" value="문의 내용 수정" class="btn_col3 ty6" 
									 	onclick="location.href='./MyHpUpdate.hp?hp_bno=${dto.hp_bno}&pageNum=${pageNum }';" >
  	        						 <input type="button" style="background-color:#18315D" value="문의 내용 삭제" class="btn_col2 ty6" 
  	        						 	onclick="location.href= './MyHpDeleteCheck.hp?hp_bno=${dto.hp_bno}&pageNum=${param.pageNum }';">
									 <a href="./MyHpList.hp" class="btn_col3 ty6">문의 목록</a>
  	        						<c:if test="${mb_id.equals('admin') }">
  	        						 <input type="submit" style="background-color:#18315D" value="문의 답글 달기" class="btn_col2 ty6">
  	        						</c:if>
									 
								</div>
							</div>
						</li>
					</ul>
				</div>
				</form>
			</li>
		
		<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
		</ul>
	</div>
  	   
  	
  	
  	</table>
</body>
</html>