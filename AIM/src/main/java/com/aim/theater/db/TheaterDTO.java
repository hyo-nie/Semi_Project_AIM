package com.aim.theater.db;

public class TheaterDTO {
	private int scCode; //스케줄코드
	private int branchCd; //지점코드
	private int roomCd; //상영관번호
	private int seatcomp; // 좌석예매현황
	private String branch_longitude;
	private String branch_latitude;
	private String roomNum;//상영관이름
	private String starttime; //상영시작시간
	private String endtime; //종료시간
	private String sc_date; //상영날짜
	private int runcount;//상영횟수
	private String movieCd; //영화코드
	private String movieNm; //영화제목
	private String watchGradeNm;//관람등급
	private String poster; // 포스터
	
	private String branch_name; //지점이름
	private String branch_addr; //지점주소
	public int getScCode() {
		return scCode;
	}
	public void setScCode(int scCode) {
		this.scCode = scCode;
	}
	public int getBranchCd() {
		return branchCd;
	}
	public void setBranchCd(int branchCd) {
		this.branchCd = branchCd;
	}
	public int getRoomCd() {
		return roomCd;
	}
	public void setRoomCd(int roomCd) {
		this.roomCd = roomCd;
	}
	public int getSeatcomp() {
		return seatcomp;
	}
	public void setSeatcomp(int seatcomp) {
		this.seatcomp = seatcomp;
	}
	public String getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getSc_date() {
		return sc_date;
	}
	public void setSc_date(String sc_date) {
		this.sc_date = sc_date;
	}
	public int getRuncount() {
		return runcount;
	}
	public void setRuncount(int runcount) {
		this.runcount = runcount;
	}
	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getWatchGradeNm() {
		return watchGradeNm;
	}
	public void setWatchGradeNm(String watchGradeNm) {
		this.watchGradeNm = watchGradeNm;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getBranch_addr() {
		return branch_addr;
	}
	public void setBranch_addr(String branch_addr) {
		this.branch_addr = branch_addr;
	}	
	public String getBranch_longitude() {
		return branch_longitude;
	}
	public void setBranch_longitude(String branch_longitude) {
		this.branch_longitude = branch_longitude;
	}
	public String getBranch_latitude() {
		return branch_latitude;
	}
	public void setBranch_latitude(String branch_latitude) {
		this.branch_latitude = branch_latitude;
	}
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	@Override
	public String toString() {
		return "TheaterDTO [scCode=" + scCode + ", branchCd=" + branchCd + ", roomCd=" + roomCd + ", seatcomp="
				+ seatcomp + ", branch_longitude=" + branch_longitude + ", branch_latitude=" + branch_latitude
				+ ", roomNum=" + roomNum + ", starttime=" + starttime + ", endtime=" + endtime + ", sc_date=" + sc_date
				+ ", runcount=" + runcount + ", movieCd=" + movieCd + ", movieNm=" + movieNm + ", watchGradeNm="
				+ watchGradeNm + ", poster=" + poster + ", branch_name=" + branch_name + ", branch_addr=" + branch_addr
				+ "]";
	}

	

}
