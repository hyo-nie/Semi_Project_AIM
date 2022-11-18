
//문자공백 확인
function checkIsEmpty(str){
	if( str == null || str == '' || str == undefined){
		return true;
	}
	return false;
}
//JSON 형식 return
function checkJSON(str){
	if(typeof str !== 'object'){
		str = JSON.parse(str);
	}
	return str;
}
//숫자인지 확인
function checkIsNumber(num){
	num = parseInt(num);
	// 숫자만
	var numPtn = /^[0-9]*$/;
	if(numPtn.test(num)) {		
		return true;
	}
	return false;
}
//input type="tel" 숫자 체크
function checkNumber(form){
	var isNumber =true;
	$(form).find('input[type="tel"]:visible').each(function(){
		if(!checkIsNumber($(this).val())) {		
			alert(onMessage.checkNumberInput);
			$(this).focus();
			isNumber =false;
			return false;
		}
	});
	return isNumber;
}
//아이디 형식 검증
function checkIsOnlId(str) {
	if (checkIsEmpty(str)) {	
		alert(I18n.getMessage('ch.Id.alt.idInGud'));//alert('아이디는 6자 이상 15자 이하여야 합니다.');	
		return false;
	}
	if(str.length < 6 || str.length > 16) {
		alert(I18n.getMessage('ch.Id.alt.idGud1'));//alert('아이디는 6자 이상 15자 이하여야 합니다.');	
		return false;
	}
	if(/^[0-9]*$/.test(str)) {
		alert(I18n.getMessage('ch.Id.alt.idGud2'));//alert('아이디는 숫자만 사용하실 수 없습니다.');	
		return false;
	}
	if(!/^[0-9a-zA-z-_]*$/.test(str)) {
		alert(I18n.getMessage('ch.Id.alt.idGud3'));//alert('아이디에 사용할 수 없는 특수문자가 포함되어 있습니다.');	
		return false;
	}
	if(/[a-zA-Z]/.test(str) == false) {
		alert(I18n.getMessage('ch.Id.alt.idGud4'));//alert('아이디는 숫자와 특수문자만 사용하실 수 없습니다.');	
		return false;
	}
	if(/-{2,}|_{2,}/.test(str)) {
		alert(I18n.getMessage('ch.Id.alt.idGud5'));//alert('특수문자는 연속하여 사용하실 수 없습니다.');	
		return false;
	}
	if(str.indexOf("L-PNT")!=-1) {
		//alert(I18n.getMessage('ch.Id.alt.idGud7'));//alert('허용되지 않은 문자열이 포함되어 있습니다.');	
		alert(I18n.getMessage('ch.btn.alt.chDupGud5'));//alert('사용할 수 없는 아이디입니다.');	
		return false;
	}
	return true;
}

