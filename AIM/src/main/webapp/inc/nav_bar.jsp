<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../inc/include.jsp" />
<!DOCTYPE html>
<!-- Header -->
<script>
	$(function() {
		$(".btn_menu_all").on("click", function() {
			alert("삭제고민중");
			$("#layerAllMenu").attr('class','.menu_all_wrap.active')
			return false;
		});
	});
	$(function() {
		$("#hideBtn").on("click", function() {
			$("#text").hide();
			return false;
		});
	});
</script>


<div id="header_section" class="header ty3">
	<h1 class="logo">
		<a href="./Main.aim"></a>
		<!-- aim 주소창 변경하기 -->
	</h1>
	<div class="gnb">
		<ul class="g_menu1">
			<li><a href="https://www.facebook.com" class="btn_facebook"
				target="_blank" title="AIM 페이스북 새창열림">페이스북</a></li>
			<!-- AIM 페이스북 주소 변경 -->
			<li><a href="https://www.youtube.com" class="btn_youtube"
				target="_blank" title="AIM 유튜브 새창열림">유튜브</a></li>
			<!-- AIM 유튜브 주소 변경 -->
			<li><a href="https://www.instagram.com" class="btn_follow"
				target="_blank" title="AIM 인스타그램 새창열림">인스타그램</a></li>
			<!-- AIM 인스타 주소 변경 -->
		</ul>
		<ul class="g_menu2">
			<li><a href="#">멤버십</a></li>
			<!-- 멤버십 주소 변경 -->
			<li><a href="./NtList.nt">고객센터</a></li>
			<!-- 고객센터 주소 변경 -->
			<li><a href="./RentalWrite.th">단체관람/대관문의</a></li>
			<!-- 단체/대관문의 -->

			<c:if test="${mb_id == null }">
				<li><a href="./Login.aim">로그인</a></li>
			</c:if>
			<!-- 로그인 x : 로그인 버튼 -->

			<c:if test="${mb_id != null }">
				<li><a onclick="logout();">로그아웃</a></li>
			</c:if>
			<!-- 로그인 o : 로그아웃 버튼 -->

		</ul>
		<ul class="g_menu3">

			<c:if test="${mb_id == null }">
				<li><a href="./JoinTerms.aim" class="btn_my">회원가입</a></li>
			</c:if>
			<!-- 로그인 x : 회원가입 버튼 -->

			<c:if test="${mb_id != null }">
				<c:if test="${mb_id.equals('admin') }">
					<li><a href="./AdminPage.aim" class="btn_my">관리자페이지</a></li>
				</c:if>
				<c:if test="${!mb_id.equals('admin') }">
					<li><a href="./MyPage.aim" class="btn_my">마이페이지</a></li>
				</c:if>
			</c:if>
			<!-- 로그인 o : 마이페이지 버튼 -->


			<li><a href="./Ticketing.tk" class="btn_reserve">바로 예매</a></li>
			<!-- 바로예매 이동 -->
			<li><button class="btn_menu_all">전체 메뉴 레이어 열기</button>	
		</li>
	</ul>
					
	</div>
	<div id="nav" class="area__gnbmovingbar">
		<ul>
			<li class=""><a href="./Ticketing.tk">예매</a> <!-- 예매 임시 가상주소 입니다 자유롭게 변경해서 사용해주세요 -->
				</li>
			<li class=""><a href="./MovieHomeList.mv">영화</a> <!-- 영화 임시 가상주소 입니다 자유롭게 변경해서 사용해주세요 -->
				<div>
					<ul>
						<li><a href="./MovieHomeList.mv" title="홈">홈</a></li>
						<li><a href="./MovieList.mv" title="현재상영작">현재상영작</a></li>
					</ul>
				</div></li>
			<li class="is-current"><a href="#">영화관</a> <!-- 영화관은 상세영화관 클릭안하면 클릭해도 이동 없습니다 자유롭게 변경해서 사용해주세요 -->
				<div>
					<ul>
						<li><a href="./branch.th?branchCd=1" title="서면">서면</a></li>
						<li><a href="./branch.th?branchCd=2" title="해운대">해운대</a></li>
						<li><a href="./branch.th?branchCd=3" title="대연">대연</a></li>
						<li><a href="./branch.th?branchCd=4" title="하단">하단</a></li>
						<li><a href="./branch.th?branchCd=5" title="동래">동래</a></li>
					</ul>
				</div></li>
			<li class=""><a href="./StoreMain.st">스토어</a>
				<div>
					<ul>
						<li><a href="./AimPick.st" title="추천상품">AIM's pick</a></li>
						<li><a href="./GiftcardList.st" title="기프트카드">기프트카드/관람권</a></li>
						<li><a href="./PopcornList.st" title="팝콘">팝콘/음료/굿즈</a></li>
					</ul>
				</div></li>
			<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
		</ul>
	</div>
</div>



<%-- 사이트맵 시작 --%>
				