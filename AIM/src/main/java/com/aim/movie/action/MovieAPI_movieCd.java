package com.aim.movie.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MovieAPI_movieCd {
	
	// 상수설정
	private final String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
	private final String KEY = "8d264108cfa20f086d75ae469aa86cb6";
	
	public JSONObject requestAPI(String movieCd) { 
	  //JSONObject 사용하려면 일반 String 파일을 JSON 파일로 바꿔주는 라이브러리를 추가해야 함

		JSONObject movieInfo = null;
		
		try {
			// Request URL 연결 객체 생성
			URL requestURL = new URL(REQUEST_URL+"?key="+KEY+"&movieCd="+movieCd);
			
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
			JSONObject movieInfoResult = responseBody.getJSONObject("movieInfoResult");
			
			// 박스오피스 목록 출력
//			dailyBoxOfficeList = boxOfficeResult.getJSONArray("dailyBoxOfficeList");
//			System.out.println(movieInfoResult);
			movieInfo = movieInfoResult.getJSONObject("movieInfo");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return movieInfo;
	}
}
