<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 각종 요소 -->
	<jsp:include page="../inc/include.jsp"/>
	
<!-- 각종 요소 -->

</head>
<body>
	
	<!-- 상위 배너 -->
	<jsp:include page="../inc/topbanner.jsp"/>
	<!-- 헤더/네비 -->
	<jsp:include page="../inc/nav_bar.jsp"/>


<div id="PersonSeatContents"></div>
<div id="contents" class="contents_full contents_reserve" style="">
    
    <div class="wrap_reserve">
        <h2 class="hidden">예매하기</h2>
        <div id="PersonSeatHeader" class="section_step_tit">
	        <ul>
	        
	        	<!-- 선택한 상영정보 마우스 올리면 -->
	        	<li class="step01 prev">
	        		<a href="#reserveStep01">
		        		<strong class="tit">
		        		<span>01</span>
		        		<br>상영시간
		        		</strong>
			       		<div class="bx_con">
				       		<dl>
				       			
					       			<dt>선택한 영화 제목</dt>
					       			<dd>${selectSche.movieNm }</dd>
					       			
					       			<dt>선택한 상영관</dt>
					       			<dd>${selectSche.branch_name } ${selectSche.roomNum }</dd>
					       			<dt>선택한 상영 날짜</dt>
					       			<dd>${selectSche.sc_date }</dd>
					       			<dt>선택한 시간</dt>
					       			<dd>${selectSche.starttime }</dd>
				
				    		</dl>
			    		</div>
	    			</a>
	    		</li>
	    		
	    		<!-- 선택한 인원과 좌석 -->
	    		<li class="step02 active">
	    			<a href="#reserveStep02">
	    				<strong class="tit">
	    				<span>02</span>
	    				<br>인원/좌석
	    				</strong>
	    				<div class="bx_con">
	    					<dl>
	    						<dt>선택한 인원</dt>
	    						<dd><span id="preview_person_info"></span></dd>
	    						<dt>선택한 좌석</dt>
	    						<dd class="seat_list"><span id="preview_seat_info"></span></dd>
	   						</dl>
	 					</div>
	 				</a>
	 			</li>
	 			<li class="step03">
	 				<a style="cursor: default;">
		 				<strong class="tit">
		 				<span>03</span>
		 				<br>결제
		 				</strong>
		 				<div class="bx_con">
		 					<dl>
		 						<dt>티켓금액</dt>
		 						<dd>0원</dd>
		 						<dt>할인금액</dt>
		 						<dd>0원</dd>
		 						<dt>총합계</dt>
		 						<dd>0원</dd>
							</dl>
						</div>
					</a>
				</li>
				<li>
					<a style="cursor: default;">
						<strong class="tit">
						<span>04</span>
						<br>결제완료
						</strong>
					</a>
				</li>
			</ul>
		</div>

        

        
        <div id="reserveStep01" class="section_step_con step01">
            <h3 class="hidden">상영시간</h3>

        </div>
        

        
        <div id="reserveStep02" class="section_step_con step02 active">
            <h3 class="hidden">인원/좌석</h3>
            <!--<div id="PersonSeatHeader"></div>-->
            
            <div class="article article_seat">
                <div class="group_top">
                    <h4 class="tit">인원/좌석 선택</h4>
                    <p class="txt" id="txtPeopleMaxcount"></p>
                </div>
                <div class="inner">
                    
                    <div id="PersonSeatCount">
                    	<div class="select_num_people_wrap">
	                    	<h5 class="hidden">인원선택</h5>
	                    	<div class="movie_infor">
		                    	<h6 class="hidden">예매 정보</h6>
		                    	<span class="thm">
		                    	</span>
		                    	
		                    	<!-- 선택한 상영정보 고정 -->
		                    	<div class="group_infor">
			                    	<div class="bx_tit">
				                    	<c:choose>
											<c:when test="${selectSche.watchGradeNm eq '12세이상관람가' }"> 
												<span class="ic_grade gr_12">12</span>
											</c:when>
											<c:when test="${selectSche.watchGradeNm eq '15세이상관람가' }"> 
												<span class="ic_grade gr_15">15</span>
											</c:when>
											<c:otherwise>
												<span class="ic_grade gr_all">ALL</span>
											</c:otherwise>
										</c:choose>
<!-- 				                    	<span class="ic_grade gr_12">관람가</span> -->
				                    	<strong>${selectSche.movieNm }</strong>
			                    	</div>
			                    	<dl>
			                    		<dt>일시</dt>	                    		
			                    		<dd class="sub_info1">${selectSche.sc_date }<em></em>
			                    		<span class="time">${selectSche.starttime }</span></dd>
			                    		<dt>영화관</dt>
			                    		<dd class="sub_info1">${selectSche.branch_name } · ${selectSche.roomNum } </dd>
		                    		</dl>
	                    		</div>
                    			<!-- 선택한 상영정보 고정 -->
                    			
                    		</div>
                    		
                    		<!-- 인원수 선택하기 -->
                    		<div class="count_people">
	                    		<h6 class="hidden">인원선택</h6>
	                    		<ul>
	                    			<li id="person_10" data-code="10" data-peple="성인" data-count="0">
		                    			<strong class="tit">인원수</strong>
		                    			<span class="bx_num">
			                    			<button class="btn_mins" id="Minus|10">감소</button>
			                    				<div class="txt_num">0</div>
			                    			<button class="btn_plus" id="Plus|10">증가</button>
<!-- 			                    			<script type="text/javascript"> -->
<%-- // 			                    				${".btn_mins"}.click(function(){ --%>
<!-- // 			                    					var num = $(".txt_num").val(); -->
<!-- // 			                    					var plusNum = Number(num) + 1; -->
			                    					
