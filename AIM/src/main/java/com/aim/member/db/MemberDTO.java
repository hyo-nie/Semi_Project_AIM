package com.aim.member.db;

public class MemberDTO {
  private String mb_id;
  private String mb_pw;
  private String mb_name;
  private String mb_nick;
  private String mb_birth;
  private String mb_gender;
  private String mb_tel;
  private int mb_grade;
  private int mb_pay;
  private int mb_view;
  
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
  public String getMb_name() {
    return mb_name;
  }
  public void setMb_name(String mb_name) {
    this.mb_name = mb_name;
  }
  public String getMb_nick() {
    return mb_nick;
  }
  public void setMb_nick(String mb_nick) {
    this.mb_nick = mb_nick;
  }
  public String getMb_birth() {
    return mb_birth;
  }
  public void setMb_birth(String mb_birth) {
    this.mb_birth = mb_birth;
  }
  public String getMb_gender() {
    return mb_gender;
  }
  public void setMb_gender(String mb_gender) {
    this.mb_gender = mb_gender;
  }
  public String getMb_tel() {
    return mb_tel;
  }
  public void setMb_tel(String mb_tel) {
    this.mb_tel = mb_tel;
  }
  public int getMb_grade() {
    return mb_grade;
  }
  public void setMb_grade(int mb_grade) {
    this.mb_grade = mb_grade;
  }
  public int getMb_pay() {
    return mb_pay;
  }
  public void setMb_pay(int mb_pay) {
    this.mb_pay = mb_pay;
  }
  public int getMb_view() {
    return mb_view;
  }
  public void setMb_view(int mb_view) {
    this.mb_view = mb_view;
  }
  
  @Override
  public String toString() {
    return "MemberDTO [mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", mb_name=" + mb_name + ", mb_nick=" + mb_nick
        + ", mb_birth=" + mb_birth + ", mb_gender=" + mb_gender + ", mb_tel=" + mb_tel + ", mb_grade=" + mb_grade
        + ", mb_pay=" + mb_pay + ", mb_view=" + mb_view + "]";
  }
  
}
