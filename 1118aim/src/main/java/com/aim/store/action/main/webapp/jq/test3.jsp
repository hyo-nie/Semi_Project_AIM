<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.1.js"></script>
	<script type="text/javascript">
		$(function(){
			// h2 글자색 변경
// 			alert($('h2').css('color'));
 			$('h2').css('color','#5F00FF');			
// 			alert($('h2').css('color'));
			
			// h2 태그의 글자색을 모두 다른색으로 변경
			$('h2').css('color','red');
			var colorArr = ['#ff9966','#ff9999','#ff99cc'];
			$('h2').css('color',function(idx,val){
				// 글자색 값을 표현 -> 리턴
				// alert(idx+"/"+val);
				return colorArr[idx];
			});
			
		      // 속성 여러 개 한 번에 사용
		      $('h2').css({
		         color:"#ff80aa",
		         background:"#e6f2ff"
		      });
		      
		      $('h2').css({
		         color:"#e6f2ff",
		         background:function(idx){
		            return colorArr[idx];
		         }
		      });

			
			
			// attr(속성명, 속성값)
			$('img').attr('src','456.jpg');
			
			// 이미지 가로크기 조절(300)
			$('img').attr('width',300);
			
			// 페이지 실행했을 ㄸㅐ 이미지 가로크기를 3개 전부 다 다르게 조절하기
			$('img').attr('width',function(idx){
				return (idx+1)*100;
			});
			
			// 이미지 가로/세로 각각 다른 크기로 조절
			$('img').attr({
				width:function(a){
					return (a+1)*100;
				},
				height:function(b){
					return (b+1)*200;
				}
			});
			
			
			
		});


	</script>
</head>
<body>
	<h1>test3.jsp</h1>

	<h2>head - 0</h2>
	<h2>head - 1</h2>
	<h2>head - 2</h2>
	
	<hr>
	
	<img src="123.jpg" class="1">
	<img src="123.jpg" class="2">
	<img src="123.jpg">
	
</body>
</html>