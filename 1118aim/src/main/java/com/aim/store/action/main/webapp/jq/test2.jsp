<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			// 선택자
			$('h2').css('color','RED');					// 태그선택자
			$('*').css('color','blue');					// * - 전체(모든요소)
			$('.title1').css('color','orange');			// 클래스를 선택할 때? .클래스명	(css영역에서는 클래스명을 많이 쓰고)
			$('#title2').css('color','deeppink');		// 아이디를 선택할 때? #아이디명	(개발 영역에서는 id를 많이 쓴다고...함.......)		
			
			/* jquery - 아이디값 가져오기 */
			// alert($('input').val());  	-> 얘는 안 됨! 얘는 ready되는 시점에 input 태그 안에 있는 값을 꺼내와줌.... 
			$('input').val('아이티윌');
			alert($('input').val());	 // -> 데이터가 존재하게 되면 alert 창이 뜸!
			
			/* 비밀번호 자리에 아이티윌 대신 12345 넣어보기 */
			// $('input.pw').val('12345');
			$('input[type=password]').val('123456789');
			// alert($('input.pw').val());
			alert($('input[type=password]').val());
			
			
			// 위치 탐색 선택자
			$('tr:odd').css('background','green');
			$('tr:even').css('background','blue');
			$('tr:first').css('background','yellow');
			
		});
		
		/* js - 아이디값 가져오기 */
		// document.폼태그명.요소명.value;
		// 근데 만약 폼태그가 없다면? 가져오기 좀 더 힘들어짐......

	
				
	</script>
</head>
<body>
	<h1>test2.jsp</h1>
	
	<h2 class="title1">제목1</h2>
	<h2 id="title2">제목2</h2>
	
	<form action="" name="fr">
		아이디 : <input type="text" name="id"><br>
		패스워드 : <input type="password" id="pw" class="pw"><br>
	</form>
	
	<hr>
	
	<table border="1">
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>		
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>				
	</table>


</body>
</html>