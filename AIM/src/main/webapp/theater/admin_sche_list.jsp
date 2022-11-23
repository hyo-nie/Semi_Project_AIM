<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 각종 요소 -->
<jsp:include page="../inc/include.jsp"/>
<!-- 상위 배너 -->
<jsp:include page="../inc/topbanner.jsp"/>
<!-- 헤더/네비 -->
<jsp:include page="../inc/nav_bar.jsp"/>

<%
	//로그인 제어
	String mb_id = (String)session.getAttribute("mb_id");
	if(mb_id==null || !mb_id.equals("admin")){
		response.sendRedirect("./Main.aim");
		System.out.println("비정상적 접근 발생! IP : "+request.getRemoteAddr());
	}
	%>
	
<br><br><br><br><br><br><br><br><br>			
<!-- 게시판 -->
<article>
<h1>관리자 스케줄등록 리스트</h1>
<br><br>
<table id="notice" border="2">
<tr><th class="tno">스케줄번호</th>
    <th class="twrite">지점명</th>
    <th class="tdate">상영날짜</th>
    <th class="tdate">상영관</th>
    <th class="tdate">영화명</th>
    <th class="tdate">시작시간</th>
    <th class="tdate">상영횟수</th>
    <th class="tread">관리</th></tr>
    
    <c:forEach var="admins" items="${adminScheList }">
		<tr>
			<td>${admins.scCode }</td>
			<td>${admins.branch_name }</td>
		    <td>${admins.sc_date }</td>
		    <td>${admins.roomCd }</td>
		    <td>${admins.movieNm }</td>
		    <td>${admins.starttime }</td>
		    <td>${admins.runcount }</td>
		    <td>
		    	<a href="./adminScheModify.th?scCode=${admins.scCode }">수정</a>
		    	/
		    	<a href="./AdminScheRemove.th?scCode=${admins.scCode }">삭제</a>
		    </td>
		
	    </tr>
    </c:forEach>

</table>
<br>
<div id="table_search">
	<input type="button" value="스케줄등록" class="btn"
		onclick="location.href='./AdminScheAdd.th';"
	>
</div>
<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->	
	
	
	
	
	
	
<!-- 하단배너 -->
<jsp:include page="../inc/loginform_bottom_banner.jsp" />
<!-- 약관 -->
<jsp:include page="../inc/footer.jsp" />
</body>
</html>