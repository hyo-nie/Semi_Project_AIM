package com.aim.store.db;

import java.sql.Timestamp;

public class OrderDTO {
	
	private int o_num;
	private String o_cnum;
	private int o_stnum;
	private String o_name;
	private int o_amount;
	private String o_id;
	private String o_tel;
	private int o_sum;
	private String o_pay;
	private Timestamp o_pdate;
	private int o_refund;
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getO_cnum() {
		return o_cnum;
	}
	public void setO_cnum(String o_cnum) {
		this.o_cnum = o_cnum;
	}
	public int getO_stnum() {
		return o_stnum;
	}
	public void setO_stnum(int o_stnum) {
		this.o_stnum = o_stnum;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public int getO_amount() {
		return o_amount;
	}
	public void setO_amount(int o_amount) {
		this.o_amount = o_amount;
	}
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public String getO_tel() {
		return o_tel;
	}
	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}
	public int getO_sum() {
		return o_sum;
	}
	public void setO_sum(int o_sum) {
		this.o_sum = o_sum;
	}
	public String getO_pay() {
		return o_pay;
	}
	public void setO_pay(String o_pay) {
		this.o_pay = o_pay;
	}
	public Timestamp getO_pdate() {
		return o_pdate;
	}
	public void setO_pdate(Timestamp o_pdate) {
		this.o_pdate = o_pdate;
	}
	public int getO_refund() {
		return o_refund;
	}
	public void setO_refund(int o_refund) {
		this.o_refund = o_refund;
	}
	@Override
	public String toString() {
		return "OrderDTO [o_num=" + o_num + ", o_cnum=" + o_cnum + ", o_stnum=" + o_stnum + ", o_name=" + o_name
				+ ", o_amount=" + o_amount + ", o_id=" + o_id + ", o_tel=" + o_tel + ", o_sum=" + o_sum + ", o_pay="
				+ o_pay + ", o_pdate=" + o_pdate + ", o_refund=" + o_refund + "]";
	}
	
}