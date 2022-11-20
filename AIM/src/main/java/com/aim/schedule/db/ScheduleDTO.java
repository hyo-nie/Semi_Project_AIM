package com.aim.schedule.db;

public class ScheduleDTO {
	private int scCode;
	private int branchCd;
	private String sc_date;
	private int roomCd;
	private String movieCd;
	private String starttime;
	private String endtime;
	private int runcount;
	private String seatcomp;
	private String movieNm;
	private String watchGradeNm;
	
	// 조인용 변수 추가
	private String branch_name;
	private int completeCnt;
	private int totalseatCnt;
	
	// 조인용 변수 추가 2
	private String roomNum;
	private String poster;
	private String showTm;
	
	public String getShowTm() {
		return showTm;
	}
	public void setShowTm(String showTm) {
		this.showTm = showTm;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}
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
	public String getSc_date() {
		return sc_date;
	}
	public void setSc_date(String sc_date) {
		this.sc_date = sc_date;
	}
	public int getRoomCd() {
		return roomCd;
	}
	public void setRoomCd(int roomCd) {
		this.roomCd = roomCd;
	}
	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
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
	public int getRuncount() {
		return runcount;
	}
	public void setRuncount(int runcount) {
		this.runcount = runcount;
	}
	public String getSeatcomp() {
		return seatcomp;
	}
	public void setSeatcomp(String seatcomp) {
		this.seatcomp = seatcomp;
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
	public int getCompleteCnt() {
		return completeCnt;
	}
	public void setCompleteCnt(int completeCnt) {
		this.completeCnt = completeCnt;
	}
	public int getTotalseatCnt() {
		return totalseatCnt;
	}
	public void setTotalseatCnt(int totalseatCnt) {
		this.totalseatCnt = totalseatCnt;
	}
	
	@Override
	public String toString() {
		return "ScheduleDTO [scCode=" + scCode + ", branchCd=" + branchCd + ", sc_date=" + sc_date + ", roomCd="
				+ roomCd + ", movieCd=" + movieCd + ", starttime=" + starttime + ", endtime=" + endtime + ", runcount="
				+ runcount + ", seatcomp=" + seatcomp + ", movieNm=" + movieNm + ", watchGradeNm=" + watchGradeNm
				+ ", branch_name=" + branch_name + ", completeCnt=" + completeCnt + ", totalseatCnt=" + totalseatCnt
				+ ", roomNum=" + roomNum + ", poster=" + poster + ", showTm=" + showTm + "]";
	}
	
}
	
