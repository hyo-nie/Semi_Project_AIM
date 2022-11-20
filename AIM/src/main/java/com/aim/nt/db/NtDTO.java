package com.aim.nt.db;

import java.sql.Date;

public class NtDTO {

	private String mb_id;	// 공지 ID (admin)
	private int nt_bno;	// 공지글번호
	private String nt_subject;	// 공지 제목
	private String nt_content; // 공지 내용
	private Date nt_date;	// 공지 날짜
	private String nt_file;	// 공지 첨부 파일
	private int nt_re_ref; // 참조 번호 (글 그룹 나눔)
	private int nt_re_lev; // 참조 레벨 ( 답글 달시 이용)	
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getNt_bno() {
		return nt_bno;
	}
	public void setNt_bno(int nt_bno) {
		this.nt_bno = nt_bno;
	}
	public String getNt_subject() {
		return nt_subject;
	}
	public void setNt_subject(String nt_subject) {
		this.nt_subject = nt_subject;
	}
	public String getNt_content() {
		return nt_content;
	}
	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}
	public Date getNt_date() {
		return nt_date;
	}
	public void setNt_date(Date nt_date) {
		this.nt_date = nt_date;
	}
	public String getNt_file() {
		return nt_file;
	}
	public void setNt_file(String nt_file) {
		this.nt_file = nt_file;
	}
	public int getNt_re_ref() {
		return nt_re_ref;
	}
	public void setNt_re_ref(int nt_re_ref) {
		this.nt_re_ref = nt_re_ref;
	}
	public int getNt_re_lev() {
		return nt_re_lev;
	}
	public void setNt_re_lev(int nt_re_lev) {
		this.nt_re_lev = nt_re_lev;
	}
	@Override
	public String toString() {
		return "NtDTO [mb_id=" + mb_id + ", nt_bno=" + nt_bno + ", nt_subject=" + nt_subject + ", nt_content="
				+ nt_content + ", nt_date=" + nt_date + ", nt_file=" + nt_file + ", nt_re_ref=" + nt_re_ref
				+ ", nt_re_lev=" + nt_re_lev + "]";
	}
	
	
	
}