<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AIM - 스토어 상품 수정</title>
<link href="./assets/css/common.css" rel="stylesheet" type="text/css">
<link href="./assets/css/default.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function check(){
	// 카테고리, 소분류, 상품명, 가격, 구성
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
	if (confirm("상품을 등록 하시겠습니까?") == true){
		 document.adminfr.submit();
		 
	 }else{
	     return false;
	 }	
	
}


</script>
</head>
<body>

	<%
		/* 로그인 제어! 스토어 상품 수정 페이지는 admin(관리자)만 접근 가능 */
			String id = (String) session.getAttribute("mb_id");
			if (id == null || !id.equals("admin")) {
				response.sendRedirect("./Login.aim");
			}
	%>
	
	<form action="./AdminStoreModifyPro.ad" method="post" name="adminfr"> 
	<input type="hidden" name="st_num" value="${dto.st_num }">
	<!-- 파일 수정 안 함 -->
	
	<div id="contents">
		<div class="title_top">
			<h2 class="tit">스토어 상품 수정</h2>
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
							<option value="0" 
								<c:if test="${dto.category_code.equals('0')}">
									selected="selected"
								</c:if>
							>카테고리 선택</option>
							<option value="1" 
								<c:if test="${dto.category_code.equals('1')}">
									selected="selected"
								</c:if>
							>기프트카드/관람권</option>
							<option value="2" 
								<c:if test="${dto.category_code.equals('2')}">
									selected="selected"
								</c:if>
							>팝콘/음료/굿즈</option>
							
						</select>
					</td>
				</tr>
				

				<tr>
					<th scope="row" class="req1">소분류</th>
					<td>
						<select name="category_name" id="iDdivisionCode">
							<option value="0" selected="selected">소분류 선택</option>
							<option value="기프트카드" 
								<c:if test="${dto.category_name.equals('기프트카드')}">
									selected="selected"
								</c:if>
							>기프트카드</option>
							<option value="관람권"
								<c:if test="${dto.category_name.equals('관람권')}">
									selected="selected"
								</c:if>
							>관람권</option>
							<option value="팝콘"
								<c:if test="${dto.category_name.equals('기프트카드')}">
									selected="selected"
								</c:if>
							>팝콘</option>
							<option value="음료"
								<c:if test="${dto.category_name.equals('기프트카드')}">
									selected="selected"
								</c:if>
							>음료</option>
							<option value="콤보"
								<c:if test="${dto.category_name.equals('기프트카드')}">
									selected="selected"
								</c:if>
							>콤보</option>
							<option value="굿즈"
								<c:if test="${dto.category_name.equals('기프트카드')}">
									selected="selected"
								</c:if>
							>굿즈</option>
						</select>
					</td>
				</tr>
				
				
					
				<tr>
					<th scope="row" class="req1">상품명</th>
					<td>
						<input type="text" name="name" value="${dto.st_name }">
						<div class="bx_file ">
							<div id="layerSelectCinema" class="layer_wrap ty3 layer_select_cinema" style="left: 0px; top: 0px;"></div>
							<div class="file_item"></div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="req1">가격</th>
					<td>
						<input type="text" name="price" value="${dto.st_price }"> 원
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
							<input type="text" class="ty2 w_full" name="text" value="${dto.st_text }" id="iDtitle">
						</div>
					</td>
				</tr>

				
			</tbody>
		</table>
		
			<div class="btn_btm_wrap">
				<a href="#none" class="btn_col3 ty6">취소</a>
				<input type="button" value="수정" class="btn_col2 ty6" onclick="check();">
			</div>
			
		</div>
	
	</form>


</body>
</html>