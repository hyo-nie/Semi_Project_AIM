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
			<li><a href="#">단체관람/대관문의</a></li>
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
				<div>
					<ul>
						<li><a href="./Ticketing.tk" title="예매하기">예매하기</a></li>
						<li><a href="#" title="상영시간표">상영시간표</a></li>
						<li><a href="#" title="할인안내">할인안내</a></li>
					</ul>
				</div></li>
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
						<li><a href="./branch.th?branchCd=4" title="사상">사상</a></li>
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
				<div id="allmenu">
					<div id="layerAllMenu" class="menu_all_wrap" tabindex="0"
						style="left: 44.3%;top: 191px;margin-left: 0px;background-color: white;width: 600px;z-index: 10000000000;position: absolute;font-size: 10px;">
						<strong class="hidden">레이어 팝업 시작</strong>
						<div class="group_menu_all">
							<table style="font-size:10px;">
								<caption>전체메뉴</caption>
								<thead>
									<tr>
										<th colspan="6" scope="colgroup" id="gmenu"><span
											class="hidden">사이트 전체메뉴</span></th>
									</tr>
								</thead>
								<tbody>
									<tr style="font-size:12px;">
										<th scope="col" id="gmenu1"><span>예매</span></th>
										<th scope="col" id="gmenu2"><span>영화</span></th>
										<th scope="col" id="gmenu3"><span>영화관</span></th>
										<th scope="col" id="gmenu4"><span>스페셜관</span></th>
										<th scope="col" id="gmenu5"><span>스토어</span></th>
										<th scope="col" id="gmenu6"><span>멤버십</span></th>
									</tr>
									<tr style="vertical-align: baseline;">
										<td headers="gmenu gmenu1"><ul>
												<li><a title="예매하기" tabindex="0">예매하기</a></li>
												<li><a title="상영시간표" tabindex="0">상영시간표</a></li>
												<li><a title="할인안내" tabindex="0">할인안내</a></li>
											</ul></td>
										<td headers="gmenu gmenu2"><ul>
												<li><a title="홈" tabindex="0">홈</a></li>
												<li><a title="현재상영작" tabindex="0">현재상영작</a></li>
												<li><a title="상영예정작" tabindex="0">상영예정작</a></li>
												<li><a title="아르떼" tabindex="0">아르떼</a></li>
												<li><a title="국립극장" tabindex="0">국립극장</a></li>
											</ul></td>
										<td headers="gmenu gmenu3"><ul>
												<li><a title="스페셜관" tabindex="0">스페셜관</a></li>
												<li><a title="서울" tabindex="0">서울</a></li>
												<li><a title="경기/인천" tabindex="0">경기/인천</a></li>
												<li><a title="충청/대전" tabindex="0">충청/대전</a></li>
												<li><a title="전라/광주" tabindex="0">전라/광주</a></li>
												<li><a title="경북/대구" tabindex="0">경북/대구</a></li>
												<li><a title="경남/부산/울산" tabindex="0">경남/부산/울산</a></li>
												<li><a title="강원" tabindex="0">강원</a></li>
												<li><a title="제주" tabindex="0">제주</a></li>
											</ul></td>
										<td headers="gmenu gmenu4"><ul>
												<li><a title="홈" tabindex="0">홈</a></li>
												<li><a title="샤롯데" tabindex="0">샤롯데</a></li>
												<li><a title="수퍼플렉스 G" tabindex="0">수퍼플렉스 G</a></li>
												<li><a title="수퍼 S" tabindex="0">수퍼 S</a></li>
												<li><a title="수퍼플렉스" tabindex="0">수퍼플렉스</a></li>
												<li><a title="수퍼 4D" tabindex="0">수퍼 4D</a></li>
												<li><a title="컬러리움" tabindex="0">컬러리움</a></li>
												<li><a title="씨네살롱" tabindex="0">씨네살롱</a></li>
												<li><a title="씨네패밀리" tabindex="0">씨네패밀리</a></li>
												<li><a title="씨네커플" tabindex="0">씨네커플</a></li>
												<li><a title="씨네비즈" tabindex="0">씨네비즈</a></li>
												<li><a title="씨네컴포트(리클라이너)" tabindex="0">씨네컴포트(리클라이너)</a></li>
											</ul></td>
										<td headers="gmenu gmenu5"><ul>
												<li><a title="베스트" tabindex="0">베스트</a></li>
												<li><a title="포토카드" tabindex="0">포토카드</a></li>
												<li><a title="관람권" tabindex="0">관람권</a></li>
												<li><a title="스낵음료" tabindex="0">스낵음료</a></li>
											</ul></td>
										<td headers="gmenu gmenu6"><ul>
												<li><a title="VIP" tabindex="0">VIP/Friend</a></li>
												<li><a title="짝꿍클럽" tabindex="0">짝꿍클럽</a></li>
												<li><a title="틴틴클럽" tabindex="0">틴틴클럽</a></li>
												<li><a title="브라보클럽" tabindex="0">브라보클럽</a></li>
											</ul></td>
									</tr>
									<tr style="font-size:12px;">
										<th scope="col" id="gmenu7"><span>마이</span></th>
										<th scope="col" id="gmenu8"><span>고객센터</span></th>
										<th scope="col" id="gmenu9"><span>회원 서비스</span></th>
										<th scope="col" id="gmenu10"><span>이벤트</span></th>
										<th scope="col" id="gmenu11"><span>할인안내</span></th>
										<th scope="col" id="gmenu12"><span>회사소개</span></th>
									</tr>
									<tr style="vertical-align: baseline;">
										<td headers="gmenu gmenu7"><ul>
												<li><a title="결제내역" tabindex="0">결제내역</a></li>
												<li><a title="쿠폰함" tabindex="0">쿠폰함</a></li>
												<li><a title="MY 이벤트" tabindex="0">MY 이벤트</a></li>
												<li><a title="MY 클럽" tabindex="0">MY 클럽</a></li>
												<li><a title="MY 무비로그" tabindex="0">MY 무비로그</a></li>
												<li><a title="MY 정보 관리" tabindex="0">MY 정보 관리</a></li>
											</ul></td>
										<td headers="gmenu gmenu8"><ul>
												<li><a title="브라보클럽" tabindex="0">FAQ</a></li>
												<li><a title="공지사항" tabindex="0">공지사항</a></li>
												<li><a title="1:1 문의" tabindex="0">1:1 문의</a></li>
												<li><a title="단체관람/대관문의" tabindex="0">단체관람/대관문의</a></li>
												<li><a title="분실물문의" tabindex="0">분실물문의</a></li>
											</ul></td>
										<td headers="gmenu gmenu9"><ul>
												<li><a title="로그인" tabindex="0">로그인</a></li>
												<li><a title="회원가입" tabindex="0">회원가입</a></li>
												<li><a title="아이디/비밀번호찾기" tabindex="0">아이디/비밀번호찾기</a></li>
												<li><a title="회원약관" tabindex="0">회원약관</a></li>
												<li><a title="개인정보처리방침" tabindex="0">개인정보처리방침</a></li>
												<li><a title="이메일무단수집거부" tabindex="0">이메일무단수집거부</a></li>
												<li><a title="영상정보처리기기 운영 및 관리방침" tabindex="0">영상정보처리기기
														운영 및 관리방침</a></li>
												<li><a title="L.POINT회원안내" tabindex="0">L.POINT회원안내</a></li>
											</ul></td>
										<td headers="gmenu gmenu10"><ul>
												<li><a title="영화" tabindex="0">영화</a></li>
												<li><a title="시사회/무대인사" tabindex="0">시사회/무대인사</a></li>
												<li><a title="HOT" tabindex="0">HOT</a></li>
												<li><a title="제휴할인" tabindex="0">제휴할인</a></li>
												<li><a title="우리동네영화관" tabindex="0">우리동네영화관</a></li>
											</ul></td>
										<td headers="gmenu gmenu11"><ul>
												<li><a title="신용카드" tabindex="0">신용카드</a></li>
												<li><a title="포인트" tabindex="0">포인트</a></li>
												<li><a title="통신사" tabindex="0">통신사</a></li>
												<li><a title="기타결제수단" tabindex="0">기타결제수단</a></li>
											</ul></td>
										<td headers="gmenu gmenu12"><ul>
												<li><a title="채용안내" target="_blank" tabindex="0">채용안내</a></li>
												<li><a title="광고/임대문의" target="_blank" tabindex="0">광고/임대문의</a></li>
												<li><a title="기업정보" target="_blank" tabindex="0">기업정보</a></li>
												<li><a title="사회적책임" target="_blank" tabindex="0">사회적책임</a></li>
											</ul></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="group_banner">
							<a
								href="#none"
								target=""><img style="width: 600px; margin-top: 20px;"
								src="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_980180.jpg"
								alt=""></a>
						</div>
						<div class="group_close">
							<button class="btn_close">전체메뉴 닫기</button>
						</div>
						<strong class="hidden txtTabIndex" tabindex="0">레이어 팝업 끝</strong>
					</div>
				</div>
				<%-- 사이트맵 끝 --%>
<!-- End Header -->