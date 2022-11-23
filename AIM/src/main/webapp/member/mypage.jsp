<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp" />
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp"/>
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/login_nav_bar.jsp" />


    <div id="contents" class="contents_mypage area__movingbar litype8"
		style="padding-top: 50px;">
        <!-- 마이페이지 공통부분 -->
        <div class="mypage_top_infor" id="mypage_top_infor">
			<h2 class="hidden">마이페이지</h2>
			<div class="mypage_box">
				<h3 class="hidden">회원 등급 및 포인트</h3>
				<div class="my_info">
					<div class="grade_area">
						<span class="txt_rank_common ml5">일반</span>
					</div>
					<p class="name">
						<strong>${dto.mb_id }</strong>반가워요!</p>
					<div class="profile_set">
						<p class="tooltip_bk">닉네임을 설정해 주세요.</p>
						<button type="button" class="btn_txt_edit" title="레이어팝업 열기">편집</button>
					</div>
					<div class="next_rank">
						<p>1분기 Lv.1까지 <em class="font22">40,000원 남았어요!</em>
						</p>
					</div>
				</div>
				<div class="bx_grade merge2020">
					<div class="area_gauge friendslv">
						<div class="gauge" style="width: 0%;"></div>
						<ul class="infograde">
							<li><strong class="" style="font-weight: normal;">Friends</strong><em>0</em></li>
							<li><strong class="">Lv.1</strong><em>4만원</em></li>
							<li><strong class="">Lv.2</strong><em>6만원</em></li>
							<li><strong class="">Lv.3</strong><em>8만원</em></li>
						</ul>
					</div>
					<a href="https://www.lottecinema.co.kr/NLCHS/Mypage/MemberVipzone"
						class="btn_col5 ty5 rnd">MEMBERSHIP ZONE</a>
				</div>
				<div class="btn_wrap">
					<a href="https://www.lpoint.com/app/mypage/LHMA200100.do"
						target="_blank" title="L.POINT 페이지 이동"><span class="txt_img"><img
							src="/NLCHS/Content/images/common/txt_lpoint_20210407.png"
							alt="L.POINT"></span> <em>39P</em></a><a
						href="https://www.lottecinema.co.kr/NLCHS/MyCinema/CouponList?mTab=2&amp;sTab=1"
						title="쿠폰함 페이지 이동">쿠폰함 <em class="txt_color">0</em></a>
				</div>
			</div>
			<div class="my_theater" id="my_theater">
				<h3 class="tit">MY 영화관</h3>
				<button type="button" class="btn_setup" title="레이어팝업 열기">설정</button>
				<ul class="theater_box">
					<li class="add" id="my_theater_1"><strong>1st</strong></li>
					<li class="add" id="my_theater_2"><strong>2nd</strong></li>
					<li class="add" id="my_theater_3"><strong>3rd</strong></li>
				</ul>
				<div class="banner_club">
					<a
						href="https://www.lottecinema.co.kr/NLCHS/MyCinema/MyClubBravo?mTab=4&amp;sTab=3"><img
						src="/NLCHS/Content/images/member/my_club_315_bravo_210316.jpg"
						alt="BROVO CLUB 브라보 마이 라이프 여유있는 브라보클럽. 영화할인권 커피1천원"></a>
				</div>
			</div>
		</div>
        <!-- //마이페이지 공통부분 -->
        <!-- 마이페이지 메뉴 공통부분 -->
        <div id="mypage_top_menu">
			<ul class="tab_wrap_lnk actionmovingbar">
				<li class="active"><a href="#!" style="width: 16.67%; left: 0%;"><span>결제내역</span></a>
				<ul>
						<li class="active"><a href="#!"
							style="left: 0px; margin-left: 28.8438px;"><span>예매내역</span></a></li>
						<li class=""><a href="#!"
							style="left: 66px; margin-left: 28.8438px;"><span>구매/선물내역</span></a></li>
						<li class=""><a href="#!"
							style="left: 160px; margin-left: 28.8438px;"><span>취소내역</span></a></li>
					</ul></li>
				<li class=""><a href="#!" style="width: 16.67%; left: 16.67%;"><span>쿠폰함</span></a></li>
				<li class=""><a href="#!" style="width: 16.67; left: 33.34%;"><span>MY 이벤트</span></a></li>
				<li class=""><a href="#!" style="width: 16.67%; left: 50%;"><span>MY 무비로그</span></a>
				<ul>
						<li class=""><a href="#!"
							style="left: 0px; margin-left: 627.281px;"><span>보고싶어요</span></a></li>
						<li class=""><a href="#!"
							style="left: 73px; margin-left: 627.281px;"><span>내가 본 영화</span></a></li>
					</ul></li>
				<li class=""><a href="#!" style="width: 16.67%; left: 66.67%;"><span>1:1 문의</span></a></li>
				<li class=""><a href="#!" style="width: 16.67%; left: 83.7%;"><span>MY 정보 관리</span></a>
				<ul>
						<li class=""><a href="#!"
							style="left: 0px; margin-left: 592px;"><span>회원정보관리</span></a></li>
						<li class=""><a href="#!"
							style="left: 84px; margin-left: 592px;"><span>1:1문의내역</span></a></li>
						<li class=""><a href="#!"
							style="left: 162px; margin-left: 592px;"><span>단체관람/대관문의내역</span></a></li>
						<li class=""><a href="#!"
							style="left: 293px; margin-left: 592px;"><span>분실물문의내역</span></a></li>
					</ul></li>
				<li class="wrap_nav_underline"><span class="nav_underline"></span></li>
			</ul>
		</div>
        <!-- //마이페이지 메뉴 공통부분 -->


        <script src="/NLCHS/Scripts/common/aes.js"></script>
        <script src="/NLCHS/Scripts/common/sso.js?v=202211151557"></script>
        <script src="/NLCHS/Scripts/common/LcCommon.js?v=202211151557"></script>
        <script
			src="/NLCHS/Scripts/common/crossDomainStorage.js?v=202211151557"></script>

        <script
			src="/NLCHS/Scripts/Dist/Pagination.bundle.js?v=202211151557"></script>

        
        


