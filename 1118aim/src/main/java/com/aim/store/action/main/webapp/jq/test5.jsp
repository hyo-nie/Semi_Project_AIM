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
			
// 			$('input').click(function(){
// 				// 비동기 방식 처리
// 				// $.ajax("test.jsp");
// 				$.ajax({
// 					url:"test.jsp",
// 					data: {name:"홍길동"},
// 					success: function(data){
// 						alert('ajax 성공');
// 						alert(data);
// 						$('body').append(data);
// 					},
// 					error: function(){
// 						alert('ajax 실패');
// 					},
// 					complete: function(){
// 						alert('ajax 완전 끝!');
// 					}
// 				});
// 			}); //click
			
			

			$('#btnNews').click(function(){
				alert("뉴스 정보 가져오기");
				
				$.ajax({
					url:"https://fs.jtbc.co.kr//RSS/sports.xml",
					success: function(data){
						alert('성공');
						// console.log(data);
						$(data).find('item').each(function(){		// find라는 function을 사용해서 태그를 찾을 수 있게...
							$('body').append("<a href='"+$(this).find('link').text()+"'>"+ $(this).find('title').text() + "<hr></a>");
							
							
						});
					}
					
				});
				
			});
			
			

			
			
			
		});
		
	</script>	
</head>
<body>
		<h1>test5.jsp</h1>
		
		<input type="button" id="btn" value="정보불러오기">
		
		<input type="button" id="btnNews" value="뉴스 정보 불러오기"><br>









		
</body>
</html>