<!-- // 			                    					if(plusNum >= ) -->
<!-- // 			                    				}); -->
<!-- 			                    			</script> -->
		                    			</span>
	                    			</li>
	                    			
	                   			</ul>
                   			</div>
                   			<!-- 인원수 선택하기 -->
                   			
                 		</div>
                 	</div>
                    

                    
                    <div class="select_seat_wrap">
                        <h5 class="hidden">좌석선택</h5>
                        <div class="top_txt_info">
                            <p id="ticketMessageInfo">좌석 선택 후 결제하기 버튼을 클릭하세요</p>
                        </div>
                        <div id="PersonSeatSelect"> </div>
                        
                        <div id="container" class="seat_wrap">
                            <article class="mseat_wrap">
                                <div class="mseat_inner">

                                    <div class="mCustomScrollbar _mCS_1 mCS-autoHide" data-mcs-theme="minimal-dark" style="position: relative; overflow: visible; height: 470px;"><div id="mCSB_1" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
                                        <div class="meat_door_pos" id="scrollWrap">
                                            <div class="mseat_hidden">
                                                
                                                <span class="title_screen1">SCREEN</span>
                                                
                                                <div class="showMap">
                                                <div class="floor_bx seatSet1">

																	<span class="floor_tit" style="display: none;">10F</span>
																	<div class="seat_area"
																		style="margin-top: 30px; width: 506.688px; height: 378.105px;">
																		<span class="seat_tit" style="left: -30px; top: 0px">A</span>
																		<a href="#none" alt="A1 일반석 선택불가능"
																			class="sel  p0 grNum3" block-code="p0" data-seat="A1"
																			seat-statuscode="0" seat-group="grNum3"
																			seat-code="1A01" style="left: 21px; top: 0px;"> <span
																			class="f1" style="top: 0px;">1</span></a> <a href="#none"
																			alt="A2 일반석 선택불가능" class="sel  p0 grNum3"
																			block-code="p0" data-seat="A2" seat-statuscode="0"
																			seat-group="grNum3" seat-code="1A02"
																			style="left: 46.1875px; top: 0px;"> <span
																			class="f1" style="top: 0px;">2</span></a> <a href="#none"
																			alt="A3 일반석 선택불가능" class="sel  p0 grNum3"
																			block-code="p0" data-seat="A3" seat-statuscode="0"
																			seat-group="grNum3" seat-code="1A03"
																			style="left: 71.375px; top: 0px;"> <span
																			class="f1" style="top: 0px;">3</span></a> 
																			<a href="#none"
																			alt="좌석 번호:A4 장애인석"
																			class="sel handicapped p0 grNum4 no_select"
																			block-code="p0" data-seat="A4" seat-statuscode="0"
																			seat-group="grNum4" seat-code="1A04"
																			style="left: 115.312px; top: 0px;"> <span
																			class="handicapped f1 no_select blind" href="#none"
																			style="top: 0px;">4</span></a> <a href="#none"
																			alt="A5 장애인석 선택불가능"
																			class="sel handicapped p0 grNum4 no_select"
																			block-code="p0" data-seat="A5" seat-statuscode="0"
																			seat-group="grNum4" seat-code="1A05"
																			style="left: 140.5px; top: 0px;"> <span
																			class="handicapped f1 no_select blind" href="#none"
																			style="top: 0px;">5</span></a> <a href="#none"
																			alt="좌석 번호:A6 장애인석"
																			class="sel handicapped p0 grNum4 no_select"
																			block-code="p0" data-seat="A6" seat-statuscode="0"
																			seat-group="grNum4" seat-code="1A06"
																			style="left: 165.688px; top: 0px;"> <span
																			class="handicapped f1 no_select blind" href="#none"
																			style="top: 0px;">6</span></a> <a href="#none"
																			alt="좌석 번호:A7 장애인석"
																			class="sel handicapped p0 grNum4 no_select"
																			block-code="p0" data-seat="A7" seat-statuscode="0"
																			seat-group="grNum4" seat-code="1A07"
																			style="left: 190.875px; top: 0px;"> <span
																			class="handicapped f1 no_select blind" href="#none"
																			style="top: 0px;">7</span></a> <a href="#none"
																			alt="A8 장애인석 선택불가능"
																			class="sel handicapped p0 grNum4 no_select"
																			block-code="p0" data-seat="A8" seat-statuscode="0"
																			seat-group="grNum4" seat-code="1A08"
																			style="left: 216.062px; top: 0px;"> <span
																			class="handicapped f1 no_select blind" href="#none"
																			style="top: 0px;">8</span></a> <a href="#none"
																			alt="좌석 번호:A9 장애인석"
																			class="sel handicapped p0 grNum4 no_select"
																			block-code="p0" data-seat="A9" seat-statuscode="0"
																			seat-group="grNum4" seat-code="1A09"
																			style="left: 241.25px; top: 0px;"> <span
																			class="handicapped f1 no_select blind" href="#none"
																			style="top: 0px;">9</span></a> <a href="#none"
																			alt="좌석 번호:A10 일반석" class="sel  p0 grNum5"
																			block-code="p0" data-seat="A10" seat-statuscode="0"
																			seat-group="grNum5" seat-code="1A10"
																			style="left: 266.438px; top: 0px;"> <span
																			class="f1" style="top: 0px;">10</span></a> <a
																			href="#none" alt="A11 일반석 선택불가능"
																			class="sel  p0 grNum5" block-code="p0"
																			data-seat="A11" seat-statuscode="0"
																			seat-group="grNum5" seat-code="1A11"
																			style="left: 291.625px; top: 0px;"> <span
																			class="f1" style="top: 0px;">11</span></a> <a
																			href="#none" alt="좌석 번호:A12 일반석"
																			class="sel  p0 grNum5" block-code="p0"
																			data-seat="A12" seat-statuscode="0"
																			seat-group="grNum5" seat-code="1A12"
																			style="left: 316.812px; top: 0px;"> <span
																			class="f1" style="top: 0px;">12</span></a> <a
																			href="#none" alt="좌석 번호:A13 일반석"
																			class="sel  p0 grNum5" block-code="p0"
																			data-seat="A13" seat-statuscode="0"
																			seat-group="grNum5" seat-code="1A13"
																			style="left: 342px; top: 0px;"> <span class="f1"
																			style="top: 0px;">13</span></a> <a href="#none"
																			alt="A14 일반석 선택불가능" class="sel  p0 grNum5"
																			block-code="p0" data-seat="A14" seat-statuscode="0"
																			seat-group="grNum5" seat-code="1A14"
																			style="left: 367.188px; top: 0px;"><span
																			class="f1" style="top: 0px;">14</span></a><a href="#none"
																			alt="좌석 번호:A15 일반석" class="sel  p0 grNum5"
																			block-code="p0" data-seat="A15" seat-statuscode="0"
																			seat-group="grNum5" seat-code="1A15"
																			style="left: 392.375px; top: 0px;"><span
																			class="f1" style="top: 0px;">15</span></a><a href="#none"
																			alt="A16 일반석 선택불가능" class="sel  p0 grNum6"
																			block-code="p0" data-seat="A16" seat-statuscode="0"
																			seat-group="grNum6" seat-code="1A16"
																			style="left: 436.312px; top: 0px;"><span
																			class="f1" style="top: 0px;">16</span></a><a href="#none"
																			alt="A17 일반석 선택불가능" class="sel  p0 grNum6"
																			block-code="p0" data-seat="A17" seat-statuscode="0"
																			seat-group="grNum6" seat-code="1A17"
																			style="left: 461.5px; top: 0px;"><span class="f1"
																			style="top: 0px;">17</span></a><a href="#none"
																			alt="A18 일반석 선택불가능" class="sel  p0 grNum6"
																			block-code="p0" data-seat="A18" seat-statuscode="0"
																			seat-group="grNum6" seat-code="1A18"
																			style="left: 486.688px; top: 0px;"><span
																			class="f1" style="top: 0px;">18</span></a> <span
																			class="seat_tit"
																			style="left: -30px; top: 25.57894736842105px">B</span>
																		<a href="#none" alt="B1 일반석 선택불가능"
																			class="sel  p0 grNum7" block-code="p0" data-seat="B1"
																			seat-statuscode="0" seat-group="grNum7"
																			seat-code="1B01" style="left: 21px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="B2 일반석 선택불가능" class="sel  p0 grNum7"
																			block-code="p0" data-seat="B2" seat-statuscode="0"
																			seat-group="grNum7" seat-code="1B02"
																			style="left: 46.1875px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="B3 일반석 선택불가능" class="sel  p0 grNum7"
																			block-code="p0" data-seat="B3" seat-statuscode="0"
																			seat-group="grNum7" seat-code="1B03"
																			style="left: 71.375px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">3</span></a><a
																			href="javascript:void(0);" alt="좌석 번호:B4 일반석"
																			class="sel  p0 grNum8" block-code="p0" data-seat="B4"
																			seat-statuscode="0" seat-group="grNum8"
																			seat-code="1B04"
																			style="left: 115.312px; top: 25.5789px;"><span
																			class="f1 bland" style="top: 0px;">4</span></a><a
																			href="#none" alt="B5 일반석 선택불가능"
																			class="sel  p0 grNum8" block-code="p0" data-seat="B5"
																			seat-statuscode="0" seat-group="grNum8"
																			seat-code="1B05"
																			style="left: 140.5px; top: 25.5789px;"><span
																			class="f1 bland" style="top: 0px;">5</span></a><a
																			href="#none" alt="좌석 번호:B6 일반석"
																			class="sel  p0 grNum8" block-code="p0" data-seat="B6"
																			seat-statuscode="0" seat-group="grNum8"
																			seat-code="1B06"
																			style="left: 165.688px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">6</span></a><a href="#none"
																			alt="좌석 번호:B7 일반석" class="sel  p0 grNum8"
																			block-code="p0" data-seat="B7" seat-statuscode="0"
																			seat-group="grNum8" seat-code="1B07"
																			style="left: 190.875px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">7</span></a><a href="#none"
																			alt="좌석 번호:B8 일반석" class="sel  p0 grNum8"
																			block-code="p0" data-seat="B8" seat-statuscode="0"
																			seat-group="grNum8" seat-code="1B08"
																			style="left: 216.062px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">8</span></a><a href="#none"
																			alt="좌석 번호:B9 일반석" class="sel  p0 grNum8"
																			block-code="p0" data-seat="B9" seat-statuscode="0"
																			seat-group="grNum8" seat-code="1B09"
																			style="left: 241.25px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">9</span></a><a href="#none"
																			alt="좌석 번호:B10 일반석" class="sel  p0 grNum8"
																			block-code="p0" data-seat="B10" seat-statuscode="0"
																			seat-group="grNum8" seat-code="1B10"
																			style="left: 266.438px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">10</span></a><a href="#none"
																			alt="좌석 번호:B11 일반석" class="sel  p0 grNum8"
																			block-code="p0" data-seat="B11" seat-statuscode="0"
																			seat-group="grNum8" seat-code="1B11"
																			style="left: 291.625px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">11</span></a><a href="#none"
																			alt="좌석 번호:B12 일반석" class="sel  p0 grNum8"
																			block-code="p0" data-seat="B12" seat-statuscode="0"
																			seat-group="grNum8" seat-code="1B12"
																			style="left: 316.812px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">12</span></a><a href="#none"
																			alt="좌석 번호:B13 일반석" class="sel  p0 grNum8"
																			block-code="p0" data-seat="B13" seat-statuscode="0"
																			seat-group="grNum8" seat-code="1B13"
																			style="left: 342px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">13</span></a><a href="#none"
																			alt="B14 일반석 선택불가능" class="sel  p0 grNum8"
																			block-code="p0" data-seat="B14" seat-statuscode="0"
																			seat-group="grNum8" seat-code="1B14"
																			style="left: 367.188px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">14</span></a><a href="#none"
																			alt="좌석 번호:B15 일반석" class="sel  p0 grNum8"
																			block-code="p0" data-seat="B15" seat-statuscode="0"
																			seat-group="grNum8" seat-code="1B15"
																			style="left: 392.375px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">15</span></a><a href="#none"
																			alt="B16 일반석 선택불가능" class="sel  p0 grNum9"
																			block-code="p0" data-seat="B16" seat-statuscode="0"
																			seat-group="grNum9" seat-code="1B16"
																			style="left: 436.312px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">16</span></a><a href="#none"
																			alt="B17 일반석 선택불가능" class="sel  p0 grNum9"
																			block-code="p0" data-seat="B17" seat-statuscode="0"
																			seat-group="grNum9" seat-code="1B17"
																			style="left: 461.5px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">17</span></a><a href="#none"
																			alt="B18 일반석 선택불가능" class="sel  p0 grNum9"
																			block-code="p0" data-seat="B18" seat-statuscode="0"
																			seat-group="grNum9" seat-code="1B18"
																			style="left: 486.688px; top: 25.5789px;"><span
																			class="f1" style="top: 0px;">18</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 51.1578947368421px">C</span><a
																			href="#none" alt="C1 일반석 선택불가능"
																			class="sel  p0 grNum10" block-code="p0"
																			data-seat="C1" seat-statuscode="0"
																			seat-group="grNum10" seat-code="1C01"
																			style="left: 21px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="C2 일반석 선택불가능" class="sel  p0 grNum10"
																			block-code="p0" data-seat="C2" seat-statuscode="0"
																			seat-group="grNum10" seat-code="1C02"
																			style="left: 46.1875px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="C3 일반석 선택불가능" class="sel  p0 grNum10"
																			block-code="p0" data-seat="C3" seat-statuscode="0"
																			seat-group="grNum10" seat-code="1C03"
																			style="left: 71.375px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:C4 일반석" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C4" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C04"
																			style="left: 115.312px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">4</span></a><a href="#none"
																			alt="C5 일반석 선택불가능" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C5" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C05"
																			style="left: 140.5px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">5</span></a><a href="#none"
																			alt="좌석 번호:C6 일반석" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C6" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C06"
																			style="left: 165.688px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">6</span></a><a href="#none"
																			alt="좌석 번호:C7 일반석" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C7" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C07"
																			style="left: 190.875px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">7</span></a><a href="#none"
																			alt="좌석 번호:C8 일반석" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C8" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C08"
																			style="left: 216.062px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">8</span></a><a href="#none"
																			alt="좌석 번호:C9 일반석" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C9" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C09"
																			style="left: 241.25px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">9</span></a><a href="#none"
																			alt="좌석 번호:C10 일반석" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C10" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C10"
																			style="left: 266.438px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">10</span></a><a href="#none"
																			alt="좌석 번호:C11 일반석" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C11" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C11"
																			style="left: 291.625px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">11</span></a><a href="#none"
																			alt="좌석 번호:C12 일반석" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C12" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C12"
																			style="left: 316.812px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">12</span></a><a href="#none"
																			alt="좌석 번호:C13 일반석" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C13" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C13"
																			style="left: 342px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">13</span></a><a href="#none"
																			alt="C14 일반석 선택불가능" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C14" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C14"
																			style="left: 367.188px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">14</span></a><a href="#none"
																			alt="좌석 번호:C15 일반석" class="sel  p0 grNum11"
																			block-code="p0" data-seat="C15" seat-statuscode="0"
																			seat-group="grNum11" seat-code="1C15"
																			style="left: 392.375px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">15</span></a><a href="#none"
																			alt="C16 일반석 선택불가능" class="sel  p0 grNum12"
																			block-code="p0" data-seat="C16" seat-statuscode="0"
																			seat-group="grNum12" seat-code="1C16"
																			style="left: 436.312px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">16</span></a><a href="#none"
																			alt="C17 일반석 선택불가능" class="sel  p0 grNum12"
																			block-code="p0" data-seat="C17" seat-statuscode="0"
																			seat-group="grNum12" seat-code="1C17"
																			style="left: 461.5px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">17</span></a><a href="#none"
																			alt="C18 일반석 선택불가능" class="sel  p0 grNum12"
																			block-code="p0" data-seat="C18" seat-statuscode="0"
																			seat-group="grNum12" seat-code="1C18"
																			style="left: 486.688px; top: 51.1579px;"><span
																			class="f1" style="top: 0px;">18</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 76.73684210526316px">D</span><a
																			href="#none" alt="D1 일반석 선택불가능"
																			class="sel  p0 grNum13" block-code="p0"
																			data-seat="D1" seat-statuscode="0"
																			seat-group="grNum13" seat-code="1D01"
																			style="left: 21px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="D2 일반석 선택불가능" class="sel  p0 grNum13"
																			block-code="p0" data-seat="D2" seat-statuscode="0"
																			seat-group="grNum13" seat-code="1D02"
																			style="left: 46.1875px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="D3 일반석 선택불가능" class="sel  p0 grNum13"
																			block-code="p0" data-seat="D3" seat-statuscode="0"
																			seat-group="grNum13" seat-code="1D03"
																			style="left: 71.375px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:D4 일반석" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D4" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D04"
																			style="left: 115.312px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">4</span></a><a href="#none"
																			alt="D5 일반석 선택불가능" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D5" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D05"
																			style="left: 140.5px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">5</span></a><a href="#none"
																			alt="좌석 번호:D6 일반석" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D6" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D06"
																			style="left: 165.688px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">6</span></a><a href="#none"
																			alt="좌석 번호:D7 일반석" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D7" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D07"
																			style="left: 190.875px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">7</span></a><a href="#none"
																			alt="좌석 번호:D8 일반석" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D8" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D08"
																			style="left: 216.062px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">8</span></a><a href="#none"
																			alt="좌석 번호:D9 일반석" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D9" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D09"
																			style="left: 241.25px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">9</span></a><a href="#none"
																			alt="좌석 번호:D10 일반석" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D10" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D10"
																			style="left: 266.438px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">10</span></a><a href="#none"
																			alt="좌석 번호:D11 일반석" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D11" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D11"
																			style="left: 291.625px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">11</span></a><a href="#none"
																			alt="좌석 번호:D12 일반석" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D12" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D12"
																			style="left: 316.812px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">12</span></a><a href="#none"
																			alt="좌석 번호:D13 일반석" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D13" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D13"
																			style="left: 342px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">13</span></a><a href="#none"
																			alt="D14 일반석 선택불가능" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D14" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D14"
																			style="left: 367.188px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">14</span></a><a href="#none"
																			alt="좌석 번호:D15 일반석" class="sel  p0 grNum14"
																			block-code="p0" data-seat="D15" seat-statuscode="0"
																			seat-group="grNum14" seat-code="1D15"
																			style="left: 392.375px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">15</span></a><a href="#none"
																			alt="D16 일반석 선택불가능" class="sel  p0 grNum15"
																			block-code="p0" data-seat="D16" seat-statuscode="0"
																			seat-group="grNum15" seat-code="1D16"
																			style="left: 436.312px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">16</span></a><a href="#none"
																			alt="D17 일반석 선택불가능" class="sel  p0 grNum15"
																			block-code="p0" data-seat="D17" seat-statuscode="0"
																			seat-group="grNum15" seat-code="1D17"
																			style="left: 461.5px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">17</span></a><a href="#none"
																			alt="D18 일반석 선택불가능" class="sel  p0 grNum15"
																			block-code="p0" data-seat="D18" seat-statuscode="0"
																			seat-group="grNum15" seat-code="1D18"
																			style="left: 486.688px; top: 76.7368px;"><span
																			class="f1" style="top: 0px;">18</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 102.3157894736842px">E</span><a
																			href="#none" alt="E1 일반석 선택불가능"
																			class="sel  p0 grNum16" block-code="p0"
																			data-seat="E1" seat-statuscode="0"
																			seat-group="grNum16" seat-code="1E01"
																			style="left: 21px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="E2 일반석 선택불가능" class="sel  p0 grNum16"
																			block-code="p0" data-seat="E2" seat-statuscode="0"
																			seat-group="grNum16" seat-code="1E02"
																			style="left: 46.1875px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="E3 일반석 선택불가능" class="sel  p0 grNum16"
																			block-code="p0" data-seat="E3" seat-statuscode="0"
																			seat-group="grNum16" seat-code="1E03"
																			style="left: 71.375px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:E4 일반석" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E4" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E04"
																			style="left: 115.312px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">4</span></a><a href="#none"
																			alt="E5 일반석 선택불가능" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E5" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E05"
																			style="left: 140.5px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">5</span></a><a href="#none"
																			alt="좌석 번호:E6 일반석" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E6" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E06"
																			style="left: 165.688px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">6</span></a><a href="#none"
																			alt="좌석 번호:E7 일반석" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E7" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E07"
																			style="left: 190.875px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">7</span></a><a href="#none"
																			alt="좌석 번호:E8 일반석" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E8" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E08"
																			style="left: 216.062px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">8</span></a><a href="#none"
																			alt="좌석 번호:E9 일반석" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E9" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E09"
																			style="left: 241.25px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">9</span></a><a href="#none"
																			alt="좌석 번호:E10 일반석" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E10" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E10"
																			style="left: 266.438px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">10</span></a><a href="#none"
																			alt="좌석 번호:E11 일반석" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E11" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E11"
																			style="left: 291.625px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">11</span></a><a href="#none"
																			alt="좌석 번호:E12 일반석" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E12" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E12"
																			style="left: 316.812px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">12</span></a><a href="#none"
																			alt="좌석 번호:E13 일반석" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E13" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E13"
																			style="left: 342px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">13</span></a><a href="#none"
																			alt="E14 일반석 선택불가능" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E14" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E14"
																			style="left: 367.188px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">14</span></a><a href="#none"
																			alt="좌석 번호:E15 일반석" class="sel  p0 grNum17"
																			block-code="p0" data-seat="E15" seat-statuscode="0"
																			seat-group="grNum17" seat-code="1E15"
																			style="left: 392.375px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">15</span></a><a href="#none"
																			alt="E16 일반석 선택불가능" class="sel  p0 grNum18"
																			block-code="p0" data-seat="E16" seat-statuscode="0"
																			seat-group="grNum18" seat-code="1E16"
																			style="left: 436.312px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">16</span></a><a href="#none"
																			alt="E17 일반석 선택불가능" class="sel  p0 grNum18"
																			block-code="p0" data-seat="E17" seat-statuscode="0"
																			seat-group="grNum18" seat-code="1E17"
																			style="left: 461.5px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">17</span></a><a href="#none"
																			alt="E18 일반석 선택불가능" class="sel  p0 grNum18"
																			block-code="p0" data-seat="E18" seat-statuscode="0"
																			seat-group="grNum18" seat-code="1E18"
																			style="left: 486.688px; top: 102.316px;"><span
																			class="f1" style="top: 0px;">18</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 127.89473684210526px">F</span><a
																			href="#none" alt="F1 일반석 선택불가능"
																			class="sel  p0 grNum19" block-code="p0"
																			data-seat="F1" seat-statuscode="0"
																			seat-group="grNum19" seat-code="1F01"
																			style="left: 21px; top: 127.895px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="F2 일반석 선택불가능" class="sel  p0 grNum19"
																			block-code="p0" data-seat="F2" seat-statuscode="0"
																			seat-group="grNum19" seat-code="1F02"
																			style="left: 46.1875px; top: 127.895px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="F3 일반석 선택불가능" class="sel  p0 grNum19"
																			block-code="p0" data-seat="F3" seat-statuscode="0"
																			seat-group="grNum19" seat-code="1F03"
																			style="left: 71.375px; top: 127.895px;"><span
																			class="f1" style="top: 0px;">3</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 153.47368421052633px">G</span><a
																			href="#none" alt="G1 일반석 선택불가능"
																			class="sel  p0 grNum20" block-code="p0"
																			data-seat="G1" seat-statuscode="0"
																			seat-group="grNum20" seat-code="1G01"
																			style="left: 21px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="G2 일반석 선택불가능" class="sel  p0 grNum20"
																			block-code="p0" data-seat="G2" seat-statuscode="0"
																			seat-group="grNum20" seat-code="1G02"
																			style="left: 46.1875px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="G3 일반석 선택불가능" class="sel  p0 grNum20"
																			block-code="p0" data-seat="G3" seat-statuscode="0"
																			seat-group="grNum20" seat-code="1G03"
																			style="left: 71.375px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:G4 일반석" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G4" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G04"
																			style="left: 115.312px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">4</span></a><a href="#none"
																			alt="G5 일반석 선택불가능" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G5" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G05"
																			style="left: 140.5px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">5</span></a><a href="#none"
																			alt="좌석 번호:G6 일반석" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G6" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G06"
																			style="left: 165.688px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">6</span></a><a href="#none"
																			alt="좌석 번호:G7 일반석" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G7" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G07"
																			style="left: 190.875px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">7</span></a><a href="#none"
																			alt="좌석 번호:G8 일반석" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G8" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G08"
																			style="left: 216.062px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">8</span></a><a href="#none"
																			alt="좌석 번호:G9 일반석" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G9" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G09"
																			style="left: 241.25px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">9</span></a><a href="#none"
																			alt="좌석 번호:G10 일반석" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G10" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G10"
																			style="left: 266.438px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">10</span></a><a href="#none"
																			alt="좌석 번호:G11 일반석" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G11" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G11"
																			style="left: 291.625px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">11</span></a><a href="#none"
																			alt="좌석 번호:G12 일반석" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G12" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G12"
																			style="left: 316.812px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">12</span></a><a href="#none"
																			alt="좌석 번호:G13 일반석" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G13" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G13"
																			style="left: 342px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">13</span></a><a href="#none"
																			alt="G14 일반석 선택불가능" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G14" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G14"
																			style="left: 367.188px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">14</span></a><a href="#none"
																			alt="좌석 번호:G15 일반석" class="sel  p0 grNum21"
																			block-code="p0" data-seat="G15" seat-statuscode="0"
																			seat-group="grNum21" seat-code="1G15"
																			style="left: 392.375px; top: 153.474px;"><span
																			class="f1" style="top: 0px;">15</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 179.05263157894737px">H</span><a
																			href="#none" alt="H1 일반석 선택불가능"
																			class="sel  p0 grNum22" block-code="p0"
																			data-seat="H1" seat-statuscode="0"
																			seat-group="grNum22" seat-code="1H01"
																			style="left: 21px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="H2 일반석 선택불가능" class="sel  p0 grNum22"
																			block-code="p0" data-seat="H2" seat-statuscode="0"
																			seat-group="grNum22" seat-code="1H02"
																			style="left: 46.1875px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="H3 일반석 선택불가능" class="sel  p0 grNum22"
																			block-code="p0" data-seat="H3" seat-statuscode="0"
																			seat-group="grNum22" seat-code="1H03"
																			style="left: 71.375px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:H4 일반석" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H4" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H04"
																			style="left: 115.312px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">4</span></a><a href="#none"
																			alt="H5 일반석 선택불가능" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H5" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H05"
																			style="left: 140.5px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">5</span></a><a href="#none"
																			alt="좌석 번호:H6 일반석" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H6" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H06"
																			style="left: 165.688px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">6</span></a><a href="#none"
																			alt="좌석 번호:H7 일반석" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H7" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H07"
																			style="left: 190.875px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">7</span></a><a href="#none"
																			alt="좌석 번호:H8 일반석" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H8" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H08"
																			style="left: 216.062px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">8</span></a><a href="#none"
																			alt="좌석 번호:H9 일반석" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H9" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H09"
																			style="left: 241.25px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">9</span></a><a href="#none"
																			alt="좌석 번호:H10 일반석" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H10" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H10"
																			style="left: 266.438px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">10</span></a><a href="#none"
																			alt="좌석 번호:H11 일반석" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H11" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H11"
																			style="left: 291.625px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">11</span></a><a href="#none"
																			alt="좌석 번호:H12 일반석" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H12" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H12"
																			style="left: 316.812px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">12</span></a><a href="#none"
																			alt="좌석 번호:H13 일반석" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H13" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H13"
																			style="left: 342px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">13</span></a><a href="#none"
																			alt="H14 일반석 선택불가능" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H14" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H14"
																			style="left: 367.188px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">14</span></a><a href="#none"
																			alt="좌석 번호:H15 일반석" class="sel  p0 grNum23"
																			block-code="p0" data-seat="H15" seat-statuscode="0"
																			seat-group="grNum23" seat-code="1H15"
																			style="left: 392.375px; top: 179.053px;"><span
																			class="f1" style="top: 0px;">15</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 204.6315789473684px">I</span><a
																			href="#none" alt="I1 일반석 선택불가능"
																			class="sel  p0 grNum24" block-code="p0"
																			data-seat="I1" seat-statuscode="0"
																			seat-group="grNum24" seat-code="1I01"
																			style="left: 21px; top: 204.632px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="I2 일반석 선택불가능" class="sel  p0 grNum24"
																			block-code="p0" data-seat="I2" seat-statuscode="0"
																			seat-group="grNum24" seat-code="1I02"
																			style="left: 46.1875px; top: 204.632px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="I3 일반석 선택불가능" class="sel  p0 grNum24"
																			block-code="p0" data-seat="I3" seat-statuscode="0"
																			seat-group="grNum24" seat-code="1I03"
																			style="left: 71.375px; top: 204.632px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:I4 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I4" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I04"
																			style="left: 115.312px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">4</span></a><a
																			href="#none" alt="I5 일반석 SWEET SPOT 선택불가능"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I5" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I05"
																			style="left: 140.5px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">5</span></a><a
																			href="#none" alt="좌석 번호:I6 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I6" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I06"
																			style="left: 165.688px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">6</span></a><a
																			href="#none" alt="좌석 번호:I7 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I7" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I07"
																			style="left: 190.875px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">7</span></a><a
																			href="#none" alt="좌석 번호:I8 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I8" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I08"
																			style="left: 216.062px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">8</span></a><a
																			href="#none" alt="좌석 번호:I9 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I9" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I09"
																			style="left: 241.25px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">9</span></a><a
																			href="#none" alt="좌석 번호:I10 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I10" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I10"
																			style="left: 266.438px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">10</span></a><a
																			href="#none" alt="좌석 번호:I11 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I11" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I11"
																			style="left: 291.625px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">11</span></a><a
																			href="#none" alt="좌석 번호:I12 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I12" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I12"
																			style="left: 316.812px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">12</span></a><a
																			href="#none" alt="좌석 번호:I13 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I13" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I13"
																			style="left: 342px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">13</span></a><a
																			href="#none" alt="I14 일반석 SWEET SPOT 선택불가능"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I14" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I14"
																			style="left: 367.188px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">14</span></a><a
																			href="#none" alt="좌석 번호:I15 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum25" block-code="p0"
																			data-seat="I15" seat-statuscode="0"
																			seat-group="grNum25" seat-code="1I15"
																			style="left: 392.375px; top: 204.632px;"><span
																			class="sweet_spot f1" style="top: 0px;">15</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 230.21052631578948px">J</span><a
																			href="#none" alt="J1 일반석 선택불가능"
																			class="sel  p0 grNum26" block-code="p0"
																			data-seat="J1" seat-statuscode="0"
																			seat-group="grNum26" seat-code="1J01"
																			style="left: 21px; top: 230.211px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="J2 일반석 선택불가능" class="sel  p0 grNum26"
																			block-code="p0" data-seat="J2" seat-statuscode="0"
																			seat-group="grNum26" seat-code="1J02"
																			style="left: 46.1875px; top: 230.211px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="J3 일반석 선택불가능" class="sel  p0 grNum26"
																			block-code="p0" data-seat="J3" seat-statuscode="0"
																			seat-group="grNum26" seat-code="1J03"
																			style="left: 71.375px; top: 230.211px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:J4 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J4" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J04"
																			style="left: 115.312px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">4</span></a><a
																			href="#none" alt="J5 일반석 SWEET SPOT 선택불가능"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J5" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J05"
																			style="left: 140.5px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">5</span></a><a
																			href="#none" alt="좌석 번호:J6 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J6" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J06"
																			style="left: 165.688px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">6</span></a><a
																			href="#none" alt="좌석 번호:J7 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J7" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J07"
																			style="left: 190.875px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">7</span></a><a
																			href="#none" alt="좌석 번호:J8 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J8" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J08"
																			style="left: 216.062px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">8</span></a><a
																			href="#none" alt="좌석 번호:J9 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J9" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J09"
																			style="left: 241.25px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">9</span></a><a
																			href="#none" alt="좌석 번호:J10 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J10" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J10"
																			style="left: 266.438px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">10</span></a><a
																			href="#none" alt="좌석 번호:J11 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J11" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J11"
																			style="left: 291.625px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">11</span></a><a
																			href="#none" alt="좌석 번호:J12 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J12" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J12"
																			style="left: 316.812px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">12</span></a><a
																			href="#none" alt="좌석 번호:J13 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J13" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J13"
																			style="left: 342px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">13</span></a><a
																			href="#none" alt="J14 일반석 SWEET SPOT 선택불가능"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J14" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J14"
																			style="left: 367.188px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">14</span></a><a
																			href="#none" alt="좌석 번호:J15 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum27" block-code="p0"
																			data-seat="J15" seat-statuscode="0"
																			seat-group="grNum27" seat-code="1J15"
																			style="left: 392.375px; top: 230.211px;"><span
																			class="sweet_spot f1" style="top: 0px;">15</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 255.78947368421052px">K</span><a
																			href="#none" alt="K1 일반석 선택불가능"
																			class="sel  p0 grNum28" block-code="p0"
																			data-seat="K1" seat-statuscode="0"
																			seat-group="grNum28" seat-code="1K01"
																			style="left: 21px; top: 255.789px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="K2 일반석 선택불가능" class="sel  p0 grNum28"
																			block-code="p0" data-seat="K2" seat-statuscode="0"
																			seat-group="grNum28" seat-code="1K02"
																			style="left: 46.1875px; top: 255.789px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="K3 일반석 선택불가능" class="sel  p0 grNum28"
																			block-code="p0" data-seat="K3" seat-statuscode="0"
																			seat-group="grNum28" seat-code="1K03"
																			style="left: 71.375px; top: 255.789px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:K4 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K4" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K04"
																			style="left: 115.312px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">4</span></a><a
																			href="#none" alt="K5 일반석 SWEET SPOT 선택불가능"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K5" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K05"
																			style="left: 140.5px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">5</span></a><a
																			href="#none" alt="좌석 번호:K6 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K6" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K06"
																			style="left: 165.688px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">6</span></a><a
																			href="#none" alt="좌석 번호:K7 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K7" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K07"
																			style="left: 190.875px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">7</span></a><a
																			href="#none" alt="좌석 번호:K8 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K8" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K08"
																			style="left: 216.062px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">8</span></a><a
																			href="#none" alt="좌석 번호:K9 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K9" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K09"
																			style="left: 241.25px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">9</span></a><a
																			href="#none" alt="좌석 번호:K10 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K10" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K10"
																			style="left: 266.438px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">10</span></a><a
																			href="#none" alt="좌석 번호:K11 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K11" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K11"
																			style="left: 291.625px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">11</span></a><a
																			href="#none" alt="좌석 번호:K12 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K12" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K12"
																			style="left: 316.812px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">12</span></a><a
																			href="#none" alt="좌석 번호:K13 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K13" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K13"
																			style="left: 342px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">13</span></a><a
																			href="#none" alt="K14 일반석 SWEET SPOT 선택불가능"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K14" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K14"
																			style="left: 367.188px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">14</span></a><a
																			href="#none" alt="좌석 번호:K15 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum29" block-code="p0"
																			data-seat="K15" seat-statuscode="0"
																			seat-group="grNum29" seat-code="1K15"
																			style="left: 392.375px; top: 255.789px;"><span
																			class="sweet_spot f1" style="top: 0px;">15</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 281.36842105263156px">L</span><a
																			href="#none" alt="L1 일반석 선택불가능"
																			class="sel  p0 grNum30" block-code="p0"
																			data-seat="L1" seat-statuscode="0"
																			seat-group="grNum30" seat-code="1L01"
																			style="left: 21px; top: 281.368px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="L2 일반석 선택불가능" class="sel  p0 grNum30"
																			block-code="p0" data-seat="L2" seat-statuscode="0"
																			seat-group="grNum30" seat-code="1L02"
																			style="left: 46.1875px; top: 281.368px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="L3 일반석 선택불가능" class="sel  p0 grNum30"
																			block-code="p0" data-seat="L3" seat-statuscode="0"
																			seat-group="grNum30" seat-code="1L03"
																			style="left: 71.375px; top: 281.368px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:L4 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L4" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L04"
																			style="left: 115.312px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">4</span></a><a
																			href="#none" alt="L5 일반석 SWEET SPOT 선택불가능"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L5" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L05"
																			style="left: 140.5px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">5</span></a><a
																			href="#none" alt="좌석 번호:L6 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L6" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L06"
																			style="left: 165.688px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">6</span></a><a
																			href="#none" alt="좌석 번호:L7 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L7" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L07"
																			style="left: 190.875px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">7</span></a><a
																			href="#none" alt="좌석 번호:L8 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L8" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L08"
																			style="left: 216.062px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">8</span></a><a
																			href="#none" alt="좌석 번호:L9 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L9" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L09"
																			style="left: 241.25px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">9</span></a><a
																			href="#none" alt="좌석 번호:L10 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L10" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L10"
																			style="left: 266.438px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">10</span></a><a
																			href="#none" alt="좌석 번호:L11 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L11" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L11"
																			style="left: 291.625px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">11</span></a><a
																			href="#none" alt="좌석 번호:L12 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L12" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L12"
																			style="left: 316.812px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">12</span></a><a
																			href="#none" alt="좌석 번호:L13 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L13" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L13"
																			style="left: 342px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">13</span></a><a
																			href="#none" alt="L14 일반석 SWEET SPOT 선택불가능"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L14" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L14"
																			style="left: 367.188px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">14</span></a><a
																			href="#none" alt="좌석 번호:L15 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum31" block-code="p0"
																			data-seat="L15" seat-statuscode="0"
																			seat-group="grNum31" seat-code="1L15"
																			style="left: 392.375px; top: 281.368px;"><span
																			class="sweet_spot f1" style="top: 0px;">15</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 306.94736842105266px">M</span><a
																			href="#none" alt="M1 일반석 선택불가능"
																			class="sel  p0 grNum32" block-code="p0"
																			data-seat="M1" seat-statuscode="0"
																			seat-group="grNum32" seat-code="1M01"
																			style="left: 21px; top: 306.947px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="M2 일반석 선택불가능" class="sel  p0 grNum32"
																			block-code="p0" data-seat="M2" seat-statuscode="0"
																			seat-group="grNum32" seat-code="1M02"
																			style="left: 46.1875px; top: 306.947px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="M3 일반석 선택불가능" class="sel  p0 grNum32"
																			block-code="p0" data-seat="M3" seat-statuscode="0"
																			seat-group="grNum32" seat-code="1M03"
																			style="left: 71.375px; top: 306.947px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:M4 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M4" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M04"
																			style="left: 115.312px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">4</span></a><a
																			href="#none" alt="M5 일반석 SWEET SPOT 선택불가능"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M5" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M05"
																			style="left: 140.5px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">5</span></a><a
																			href="#none" alt="좌석 번호:M6 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M6" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M06"
																			style="left: 165.688px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">6</span></a><a
																			href="#none" alt="좌석 번호:M7 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M7" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M07"
																			style="left: 190.875px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">7</span></a><a
																			href="#none" alt="좌석 번호:M8 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M8" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M08"
																			style="left: 216.062px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">8</span></a><a
																			href="#none" alt="좌석 번호:M9 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M9" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M09"
																			style="left: 241.25px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">9</span></a><a
																			href="#none" alt="좌석 번호:M10 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M10" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M10"
																			style="left: 266.438px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">10</span></a><a
																			href="#none" alt="좌석 번호:M11 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M11" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M11"
																			style="left: 291.625px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">11</span></a><a
																			href="#none" alt="좌석 번호:M12 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M12" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M12"
																			style="left: 316.812px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">12</span></a><a
																			href="#none" alt="좌석 번호:M13 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M13" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M13"
																			style="left: 342px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">13</span></a><a
																			href="#none" alt="M14 일반석 SWEET SPOT 선택불가능"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M14" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M14"
																			style="left: 367.188px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">14</span></a><a
																			href="#none" alt="좌석 번호:M15 일반석 SWEET SPOT"
																			class="sel  sweet_spot p0 grNum33" block-code="p0"
																			data-seat="M15" seat-statuscode="0"
																			seat-group="grNum33" seat-code="1M15"
																			style="left: 392.375px; top: 306.947px;"><span
																			class="sweet_spot f1" style="top: 0px;">15</span></a><a
																			href="#none" alt="M16 일반석 선택불가능"
																			class="sel  p0 grNum34" block-code="p0"
																			data-seat="M16" seat-statuscode="0"
																			seat-group="grNum34" seat-code="1M16"
																			style="left: 436.312px; top: 306.947px;"><span
																			class="f1" style="top: 0px;">16</span></a><a href="#none"
																			alt="M17 일반석 선택불가능" class="sel  p0 grNum34"
																			block-code="p0" data-seat="M17" seat-statuscode="0"
																			seat-group="grNum34" seat-code="1M17"
																			style="left: 461.5px; top: 306.947px;"><span
																			class="f1" style="top: 0px;">17</span></a><a href="#none"
																			alt="M18 일반석 선택불가능" class="sel  p0 grNum34"
																			block-code="p0" data-seat="M18" seat-statuscode="0"
																			seat-group="grNum34" seat-code="1M18"
																			style="left: 486.688px; top: 306.947px;"><span
																			class="f1" style="top: 0px;">18</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 332.5263157894737px">N</span><a
																			href="#none" alt="N1 일반석 선택불가능"
																			class="sel  p0 grNum35" block-code="p0"
																			data-seat="N1" seat-statuscode="0"
																			seat-group="grNum35" seat-code="1N01"
																			style="left: 21px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="N2 일반석 선택불가능" class="sel  p0 grNum35"
																			block-code="p0" data-seat="N2" seat-statuscode="0"
																			seat-group="grNum35" seat-code="1N02"
																			style="left: 46.1875px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="N3 일반석 선택불가능" class="sel  p0 grNum35"
																			block-code="p0" data-seat="N3" seat-statuscode="0"
																			seat-group="grNum35" seat-code="1N03"
																			style="left: 71.375px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:N4 일반석" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N4" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N04"
																			style="left: 115.312px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">4</span></a><a href="#none"
																			alt="N5 일반석 선택불가능" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N5" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N05"
																			style="left: 140.5px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">5</span></a><a href="#none"
																			alt="좌석 번호:N6 일반석" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N6" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N06"
																			style="left: 165.688px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">6</span></a><a href="#none"
																			alt="좌석 번호:N7 일반석" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N7" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N07"
																			style="left: 190.875px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">7</span></a><a href="#none"
																			alt="좌석 번호:N8 일반석" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N8" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N08"
																			style="left: 216.062px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">8</span></a><a href="#none"
																			alt="좌석 번호:N9 일반석" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N9" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N09"
																			style="left: 241.25px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">9</span></a><a href="#none"
																			alt="좌석 번호:N10 일반석" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N10" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N10"
																			style="left: 266.438px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">10</span></a><a href="#none"
																			alt="좌석 번호:N11 일반석" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N11" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N11"
																			style="left: 291.625px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">11</span></a><a href="#none"
																			alt="좌석 번호:N12 일반석" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N12" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N12"
																			style="left: 316.812px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">12</span></a><a href="#none"
																			alt="좌석 번호:N13 일반석" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N13" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N13"
																			style="left: 342px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">13</span></a><a href="#none"
																			alt="N14 일반석 선택불가능" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N14" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N14"
																			style="left: 367.188px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">14</span></a><a href="#none"
																			alt="좌석 번호:N15 일반석" class="sel  p0 grNum36"
																			block-code="p0" data-seat="N15" seat-statuscode="0"
																			seat-group="grNum36" seat-code="1N15"
																			style="left: 392.375px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">15</span></a><a href="#none"
																			alt="N16 일반석 선택불가능" class="sel  p0 grNum37"
																			block-code="p0" data-seat="N16" seat-statuscode="0"
																			seat-group="grNum37" seat-code="1N16"
																			style="left: 436.312px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">16</span></a><a href="#none"
																			alt="N17 일반석 선택불가능" class="sel  p0 grNum37"
																			block-code="p0" data-seat="N17" seat-statuscode="0"
																			seat-group="grNum37" seat-code="1N17"
																			style="left: 461.5px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">17</span></a><a href="#none"
																			alt="N18 일반석 선택불가능" class="sel  p0 grNum37"
																			block-code="p0" data-seat="N18" seat-statuscode="0"
																			seat-group="grNum37" seat-code="1N18"
																			style="left: 486.688px; top: 332.526px;"><span
																			class="f1" style="top: 0px;">18</span></a><span
																			class="seat_tit"
																			style="left: -30px; top: 358.10526315789474px">O</span><a
																			href="#none" alt="O1 일반석 선택불가능"
																			class="sel  p0 grNum38" block-code="p0"
																			data-seat="O1" seat-statuscode="0"
																			seat-group="grNum38" seat-code="1O01"
																			style="left: 21px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">1</span></a><a href="#none"
																			alt="O2 일반석 선택불가능" class="sel  p0 grNum38"
																			block-code="p0" data-seat="O2" seat-statuscode="0"
																			seat-group="grNum38" seat-code="1O02"
																			style="left: 46.1875px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">2</span></a><a href="#none"
																			alt="O3 일반석 선택불가능" class="sel  p0 grNum38"
																			block-code="p0" data-seat="O3" seat-statuscode="0"
																			seat-group="grNum38" seat-code="1O03"
																			style="left: 71.375px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">3</span></a><a href="#none"
																			alt="좌석 번호:O4 일반석" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O4" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O04"
																			style="left: 115.312px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">4</span></a><a href="#none"
																			alt="O5 일반석 선택불가능" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O5" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O05"
																			style="left: 140.5px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">5</span></a><a href="#none"
																			alt="좌석 번호:O6 일반석" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O6" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O06"
																			style="left: 165.688px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">6</span></a><a href="#none"
																			alt="좌석 번호:O7 일반석" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O7" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O07"
																			style="left: 190.875px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">7</span></a><a href="#none"
																			alt="좌석 번호:O8 일반석" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O8" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O08"
																			style="left: 216.062px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">8</span></a><a href="#none"
																			alt="좌석 번호:O9 일반석" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O9" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O09"
																			style="left: 241.25px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">9</span></a><a href="#none"
																			alt="좌석 번호:O10 일반석" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O10" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O10"
																			style="left: 266.438px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">10</span></a><a href="#none"
																			alt="좌석 번호:O11 일반석" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O11" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O11"
																			style="left: 291.625px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">11</span></a><a href="#none"
																			alt="좌석 번호:O12 일반석" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O12" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O12"
																			style="left: 316.812px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">12</span></a><a href="#none"
																			alt="좌석 번호:O13 일반석" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O13" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O13"
																			style="left: 342px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">13</span></a><a href="#none"
																			alt="O14 일반석 선택불가능" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O14" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O14"
																			style="left: 367.188px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">14</span></a><a href="#none"
																			alt="좌석 번호:O15 일반석" class="sel  p0 grNum39"
																			block-code="p0" data-seat="O15" seat-statuscode="0"
																			seat-group="grNum39" seat-code="1O15"
																			style="left: 392.375px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">15</span></a><a href="#none"
																			alt="O16 일반석 선택불가능" class="sel  p0 grNum40"
																			block-code="p0" data-seat="O16" seat-statuscode="0"
																			seat-group="grNum40" seat-code="1O16"
																			style="left: 436.312px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">16</span></a><a href="#none"
																			alt="O17 일반석 선택불가능" class="sel  p0 grNum40"
																			block-code="p0" data-seat="O17" seat-statuscode="0"
																			seat-group="grNum40" seat-code="1O17"
																			style="left: 461.5px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">17</span></a><a href="#none"
																			alt="O18 일반석 선택불가능" class="sel  p0 grNum40"
																			block-code="p0" data-seat="O18" seat-statuscode="0"
																			seat-group="grNum40" seat-code="1O18"
																			style="left: 486.688px; top: 358.105px;"><span
																			class="f1" style="top: 0px;">18</span></a>
																	</div>
																	<span data-y="392px" data-x="448px" class="w_bottom" style="top: 383px; left: 779.5px;">상영관 출입문 입니다.</span>
                                               	</div>
                                               	</div>
                                                
                                            </div>
                                        </div>
                                    </div></div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; display: block; height: 445px; max-height: 436px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 50px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div>


                                </div>

                                <div class="seat_btm_box">
                                    
									<div class="seat_type_box">
												<div class="top_info">
													
												</div>
												<div class="btm_info">
											
												</div>

									</div>

                                    
                                    <div class="notice_box" style="display:none;">
                                        <h6 class="tit_info">이용안내</h6>
                                        <ul class="list_txt ty3">
                                            <li>12세 미만의 고객님(영,유아 포함)은 부모님 또는 보호자를 동반하여도 관람이 불가합니다.</li>
                                            <li>영화 관람 시, 신분증을 지참하여 주시기 바랍니다.</li>
                                        </ul>
                                    </div>
                                    
                                </div>
                            </article>
                        </div>
                        
                    </div>
                    

                    
                    <div id="PersonSeatSummery">
	                    <div class="select_seat_result">
		                    <div class="group_lft">
			                    <dl class="total_price">
				                    <dt>총 합계</dt>
				                    <dd><strong>0</strong>원</dd>
			                    </dl>
		                    </div>
	                    <div class="group_rgt">
		                    <a href="#" class="btn_col1" id="link_rpay">결제하기</a>
		                   
	                    </div>
	                    </div>
                    </div>
                    
                </div>
            </div>
            
        </div>
        

        
        <div id="reserveStep03" class="section_step_con step03 ">
            <h3 class="hidden">결제</h3>

        </div>
        

        
        <div id="reserveStep04" class="section_step_con step04 ">
            <h3 class="hidden">결제완료</h3>

        </div>
        
    </div>
    