<div class="mypage_wrap" id="mypage_wrap">
			<div class="tab_con">
				<h4 class="hidden">예매내역</h4>
				<div class="bx_nodata">
					<img src="/NLCHS/Content/images/icon/nodata_140_01.png" alt="">
					<p class="tit">예매 내역이 존재하지 않습니다.</p>
				</div>
				<div class="txt_list_wrap">
					<div class="list_bdr_box">
						<h5 class="title txt_caution2">유의사항</h5>
						<div class="list_inner_box">
							<strong class="tit">환불 안내</strong>
							<dl class="list_define">
								<dt>신용카드</dt>
								<dd>결제 후 3일 이내 취소 시 승인 취소 가능합니다.</dd>
								<dd>3일 이후 예매 취소 시 영업일 기준 3일 ~ 7일 이내 카드사에서 환불됩니다.</dd>
							</dl>
							<dl class="list_define">
								<dt>체크카드</dt>
								<dd>결제 후 3일 이내 취소 시 당일 카드사에서 환불 처리됩니다.</dd>
								<dd>3일 이후 예매 취소 시 카드사에 따라 3일 ~ 10일 카드사에서 환불됩니다.</dd>
							</dl>
							<dl class="list_define">
								<dt>휴대폰 결제</dt>
								<dd>결제 일자 기준 당월(1일 ~ 말일까지) 취소만 가능합니다.</dd>
								<dd>익월 취소의 경우 롯데시네마 고객센터(1544-8855)로 문의 주시기 바랍니다.</dd>
							</dl>
							<dl class="list_define">
								<dt>모바일캐시비/티머니</dt>
								<dd>모바일캐시비(선불형): 모바일캐시비 APP 선물함으로 취소금액이 충전됩니다.</dd>
								<dd>모바일티머니(선불형): 환불 SMS 수신 후 URL 클릭하시면 모바일티머니 APP이 자동으로 실행되어 취소금액이 충전됩니다.</dd>
								<dd>모바일캐시비/티머니(후불형): 취소금액은 환불되지 않고, 신용카드 대금에서 청구 취소됩니다. (취소일 7일 이내 카드사 청구내역에서 확인 가능합니다.)</dd>
								<dd>모바일캐시비/티머니(플라스틱카드): 교통카드충전결제 APP 실행 후, [환불내역]에서 카드 태깅하여 카드로 충전됩니다.</dd>
							</dl>
							<dl class="list_define">
								<dt>예매 및 추가상품 구매 취소 안내</dt>
								<dd>온라인 예매 및 추가상품 구매 취소는 상영 20분 전까지 가능하며, 20분 이전부터는 현장 취소만 가능합니다.</dd>
								<dd>티켓에 표기된 상영시작시간 이후 환불은 불가합니다.</dd>
								<dd>무대인사, 스페셜상영회, GV, 라이브뷰잉 등 특별 상영 회차의 예매 취소는 상영전일 23시 59분 59초까지만 취소 가능합니다.</dd>
								<dd>온라인 예매 후 현장에서 티켓 발권 시 온라인으로 예매 취소는 불가능하며, 현장 취소만 가능합니다.</dd>
								<dd>적립 예정 L.POINT는 영화 관람 다음 날 적립됩니다.</dd>
								<dd>예고편과 광고 상영으로 실제 영화 시작 시간이 10분 정도 차이 날 수 있습니다.</dd>
								<dd>SMS 수신을 이용하시면 예매내역을 휴대폰으로 받을 수 있습니다.</dd>
								<dd>반드시 전체 취소만 가능하며, 예매나 추가상품 중 부분 취소는 불가능합니다.</dd>
								<dd>추가상품 수령 완료 시 예매 및 상품 취소 모두 불가능합니다.</dd>
								<dd>포토티켓 발권 완료 시 환불은 발권된 포토티켓 모두 지참 후 해당 영화관에서만 가능합니다.</dd>
							</dl>
							<dl class="list_define">
								<dt>상품취소 안내</dt>
								<dd>스토어 상품의 취소기한은 구매일로부터 70일입니다. (취소 관련문의 : 고객센터 1544-8855)</dd>
								<dd>구매취소는 취소기한 내 마이시네마 &gt; 예매/구매내역에서만 가능합니다.(현장취소 불가)</dd>
								<dd>구매하신 상품은 부분환불 및 현금환불이 되지 않습니다.</dd>
								<dd>좌석 구매 시 함께 구매한 매점 상품은 영화 관람 완료 후에는 취소가 불가합니다.</dd>
								<dd>얼리버드 상품은 특별관람권이므로 구매 후 7일 이내 환불 가능합니다.</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>


