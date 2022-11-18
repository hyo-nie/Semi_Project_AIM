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
			// html(), text()
			var h = $('h2').html();		// 해당 대상(요소) 처음 만나는 값을 1개 가져옴
			alert(h);
			
			var t = $('h2').text();		// 해당 대상(요소) 모든 값을 가져옴
			alert(t);
			
			
			// 해당 요소의 값을 변경(모두!)
			// $('h2').html('Hello Itwill');
			// $('h2').text('Hello Itwill');
			// $('h2').html('<h1>Hello Itwill</h1>');		// 태그가 적용
			// $('h2').text('<h1>Hello Itwill</h1>');	// 태그가 적용X, 단순 텍스트
		//	$('h2').html('<h1>Hello Itwill'+t+'</h1>');	
			
			$('h2').html(function(idx,html){
				return html+"///"+idx+"@@@@@@@@";
			});
			
			
			// append(), prepend()
			$('body').append("추추추추추ㅜ추추추추차구차구차구추가");
			$('body').prepend("가가가가가가ㅏ가가추가추가추가추가추가");
			
// 			$('div').html(function(idx,html){
// 				return html+idx;
// 			});
			
			$('div').append(function(i){
				return i;
			});
			
			
			// 배열 생성(2차원 배열 형태,,, 원래 자스에는 2차원 배열이 없음) => JSON 타입
			var arr =
				[									// 대괄호? 배열
					{name:"학생1",addr:"부산"},		// 중괄호? 객체
					{name:"학생2",addr:"울산"},
					{name:"학생3",addr:"서울"},
					{name:"학생4",addr:"대전"},
					{name:"학생4",addr:"광주"}
				];
			
// 			for(var i = 0;i<arr.length;i++){
// 				$('table').append("<tr><td>"+arr[i].name+"</td><td>"+arr[i].addr+"</td></tr>");
// 			} // 근데 보통 이런 코드는 쓰지 않음
			
			
			// each()
// 			$(요소).each(function(){});
// 			$.each(요소,function(){});
//			=> 두 개가 같은 의미!

			// 배열의 값을 테이블에 추가하려면?
			$(arr).each(function(idx,item){
				// alert('배열의 값을 테이블에 추가하려면?');
				console.log(item);	// 배열의 객체값
				$('table').append("<tr><td>"+item.name+"</td><td>"+item.addr+"</td></tr>");
			});
			
			$('h3').css('background','blue');
			
			
			
			
			
			
		});
	
	
	</script>
	<style type="text/css">
		h3{
			background: red;
		}
	</style>
</head>
<body>
	
	<h1>test4.jsp</h1>
	
	<h2>head - 0</h2>
	<h2>head - 1</h2>
	<h2>head - 2</h2>
	<h2>head - 3</h2>
	<h2>head - 4</h2>
	
	
	<hr>
	
	
	<div>div</div>
	<div>div</div>
	<div>div</div>
	<div>div</div>
	<div>div</div>
	
	
	<hr>
	
	
	<table border="1">
		<tr>
			<td>이름</td>
			<td>주소</td>
		</tr>
	</table>
	
	
	<h3>item - 0</h3>
	<h3>item - 1</h3>
	<h3>item - 2</h3>
	<h3>item - 3</h3>
	<h3>item - 4</h3>
	
	
	
</body>
</html>