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

</head>
<body>

	<!-- 카테고리 별로 상품을 따로 등록을 하는 게 좋을 거 같음 -->

	<%
		/* 로그인 제어! 스토어 상품 등록 페이지는 admin(관리자)만 접근 가능 */
			String id = (String) session.getAttribute("mb_id");
			if (id == null || !id.equals("admin")) {
				response.sendRedirect("./Login.aim");
			}
	%>
	
	<form action="./AdminStoreAddAction.ad" method="post" enctype="multipart/form-data">
	
	<div id="contents">
		<div class="title_top">
			<h2 class="tit">스토어 상품 등록</h2>
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
							<option value="0" selected="selected">카테고리 선택</option>
							<option value="1">기프트카드/관람권</option>
							<option value="2">팝콘/음료/굿즈</option>
						</select>
					</td>
				</tr>
				
				
				<!-- select-option으로 소분류를 나눌 예정 -->
				<!-- code_1이면 기프트카드와 관람권이 option으로, -->
				<!-- code_2이면 팝콘, 음료, 콤보, 굿즈가 option으로 -->
				<tr>
					<th scope="row" class="req1">소분류</th>
					<td>
						<select name="category_name" id="iDdivisionCode">
							<option value="0" selected="selected">소분류 선택</option>
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
				<a href="#none" class="btn_col3 ty6">취소</a>
				<input type="submit" value="등록" class="btn_col2 ty6">
			</div>
			
		</div>
	
	</form>


</body>
</html>