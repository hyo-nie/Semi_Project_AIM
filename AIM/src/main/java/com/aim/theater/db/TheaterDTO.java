package com.aim.theater.db;

public class TheaterDTO {
	private int branchCd;
	private String branch_name;
	private String branch_addr;
	
	public int getBranchCd() {
		return branchCd;
	}
	public void setBranchCd(int branchCd) {
		this.branchCd = branchCd;
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
	
	@Override
	public String toString() {
		return "TheaterDTO [branchCd=" + branchCd + ", branch_name=" + branch_name + ", branch_addr=" + branch_addr
				+ "]";
	}
}
