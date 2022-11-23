package com.aim.movie.action;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

public class MovieAPIAction {
	
	public static void main(String[] args) {
		MovieAPI mv = new MovieAPI();
		
		List<JSONObject> list = mv.requestAPI();

		for(JSONObject jo : list) {
			try {
				jo.get("movieNm");
				jo.get("poster");
				jo.get("watchGradeNm");
				jo.get("bookRating");
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}

	}
}