</div>



		<script src="/NLCHS/Scripts/Dist/TicketingPersonSeat.bundle.js?v=202211132152"></script>



    


    
    <div id="banner_reserve_section" class="banner_reserve_wrap"><div class="bx_lft"><a href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_37&amp;adgroupid=adg_lottecinema_20221031_50&amp;adid=adi_lottecinema_20221031_50" target="_blank"><img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Mp/Mp_160300.jpg" alt="현대해상 다이렉트 자동차보험 신규자동차 보험 30만원 이상 가입 시 롯데 3만원 상품권 지급 30000원"></a></div><div class="bx_rgt"><a href="https://nvapi.feeldmc.com:443/ad/p/in/v1_0/clk?slotid=stw_lottelotte_37&amp;adgroupid=adg_lottecinema_20221031_17&amp;adid=adi_lottecinema_20221031_17" target=""><img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Hyundaicard/Hyundaicard_160300.jpg" alt="상시 영화티켓 장당 6,000M포인트 사용 자세히보기"></a></div></div>
    <div id="banner_side_section" class="banner_side_wrap"></div>
   
    
    

    



    <script src="/NLCHS/Scripts/Dist/Pagination.bundle.js?v=202211132152"></script>
    <script src="/NLCHS/Scripts/Dist/LayoutTopOfTop.bundle.js"></script>
    <script src="/NLCHS/Scripts/Dist/LayoutSkipNav.bundle.js?v=202211132152"></script>
    <script src="/NLCHS/Scripts/Dist/LayoutHeaderMenu.bundle.js?v=202211132152"></script>
    <script src="/NLCHS/Scripts/Dist/LayoutBanner.bundle.js?v=202211132152"></script>
    <script src="/NLCHS/Scripts/Dist/LayoutFooter.bundle.js?v=202211132152"></script>
    
    <script src="/NLCHS/Scripts/Dist/LayoutBannerReserve.bundle.js?v=202211132152"></script>

    
    
    

    <script>
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


