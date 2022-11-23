package com.aim.ticketing.db;

public class timeDTO {
	private int month;
	private int date;
	private String korDayOfWeek;
	private String yyyyMMdd;
	
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	public String getKorDayOfWeek() {
		return korDayOfWeek;
	}
	public void setKorDayOfWeek(String korDayOfWeek) {
		this.korDayOfWeek = korDayOfWeek;
	}
	public String getYyyyMMdd() {
		return yyyyMMdd;
	}
	public void setYyyyMMdd(String yyyyMMdd) {
		this.yyyyMMdd = yyyyMMdd;
	}
	
	@Override
	public String toString() {
		return "timeDTO [month=" + month + ", date=" + date + ", korDayOfWeek=" + korDayOfWeek + ", yyyyMMdd="
				+ yyyyMMdd + "]";
	}
	
	
	
	
}
