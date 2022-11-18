package com.aim.store.db;

public class StoreDTO {
   private int st_num; // 제품번호
   private String st_name; // 상품명
   private int st_price; // 상품가격
   private String st_text; // 상품 설명
   private String st_img; // 상품 사진
   private String category_name; // 카테고리이름
   private String category_code; // 카테고리코드
   
public int getSt_num() {
	return st_num;
}
public void setSt_num(int st_num) {
	this.st_num = st_num;
}
public String getSt_name() {
	return st_name;
}
public void setSt_name(String st_name) {
	this.st_name = st_name;
}
public int getSt_price() {
	return st_price;
}
public void setSt_price(int st_price) {
	this.st_price = st_price;
}
public String getSt_text() {
	return st_text;
}
public void setSt_text(String st_text) {
	this.st_text = st_text;
}
public String getSt_img() {
	return st_img;
}
public void setSt_img(String st_img) {
	this.st_img = st_img;
}
public String getCategory_name() {
	return category_name;
}
public void setCategory_name(String category_name) {
	this.category_name = category_name;
}
public String getCategory_code() {
	return category_code;
}
public void setCategory_code(String category_code) {
	this.category_code = category_code;
}

@Override
public String toString() {
	return "StoreDTO [st_num=" + st_num + ", st_name=" + st_name + ", st_price=" + st_price + ", st_text=" + st_text
			+ ", st_img=" + st_img + ", category_name=" + category_name + ", category_code=" + category_code + "]";
}
  
   
}