<iframe title="교차프레임" src="https://www.lottecinema.co.kr/NLCHS/crossd_iframe.html" style="position: absolute; width: 1px; height: 1px; left: -9999px;"></iframe><iframe title="교차프레임" src="https://www.lottecinema.co.kr/NLCHS/crossd_iframe.html" style="position: absolute; width: 1px; height: 1px; left: -9999px;"></iframe><iframe title="교차프레임" src="https://event.lottecinema.co.kr/NLCHS/crossd_iframe.html" style="position: absolute; width: 1px; height: 1px; left: -9999px;"></iframe><iframe title="교차프레임" src="https://event.lottecinema.co.kr/NLCHS/crossd_iframe.html" style="position: absolute; width: 1px; height: 1px; left: -9999px;"></iframe><script type="text/javascript" id="">var __selperAccountId="6105da92-8851-11ea-a969-70106f4bafe6",__selperFacebookPixelId=["233523444404890"],__selperGoogleAnalyticsMeasurementId=["UA-164790289-1"],__selperSellerGoogleAnalyticsMeasurementId="",__selperSellerGoogleAnalyticsMeasurementIds={16790:"UA-161846195-15",16827:"UA-161846195-18"};
function __getSelperCookie(a){a+="\x3d";for(var c=document.cookie.split(";"),d=0;d<c.length;d++){for(var b=c[d];" "==b.charAt(0);)b=b.substring(1,b.length);if(0==b.indexOf(a))return b.substring(a.length,b.length)}return null}function fetchSelperClassTagValue(a){return"object"==typeof a[0]?""==a[0].innerText?"string"==typeof a[0].innerHTML?a[0].innerHTML:"":a[0].innerText:""}
function fetchSelperClassTagValues(a){var c=[];if(Array.isArray(a))for(var d=a.length,b=0;b<d;b++){var e=a[b];""==e.innerText?"string"==typeof e.innerHTML&&c.push(e.innerHTML):c.push(e.innerText)}return c}function convertToNumberSelperTagValue(a){if(isNaN(a)){var c=/[^0-9\.]/gi;a=a.replace(c,"");a=isNaN(a)?1:a}return Number(a)}
function __fetchSelperParams(){for(var a=document.location.search.split("+").join(" "),c={},d,b=/[?&]?([^=]+)=([^&]*)/g;d=b.exec(a);)c[decodeURIComponent(d[1])]=decodeURIComponent(d[2]);return c}var __selperEventType="",__selperOstype="",__hasSelperProductInformation=!1,__selperProducts=[],params=__fetchSelperParams(),pathname=document.location.pathname;
if("/NLCHS/Movie/MovieDetailView"==pathname){if("string"==typeof params.movie){var movieId=params.movie;__selperEventType="ViewContent";var imageUrl="",movieName="",productType1="",__selperDetailTopWraps=document.getElementsByClassName("detail_top_wrap");if("object"==typeof __selperDetailTopWraps&&1==__selperDetailTopWraps.length){var __selperDetailTopWrap=__selperDetailTopWraps[0],__selperPosterInfos=__selperDetailTopWrap.getElementsByClassName("poster_info");if("object"==typeof __selperPosterInfos&&
0<__selperPosterInfos.length){var __selperPosterInfo=__selperPosterInfos[0],__selperPosterInfoImgs=__selperPosterInfo.getElementsByTagName("img");"object"==typeof __selperPosterInfoImgs&&0<__selperPosterInfoImgs.length&&(imageUrl=__selperPosterInfoImgs[0].src)}var __selperTitInfos=__selperDetailTopWrap.getElementsByClassName("tit_info");if("object"==typeof __selperTitInfos&&0<__selperTitInfos.length){var __selperTitInfo=__selperTitInfos[0],__selperTitInfoStrongs=__selperTitInfo.getElementsByTagName("strong");
"object"==typeof __selperTitInfoStrongs&&0<__selperTitInfoStrongs.length&&(movieName=__selperTitInfoStrongs[0].innerText)}var __selperDetailInfo2s=__selperDetailTopWrap.getElementsByClassName("detail_info2");if("object"==typeof __selperDetailInfo2s&&0<__selperDetailInfo2s.length){var __selperDetailInfo2=__selperDetailInfo2s[0].getElementsByTagName("em");"object"==typeof __selperDetailInfo2&&0<__selperDetailInfo2.length&&(productType1=__selperDetailInfo2[1].innerText)}}var description="",__selperMoviTabInfo1s=
document.getElementsByClassName("movi_tab_info1");if("object"==typeof __selperMoviTabInfo1s&&0<__selperMoviTabInfo1s.length){var __selperTxtInfos=__selperMoviTabInfo1s[0].getElementsByClassName("txt_info");"object"==typeof __selperTxtInfos&&0<__selperTxtInfos.length&&(description=__selperTxtInfos[0].innerText)}__selperProducts.push({id:movieId,basePrice:13E3,salePrice:13E3,shippingPrice:0,currency:"KRW",name:movieName,productType1:productType1,orderNo:"",quantity:1,description:description,imageUrl:imageUrl})}}else if("/NLCMS/Movie/MovieDetailView"==
pathname||"/NLCMW/movie/moviedetailview"==pathname||"/NLCMS/movie/moviedetailview"==pathname||"/nlcms/movie/moviedetailview"==pathname.toLowerCase()){if("string"==typeof params.movie){movieId=params.movie;__selperEventType="ViewContent";productType1=movieName=imageUrl="";var __selperMovieDetailSummaris=document.getElementsByClassName("movie_detail_summary");if("object"==typeof __selperMovieDetailSummaris&&1==__selperMovieDetailSummaris.length){var __selperMovieDetailSummary=__selperMovieDetailSummaris[0],
__selperThms=__selperMovieDetailSummary.getElementsByClassName("thm");if("object"==typeof __selperThms&&0<__selperThms.length){var __selperThmImgs=__selperThms[0].getElementsByTagName("img");"object"==typeof __selperThmImgs&&0<__selperThmImgs.length&&(imageUrl=__selperThmImgs[0].src)}var __selperBxInfors=__selperMovieDetailSummary.getElementsByClassName("bx_infor");if("object"==typeof __selperBxInfors&&0<__selperBxInfors.length){var __selperBxInfor=__selperBxInfors[0],__selperBxInforTits=__selperBxInfor.getElementsByClassName("tit");
"object"==typeof __selperBxInforTits&&0<__selperBxInforTits.length&&(movieName=__selperBxInforTits[0].innerText);var __selperBxInforTxtGeneres=__selperBxInfor.getElementsByClassName("txt_genre");"object"==typeof __selperBxInforTxtGeneres&&0<__selperBxInforTxtGeneres.length&&(productType1=__selperBxInforTxtGeneres[0].innerText)}}__selperProducts.push({id:movieId,basePrice:13E3,salePrice:13E3,shippingPrice:0,currency:"KRW",name:movieName,productType1:productType1,orderNo:"",quantity:1,description:"",
imageUrl:imageUrl})}}else if("/NLCHS/ticketing"==pathname)"string"==typeof params.movieCd&&(movieId=params.movieCd,__selperEventType="AddToCart",__selperProducts.push({id:movieId,basePrice:13E3,salePrice:13E3,shippingPrice:0,currency:"KRW",name:"",productType1:"",orderNo:"",quantity:1,description:"",imageUrl:""}));else if("/NLCMW/ticketing"==pathname||"/NLCMS/ticketing"==pathname)"string"==typeof params.movieCd&&(movieId=params.movieCd,__selperEventType="AddToCart",__selperProducts.push({id:movieId,
basePrice:13E3,salePrice:13E3,shippingPrice:0,currency:"KRW",name:"",productType1:"",orderNo:"",quantity:1,description:"",imageUrl:""}));else if("/NLCHS/Ticketing/PaymentResult"==pathname||"/nlchs/ticketing/paymentresult"==pathname.toLowerCase()){var orderNo=movieId="",__selperReserveResultWraps=document.getElementsByClassName("reserve_result_wrap");if("object"==typeof __selperReserveResultWraps&&0<__selperReserveResultWraps.length){var __selperBxThms=__selperReserveResultWraps[0].getElementsByClassName("bx_thm");
if("object"==typeof __selperBxThms&&0<__selperBxThms.length){var __selperBxThm=__selperBxThms[0],__selperBxThmImgs=__selperBxThm.getElementsByTagName("img");if("object"==typeof __selperBxThmImgs&&0<__selperBxThmImgs.length){var __selperBxThmImgSrc=__selperBxThmImgs[0].src,imgName=__selperBxThmImgSrc.substring(__selperBxThmImgSrc.lastIndexOf("/")+1,__selperBxThmImgSrc.length);movieId=imgName.substring(0,imgName.indexOf("_"))}}var __selperGroupInfors=__selperReserveResultWraps[0].getElementsByClassName("group_infor");
if("object"==typeof __selperGroupInfors&&0<__selperGroupInfors.length){var __selperTxtNums=__selperGroupInfors[0].getElementsByClassName("txt_num");"object"==typeof __selperTxtNums&&0<__selperTxtNums.length&&(orderNo=__selperTxtNums[0].innerText)}}var basePrice=0,salePrice=0,__selperPaymentWraps=document.getElementsByClassName("payment_wrap");if("object"==typeof __selperPaymentWraps&&0<__selperPaymentWraps.length){var __selperGroupPriceCase1s=__selperPaymentWraps[0].getElementsByClassName("group_price case1");
if("object"==typeof __selperGroupPriceCase1s&&0<__selperGroupPriceCase1s.length){var __selperStrongs=__selperGroupPriceCase1s[0].getElementsByTagName("strong");"object"==typeof __selperStrongs&&0<__selperStrongs.length&&(basePrice=convertToNumberSelperTagValue(__selperStrongs[0].innerText))}var __selperGroupPriceCase3s=__selperPaymentWraps[0].getElementsByClassName("group_price case3");"object"==typeof __selperGroupPriceCase3s&&0<__selperGroupPriceCase3s.length&&(__selperStrongs=__selperGroupPriceCase3s[0].getElementsByTagName("strong"),
"object"==typeof __selperStrongs&&0<__selperStrongs.length&&(salePrice=convertToNumberSelperTagValue(__selperStrongs[0].innerText)))}""!=movieId&&(__selperEventType="Purchase",__selperProducts.push({id:movieId,basePrice:basePrice,salePrice:salePrice,shippingPrice:0,currency:"KRW",name:"",productType1:"",orderNo:orderNo,quantity:1,description:"",imageUrl:""}))}else if("/NLCMW/MyCinema/BaroTicketSolo"==pathname||"/NLCMS/MyCinema/BaroTicketSolo"==pathname||"/nlcms/mycinema/baroticketsolo"==pathname.toLowerCase()){movieId=
"";"string"==typeof params.TransNo&&(orderNo=params.TransNo);var __selperPosterImg=document.getElementById("posterImg");if("object"==typeof __selperPosterImg){var __selperPosterImgSrc=__selperPosterImg.src;imgName=__selperPosterImgSrc.substring(__selperPosterImgSrc.lastIndexOf("/")+1,__selperPosterImgSrc.length);movieId=imgName.substring(0,imgName.indexOf("_"))}orderNo="";var __selperTicketnums=document.getElementsByClassName("ticketnum");if("object"==typeof __selperTicketnums&&0<__selperTicketnums.length){var __selperTicketnum=
__selperTicketnums[0];orderNo=__selperTicketnum.innerText}var quantity=0;salePrice=0;var __selperTkSeats=document.getElementsByClassName("tk_seat");if("object"==typeof __selperTkSeats&&0<__selperTkSeats.length)for(var __selperTkSeatList=__selperTkSeats[0].getElementsByTagName("li"),__selperTkSeatListSize=__selperTkSeatList.length,i=0;i<__selperTkSeatListSize;i++){var __selperTkSeat=__selperTkSeatList[i],__selperQuantity=convertToNumberSelperTagValue(__selperTkSeat.innerText);quantity+=__selperQuantity;
__selperTkSeat.innerText.includes("\uc131\uc778")?salePrice+=13E3*__selperQuantity:__selperTkSeat.innerText.includes("\uccad\uc18c\ub144")?salePrice+=1E4*__selperQuantity:__selperTkSeat.innerText.includes("\uc2dc\ub2c8\uc5b4")?salePrice+=5E3*__selperQuantity:__selperTkSeat.innerText.includes("\uc7a5\uc560\uc778")&&(salePrice+=5E3*__selperQuantity)}""!=movieId&&(__selperEventType="Purchase",__selperProducts.push({id:movieId,basePrice:salePrice,salePrice:salePrice,shippingPrice:0,currency:"KRW",name:"",
productType1:"",orderNo:orderNo,quantity:1,description:"",imageUrl:""}))}0<__selperProducts.length&&(__hasSelperProductInformation=!0);var __selperGoogleAnalyticsItems=[],__selperContnets=[],__selperItems=[],__selperTotalSalePrice=0,__selperProductOrderNo="";
if(__hasSelperProductInformation)for(i=0;i<__selperProducts.length;i++){var product=__selperProducts[i],__selperGoogleAnalyticsItem={},__selperContnet={},__selperItem={};"string"==typeof product.id&&(__selperGoogleAnalyticsItem.id=product.id,__selperContnet.id=product.id,__selperItem.id=product.id);"number"==typeof product.quantity?(__selperGoogleAnalyticsItem.quantity=product.quantity,__selperContnet.quantity=product.quantity,__selperItem.quantity=product.quantity):(__selperGoogleAnalyticsItem.quantity=
1,__selperContnet.quantity=1,__selperItem.quantity=1);"number"==typeof product.salePrice?(__selperGoogleAnalyticsItem.price=product.salePrice,__selperContnet.item_price=product.salePrice,__selperItem.price=product.salePrice,__selperTotalSalePrice+=product.salePrice):"number"==typeof product.basePrice&&(__selperGoogleAnalyticsItem.price=product.basePrice,__selperContnet.item_price=product.basePrice,__selperItem.price=product.basePrice,__selperTotalSalePrice+=product.basePrice);"string"==typeof product.name&&
(__selperGoogleAnalyticsItem.name=product.name,__selperItem.name=product.name);"string"==typeof product.orderNo&&(__selperProductOrderNo=product.orderNo);__selperGoogleAnalyticsItems.push(__selperGoogleAnalyticsItem);__selperContnets.push(__selperContnet);__selperItems.push(__selperItem)};</script>


