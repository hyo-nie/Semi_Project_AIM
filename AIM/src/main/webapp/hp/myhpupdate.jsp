<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> AIM (All In Movie!) - 고객센터 </title>

<script type="text/javascript">
	

</script>

</head>
<body style="">
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp"/>
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp" />
	<!-- 사이드 퀵메뉴 -->
	<jsp:include page="../inc/side_quick_menu.jsp" />

<div id="contents" class="contents_customer area__movingbar litype5"
		style="">
		<div class="title_top">
			<h2 class="tit"> 고객센터 - 1:1 문의 </h2>
		</div>
		<ul class="tab_wrap outer actionmovingbar">
			<li>
				<button type="button" class="tab_tit" style="width: 33.33%; left: 0%;" onclick="location.href='./NtList.nt';">
					<span>공지 사항</span>
				</button>
			</li>
			<li class="active">
				<button type="button" class="tab_tit" style="width: 33.33%; left: 33.33%;">
					<span>1:1 문의</span>
				</button>
				<div class="tab_con">
					<h3 class="hidden">1:1 문의</h3>
					<div class="con_top">
						<div class="ico_tit qus">1:1 문의글 답변 운영시간 10:00 ~ 19:00 이며 <br>
												 접수 후 48시간 안에 답변 드리겠습니다.
						</div>
					</div>
					<dl class="contxt_type1">
						<dt class="tit">고객님의 문의에 
						<span class="txt_color02">답변하는 직원은 고객 여러분의 가족 중 한 사람</span>
						일 수 있습니다.</dt>
						<dd class="desc">고객의 언어폭력(비하, 욕설, 반말, 성희롱 등)으로부터 직원을 보호하기 위해 관련 법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.</dd>
					</dl>
					<div class="con_tit ty2">
						<h4 class="tit">문의내용</h4>
						<div class="group_rgt">
							<span class="txt_req">필수입력</span>
						</div>
					</div>
				<form action="./MyHpUpdatePro.hp?hp_bno=${dto.hp_bno }&pageNum=${pageNum }" method="post">
					<table class="tbl_form" summary="문의내용작성 테이블">
						<caption>문의 내용을 작성해주세요</caption>
						<colgroup>
							<col style="width: 15%;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
						
							<tr>
								<th scope="row" class="req" name="hp_class">종류</th>
								<td>
									<input type="radio" name="rdo00" id="radio01" class="aNoneSelect" checked>
										<label for="radio01">영화 문의</label>
									<input type="radio" name="rdo00" id="radio02">
										<label for="radio02">기타 문의</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							
							<tr>
								<th scope="row" class="req">제목</th>
								<td>
									<div class="bx_textarea">
										<input type="text" class="ty2 w_full" placeholder="제목을 입력해주세요" 
										title="문의내용 제목입력" name="hp_subject" value="${dto.hp_subject }">
										<span class="txt_count">
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="req">내용</th>
								<td>
									<div class="bx_textarea">
										<textarea class="ty2" cols="10" rows="10" name="hp_content" 
										title="문의내용을 입력해주세요" 
										placeholder="내용 및 첨부파일에 개인정보(카드번호, 계좌번호, 주민번호)가 포함되지 않도록 유의하여 입력해주세요.">${dto.hp_content }</textarea>
										<span class="txt_count"><em id="strongContentsCount">
											
											</em>
										</span>
									</div></td>
							</tr>
						
						</tbody>
					</table>
			
					<div class="con_tit ty2">
						<h4 class="tit">고객정보</h4>
						<div class="group_rgt">
							<span class="txt_req">필수입력</span>
						</div>
					</div>
					<table class="tbl_form" summary="고객정보작성 테이블">
						<caption>고객정보를 작성해주세요</caption>
						<colgroup>
							<col style="width: 15%;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="req">아이디</th>
								<td><input type="text" class="ty2 inp_name" name="mb_id" title="아이디" value="${dto.mb_id }"></td>
							</tr>
							<tr>
								<th scope="row" class="req">비밀번호</th>
								<td>
									<input type="text" class="ty2 inp_id" title="비밀번호"	name="mb_pw" > 
									<span class="txt_caution1 fl_r with_inp">사용되는 비밀번호는 수정 및 삭제에 이용되므로 필수로 작성해주시기 바랍니다.</span></td>
							</tr>
						</tbody>
					</table>
					<div class="con_tit ty2">
						<h4 class="tit">개인정보 수집에 대한 동의</h4>
						<div class="group_rgt">
							<p class="txt_form"> 문의를 통해 아래의 개인정보를 수집합니다. 수집된 개인정보는 문의 외 목적으로 사용하지 않습니다. </p>
						</div>
					</div>
					<div class="privacy_wrap">
						<div class="txtarea">
							<a class="focus_textarea" href="javascript:void(0);">개인정보의 수집목적 및 항목</a><br>
								① 수집 목적 : 원활한 고객 상담, 불편사항 및 문의사항 관련 의사소통 경로 확보<br>
								② 수집 항목<br>
								*필수입력사항<br>
								- 이용자 식별을 위한 항목 : 성명, 연락처, 이메일, 아이디(로그인 시 수집)<br>
								<span class="color_red"><br>
								개인정보의 보유 및 이용기간<br>
								입력하신 개인정보는 소비자 보호에 관한 법률 등 관계 법률에 의해 다음과 같이 보유합니다.<br>
								보유기간 : 문의접수 후 처리 완료시점으로 부터 3년</span><br><br>
								※ 1:1문의 서비스 제공을 위한 최소한의 개인정보이며 거부할 수 있습니다. 다만, 수집에 동의하지 않을 경우 서비스 이용이 제한됩니다
						</div>
						<div class="bx_inp">
							<input type="radio" name="rdo01" id="radio10" class="iDrdoAgreeY"><label for="radio10">동의 </label>
								<input type="radio" name="rdo01" id="radio11" checked=""><label for="radio11">동의하지않음</label>
						</div>
						
						<div class="btn_btm_wrap">
							<input type="hidden" name="mb_id" id="mb_id" value="${dto.mb_id }">
							<input type="hidden" name="mb_pw" id="mb_pw" value="${dto.mb_pw }">
							<input type="submit" class="btn_col3 ty6" value="수정하기" >
							<input type="button" class="btn_col2 ty6" value="문의목록" onclick="location.href='./MyHpList.hp';" >
							
						</div>
						</form>
					</div>
				</div></li>
		<li>
				<button type="button" class="tab_tit" style="width: 33.33%; left: 66.67%;" onclick="location.href='./MyHpList.hp';" >
					<span>문의 내용 목록</span>
				</button></li>
			<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
		</ul>
	</div>


    <div id="footer_section" class="footer">
		<div class="inner">
			<ul class="f_menu">
				<li><a
					href="https://www.lottecinema.co.kr/NLCHS/Etc/MemberClause"
					title="회원약관" target="_self">회원약관</a></li>
				<li><a
					href="https://www.lottecinema.co.kr/NLCHS/Etc/IndividualInfomationHandlingPolicy"
					title="개인정보처리방침" target="_self"><strong>개인정보처리방침</strong></a></li>
				<li><a
					href="https://www.lottecinema.co.kr/NLCHS/Etc/EmailCollectionRefusal"
					title="이메일무단수집거부" target="_self">이메일무단수집거부</a></li>
				<li><a
					href="https://www.lottecinema.co.kr/NLCHS/Etc/ElectronicManagementPolicy"
					title="영상정보처리기기 운영 및 관리방침" target="_self">영상정보처리기기 운영 및 관리방침</a></li>
			</ul>
		</div>
		
	</div>
   
</body>
</html>