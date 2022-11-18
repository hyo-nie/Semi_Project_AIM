/** =========================================================================
 * 통합회원제 Web : 통합회원제 클라이언트 유틸리티 
 * @fileName : util.js
 * 
 * =========================================================================
 */

/**
 * 통신 유틸리티
 * - 생성자
 */
//var _isDebug = true;
var HttpUtil = {
	ajax: function(targetUrl, inDta, callback) {
		if (_isDebug) {
			console.log('URL : ' + targetUrl);
		}
		var __self = this;
		$.ajax({
			url : targetUrl,
			type : 'POST',
			async : false,
			cache : false,
			contentType : 'text/html;charset=utf-8',
			data : inDta,
			timeout : 11000,
			beforeSend : function() {

			},
			success : function(response) {
				if (_isDebug) {
					console.log('OUTPUT : ' + JSON.stringify(response));
				}
				if (response == null || response == undefined) {
					if(_isDebug) {
						console.log("IO Exception Error :::::: Server Response is null");
					}
					var rspDta = {
							rspClac : "E",
							rspC : "77",
							rspDtc : "004",
							rspMsgCn : "HTTP 통신데이터 송수신 중 오류가 발생하였습니다."
					};
					
					return callback(rspDta);
				} else {
					callback(response);
				}
			},
			error : function(response, textStatus, errorThrown) {
				if (_isDebug) {
					console.log('ERROR : ' + JSON.stringify(response));
				}
				var rspDta = {};
				
				if (response == null || response == undefined) {
					rspDta = HttpUtil.setErrorMessage();
					return callback(rspDta);
				} else {
					rspDta = HttpUtil.setErrorMessage(response.status);
					return callback(rspDta);
				}
			}
		});
	},
	
	setErrorMessage : function(statusCode) {
		var rspDta = {};
		var __self = this;
		if(DataUtil.isEmpty(statusCode) || statusCode == '0') {
			if(_isDebug) {
				console.log("[setErrorMessage] Connection Error");
			}
			rspDta = {
					rspClac : "E",
					rspC : "77",
					rspDtc : "003",
					rspMsgCn : "Connection 오류가 발생하였습니다."
			};
		} else if(statusCode == '408') {
			if(_isDebug) {
				console.log("[setErrorMessage] Timeout Error");
			}
			rspDta = {
					rspClac : "E",
					rspC : "77",
					rspDtc : "002",
					rspMsgCn : "요청시간을 초과하였습니다."
			};
		} else {
			rspDta ={
					rspClac : "E",
					rspC : "77",
					rspDtc : "005",
					rspMsgCn : "송수신 중 오류가 발생하였습니다. [상태코드:" + statusCode + "]"
			};
		}
		
		return rspDta;
	}
}

/**
 * 통합회원제 암복호화 유틸리티
 * - (주의) 통합회원제 클라이언트 라이브러리에서 참조하는 유틸리티로, 제휴사에서 직접 호출하지 않는다.
 */
