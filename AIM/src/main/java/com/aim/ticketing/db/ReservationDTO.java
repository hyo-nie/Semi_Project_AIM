package com.aim.ticketing.db;

public class ReservationDTO {
	private String tkCode;
	private String movieCd;
	private String totalPrice;
	private String cusCnt;
	private String payment;
	private String mb_id;
	private String branchCd;
	
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
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getCusCnt() {
		return cusCnt;
	}
	public void setCusCnt(String cusCnt) {
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
	public String getBranchCd() {
		return branchCd;
	}
	public void setBranchCd(String branchCd) {
		this.branchCd = branchCd;
	}
	
	@Override
	public String toString() {
		return "ReservationDTO [tkCode=" + tkCode + ", movieCd=" + movieCd + ", totalPrice=" + totalPrice + ", cusCnt="
				+ cusCnt + ", payment=" + payment + ", mb_id=" + mb_id + ", branchCd=" + branchCd + "]";
	}
}
