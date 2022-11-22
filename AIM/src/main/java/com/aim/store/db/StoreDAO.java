package com.aim.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StoreDAO {

	   private Connection con = null;
	   private PreparedStatement pstmt = null;
	   private ResultSet rs = null;
	   private String sql = "";
	   
	   
	   private Connection getConnection() throws Exception{
			Context initCTX = new InitialContext();			
			DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/AIM");		
			con = ds.getConnection();

			return con;
	   }
	         
	   // 자원 해제
	   public void closeDB() {
	      System.out.println("DAO : 연결 자원 해제");
	      try {
	         if (rs != null)
	            rs.close();
	         if (pstmt != null)
	            pstmt.close();
	         if (con != null)
	            con.close();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   } // 자원해제
	
	   
	   /**
	    * getStoreProduct()
	    * - 카테고리별 스토어 상품 정보를 불러오는 메서드
	    * - 카테고리 1 : 기프트카드 / 관람권
	    *   카테고리 2 : 팝콘 / 음료 / 굿즈
	    * @param code
	    * @return
	    */
	   public List getStoreProduct(String code) {
		   List productList = new ArrayList();
		   
		   try {
			con = getConnection();
			sql = "select * from store where category_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StoreDTO dto = new StoreDTO();
				
				dto.setCategory_code(code);
				dto.setCategory_name(rs.getString("category_name"));
				dto.setSt_img(rs.getString("st_img"));
				dto.setSt_name(rs.getString("st_name"));
				dto.setSt_num(rs.getInt("st_num"));
				dto.setSt_price(rs.getInt("st_price"));
				dto.setSt_text(rs.getString("st_text"));
				
				productList.add(dto);
			}
			System.out.println("DAO : 상품의 개수? " + productList.size());
//			System.out.println(productList);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		   return productList;
		   
	   } // 카테고리별 스토어 상품 정보를 불러오는 메서드 끝 
	   
	   /**
	    * getAimPick()
	    * AIM's pick 상품을 불러오는 메서드 
	    * @param st_num
	    * @return
	    */
	   public StoreDTO getAimPick(int st_num) {
		   StoreDTO dto = new StoreDTO();
		   
		   try {
			con = getConnection();
			sql = "select * from store where st_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, st_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setSt_img(rs.getString("st_img"));
				dto.setSt_name(rs.getString("st_name"));
				dto.setSt_num(st_num);
				dto.setSt_price(rs.getInt("st_price"));
				dto.setSt_text(rs.getString("st_text"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}		   
		   
		   return dto;
		   
	   }
	   
	   
	   // 상품 상세정보를 조회하는 메서드 - getProductInfo()
	   public StoreDTO getProductInfo(int st_num) {
		   StoreDTO dto = null;
		   
		   try {
			con = getConnection();
			sql = "select * from store where st_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, st_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new StoreDTO();
				
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setSt_img(rs.getString("st_img"));
				dto.setSt_name(rs.getString("st_name"));
				dto.setSt_num(rs.getInt("st_num"));
				dto.setSt_price(rs.getInt("st_price"));
				dto.setSt_text(rs.getString("st_text"));
			}
			
			System.out.println("DAO : 상품 상세 정보 조회 완료! " + dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		   return dto;
	   } // 상품 상세정보를 조회하는 메서드 끝 - getProductInfo()
	
		// 관람권 & 기프트카드리스트 - getGiftcard(card)
		public List getGiftcard(String card) {
			List Giftcard = new ArrayList();
//			StringBuffer SQL = new StringBuffer();
			
			try {
				con = getConnection();
				sql = "select * from store where category_code=?";
//				SQL.append("select * from store");
				
//				if(card.equals("all")) {
//					System.out.println(" DAO : all " + SQL);
//				} // 관람권, 기프트카드가 한 카테고리이므로 if절만 사용함
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, card);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					StoreDTO dto = new StoreDTO();
					dto.setSt_num(rs.getInt("st_num"));
					dto.setSt_name(rs.getString("st_name"));
					dto.setSt_price(rs.getInt("st_price"));
					dto.setSt_text(rs.getString("st_text"));
					dto.setSt_img(rs.getString("st_img"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setCategory_code(card);
					
					Giftcard.add(dto);
				} 
				
				System.out.println(" DAO : 상품리스트 저장 완료 " + Giftcard.size());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return Giftcard;
		}
		// 관람권 & 기프트카드리스트 - getGiftcard(card)
		
		// 관람권 & 기프트카드리스트 상세정보 조회 - getGiftcardDetail(st_num)
		public StoreDTO getGiftcardDetail(int st_num) {
			StoreDTO dto = null;
			
			try {
				con = getConnection();
				sql = "select * from store where st_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, st_num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new StoreDTO();
					
					dto.setSt_num(rs.getInt("st_num"));
					dto.setSt_name(rs.getString("st_name"));
					dto.setSt_price(rs.getInt("st_price"));
					dto.setSt_text(rs.getString("st_text"));
					dto.setSt_img(rs.getString("st_img"));
					dto.setCategory_name(rs.getString("category_name"));
					dto.setCategory_code(rs.getString("category_code"));
				}
				System.out.println(" DAO : 상품조회 완료");
				System.out.println(dto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return dto;
		}
		
		// 관람권 & 기프트카드리스트 상세정보 조회 - getGiftcardDetail()
}
