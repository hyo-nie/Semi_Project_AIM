<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function roomCdChange(e){
		var roomCd_seomyeon = ["1","2","3"];
		var roomCd_haewoondae = ["4","5","6"];
		var roomCd_daeyeon = ["7","8","9"];
		var roomCd_sasang = ["10","11","12"];
		var roomCd_dongrae = ["13","14","15"];
		var target = document.getElementById("room");
		
		if(e.value == "1") var d = roomCd_seomyeon;
		else if(e.value == "2") var d = roomCd_haewoondae;
		else if(e.value == "3") var d = roomCd_daeyeon;
		else if(e.value == "4") var d = roomCd_sasang;
		else if(e.value == "5") var d = roomCd_dongrae;
		
		target.options.length = 0;
		
		for(x in d){
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
</script>
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
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- 게시판 -->
	<article>
	<h1>관리자 스케줄 수정페이지</h1>
	<form action ="./AdminScheModifyPro.th" method="post" >
	<input type="hidden" name="scCode" value="${getsche.scCode }">
	<table id="notice">
		<tr>
	   		<th class="ttitle" colspan="2">AIM 스케줄 수정</th>
	    </tr>
		<tr>
			<td>지점</td>
			<td>
				<select name="branchCd" onchange="roomCdChange(this)">
					<option value="1"
						<c:if test="${getsche.branchCd eq 1}">
						selected="selected"
						</c:if>
					>서면점</option>
					<option value="2"
						<c:if test="${getsche.branchCd eq 2}">
						selected="selected"
						</c:if>
					>해운대점</option>
					<option value="3"
						<c:if test="${getsche.branchCd eq 3}">
						selected="selected"
						</c:if>
					>대연점</option>
					<option value="4"
						<c:if test="${getsche.branchCd eq 4}">
						selected="selected"
						</c:if>
					>사상점</option>
					<option value="5"
						<c:if test="${getsche.branchCd eq 5}">
						selected="selected"
						</c:if>
					>동래점</option>

				</select>
			</td>
	    </tr>
		<tr>
			<td>날짜</td>
			<td>
				<input type="text" name="sc_date" value="${getsche.sc_date }">
			</td>
	    </tr>
		<tr>
			<td>상영관코드</td>
			<td>
				<select name="roomCd" id="room" value="${getsche.roomCd }">

				</select>
			</td>
	    </tr>
		<tr>
			<td>영화제목</td>
			<td>			
				<select name="movieCd">
					<c:forEach var="movie" items="${getmovie }">
						<option value="${movie.movieCd}" 
							<c:if test="${getsche.movieCd eq movie.movieCd}">
							selected="selected"
							</c:if>
						>${movie.movieNm }
						</option>
					</c:forEach>

				</select>
			</td>
	    </tr>
	    <tr>
			<td>상영시간</td>
			<td>
				<input type="text" name="starttime" value="${getsche.starttime }">
			</td>
	    </tr>
	    <tr>
			<td>상영종료시간</td>
			<td>
				<input type="text" name="endtime" value="${getsche.endtime }">
			</td>
	    </tr>
	    <tr>
			<td>상영횟수</td>
			<td>
				<input type="text" name="runcount" value="${getsche.runcount }">
			</td>
	    </tr>
	    
	    
	</table>
		<div id="table_search">
			<input type="submit" value="수정하기" class="btn">
		</div>
	</form>
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