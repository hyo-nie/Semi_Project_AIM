package com.aim.ticketing.db;

public class ReservationDTO {
	private String tkCode;
	private String movieCd;
	private int totalPrice;
	private int cusCnt;
	private String payment;
	private String mb_id;
	private int scCode;
	
	public String getTkCode() {
		return tkCode;
	}
	public void setTkCode(String tkCode) {
		this.tkCode = tkCode;
	}
	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getCusCnt() {
		return cusCnt;
	}
	public void setCusCnt(int cusCnt) {
		this.cusCnt = cusCnt;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getScCode() {
		return scCode;
	}
	public void setScCode(int scCode) {
		this.scCode = scCode;
	}
	
	@Override
	public String toString() {
		return "ReservationDTO [tkCode=" + tkCode + ", movieCd=" + movieCd + ", totalPrice=" + totalPrice + ", cusCnt="
				+ cusCnt + ", payment=" + payment + ", mb_id=" + mb_id + ", scCode=" + scCode + "]";
	}
	
	
}