<script type="text/javascript" id="">!function(f,c,d,e,g,a,b){a=c.createElement(d);a.async=!0;a.src=e;b=c.getElementsByTagName(d)[0];b.parentNode.insertBefore(a,b)}(window,document,"script","https://www.googletagmanager.com/gtag/js?id\x3d"+__selperGoogleAnalyticsMeasurementId[0]);window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments)}gtag("js",new Date);</script>

<script type="text/javascript" id="">for(var i=0;i<__selperGoogleAnalyticsMeasurementId.length;i++)gtag("config",__selperGoogleAnalyticsMeasurementId[i]);for(i=0;i<__selperProducts.length;i++){var __selperProduct=__selperProducts[i];"string"==typeof __selperSellerGoogleAnalyticsMeasurementIds[__selperProduct.id]&&(__selperSellerGoogleAnalyticsMeasurementId=__selperSellerGoogleAnalyticsMeasurementIds[__selperProduct.id],gtag("config",__selperSellerGoogleAnalyticsMeasurementId))}
switch(__selperEventType){case "ViewContent":__hasSelperProductInformation&&(gtag("event","view_item",{send_to:__selperGoogleAnalyticsMeasurementId,value:__selperTotalSalePrice,currency:"KRW",items:__selperGoogleAnalyticsItems}),""!=__selperSellerGoogleAnalyticsMeasurementId&&gtag("event","view_item",{send_to:__selperSellerGoogleAnalyticsMeasurementId,value:__selperTotalSalePrice,currency:"KRW",items:__selperGoogleAnalyticsItems}));break;case "AddToCart":__hasSelperProductInformation&&(gtag("event",
"add_to_cart",{send_to:__selperGoogleAnalyticsMeasurementId,value:__selperTotalSalePrice,currency:"KRW",items:__selperGoogleAnalyticsItems}),""!=__selperSellerGoogleAnalyticsMeasurementId&&gtag("event","add_to_cart",{send_to:__selperSellerGoogleAnalyticsMeasurementId,value:__selperTotalSalePrice,currency:"KRW",items:__selperGoogleAnalyticsItems}));break;case "Purchase":__hasSelperProductInformation&&(gtag("event","purchase",{send_to:__selperGoogleAnalyticsMeasurementId,transaction_id:__selperProductOrderNo,
value:__selperTotalSalePrice,currency:"KRW",items:__selperGoogleAnalyticsItems}),""!=__selperSellerGoogleAnalyticsMeasurementId&&gtag("event","purchase",{send_to:__selperSellerGoogleAnalyticsMeasurementId,transaction_id:__selperProductOrderNo,value:__selperTotalSalePrice,currency:"KRW",items:__selperGoogleAnalyticsItems}))};</script>


