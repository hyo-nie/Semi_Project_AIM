<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AIM 스토어 상품 등록</title>
<link href="./assets/css/common.css" rel="stylesheet" type="text/css">
<link href="./assets/css/default.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function check(){
		if(document.adminfr.category.value == ""){
			alert("카테고리를 선택해주세요!");
			document.adminfr.category.focus();
			return false;
		}
		if(document.adminfr.category_name.value == ""){
			alert("소분류를 선택해주세요!");
			document.adminfr.category_name.focus();
			return false;
		}
		if(document.adminfr.name.value == ""){
			alert("상품명을 입력해주세요!");
			document.adminfr.name.focus();
			return false;
		}
		if(document.adminfr.price.value == ""){
			alert("상품 가격을 입력해주세요!");
			document.adminfr.price.focus();
			return false;
		}
		if(document.adminfr.text.value == ""){
			alert("상품 구성을 입력해주세요!");
			document.adminfr.text.focus();
			return false;
		}
		if(document.adminfr.img.value == ""){
			alert("상품 사진을 등록해주세요!");
			document.adminfr.img.focus();
			return false;
		}
		if (confirm("상품을 등록 하시겠습니까?") == true){
			 document.adminfr.submit();
			 
		 }else{
		     return false;
		 }	
		
	}
</script>

</head>
<body>

	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp"/>

	<%
			String id = (String) session.getAttribute("mb_id");
			if (id == null || !id.equals("admin")) {
				response.sendRedirect("./Login.aim");
			}
	%>
	
	
	
	<form action="./AdminStoreAddAction.ad" method="post" name="adminfr" enctype="multipart/form-data">
	
	<div id="contents">
		<div class="movi_pre_list">
			<h3 class="tit_type0" style="margin-top: 50px;"><strong class="ty2 eng">AIM</strong> 스토어 상품 등록</h3>
		</div>
			<table class="tbl_form">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: auto;">
				</colgroup>
			
	
		
			<tbody>
				<tr>
					<th scope="row" class="req1">카테고리</th>
					<td>
						<select title="카테고리를 선택" name="category" id="iDdivisionCode">
							<option value="" selected disabled hidden>카테고리</option>
							<option value="1">기프트카드/관람권</option>
							<option value="2">팝콘/음료/굿즈</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th scope="row" class="req1">소분류</th>
					<td>
						<select name="category_name" id="iDdivisionCode">
							<option value="" selected disabled hidden>소분류</option>
							<option value="기프트카드">기프트카드</option>
							<option value="관람권">관람권</option>
							<option value="팝콘">팝콘</option>
							<option value="음료">음료</option>
							<option value="콤보">콤보</option>
							<option value="굿즈">굿즈</option>
						</select>
					</td>
				</tr>
				
				
					
				<tr>
					<th scope="row" class="req1">상품명</th>
					<td>
						<input type="text" name="name">
						<div class="bx_file ">
							<div id="layerSelectCinema" class="layer_wrap ty3 layer_select_cinema" style="left: 0px; top: 0px;"></div>
							<div class="file_item"></div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="req1">가격</th>
					<td>
						<input type="text" name="price"> 원
						<div class="bx_file ">
							<div id="layerSelectCinema" class="layer_wrap ty3 layer_select_cinema" style="left: 0px; top: 0px;"></div>
							<div class="file_item"></div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="req1">구성</th>
					<td>
						<div class="bx_textarea">
							<input type="text" class="ty2 w_full" name="text" id="iDtitle">
						</div>
					</td>
				</tr>
				
				<tr>
					<th scope="row">첨부파일</th>
					<td>
						<div class="bx_file">
							<input type="file" id="file" name="img">
							<label class="" for="file">파일선택</label>
							<div class="file_item"></div>
						</div>
						<span class="txt_caution1 fl_r with_inp"> 상품 대표 사진을 등록해주세요.</span>
					</td>
				</tr>
				
			</tbody>
		</table>
		
			<div class="btn_btm_wrap">
				<input type="button" value="등록" class="btn_col2 ty6" onclick="check();">
				<input type="reset" class="btn_col3 ty6" value="취소하기" onclick="history.back()">
			</div>
			
		</div>
	
	</form>


</body>
</html>