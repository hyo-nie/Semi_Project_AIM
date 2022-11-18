<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery.ul</title>
<!--  script 불러오기 ****필수****  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<!-- 스크립트를 링크로 불러오시거나, 파일을 폴더안에 넣어서 경로로 불러오시거나 똑같은 방법입니다. -->
<!--  script 불러오기 ****필수**** -->

<!-- 전체체크 제어 css 확인 불필요 -->
<style type="text/css">
table, tble tr{margin : 0; padding : 0;}
table{width:800px;text-align:center;border-collapse:collapse;border-left:1px solid #ddd;border-right: 1px solid #ddd;}
table tr{border-bottom: 1px solid #ddd;}
</style>
<!-- 전체체크 제어 css 확인 불필요 -->

<!--  자동완성 텍스트 스크립트 -->
<script type="text/javascript">
$(function() {

    var availableCity = ["아이티윌서울","아이티윌부산","아이티윌대전","아이티윌경기","아이티윌강원"]; //자동으로 완성될 단어들을 입력
    $("#city").autocomplete({
        source: availableCity, 
        select: function(event, ui) {
            console.log(ui.item);
        }
    });
});
</script>
<!--  자동완성 텍스트 스크립트 -->

<!-- 스피너 스크립트  -->
<script type="text/javascript">
	$(function(){
		$('#spinner').spinner({
			min : 0,  // 최소값
			max : 100, // 최대값
			step : 1, //증가값
			spin:function(event,ui){
				console.log(ui.value)
		}
	});
});
</script>
<!-- 스피너 스크립트  -->

<!-- 체크박스 전체 선택, 해제 제어 -->
<script type="text/javascript">
$(function(){
    $("[type=checkbox][name=check]").on("change", function(){ //0
        var check = $(this).prop("checked"); //1
        //전체 체크
        if($(this).hasClass("allcheck")){ //2
            $("[type=checkbox][name=check]").prop("checked", check);

        //단일 체크
        }else{ //3
            var all = $("[type=checkbox][name=check].allcheck");
            var allcheck = all.prop("checked")
            if(check != allcheck){ //3-1
                var len = $("[type=checkbox][name=check]").not(".allcheck").length; //3-2
                var ckLen = $("[type=checkbox][name=check]:checked").not(".allcheck").length; //3-2
                if(len === ckLen){ //3-3
                    all.prop("checked", true);
                }else{
                    all.prop("checked", false);
                }
            }
        }
    });
});
</script>
<!-- 체크박스 전체 선택, 해제 제어  -->

<!-- 툴팁기능 -->
<script type="text/javascript">
	$(function(){
		$('tip').tooltip();
	});

</script>
<!-- 툴팁기능 -->

</head>
<body>
	<h1>자동완성 텍스트박스</h1>
	<br>
	<p>아이티윌 을 검색해보세요~</p>
	<div class="ui-widget">
		<label for="city">검색할 도시: </label> <input id="city">
	</div>

	<hr>
	<br>

	<h1>스피너테스트</h1>
	<label for="spinner">구매수량 : </label> 
	<input type="text" id="spinner" value="0" />
	<input type="button" value="구매하기">

	<hr>
	<br>
	<h1>전체체크, 단일체크 제어 테스트</h1>
    <table>
        <tr>
            <th>
                전체선택<input type="checkbox" name="check" class="allcheck">
            </th>
            <th>순번</th>
            <th>품목</th>
        </tr>
        <tr>
            <td><input type="checkbox" name="check"></td>
            <td>1</td>
            <td>된장찌개</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check"></td>
            <td>2</td>
            <td>김치찌개</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check"></td>
            <td>3</td>
            <td>순두부찌개</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="check"></td>
            <td>4</td>
            <td>고추장찌개</td>
        </tr>
    </table>
    
    <hr>
    <br>
    <h1>툴팁 테스트</h1>
    <label for="tip"> 텍스트칸에 마우스를 올려보아요! </label>
    <input id="tip" title="먹고싶은걸 적어보세요."> <!-- title 부분에 팁 내용 작성 -->
</body>
</html>