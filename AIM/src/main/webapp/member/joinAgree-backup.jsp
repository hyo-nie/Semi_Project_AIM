<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fun01(){
	if(document.fr.TOS[0].checked==false && document.fr.TOS[1].checked==false){
		alert("필수 동의버튼을 체크해 주세요");
		return;
	}
	
	document.fr.submit();
}


</script>


</head>
<body>

		<h2> 약관 내용 </h2>
		<form action="./join.jsp" method = "post" name="fr">
			<fieldset>
				<legend> 약관 내용 </legend> 
					<input type="checkbox" name="TOS" value="약관1"> 야아아아악관 1 (필수)<br>
					<input type="checkbox" name="TOS" value="약관2"> 야아아아아악관 2 (필수)<br>
					<input type="checkbox" name="TOS" value="약관3"> 야아앙아악관3 (선택)<br>
					<input type="checkbox" name="TOS" value="약관4"> 야아앙아악관4 (선택)<br>
			</fieldset>
			<div class="clear"></div>
				<div id="buttons">	
					<input type="button" value="회원가입하기" onclick="fun01()" class="submit">
					<input type="button" value="돌아가기" onclick="location.href='./AIM.co.kr';" >
				</div>
		</form>		
		
</body>
</html>