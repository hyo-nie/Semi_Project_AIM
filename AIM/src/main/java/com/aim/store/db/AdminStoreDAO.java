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

public class AdminStoreDAO {

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
	   }
	

	  /** addProduct(dto) 
	   * 관리자가 상품 등록할 수 있는 메서드 
	   * @param dto
	   */
	  public void addProduct(StoreDTO dto) {
		  int st_num = 0;
		  
		  try {
			con = getConnection();
			
			// 1. 상품번호 계산
			sql = "select max(st_num) from store";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				st_num = rs.getInt(1) + 1;
			}
			System.out.println("DAO : 등록한 상품의 번호는? " + st_num);
			
			// 2. 상품 등록하기
			sql = "insert into store(st_num,st_name,st_price,st_text,st_img,category_name,category_code) "
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, st_num);
			pstmt.setString(2, dto.getSt_name());
			pstmt.setInt(3, dto.getSt_price());
			pstmt.setString(4, dto.getSt_text());
			pstmt.setString(5, dto.getSt_img());
			pstmt.setString(6, dto.getCategory_name());
			pstmt.setString(7, dto.getCategory_code());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 상품 등록이 완료되었습니다.");
			System.out.println(dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		  
	  }
	  
	 /**
	  * getAdminStoreList()
	  * 관리자가 스토어 상품을 모두 불러오는 메서드
	  * @return List
	  */
	 public List getAdminStoreList() {
		 List adminStoreList = new ArrayList();
		 
		 try {
			con = getConnection();
			sql = "select * from store";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				dto.setSt_img(rs.getString("st_img"));
				dto.setSt_name(rs.getString("st_name"));
				dto.setSt_num(rs.getInt("st_num"));
				dto.setSt_price(rs.getInt("st_price"));
				dto.setSt_text(rs.getString("st_text"));
				
				adminStoreList.add(dto);
				
			}
			
			System.out.println("DAO : 상품리스트 저장 완료(admin) / 총 " + adminStoreList.size() + "개");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		 
		return adminStoreList;
		
	 } // admin 스토어 상품을 모두 가져오는 메서드 - getAdminStoreList()
	  
	 
	 /**
	  * adminStoreDel()
	  * 관리자가 상품을 삭제하는 메서드
	  * @param st_num
	  */
	 public void adminStoreDel(int st_num) {
		 try {
			con = getConnection();
			sql = "delete from store where st_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, st_num);
			pstmt.executeUpdate();
			
			System.out.println("DAO : 상품 삭제가 완료되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		 
	 } // 상품 삭제 메서드 끝 - adminStoreDel()
	 
	 /**
	  * getAdminStore()
	  * 관리자 상품 1개의 정보 가져오는 메서드
	  * @param st_num
	  * @return
	  */
	 public StoreDTO getAdminStore(int st_num) {
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
				dto.setSt_num(st_num);
				dto.setSt_price(rs.getInt("st_price"));
				dto.setSt_text(rs.getString("st_text"));
				
			}

			System.out.println("DAO : " + st_num + "번 상품을 가져옵니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		 return dto;
		 
	 }  // 상품 1개의 정보 가져오는 메서드 끝 - getAdminStore()
	 
	 
	 /**
	  * adminStoreModify()
	  * 관리자 상품 수정 메서드(파일은 수정 불가) 
	  * @param dto
	  */
	 public void adminStoreModify(StoreDTO dto) {
		 try {
			con = getConnection();
			 sql = "update store set st_name=?,st_price=?,st_text=?,category_name=?,category_code=? "
				 		+ "where st_num=?";
			pstmt = con.prepareStatement(sql);	
			pstmt.setString(1, dto.getSt_name());
			pstmt.setInt(2, dto.getSt_price());
			pstmt.setString(3, dto.getSt_text());
			pstmt.setString(4, dto.getCategory_name());
			pstmt.setString(5, dto.getCategory_code());
			pstmt.setInt(6, dto.getSt_num());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 상품 수정이 완료되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		 
	 }  // 상품 수정 메서드 - adminStoreModify()
	 
}