//이메일 형식 검증
function checkIsEmail(str) {
	if (checkIsEmpty(str)) {
		return false;
	}
	return (/^\w+([-.]\w+|[-])*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/).test(str);
}
function checkIsForeignerNo(str, fomatChar) {
	if (utlf_IsNull(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	var jumin = eval("str.match(/^[0-9]{2}[01]{1}[0-9]{1}[0123]{1}[0-9]{1}" + arg + "[5678]{1}[0-9]{6}$/)");
	if (utlf_IsNull(jumin)) {
		return false;
	} else {
		jumin = utlf_NumberChar(jumin.toString());
	}
	var fgnNo = new Array(13);
	for (var ii = 0; ii < 13; ++ii) {
		fgnNo[ii] = parseInt(jumin.charAt(ii), 10);
	}
	if (fgnNo[11] < 6) {
		return false;
	}
	var parity = fgnNo[7] * 10 + fgnNo[8];
	if (parity & 1) {
		return false;
	}
	var total = 0;
	var weight = 2;
	for (var ii = 0; ii < 12; ++ii) {
		total += fgnNo[ii] * weight;
		if (++weight > 9) {
			weight = 2;
		}
	}
	if ((total = 11 - (total % 11)) >= 10) {
		total -= 10;
	}
	if ((total += 2) >= 10) {
		total -= 10;
	}
	return (total != fgnNo[12]) ? false : true;
}

function checkIsBizNo(str, fomatChar) {
	if (checkIsEmpty(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	var bizno = eval("str.match(/^[0-9]{3}" + arg + "[0-9]{2}" + arg + "[0-9]{5}$/)");
	if (checkIsEmpty(bizno)) {
		return false;
	} else {
		bizno = utlf_NumberChar(bizno.toString());
	}
	if ('0000000000' == bizno || '4444444444' == bizno || '8888888888' == bizno) {
		return false;
	}
	var a = parseInt(bizno.substring(0, 1), 10);
	var b = parseInt(bizno.substring(1, 2), 10);
	var c = parseInt(bizno.substring(2, 3), 10);
	var d = parseInt(bizno.substring(3, 4), 10);
	var e = parseInt(bizno.substring(4, 5), 10);
	var f = parseInt(bizno.substring(5, 6), 10);
	var g = parseInt(bizno.substring(6, 7), 10);
	var h = parseInt(bizno.substring(7, 8), 10);
	var i = parseInt(bizno.substring(8, 9), 10);
	var j = parseInt(bizno.substring(9, 10), 10);
	var sum = 0;
	sum += a * 1 % 10;
	sum += b * 3 % 10;
	sum += c * 7 % 10;
	sum += d * 1 % 10;
	sum += e * 3 % 10;
	sum += f * 7 % 10;
	sum += g * 1 % 10;
	sum += h * 3 % 10;
	sum += i * 5 % 10 + Math.floor(i * 5 / 10);
	sum += j * 1 % 10;
	return (sum % 10 == 0) ? true : false;
}

function checkIsCorpNo(str, fomatChar) {
	if (checkIsEmpty(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	var corpno = eval("str.match(/^[0-9]{6}" + arg + "[0-9]{7}$/)");
	if (checkIsEmpty(corpno)) {
		return false;
	} else {
		corpno = utlf_NumberChar(corpno.toString());
	}
	if ('0000000000000' == corpno) {
		return false;
	}
	return true;
}

function checkIsMerNo(str, fomatChar) {
	if (checkIsEmpty(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	var merno = eval("str.match(/^[0-9]{3}" + arg + "[0-9]{3}" + arg + "[0-9]{6}$/)");
	if (checkIsEmpty(merno)) {
		return false;
	}
	return true;
}

function checkIsPhone(str, fomatChar) {
	if (checkIsEmpty(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	return eval("(/^(02|013[0-9]{1}|050[0-9]{1}|0[3-9]{1}[0-9]{1})" + arg + "[1-9]{1}[0-9]{2,3}" + arg + "[0-9]{4}$/).test(str)");
}

function checkIsPassword(str) {
	if (checkIsEmpty(str)) {	
		alert(I18n.getMessage('ch.pswd.alt.pswdInGud'));	//alert('비밀번호를 입력해주세요.');	
		return false;
	}
	if(str.length < 8 || str.length > 16) {
		alert(I18n.getMessage('ch.pswd.alt.pswdGud1'));	//alert('비밀번호는 8자이상 15자 이하로 입력해주세요.');
		return false;
	}
	if (!(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^*?_~])[A-Za-z\d!@#$%^*?_~]*$/).test(str)) {
		alert(I18n.getMessage('ch.pswd.alt.pswdGud2'));	//alert('비밀번호는 영문자,숫자,특수문자 3가지가 포함되어야합니다.');	
		return false;
	}
	if (/(\w)\1\1/.test(str)) {
		alert(I18n.getMessage('ch.pswd.alt.pswdGud3'));	//alert('비밀번호는 같은 문자를 3번 이상 사용할 수 없습니다.');	
		return false;
	}

	var continue_plus  = 0;//연속성(+) 카운트
	var continue_minus = 0;//연속성(-) 카운트
	
	for(var i=0;i<str.length;i++){
		var char_pass_0 = str.charAt(i);
		var char_pass_1 = str.charAt(i+1);
		var char_pass_2 = str.charAt(i+2);
		
		//연속성(+) 카운트
		if(char_pass_1.charCodeAt(0)-char_pass_0.charCodeAt(0)== 1 && char_pass_2.charCodeAt(0) - char_pass_1.charCodeAt(0) == 1){
			continue_plus++;
		}
		//연속성(-) 카운트
		if(char_pass_0.charCodeAt(0)-char_pass_1.charCodeAt(0)== 1 && char_pass_1.charCodeAt(0) - char_pass_2.charCodeAt(0) == 1){
			continue_minus++;
		}
	}
	if(continue_plus > 0 || continue_minus > 0){
		alert(I18n.getMessage('ch.pswd.alt.pswdGud4'));	//alert('연속된 문자열을 3자 이상 사용할 수 없습니다.');
		return false;
	}
	
	if (str.match(/(qwe)|(asd)|(zxc)/)) {
		alert(I18n.getMessage('ch.pswd.alt.pswdGud5'));	//alert('키보드상에서 연속한 위치의 문자열은 사용할 수 없습니다.');	
		return false;
	}
	
	return true;
}
function checkIsMobile(str, fomatChar) {
	if (checkIsEmpty(str)) {
		return false;
	}
	var arg = fomatChar ? fomatChar : "";
	return eval("(/^01[016789]" + arg + "[1-9]{1}[0-9]{2,3}" + arg + "[0-9]{4}$/).test(str)");
}

// null 처리
function isNullStr(str){
	if( str == null  || str == undefined){ 
		str= '';
	}
	return str;
}

// 숫자만 입력
function fnNumOnly(e){
	
	var  keyValue = '';
	if(typeof(event) != 'undefined') {                                               
		keyValue = event.which;
	}else{
		keyValue = event.keyCode;
	}
	
	// 백스페이스, 방향키, 탭, F5(새로고침) 제외됨
	if(keyValue != 8 && keyValue != 9 && keyValue != 37 && keyValue != 39 && keyValue != 46 && keyValue != 116
	   && keyValue != 96 && keyValue != 97 && keyValue != 98 && keyValue != 99 && keyValue != 100 && keyValue != 101 
	   && keyValue != 102 && keyValue != 103 && keyValue != 104 && keyValue != 105 ){
		
		if(keyValue < 45 || keyValue > 57){return false;}	
	}
}

// 여권번호 유효성 검증
function passNoChk(passNo){
	var ptn1 = /[a-z]{2,2}[0-9]{7,7}/i;
	var ptn2 = /[a-z]{1,1}[0-9]{8,8}/i;
	var ptn3 = /[0-9]{7,7}/;
	
	if(ptn1.test(passNo) == true || ptn2.test(passNo) || ptn3.test(passNo)) {
		
		return true;
	}
	
	return false;
} 