var EncryptUtil = {
	_keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
	_SRN_PMT_ENC_KEY_LENGTH : 16,

	/**
	 * JSON --> JWT
	 * - 암호화된 JWT를 생성한다.
	 */
	createJwt : function(clientEncKey, signKey, inHeader, inPayload) {
		var jwt = "";
		var header = "";
		var payload = "";

		try {
			// header SET     
			header = JSON.stringify(inHeader);

			// payload SET
			payload = JSON.stringify(inPayload);

			// header Base64 인코딩
			var encodedHeader = EncryptUtil._encodeBASE64(header);
			// payload AES128 암호화
			var iv = clientEncKey.substr(0, 16);
			var encPayload = EncryptUtil._encryptAES128(payload, clientEncKey, iv);
			// payload Base64 인코딩
			var encodedPayload = EncryptUtil._encodeBASE64(encPayload);
			// signature HmacSHA256 생성
			var encBody = encodedHeader + "." + encodedPayload;
			var signature = EncryptUtil._signHMACSHA256(encBody, signKey);

			// jwt 생성
			jwt = encBody + "." + signature;
		} catch (e) {
			throw e;
		}

		return jwt;
	},
	
	/**
	 * srnPmt 생성
	 * - 화면이동시 넘겨줄 데이터 형식에 맞춰 생성
	 * @param encKey
	 * @param inputHeader
	 * @param inputPayload
	 */
	createSrnPmt : function(encKey, inputHeader, inputPayload) {
		var srnPmt = "";
		var header = "";
		var payload = "";
		
		try {
			// header SET
			header = JSON.stringify(inputHeader);
			
			// payload SET
			payload = JSON.stringify(inputPayload);
			
			// header BASE64 인코딩
			var encodedHeader = EncryptUtil._encodeBASE64(header);
			// payload AES128 암호화
			var iv = encKey.substr(0, 16);
			var encPayload = EncryptUtil._encryptAES128(payload, encKey, iv);
			// payload BASE64 인코딩
			var encodedPayload = EncryptUtil._encodeBASE64(encPayload);
			
			
			// srnPmt 생성
			srnPmt = encodedHeader + "." + encodedPayload;
		} catch(e) {
			throw e;
		}
		
		return srnPmt;
	},
	
	/**
	 * JWT --> JSON
	 * - JWT의 Header부분을 디코딩하여 반환
	 * @param jwt
	 */
	extractJwtHeader : function(jwt) {
		var rtnJson = {};
		
		//header GET
		var values = jwt.split('.');
		var encodedHeader = values[0];
		
		//header BASE64 디코딩
		var decodedHeader = EncryptUtil._decodeBASE64(encodedHeader);
		
		if(DataUtil.isJsonStr(decodedHeader)) {
			rtnJson = JSON.parse(decodedHeader.toString());
		} else {
			throw "[extractJwtHeader] JWT header 형식 오류";
		}
		
		return rtnJson; 
	},

	/**
	 * JWT --> JSON
	 * - 암호화된 JWT를 복호화하여 JSON으로 변환한다.
	 */
	extractJwtPayload : function(encKey, jwt) {
		var rtnJson = {};
		var header = {};
		var payload = {};

		// header, payload GET
		var values = jwt.split('.');
		var encodedHeader = values[0];
		var encodedPayload = values[1];

		// header Base64 디코딩
		var decodedHeader = EncryptUtil._decodeBASE64(encodedHeader);
		// header JSON String --> JSON
		if (DataUtil.isJsonStr(decodedHeader)) {
			header = JSON.parse(decodedHeader.toString());
		} else {
			throw "[extractJwtPayload] JWT header 형식 오류";
		}
		// payload Base64 디코딩
		var decodedPayload = EncryptUtil._decodeBASE64(encodedPayload);
		// payload AES128 복호화
		var iv = encKey.substring(0, 16);
		var strPayload = EncryptUtil._decryptAES128(decodedPayload, encKey, iv);

		// payload JSON String --> JSON
		// JSON 형식 체크
		if (DataUtil.isJsonStr(strPayload)) {
			payload = JSON.parse(strPayload.toString());
		} else {
			throw "[extractJwtPayload] JWT payload 형식 오류";
		}

		rtnJson = payload;

		return rtnJson;
	},

	/**
	 * JWT 검증
	 * - JWT 서명 위조여부를 검증한다.
	 */
	isJwtVerified : function(signKey, jwt) {
		try {
			var values = jwt.split('.');

			var header = ""; // header
			var payload = ""; // payload
			var signature = ""; // signature

			if (values.length == 3) {
				header = values[0]; // header
				payload = values[1]; // payload
				signature = values[2]; // signature
			} else {
				return false;
			}

			var bodyDta = header + "." + payload;

			var verifySignature = EncryptUtil._signHMACSHA256(bodyDta, signKey);

			if (signature == verifySignature) {
				return true;
			} else {
				return false;
			}
		} catch (e) {
			console.log("[isJwtVerified] JWT 검증 오류 발생");
			throw e
		}
	},
	
	/**
	 * 화면이동시 전달 데이터인 srnPmt를 생성 시 필요한 암호화키 생성
	 * - flwNo를 사용해 암호화키 생성
	 * @param flwNo
	 */
	generateSrnPmtEncKey : function(flwNo) {
		if(flwNo == null) {
			flwNo = "";
		}
		
		var rtnSrnEncKey = "";
		
		try {
			//key 생성
			rtnSrnEncKey = EncryptUtil._signHMACSHA256(flwNo, flwNo);
			rtnSrnEncKey = rtnSrnEncKey.substr(0,this._SRN_PMT_ENC_KEY_LENGTH);
		} catch (e) {
			console.log("[generateSrnPmtEncKey] key 생성 오류 발생")
			throw e;
		}
		
		return rtnSrnEncKey;
	},
	
	/**
	 * SHA512 방식으로 단방향암호화한다.
	 * @param input
	 */
	hashSHA512 : function(input) {
		var encryptedInput = "";
		//encrypt SHA512
		encryptedInput = CryptoJS.SHA512(input).toString(CryptoJS.enc.Hex);
		
		return encryptedInput;
	},
	
	/**
	 * MD5 방식으로 단방향암호화한다.
	 * @param input
	 */
	hashMD5 : function(input) {
		var encryptedInput = "";
		//encrypt SHA512
		encryptedInput = CryptoJS.MD5(input).toString();
		
		return encryptedInput;
	},

	/**
	 * URI Encode 처리
	 * @param str
	 * @returns
	 */
	encodeUri : function(str) {
		var result = encodeURIComponent(str);
		
		return result;
	},
	
	/**
	 * URI Decode 처리
	 * @param str
	 * @returns
	 */
	decodeUri : function(str) {
		var result = decodeURI(str);
		
		return result;
	},
	
	/**
	 * BASE64 인코딩
	 * - BASE64 방식으로 인코딩한다.
	 */
	_encodeBASE64 : function(input) {
		var output = "";
		var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
		var i = 0;

		input = EncryptUtil._encodeUTF8(input);

		while (i < input.length) {

			chr1 = input.charCodeAt(i++);
			chr2 = input.charCodeAt(i++);
			chr3 = input.charCodeAt(i++);

			enc1 = chr1 >> 2;
			enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
			enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
			enc4 = chr3 & 63;

			if (isNaN(chr2)) {
				enc3 = enc4 = 64;
			} else if (isNaN(chr3)) {
				enc4 = 64;
			}

			output = output + this._keyStr.charAt(enc1)
					+ this._keyStr.charAt(enc2) + this._keyStr.charAt(enc3)
					+ this._keyStr.charAt(enc4);
		}

		return output;
	},

	/**
	 * BASE64 디코딩
	 * - BASE64 방식으로 디코딩한다.
	 */
	_decodeBASE64 : function(input) {
		var output = "";
		var chr1, chr2, chr3;
		var enc1, enc2, enc3, enc4;
		var i = 0;

		input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

		while (i < input.length) {

			enc1 = this._keyStr.indexOf(input.charAt(i++));
			enc2 = this._keyStr.indexOf(input.charAt(i++));
			enc3 = this._keyStr.indexOf(input.charAt(i++));
			enc4 = this._keyStr.indexOf(input.charAt(i++));

			chr1 = (enc1 << 2) | (enc2 >> 4);
			chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
			chr3 = ((enc3 & 3) << 6) | enc4;

			output = output + String.fromCharCode(chr1);

			if (enc3 != 64) {
				output = output + String.fromCharCode(chr2);
			}
			if (enc4 != 64) {
				output = output + String.fromCharCode(chr3);
			}

		}

		output = EncryptUtil._decodeUTF8(output);

		return output;
	},

	/**
	 * UTF8 인코딩
	 * - UTF8 방식으로 인코딩한다.
	 */
	_encodeUTF8 : function(str) {
		str = str.replace(/\r\n/g, "\n");
		var utftext = "";

		for (var n = 0; n < str.length; n++) {

			var c = str.charCodeAt(n);

			if (c < 128) {
				utftext += String.fromCharCode(c);
			} else if ((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			} else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}

		}

		return utftext;
	},

	/**
	 * UTF8 디코딩
	 * - UTF8 방식으로 디코딩한다.
	 */
	_decodeUTF8 : function(utftext) {
		var str = "";
		var i = 0;
		var c = c1 = c2 = 0;

		while (i < utftext.length) {

			c = utftext.charCodeAt(i);

			if (c < 128) {
				str += String.fromCharCode(c);
				i++;
			} else if ((c > 191) && (c < 224)) {
				c2 = utftext.charCodseAt(i + 1);
				str += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			} else {
				c2 = utftext.charCodeAt(i + 1);
				c3 = utftext.charCodeAt(i + 2);
				str += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6)
						| (c3 & 63));
				i += 3;
			}

		}

		return str;
	},

	/**
	 * AES128 암호화
	 * - AES128 CBC 방식으로 암호화한다.
	 */
	_encryptAES128 : function(str, encKey, initialVector) {
		var key = CryptoJS.enc.Utf8.parse(encKey);
		var iv = CryptoJS.enc.Utf8.parse(initialVector);

		var encBytes = CryptoJS.AES.encrypt(str, key, {
			iv : iv,
			mode : CryptoJS.mode.CBC
		});

		return encBytes.toString();
	},

	/**
	 * AES128 복호화
	 * - AES128 CBC 방식으로 복호화한다.
	 */
	_decryptAES128 : function(str, encKey, initialVector) {
		try {
			var key = CryptoJS.enc.Utf8.parse(encKey);
			var iv = CryptoJS.enc.Utf8.parse(initialVector);

			var decBytes = CryptoJS.AES.decrypt(str, key, {
				iv : iv,
				mode : CryptoJS.mode.CBC
			});

			var decStr = decBytes.toString(CryptoJS.enc.Utf8);
			//                                        var decStr = decBytes.toString();
		} catch (e) {
			console.log('[decryptAES128] ' + e);
		}
		return decStr;
	},

	/**
	 * 메시지 서명
	 * - HmacSHA256 방식으로 메시지 서명을 생성한다.
	 */
	_signHMACSHA256 : function(str, secret) {
		var hash = CryptoJS.HmacSHA256(str, secret);
		return CryptoJS.enc.Base64.stringify(hash);
	},
	
	/**
	 * XSS 필터링
	 * - 문자열에서 스크립트 문자열을 제거한다.
	 */
	revertXssFiltering : function(str) {
		var rtnStr = str;
		if(DataUtil.isEmpty(str)) {
			return str;
		}
		rtnStr = rtnStr.replace(/&lt;/g, "<");
		rtnStr = rtnStr.replace(/&gt;/g, ">");
		rtnStr = rtnStr.replace(/&#39;/g, "'");
		rtnStr = rtnStr.replace(/&quot;/g, '"');

		return rtnStr;
	}
}
var DataUtil = {
		/**
		 * 문자열 앞, 뒤, 중간에 있는 모든 공백을 제거
		 * @param str
		 * @returns
		 */
		trim : function(str) {
			var regText = /\s/gi;
			var rtnStr = str.replace(regText,"");
			return rtnStr;
		},
		
		/**
		 * 입력된 문자열에서 숫자를 제외한 나머지 제거
		 * @param str
		 */
		toNumberString : function(str) {
			var regText = /[^0-9]/gi;
			var rtnStr = str.replace(regText,"");
			return rtnStr;
		},
		
		/**
		 * data가 공백문자열 혹은 null인 경우, defaultValue로 초기화
		 * @param data
		 * @param defaultValue
		 */
		nvl : function(data, defaultValue) {
			if(DataUtil.isEmpty(data)) {
				return defaultValue;
			} else {
				return data;
			}
		},
		
		/**
		 * data가 null 혹은 공백문자열인지 판별하는 메소드
		 * @param data
		 * @returns {Boolean}
		 */
		isEmpty : function(data) {
			if(typeof(data) === "string") {
				data = DataUtil.trim(data);
				//공백문자열이거나 "null"문자열인 경우
				if(data == "" || data.toLowerCase() == "null") {
					return true;
				} else {
					return false;
				}
			} else {
				if(data == null || data == undefined) {
					return true;
				} else {
					return false;
				}
			}
		},
		/**
		 * func가 함수인지 판별하는 메소드
		 * @param func
		 * @returns {Boolean}
		 */
		isFunction : function(func) {
			if(func != null && typeof(func) === "function") {
				return true;
			} else {
				return false;
			}
		},
		/**
		 * str이 JSON String인지 판별하는 메소드
		 * @param str
		 * @returns {Boolean}
		 */
		isJsonStr : function(str) {
			try {
				JSON.parse(str);
			} catch (e) {
				return false;
			}
			return true;
		},
		/**
		 * 정수 앞에 "0"을 채워 정해진 자릿수의 문자열로 반환하는 메소드
		 * @param number
		 * @param length
		 */
		padInt : function(number, length){
			var str = number + '';
			while(str.length < length){
				str = '0' + str;
			}
			return str;
		},
		/**
		 * 현재 시각을 yyyyMMddHHmmss 형태로 반환하는 메소드
		 * @returns {str}
		 */
		getCurrentDateTime : function(){
			var date = new Date();
			var yyyy = date.getFullYear().toString();
			var MM = DataUtil.padInt(date.getMonth()+1,2);
			var dd = DataUtil.padInt(date.getDate(),2);
			var hh = DataUtil.padInt(date.getHours(),2);
			var mm = DataUtil.padInt(date.getMinutes(),2);
			var ss = DataUtil.padInt(date.getSeconds(),2);
			
			return yyyy + MM + dd + hh + mm + ss;
		}
}
var MaskingUtil ={
	channelMasking : function(atcDc, str) {
		var maskedStr = "";
		switch(atcDc) {
		case 'email' :
			maskedStr = this._emailMasking(str);
			break;
		case 'id' :
			if(str.indexOf('@') < 0) {
				maskedStr = this._idMasking(str);
			} else {
				maskedStr = this._emailMasking(str);
			}
			break;
		case 'name' :
			maskedStr = this._nameMasking(str);
			break;
		case 'cellNo' :
		case 'telNo' :
			var strTkn = str.split("-");
			var prefix = "";
			var _str = "";
			
			if(strTkn.length >= 3) {
				_str = strTkn[1] + '-' + strTkn[2];
				prefix = strTkn[0] + '-';
			} else {
				_str = str;
			}
			
			maskedStr = prefix + this._numberStringMasking(_str);
			break;
		case 'addr' :
			maskedStr = this._addrMasking(str);
			break;
		case 'bzno' :
			maskedStr = this._numberStringMasking(str);
			break;
		}
		
		return maskedStr;
	},
	_idMasking : function(str) {
		var rtnStr = "";
		var len = str.length;
		if(len == 1) {
			rtnStr = '*';
		} else if(len <= 3 ) {
			rtnStr = str.substr(0,1);
			for(var idx = 0;idx<len-1;idx++) {
				rtnStr += '*';
			}
		} else if(len >= 4) {
			rtnStr = str.substr(0,3);
			for(var idx = 0;idx<len-3;idx++) {
				rtnStr +='*';
			}
		} else {
			throw "입력 값이 잘못됬습니다.";
		}
		
		return rtnStr;
	},
	_emailMasking : function(str) {
		var rtnStr = "";
		var id = str.split('@')[0];
		var domain = str.split('@')[1];
		var len = id.length;
		if(len == 1) {
			rtnStr = '*';
		} else if(len <= 3 ) {
			rtnStr = id.substr(0,1);
			for(var idx = 0;idx<len-1;idx++) {
				rtnStr += '*';
			}
		} else if(len >= 4) {
			rtnStr = id.substr(0,2);
			for(var idx = 0;idx<len-2;idx++) {
				rtnStr +='*';
			}
		} else {
			throw "입력 값이 잘못됬습니다.";
		}
		
		rtnStr += '@' + domain;
		
		return rtnStr;
	},
	_nameMasking : function(str) {
		var rtnStr = "";
		var len = str.length;
		
		rtnStr = str.substr(0,1);
		rtnStr += '*';
		if(str.length > 2) {
			rtnStr += str.substr(2);
		}
		
		return rtnStr;
	},
	_numberStringMasking : function(str) {
		var rtnStr = "";
		var strTkn = str.split('-');
		
		for(var idx in strTkn) {
			var len = strTkn[idx].length;
			if(len == 1) {
				strTkn[idx] = '*';
			} else if(len <= 3) {
				strTkn[idx] = strTkn[idx].substr(0,1);
				for(var i = 0;i<len-1;i++) {
					strTkn[idx] += '*';
				}
			} else if(len >= 4) {
				strTkn[idx] = strTkn[idx].substr(0,2);
				for(var i = 0;i<len-2;i++) {
					strTkn[idx] += '*';
				}
			}
		}
		rtnStr = strTkn[0];
		for(var idx = 1;idx<strTkn.length;idx++) {
			rtnStr += '-';
			rtnStr += strTkn[idx];
		}
		
		return rtnStr;
	},
	_addrMasking : function(str) {
		var rtnStr = "";
		rtnStr = str;
		rtnStr += '*******';
		
		return rtnStr;
	}
};