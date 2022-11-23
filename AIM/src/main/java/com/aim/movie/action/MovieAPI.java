package com.aim.movie.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

public class MovieAPI {
	
	// 상수설정
	//일간박스오피스
//	private final String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
	private final String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json";
	private final String KEY = "8d264108cfa20f086d75ae469aa86cb6";
	
	private final SimpleDateFormat DATE_FMT = new SimpleDateFormat("yyyyMMdd");
	
	public List<JSONObject> requestAPI() { 
	  //JSONObject 사용하려면 일반 String 파일을 JSON 파일로 바꿔주는 라이브러리를 추가해야 함

		JSONArray dailyBoxOfficeList = null;
		List<JSONObject> list = null;
		
		// 변수 설정 (하루전 날짜)
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, -7);
		
		// 변수 설정
		// 요청 인터페이스 Map
		// - 어제자 한국영화 10개 조회
		
		try {
			// Request URL 연결 객체 생성
			URL requestURL = new URL(REQUEST_URL+"?key="+KEY+"&targetDt="+DATE_FMT.format(cal.getTime()));
			HttpURLConnection conn = (HttpURLConnection)requestURL.openConnection();
			
			// GET 방식으로 요청
			conn.setRequestMethod("GET");
			conn.setDoInput(true);
			
			// 응답(Response) 구조 작성 - Stream -> JSONObject
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String readline = null;
			StringBuffer response = new StringBuffer();
			
			
			while ((readline = br.readLine()) != null) {
				response.append(readline);
				
			}
			
			// JSON 객체로 변환
			JSONObject responseBody = new JSONObject(response.toString());
			
		  // 데이터 추출
			// JSONObject boxOffice = responseBody.getJSONObject("movieInfoResult");
			JSONObject boxOfficeResult = responseBody.getJSONObject("boxOfficeResult");
			
			// 박스오피스 주제 출력
//			String boxofficeType = boxOfficeResult.getString("boxofficeType");
			
			// 박스오피스 목록 출력
			dailyBoxOfficeList = boxOfficeResult.getJSONArray("weeklyBoxOfficeList");
			
			list = new ArrayList<JSONObject>();  //list에 JSON객체를 하나씩 담아서 출력
			for (int i = 0; i < dailyBoxOfficeList.length(); i++) {
				list.add(dailyBoxOfficeList.getJSONObject(i));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
