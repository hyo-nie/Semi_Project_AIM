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

	<%
			String id = (String) session.getAttribute("mb_id");

	%>
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp"/>
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp" />
	


<div id="contents" class="contents_customer area__movingbar litype5" style="margin-top: 120px;">
	<div class="title_top">
		<h2 class="tit">단체관람/대관문의</h2>
	</div>

	<div class="tab_con">
			<div class="tab_con ty4">
				<h4 class="hidden">전체 공지</h4>
				<table class="tbl_dtal" summary="공지사항 상세내용에 대한 표입니다">
				<caption>공지사항 상세내용</caption>
				<colgroup>
					<col style="width: auto;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">유형 : ${dto.r_class }</th>
					</tr>
				</thead>
				<tbody>
					<tr class="tb_info">
						<td>
							<span class="tit">영화관</span>
							<span class="cont">${dto.branch_name }</span>
							<span class="tit">희망일</span>
							<span class="cont">${dto.hopeday }</span>
							<span class="tit">희망시간</span>
							<span class="cont">${dto.hopestart }시 ~ ${dto.hopeend}시</span>
						</td>

					</tr>
					<tr>
						<td>
							<span class="tit">인원수</span>
							<span class="cont">${dto.r_people }</span>
						</td>

					</tr>
					<tr>
						<td>
							<span class="tit">영화명</span>
							<span class="cont">${dto.movieNm }</span>
						</td>

					</tr>
					<tr>
						<td>
							<span class="tit">신청자명</span>
							<span class="cont">${dto.r_name}</span>
						</td>

					</tr>
					<tr>
						<td>
							<span class="tit">신청자 전화번호</span>
							<span class="cont">${dto.r_tel }</span>
						</td>

					</tr>
					
					<tr class="tb_content">
						<td>
							<div id="divNoticeContents">
								<p><font size="2" face="맑은 고딕">${dto.r_text }</font>
								</p>
							</div>
						</td>
					</tr>

				</tbody>
				</table>
				<div class="btn_btm_wrap">
				
					<c:choose>
						<c:when test="${sessionScope.mb_id eq 'admin' }">
							<a href="./AdminRentalList.th?rno=${dto.rno }&pageNum=${pageNum}" class="btn_col2 ty6">목록</a>
							<a href="./AdminRentalReWrite.th?rno=${dto.rno }&pageNum=${pageNum }&r_re_ref=${dto.r_re_ref}&r_re_lev=${dto.r_re_lev}&r_re_seq=${dto.r_re_seq}" class="btn_col2 ty6">답글</a>
						</c:when>
						<c:otherwise>
							<a href="./AdminRentalList.th?rno=${dto.rno }&pageNum=${pageNum}" class="btn_col2 ty6">목록</a>
						</c:otherwise>			
					</c:choose>
					
				</div>

					
			</div>
	</div>
		
			<span class="nav_underline"></span>


		</div>
<br><br><br><br><br><br><br><br>
<style type="text/css">
	#divNoticeContents p {
        min-height: 26px;
	}

</style>


</body>
</html>