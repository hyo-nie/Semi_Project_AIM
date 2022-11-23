package com.aim.store.db;

public class CartDTO {

	private int c_num;
	private int st_num;
	private int c_amount;
	private String st_name;
	private String mb_id;
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}
	public int getC_amount() {
		return c_amount;
	}
	public void setC_amount(int c_amount) {
		this.c_amount = c_amount;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	@Override
	public String toString() {
		return "CartDTO [c_num=" + c_num + ", st_num=" + st_num + ", c_amount=" + c_amount + ", st_name=" + st_name
				+ ", mb_id=" + mb_id + "]";
	}
	
	
	
}