<script>
    var MypageBblQuery = RequestParams(document.location.search);					//페이지 파라메터
</script>


<script
			src="/NLCHS/Scripts/Dist/TicketingOrderList.bundle.js?v=2022111503"></script>

        

    </div>
	

    <!-- popup : 프로필 편집 -->
    <div id="layerEditProfile"
		class="layer_wrap layer_mypage layer_edit_profile"
		style="left: 0; top: 0"></div>
    <!-- //popup : 프로필 편집 -->
    <!-- 적립내역팝업 -->
    <div id="layerSavingBreakdown"
		class="layer_wrap layer_saving_breakdown" style="left: 0; top: 0"></div>
    <!-- //적립내역팝업 -->
    <!-- popup : MY 영화관 설정 -->
    <div id="divContentsData"></div>
    <div id="layerRegMyCinema"
		class="layer_wrap ty3 layer_reg_my_cinema" style="left: 0; top: 0"></div>
    <!-- //popup : MY 영화관 설정 -->
    <!-- popup : 쿠폰등록 -->
    <div id="layerCouponReg"
		class="layer_wrap type4 layer_coupon_reg active area__movingbar litype2"
		style="left: 0px; top: 0px"></div>
    <!-- //popup : 쿠폰등록 -->
    <!-- popup : 쿠폰삭제 -->
    <div id="layerCouponDel" class="layer_wrap layer_coupon_del"
		style="left: 0; top: 0px"></div>
    <!-- //popup : 쿠폰삭제 -->
    <!-- popup : 선물하기 -->
    <div id="layerCouponGift"
		class="layer_wrap layer_monitor_gift active"
		style="left: 0; top: 500px;" tabindex="0"></div>
    <!-- //popup : 선물하기 -->
    <!-- VIP쿠폰받기팝업 -->
    <div id="layerVipCouponDown"
		class="layer_wrap layer_vip_coupon_down" style="left: 0; top: 0px"></div>
    <!-- //VIP쿠폰받기팝업 -->
    <!-- popup : 휴대폰으로바로티켓받기 -->
    <div id="layerGetMobTicket" class="layer_wrap layer_get_mobticket"
		style="left: 0; top: 0px"></div>
    <!-- //popup : 휴대폰으로바로티켓받기 -->
    <!-- popup : 카드매출온라인 전표 -->
    <div id="layerCardStatement"
		class="layer_wrap ty3 scroll layer_reg_my_cinema"
		style="left: 0; top: 0px"></div>
    <!-- //popup : 카드매출온라인 전표 -->
    

    
    
    <div id="banner_section" class="banner_wrap">
		<div class="banner_01">
			<a
				href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_34&amp;adgroupid=adg_lottecinema_20221021_17&amp;adid=adi_lottecinema_20221021_24"
				target=""><img
				src="https://caching2.lottecinema.co.kr/lotte_image/2022/KI/KI_980180.jpg"
				alt=""></a>
		</div>
		<div id="footerBanner" class="banner_type02"
			style="background-color: rgb(0, 108, 255); background-image: url(&quot;https://caching2.lottecinema.co.kr/lotte_image/2017/bg_01.jpg&quot;); background-repeat: repeat-x; background-position: 0px 0px;">
			<a
				href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_36&amp;adgroupid=adg_lottecinema_20221031_40&amp;adid=adi_lottecinema_20221031_40"
				target="_blank"><img
				src="https://caching2.lottecinema.co.kr/lotte_image/2022/Samsungfire/1004/Samsungfire_980240.png"
				alt=""></a>
		</div>
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
    
    
    

    



    <script
		src="/NLCHS/Scripts/Dist/LayoutSkipNav.bundle.js?v=202211151557"></script>
    <script
		src="/NLCHS/Scripts/Dist/LayoutHeaderMenu.bundle.js?v=202211151557"></script>
    <script
		src="/NLCHS/Scripts/Dist/LayoutBanner.bundle.js?v=202211151557"></script>
    <script
		src="/NLCHS/Scripts/Dist/LayoutFooter.bundle.js?v=202211151557"></script>
    <script
		src="/NLCHS/Scripts/Dist/LayoutQuickMenu.bundle.js?v=202211151557"></script>
    <script
		src="/NLCHS/Scripts/Dist/Layout_MyPage.bundle.js?v=202211151557"></script>
    <script
		src="/NLCHS/Scripts/Dist/LayoutBannerSide.bundle.js?v=202211151557"></script>

    

    

    <script>
        $(document).ready(function () {
            // 전체메뉴 중 header로 부터 수신받은 vtype으로 영화관 설정으로  바로 진입
            if (MypageCommonQuery.vType != null && MypageCommonQuery.vType != undefined && MypageCommonQuery.vType == "0") {
                var timer = setInterval(function () {
                    $(".btn_setup").click();
                    clearInterval(timer);
                }, 3000);
            }
        });

        if (document.readyState == "complete") {
            document.getElementById("loading").classList.remove('loader');
            document.getElementById("loading").classList.remove('loader-bouncing');
            document.getElementById("loading").classList.remove('is-active');
        }

                        //document.addEventListener('readystatechange', event => {
                        //    if (event.target.readyState === "complete") {
                        //        document.getElementById("loading").classList.remove('loader');
                        //        document.getElementById("loading").classList.remove('loader-bouncing');
                        //        document.getElementById("loading").classList.remove('is-active');
                        //    }
                        //});
    </script>