<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");
for(var i=0;i<__selperFacebookPixelId.length;i++)fbq("init",__selperFacebookPixelId[i]),fbq("trackSingle",__selperFacebookPixelId[i],"PageView");
switch(__selperEventType){case "ViewContent":if(__hasSelperProductInformation)for(i=0;i<__selperFacebookPixelId.length;i++)fbq("trackSingle",__selperFacebookPixelId[i],"ViewContent",{value:__selperTotalSalePrice,currency:"KRW",contents:__selperContnets,content_type:"PRODUCT"});break;case "AddToCart":if(__hasSelperProductInformation)for(i=0;i<__selperFacebookPixelId.length;i++)fbq("trackSingle",__selperFacebookPixelId[i],"AddToCart",{value:__selperTotalSalePrice,currency:"KRW",contents:__selperContnets,
content_type:"PRODUCT"});break;case "Purchase":if(__hasSelperProductInformation)for(i=0;i<__selperFacebookPixelId.length;i++)fbq("trackSingle",__selperFacebookPixelId[i],"Purchase",{value:__selperTotalSalePrice,currency:"KRW",contents:__selperContnets,content_type:"PRODUCT"})};</script>


<script type="text/javascript" id="">!function(b,d,c,e,a,f,g){b.dmcself||(a=b.dmcself=function(){a.callDmcSelf?a.callDmcSelf.apply(a,arguments):a.queue.push(arguments)},b.dmcself||(b._dmcself=a),a.push=a,a.loaded=!0,a.version="0.1",a.queue=[],f=d.createElement(c),f.async=!0,f.src=e,g=d.getElementsByTagName(c)[0],g.parentNode.insertBefore(f,g))}(window,document,"script","//dsp.dmcmedia.co.kr/selper/js/selperevt.js?ver\x3d0.1.4.1");
function getSelperUrlVars(){var b=[];if(0<window.location.href.indexOf("?"))for(var d=window.location.href.slice(window.location.href.indexOf("?")+1).split("\x26"),c=0;c<d.length;c++){var e=d[c].split("\x3d");b[e[0]]=e[1]}return b}var __selperData={};__selperData.selperAccountId=__selperAccountId;__selperData.selperFacebookPixelId=__selperFacebookPixelId;__selperData.selperGoogleAnalyticsMeasurementId=__selperGoogleAnalyticsMeasurementId;__selperData.selperSellerGoogleAnalyticsMeasurementId=__selperSellerGoogleAnalyticsMeasurementId;
__selperData.linkUrl=encodeURI(window.location.href);__selperData.eventType=__selperEventType;__selperData.orderNo=__selperProductOrderNo;__selperData.orderTotalBasePrice=__selperTotalSalePrice;__selperData.orderTotalSalePrice=__selperTotalSalePrice;__selperData.selperProductTotalValue=__selperTotalSalePrice;__selperData.product=JSON.stringify(__selperProducts);__selperData.fbc=__getSelperCookie("_fbc");__selperData.fbp=__getSelperCookie("_fbp");__selperData.ga=__getSelperCookie("_ga");
__selperData.gid=__getSelperCookie("_gid");var uri=__selperData.referrer=document.referrer;if(uri){__selperData.referrer=uri;var link=document.createElement("a");link.setAttribute("href",uri);var pattern=/[\?&](?:q|query)=([^&#]*)/,query=link.search.match(pattern);if(query&&0<query.length){var keyword=query[1].replace(/\+/gi,"%20");keyword&&(__selperData.keywordHost=link.hostname,__selperData.keyword=decodeURIComponent(keyword))}}var hrefUri=window.location.href;
if(hrefUri){__selperData.hrefUri=hrefUri;var hrefLink=document.createElement("a");hrefLink.setAttribute("href",hrefUri);var hrefPattern=/[\?&](?:search|keyword)=([^&#]*)/,hrefQuery=hrefLink.search.match(hrefPattern);if(hrefQuery&&0<hrefQuery.length){var hrefKeyword=hrefQuery[1].replace(/\+/gi,"%20");hrefKeyword&&(__selperData.searchHost=hrefLink.hostname,__selperData.searchKeyword=decodeURIComponent(hrefKeyword))}}
try{__selperData.adtracking=typeof window.adtracking;if("object"==typeof window.adtracking){var gaid=window.adtracking.getGaid();__selperData.gaid=gaid;var eventData={};__selperData["adtracking.trackEvent"]=typeof window.adtracking.trackEvent}switch(__selperEventType){case "ViewContent":case "AddToCart":case "Purchase":dmcself("init",__selperAccountId),dmcself("track","action",__selperData)}}catch(b){__selperData.error=b,dmcself("init",__selperAccountId),dmcself("track","action",__selperData),console.log("error: "+
b)};</script>
<script type="text/javascript" id="">(function(){try{var d="UA-106764115-1",h="4",a=null,e=ga.getAll(),f;var b=0;for(f=e.length;b<f;b+=1)if(e[b].get("trackingId")===d){a=e[b].get("clientId");break}a=encodeURI(a);d="https://tag-deepad.lpoint.com/cookie?mid\x3d"+h+"\x26cid\x3d"+a;var g=document.getElementsByTagName("script")[0],c=document.createElement("script");c.async=!0;c.type="text/javascript";c.src=d;g.parentNode.insertBefore(c,g)}catch(k){console.log("LPOINT DeepAD Cookie Sync Tag Error:::"+k)}})();</script>
	


	<!-- 약관 -->
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>