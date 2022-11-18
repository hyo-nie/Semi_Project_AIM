<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.1.js"></script>
<script type="text/javascript">
	alert('1111111111111');
	$(document).ready(function(){
		// 지금 이 문서가 준비가 됐을 때 function을 실행시키쇼 -> 여기까지 와야 제이쿼리 준비 완
		// $ = JQuery
		alert('22222222222222');
	});
	
	$(function(){
		alert('4444444444444');
	});
	
	jQuery(document).ready(function(){
		// $ = JQuery
		alert('555555');
	});
	
	jQuery(function(){
		alert('666666');
	});
	
	
	alert('3333333333');

</script>


</head>
<body>
		<h1>test1.jsp</h1>
		
		

</body>
</html>