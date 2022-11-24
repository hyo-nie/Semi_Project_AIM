package com.aim.theater.db;

public class RentDTO {
	private int rno;
	private int branchCd;
	private String branch_name;
	private String r_class;
	private int r_people;
	private String hopeday;
	private int hopestart;
	private int hopeend;
	private String movieCd;
	private String movieNm;
	private String r_text;
	
	private String r_name;
	private String r_tel;
	private String r_mb_pw;
	private String r_mb_id;
	
	private int r_re_ref;
	private int r_re_lev;
	private int r_re_seq;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBranchCd() {
		return branchCd;
	}
	public void setBranchCd(int branchCd) {
		this.branchCd = branchCd;
	}
	public String getR_class() {
		return r_class;
	}
	public void setR_class(String r_class) {
		this.r_class = r_class;
	}
	public int getR_people() {
		return r_people;
	}
	public void setR_people(int r_people) {
		this.r_people = r_people;
	}
	public String getHopeday() {
		return hopeday;
	}
	public void setHopeday(String hopeday) {
		this.hopeday = hopeday;
	}
	public int getHopestart() {
		return hopestart;
	}
	public void setHopestart(int hopestart) {
		this.hopestart = hopestart;
	}
	public int getHopeend() {
		return hopeend;
	}
	public void setHopeend(int hopeend) {
		this.hopeend = hopeend;
	}
	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}
	public String getR_text() {
		return r_text;
	}
	public void setR_text(String r_text) {
		this.r_text = r_text;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_tel() {
		return r_tel;
	}
	public void setR_tel(String r_tel) {
		this.r_tel = r_tel;
	}
	public int getR_re_ref() {
		return r_re_ref;
	}
	public void setR_re_ref(int r_re_ref) {
		this.r_re_ref = r_re_ref;
	}
	public int getR_re_lev() {
		return r_re_lev;
	}
	public void setR_re_lev(int r_re_lev) {
		this.r_re_lev = r_re_lev;
	}
	public int getR_re_seq() {
		return r_re_seq;
	}
	public void setR_re_seq(int r_re_seq) {
		this.r_re_seq = r_re_seq;
	}
	
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	
	public String getR_mb_pw() {
		return r_mb_pw;
	}
	public void setR_mb_pw(String r_mb_pw) {
		this.r_mb_pw = r_mb_pw;
	}
	
	public String getR_mb_id() {
		return r_mb_id;
	}
	public void setR_mb_id(String r_mb_id) {
		this.r_mb_id = r_mb_id;
	}
	@Override
	public String toString() {
		return "RentDTO [rno=" + rno + ", branchCd=" + branchCd + ", branch_name=" + branch_name + ", r_class="
				+ r_class + ", r_people=" + r_people + ", hopeday=" + hopeday + ", hopestart=" + hopestart
				+ ", hopeend=" + hopeend + ", movieCd=" + movieCd + ", movieNm=" + movieNm + ", r_text=" + r_text
				+ ", r_name=" + r_name + ", r_tel=" + r_tel + ", r_mb_pw=" + r_mb_pw + ", r_mb_id=" + r_mb_id
				+ ", r_re_ref=" + r_re_ref + ", r_re_lev=" + r_re_lev + ", r_re_seq=" + r_re_seq + "]";
	}
	
}
