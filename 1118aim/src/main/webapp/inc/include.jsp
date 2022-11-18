<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- meta data & title -->
<meta charset="utf-8">
<title>AIM - All In Movie</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="./assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="./assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="./assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="./assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="./assets/ico/apple-touch-icon-57-precomposed.png">

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300">
<link href="http://fonts.googleapis.com/css?family=PT+Sans"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="./assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="./assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./assets/css/animate.min.css">
<link rel="stylesheet" href="./assets/css/style.css">
<link href="./assets/css/common.css" rel="stylesheet" type="text/css">
<link href="./assets/css/default.css" rel="stylesheet" type="text/css">
<link href="./assets/css/content.css" rel="stylesheet" type="text/css">
<link href="./assets/css/owl.css" rel="stylesheet" type="text/css">
<link href="./assets/css/dev.css" rel="stylesheet" type="text/css">
<link href="./assets/css/owl.carousel.css" rel="stylesheet" type="text/css">
<link href="./assets/css/owl.theme.default.css" rel="stylesheet" type="text/css">
<link href="./assets/css/owl.theme.green.css" rel="stylesheet" type="text/css">
<link href="./assets/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
<link href="./assets/css/swiper.css" rel="stylesheet" type="text/css">

<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> -->


<!-- other -->
    
    <script type="text/javascript">
        var CinemaServerDomain = "https://www.lottecinema.co.kr";
        var EventServerDomain = "https://event.lottecinema.co.kr";
        var CinemaServiceDomain = "";
        var Language = "KR";
        var lottecinemaVodDomain = "https://www.lottecinemavod.co.kr";
        var seechuAgreeMode = "";       //롯데시네마 VOD 동의 호출 경로(main, vod)
        //서비스플랫폼 NLCMW:모바일웹, NLCMS:모바일앱, NLCHS:웹
        var PLATFORM_TYPE = "NLCHS";
        var CHANNEL_TYPE = "HO";
        const headTitle = "Main";
    </script>
    <script src="./assets/css/owl.carousel.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	 <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <script src="./assets/jquery-1.12.3.min.js"></script>
    <script src="./assets/jquery.jplayer.min.js"></script>
    <script src="./assets/jquery.lazy.min.js"></script>
    <script src="./assets/jquery-ui.min.js"></script>
    <script src="./assets/jquery.cookie.js"></script>
    <script src="./assets/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="./assets/css/owl.carousel-2.3.4-custom.js"></script>
    <script src="./assets/plugin.js"></script>
    <script src="./assets/pl_custom.js"></script>
    <script src="./assets/moment.js"></script>
    <script src="https://members.lpoint.com/api/js/lotte.sso.api.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="./assets/common.js?v=202211071548"></script>
    <script src="./assets/Cookie.js?v=202211071548"></script>
    <script src="./assets/js/jquery-1.10.2.min.js"></script>
	<script src="./assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="./js/wow.min.js"></script>
	<script>
      new WOW().init();
    </script>
    

    <script src="./assets/jquery.blockUI.min.js"></script>
    <script src="./assets/remarkable.min.js"></script>
    <script src="./assets/axios.min.js"></script>
    <script src="./assets/URLSearchParamsCustom.js"></script>
    <script src="./assets/Util.js?v=202211071548"></script>
    <script src="./assets/Common.js?v=202211071548"></script>
    <script src="./assets/ShareSNS.js?v=202211071548"></script>
    <script src="./assets/Member.js"></script>
    <script type="text/javascript">
        var MypageCommonQuery = RequestParams(document.location.search);					//페이지 파라메터
    </script>
    
    <!-- Google Tag Manager -->
    
    <script src="./assets/lcga.js?v=202211071548"></script>
    <!-- Google Tag Manager -->

	<!-- 로그아웃 클릭시 알림 -->
	<script type="text/javascript">
		function logout() {
			if (confirm("정말 로그아웃 하시겠습니까?")) {
				location.href='./Logout.aim';
			}	
		}
	</script>



