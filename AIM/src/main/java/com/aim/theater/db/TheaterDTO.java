package com.aim.theater.db;



import lombok.Data;

@Data
public class TheaterDTO {
	private int scCode; //스케줄코드
	private int branchCd; //지점코드
	private int roomCd; //상영관번호
	private int seatcomp; // 좌석예매현황
	private String roomNum;//상영관이름
	private String starttime; //상영시작시간
	private String endtime; //종료시간
	private String sc_date; //상영날짜
	private int runcount;//상영횟수
	private String movieCd; //영화코드
	private String movieNm; //영화제목
	private String watchGradeNm;//관람등급
	
	private String branch_name; //지점이름
	private String branch_addr; //지점주소
	
}
