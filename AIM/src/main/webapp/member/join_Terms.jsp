<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간편회원 약관동의 &lt; 회원가입</title>
<!-- css/script -->
<jsp:include page="../inc/join_include.jsp"/>

<script type="text/javascript">

	 function fnChkag() {
			if(document.getElementById('agreeCco_1009C0').checked == false){
				alert("필수요소를 모두 체크하세요");
				return false;
			}
			
			if(document.getElementById('agreeCco_1009BG').checked == false){
				alert("필수요소를 모두 체크하세요");
				return false;
			}
			
			if(document.getElementById('agreeCco_1009BI').checked == false){
				alert("필수요소를 모두 체크하세요");
				return false;
			}
			
			if(document.getElementById('agreeCco_1050C1').checked == false){
				alert("필수요소를 모두 체크하세요");
				return false;
			}
			
			if(document.getElementById('agreeCco_1050B2').checked == false){
				alert("필수요소를 모두 체크하세요");
				return false;
			}
			document.fr.submit();
		}
			
</script>
</head>

<%-- 헤드 끝  --%>

	<!-- header -->
	<div id="mast-head">
		<div class="container">
			<h1 class="bi">
				<!-- <a href="https://www.lpoint.com/" onclick="return fnWindowOpen(this.href);" target="_blank"><img src="/resources/images/common/bi-lpoint.png" alt="L.POINT"></a> -->

				<a href="./Main.aim" onclick="return fnWindowOpen(this.href);"
					target="_blank"><img src="https://ifh.cc/g/RGtYO5.png"
					alt="AIM홈페이지"></a>
			</h1>
		</div>
	</div>
	<!-- //header -->

	<!-- mast body -->
	<form action="./Join.aim" method="post" name="fr"> <%-- 액션 링크 설정하기 --%>
	<div id="mast-body">
		<div class="container">
			<!-- toparea -->
			<div class="toparea">
				<h2 class="title">
					AIM 회원가입
					<!-- 회원가입 -->
				</h2>
				<div class="step __1">
					<div class="step-desc">
						필수 약관에<br>동의해주세요:)
						<!-- 필수 약관에<br>동의해주세요:) -->
					</div>
				</div>
			</div>
			<!-- //toparea -->

			<!-- contents -->
			<div class="contents">
				<!-- 약관 -->
				<div id="member-terms"
					class="section __half __opt-in ui-allchk-wrap ui-allchk-group1"
					data-separator-number="1">
					<h3 class="subject __underline">
						<em>약관<!-- 약관 --></em>
					</h3>
					<div class="ui-check __toggle">
						<input type="checkbox" id="terms-all-check"
							data-trigger="#member-terms"
							class="ui-allchk-btn ui-allchk-group1" data-separator-number="1">
						<label for="terms-all-check">전체동의<!-- 전체동의 --></label>
					</div>
					<div class="section __opt-in __opt-wrap" id="div-prv">
						<div class="row __block">
							<div class="col-md">AIM.POINT</div>
							<div class="col-md">
								<div class="form-wrap __agreement">
									<div class="inner">
										<div class="ui-wrap">
											<div class="ui-check">
												<input type="checkbox" id="agreeCco_1009C0" name="1009"
													class="mPrv ui-allchk-el ui-allchk-group1"
													onclick="fnPrvAgChange('agreeCco_1009C0');"
													data-title="AIM.POINT 회원약관" data-prvdvc="C0"
													data-cconm="AIM.POINT" data-ccoenm="L.POINT"
													data-separator-number="1">><label
													for="agreeCco_1009C0">AIM.POINT 회원약관 <em class="">(필수)</em></label>
											</div>
											<div class="detail">
												<button type="button"
													class="ui-button __square-mini __underline"
													onclick="modal_init('term-code-agree-10090',800)">자세히</button>
											</div>
										</div>
										<div id="term-code-agree-10090"
											class="modal-container __fixed">
											<div class="modal-header">
												<div class="headline">AIM.POINT 회원약관</div>
											</div>
											<div class="modal-contents __no-style">
												<div class="privacyArea">
													<iframe
														src="./assets/joincss/iframe_1009_C0_ko.html"
														width="100%" height="100%" frameborder="0"
														scrolling="auto" marginwidth="0" marginheight="0"
														allowtransparency="true" title=""></iframe>
												</div>
											</div>
											<div class="modal-closer">
												<button type="button" class="btn-close">닫기</button>
											</div>
										</div>
									</div>
									<div class="inner">
										<div class="ui-wrap">
											<div class="ui-check">
												<input type="checkbox" id="agreeCco_1009BG" name="1009"
													class="mPrv ui-allchk-el ui-allchk-group1"
													onclick="fnPrvAgChange('agreeCco_1009BG');"
													data-title="개인정보의 필수적인 사항에 대한 수집 이용 동의" data-prvdvc="BG"
													data-cconm="AIM.POINT" data-ccoenm="AIM.POINT"
													data-separator-number="1"><label
													for="agreeCco_1009BG">개인정보의 필수적인 사항에 대한 수집 이용 동의 <em
													class="">(필수)</em></label>
											</div>
											<div class="detail">
												<button type="button"
													class="ui-button __square-mini __underline"
													onclick="modal_init('term-code-agree-10091',800)">자세히</button>
											</div>
										</div>
										<div id="term-code-agree-10091"
											class="modal-container __fixed">
											<div class="modal-header">
												<div class="headline">개인정보의 필수적인 사항에 대한 수집 이용 동의</div>
											</div>
											<div class="modal-contents __no-style">
												<div class="privacyArea">
													<iframe
														src="./assets/joincss/iframe_1009_BG_ko.html"
														width="100%" height="100%" frameborder="0"
														scrolling="auto" marginwidth="0" marginheight="0"
														allowtransparency="true" title=""></iframe>
												</div>
											</div>
											<div class="modal-closer">
												<button type="button" class="btn-close">닫기</button>
											</div>
										</div>
									</div>
									<div class="inner">
										<div class="ui-wrap">
											<div class="ui-check">
												<input type="checkbox" id="agreeCco_1009BH" name="1009"
													class="ui-allchk-el ui-allchk-group1"
													onclick="fnPrvAgChange('agreeCco_1009BH');"
													data-title="개인정보의 선택적인 사항에 대한 수집 이용 동의" data-prvdvc="BH"
													data-cconm="L.POINT" data-ccoenm="L.POINT"
													data-separator-number="1"><label
													for="agreeCco_1009BH">개인정보의 선택적인 사항에 대한 수집 이용 동의 <em
													class="__point-color">(선택)</em></label>
											</div>
											<div class="detail">
												<button type="button"
													class="ui-button __square-mini __underline"
													onclick="modal_init('term-code-agree-10092',800)">자세히</button>
											</div>
										</div>
										<div id="term-code-agree-10092"
											class="modal-container __fixed">
											<div class="modal-header">
												<div class="headline">개인정보의 선택적인 사항에 대한 수집 이용 동의</div>
											</div>
											<div class="modal-contents __no-style">
												<div class="privacyArea">
													<iframe
														src="./assets/joincss/iframe_1009_BH_ko.html"
														width="100%" height="100%" frameborder="0"
														scrolling="auto" marginwidth="0" marginheight="0"
														allowtransparency="true" title=""></iframe>
												</div>
											</div>
											<div class="modal-closer">
												<button type="button" class="btn-close">닫기</button>
											</div>
										</div>
									</div>
									<div class="inner">
										<div class="ui-wrap">
											<div class="ui-check">
												<input type="checkbox" id="agreeCco_1009BI" name="1009"
													class="mPrv ui-allchk-el ui-allchk-group1"
													onclick="fnPrvAgChange('agreeCco_1009BI');"
													data-title="개인정보의 필수적인 제3자 제공에 대한 동의" data-prvdvc="BI"
													data-cconm="L.POINT" data-ccoenm="L.POINT"
													data-separator-number="1"><label
													for="agreeCco_1009BI">개인정보의 필수적인 제3자 제공에 대한 동의 <em
													class="">(필수)</em></label>
											</div>
											<div class="detail">
												<button type="button"
													class="ui-button __square-mini __underline"
													onclick="modal_init('term-code-agree-10093',800)">자세히</button>
											</div>
										</div>
										<div id="term-code-agree-10093"
											class="modal-container __fixed">
											<div class="modal-header">
												<div class="headline">개인정보의 필수적인 제3자 제공에 대한 동의</div>
											</div>
											<div class="modal-contents __no-style">
												<div class="privacyArea">
													<iframe
														src="./assets/joincss/iframe_1009_BI_ko.html"
														width="100%" height="100%" frameborder="0"
														scrolling="auto" marginwidth="0" marginheight="0"
														allowtransparency="true" title=""></iframe>
												</div>
											</div>
											<div class="modal-closer">
												<button type="button" class="btn-close">닫기</button>
											</div>
										</div>
									</div>
									<div class="inner">
										<div class="ui-wrap">
											<div class="ui-check">
												<input type="checkbox" id="agreeCco_1009BJ" name="1009"
													class="ui-allchk-el ui-allchk-group1"
													onclick="fnPrvAgChange('agreeCco_1009BJ');"
													data-title="개인정보의 선택적인 제3자 제공에 대한 동의" data-prvdvc="BJ"
													data-cconm="L.POINT" data-ccoenm="L.POINT"
													data-separator-number="1"><label
													for="agreeCco_1009BJ">개인정보의 선택적인 제3자 제공에 대한 동의 <em
													class="__point-color">(선택)</em></label>
											</div>
											<div class="detail">
												<button type="button"
													class="ui-button __square-mini __underline"
													onclick="modal_init('term-code-agree-10094',800)">자세히</button>
											</div>
										</div>
										<div id="term-code-agree-10094"
											class="modal-container __fixed">
											<div class="modal-header">
												<div class="headline">개인정보의 선택적인 제3자 제공에 대한 동의</div>
											</div>
											<div class="modal-contents __no-style">
												<div class="privacyArea">
													<iframe
														src="./assets/joincss/iframe_1009_BJ_ko.html"
														width="100%" height="100%" frameborder="0"
														scrolling="auto" marginwidth="0" marginheight="0"
														allowtransparency="true" title=""></iframe>
												</div>
											</div>
											<div class="modal-closer">
												<button type="button" class="btn-close">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row __block">
							<div class="col-md">롯데컬처웍스</div>
							<div class="col-md">
								<div class="form-wrap __agreement">
									<div class="inner">
										<div class="ui-wrap">
											<div class="ui-check">
												<input type="checkbox" id="agreeCco_1050C1" name="1050"
													class="mPrv ui-allchk-el ui-allchk-group1"
													onclick="fnPrvAgChange('agreeCco_1050C1');"
													data-title="롯데컬처웍스 회원사 약관" data-prvdvc="C1"
													data-cconm="롯데컬처웍스" data-ccoenm="LOTTE CINEMA"
													data-separator-number="1"><label
													for="agreeCco_1050C1">롯데컬처웍스 회원사 약관 <em class="">(필수)</em></label>
											</div>
											<div class="detail">
												<button type="button"
													class="ui-button __square-mini __underline"
													onclick="modal_init('term-code-agree-10500',800)">자세히</button>
											</div>
										</div>
										<div id="term-code-agree-10500"
											class="modal-container __fixed">
											<div class="modal-header">
												<div class="headline">롯데컬처웍스 회원사 약관</div>
											</div>
											<div class="modal-contents __no-style">
												<div class="privacyArea">
													<iframe
														src="./assets/joincss/1050c1/iframe_1050_C1_ko.html"
														width="100%" height="100%" frameborder="0"
														scrolling="auto" marginwidth="0" marginheight="0"
														allowtransparency="true" title=""></iframe>
												</div>
											</div>
											<div class="modal-closer">
												<button type="button" class="btn-close">닫기</button>
											</div>
										</div>
									</div>
									<div class="inner">
										<div class="ui-wrap">
											<div class="ui-check">
												<input type="checkbox" id="agreeCco_1050B2" name="1050"
													class="mPrv ui-allchk-el ui-allchk-group1"
													onclick="fnPrvAgChange('agreeCco_1050B2');"
													data-title="필수입력정보 수집동의서" data-prvdvc="B2"
													data-cconm="롯데컬처웍스" data-ccoenm="LOTTE CINEMA"
													data-separator-number="1"><label
													for="agreeCco_1050B2">필수입력정보 수집동의서 <em class="">(필수)</em></label>
											</div>
											<div class="detail">
												<button type="button"
													class="ui-button __square-mini __underline"
													onclick="modal_init('term-code-agree-10501',800)">자세히</button>
											</div>
										</div>
										<div id="term-code-agree-10501"
											class="modal-container __fixed">
											<div class="modal-header">
												<div class="headline">필수입력정보 수집동의서</div>
											</div>
											<div class="modal-contents __no-style">
												<div class="privacyArea">
													<iframe
														src="./assets/joincss/iframe_1050_B2_ko.html"
														width="100%" height="100%" frameborder="0"
														scrolling="auto" marginwidth="0" marginheight="0"
														allowtransparency="true" title=""></iframe>
												</div>
											</div>
											<div class="modal-closer">
												<button type="button" class="btn-close">닫기</button>
											</div>
										</div>
									</div>
									<div class="inner">
										<div class="ui-wrap">
											<div class="ui-check">
												<input type="checkbox" id="agreeCco_1050B3" name="1050"
													class="ui-allchk-el ui-allchk-group1"
													onclick="fnPrvAgChange('agreeCco_1050B3');"
													data-title="선택입력정보 수집동의서" data-prvdvc="B3"
													data-cconm="롯데컬처웍스" data-ccoenm="LOTTE CINEMA"
													data-separator-number="1"><label
													for="agreeCco_1050B3">선택입력정보 수집동의서 <em
													class="__point-color">(선택)</em></label>
											</div>
											<div class="detail">
												<button type="button"
													class="ui-button __square-mini __underline"
													onclick="modal_init('term-code-agree-10502',800)">자세히</button>
											</div>
										</div>
										<div id="term-code-agree-10502"
											class="modal-container __fixed">
											<div class="modal-header">
												<div class="headline">선택입력정보 수집동의서</div>
											</div>
											<div class="modal-contents __no-style">
												<div class="privacyArea">
													<iframe
														src="./assets/joincss/1050b3/iframe_1050_B3_ko.html"
														width="100%" height="100%" frameborder="0"
														scrolling="auto" marginwidth="0" marginheight="0"
														allowtransparency="true" title=""></iframe>
												</div>
											</div>
											<div class="modal-closer">
												<button type="button" class="btn-close">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="description __high">
						<p class="__point-color">
							선택약관에 동의하지 않으셔도 회원가입이 가능합니다.
							<!-- 선택항목에 동의하지 않으셔도 정상적인 서비스를 이용하실 수 있습니다. -->
						</p>
						<p>
							L.POINT 선택약관에 동의하지 않으시면 L.POINT 모든 제휴사에서 회원 혜택이 제한됩니다.<br>
							1) 롯데백화점 MVG 등 제휴사 회원등급 선정 및 추가포인트 적립 대상에서 제외<br> 2) 롯데마트 등
							쿠폰 지급 대상에서 제외<br> 3) 모든 제휴사 이벤트 당첨대상에서 제외<br> 4) 롯데ON
							L.stamp 적립 및 리워드 대상에서 제외
							<!-- L.POINT선택약관에 동의하시면 DM쿠폰발송, 백화점MVG선정 등 다양한 혜택을 경험하실 수 있습니다. -->
						</p>
					</div>
				</div>
				<!-- //약관 -->

				<!-- btn -->
				<div class="btn-area __center">
					<button type="button" class="ui-button __square-large __black"
						onclick="fnClose();">
						취소
						<!-- 취소 -->
					</button>
					<button type="button" style="background:#18315d;"
						class="ui-button __square-large __point-color" id="delaychk"
						onclick="fnChkag();">
						다음
						<!-- 다음 -->
					</button>
				</div>
			</div>
			<!-- //contents -->
		</div>
	</div>
	<!-- //mast body -->
	</form>





<jsp:include page="../inc/footer.jsp"/>
</body>
<!-- 약관 -->
</html>