<iframe title="교차프레임"
		src="https://www.lottecinema.co.kr/NLCHS/crossd_iframe.html"
		style="position: absolute; width: 1px; height: 1px; left: -9999px;"></iframe>
	<iframe title="교차프레임"
		src="https://www.lottecinema.co.kr/NLCHS/crossd_iframe.html"
		style="position: absolute; width: 1px; height: 1px; left: -9999px;"></iframe>
	<iframe title="교차프레임"
		src="https://event.lottecinema.co.kr/NLCHS/crossd_iframe.html"
		style="position: absolute; width: 1px; height: 1px; left: -9999px;"></iframe>
	<iframe title="교차프레임"
		src="https://event.lottecinema.co.kr/NLCHS/crossd_iframe.html"
		style="position: absolute; width: 1px; height: 1px; left: -9999px;"></iframe>
	<script type="text/javascript" id="">(function(){try{var d="UA-106764115-1",h="4",a=null,e=ga.getAll(),f;var b=0;for(f=e.length;b<f;b+=1)if(e[b].get("trackingId")===d){a=e[b].get("clientId");break}a=encodeURI(a);d="https://tag-deepad.lpoint.com/cookie?mid\x3d"+h+"\x26cid\x3d"+a;var g=document.getElementsByTagName("script")[0],c=document.createElement("script");c.async=!0;c.type="text/javascript";c.src=d;g.parentNode.insertBefore(c,g)}catch(k){console.log("LPOINT DeepAD Cookie Sync Tag Error:::"+k)}})();</script>
</body>
</body>

</html>