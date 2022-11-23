package com.aim.hp.db;

import java.sql.Date;

public class HpDTO {
	private int hp_bno; // 문의 번호
	private String mb_id; // 문의자 id
	private String mb_pw; // 삭제시 필요한 pw
	private String hp_subject; // 문의 제목
	private String hp_content; // 문의 내용
	private String hp_file; // 첨부파일
	private Date hp_date; // 문의 남긴 시간
	private String hp_select; // 문의 분류
	private String hp_class; // 문의 종류 (영화 or 기타)
	private int hp_re_ref; // 참조 번호 (글 그룹 나눔)
	private int hp_re_lev; // 참조 레벨 ( 답글 달시 이용)	
	private int hp_re_seq; // 답글 순서 표시
	public int getHp_bno() {
		return hp_bno;
	}
	public void setHp_bno(int hp_bno) {
		this.hp_bno = hp_bno;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getHp_subject() {
		return hp_subject;
	}
	public void setHp_subject(String hp_subject) {
		this.hp_subject = hp_subject;
	}
	public String getHp_content() {
		return hp_content;
	}
	public void setHp_content(String hp_content) {
		this.hp_content = hp_content;
	}
	public String getHp_file() {
		return hp_file;
	}
	public void setHp_file(String hp_file) {
		this.hp_file = hp_file;
	}
	public Date getHp_date() {
		return hp_date;
	}
	public void setHp_date(Date hp_date) {
		this.hp_date = hp_date;
	}
	public String getHp_select() {
		return hp_select;
	}
	public void setHp_select(String hp_select) {
		this.hp_select = hp_select;
	}
	public String getHp_class() {
		return hp_class;
	}
	public void setHp_class(String hp_class) {
		this.hp_class = hp_class;
	}
	public int getHp_re_ref() {
		return hp_re_ref;
	}
	public void setHp_re_ref(int hp_re_ref) {
		this.hp_re_ref = hp_re_ref;
	}
	public int getHp_re_lev() {
		return hp_re_lev;
	}
	public void setHp_re_lev(int hp_re_lev) {
		this.hp_re_lev = hp_re_lev;
	}
	public int getHp_re_seq() {
		return hp_re_seq;
	}
	public void setHp_re_seq(int hp_re_seq) {
		this.hp_re_seq = hp_re_seq;
	}
	
	@Override
	public String toString() {
		return "HpDTO [hp_bno=" + hp_bno + ", mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", hp_subject=" + hp_subject
				+ ", hp_content=" + hp_content + ", hp_file=" + hp_file + ", hp_date=" + hp_date + ", hp_select="
				+ hp_select + ", hp_class=" + hp_class + ", hp_re_ref=" + hp_re_ref + ", hp_re_lev=" + hp_re_lev
				+ ", hp_re_seq=" + hp_re_seq + "]";
	}

	
}
