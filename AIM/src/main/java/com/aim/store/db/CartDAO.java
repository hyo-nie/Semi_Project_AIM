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

import com.aim.store.db.CartDTO;

public class CartDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 디비 연결해주는 메서드(커넥션풀)
	private Connection getConnection() throws Exception{
		
		// 1. 드라이버 로드 // 2. 디비연결
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/AIM"); // 다운캐스팅
		con = ds.getConnection();
		System.out.println(" DAO : 디비연결 성공(커넥션풀) con "+ con);
		
		return con;
	}
		
		// 자원해제 메서드-closeDB()
		public void closeDB() {
			System.out.println("DAO : 디비연결자원 해제");
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 자원해제 메서드 - closeDB()
		
		// 기존의 장바구니 체크 - checkCart(DTO)
		public boolean checkCart(CartDTO dto) {
			boolean result = false;
			
			try {
				con = getConnection();
				sql = "select * from cart where mb_id=? and st_num=?"; 
				// 기존에 동일 상품이 있는지 체크
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getMb_id());
				pstmt.setInt(2, dto.getSt_num());
				
				rs = pstmt.executeQuery();
				
				// data가 있다면
				if(rs.next()) { // 기존의 동일상품이 존재 -> 수량만 update
					sql = "update cart set c_amount=c_amount+? where mb_id=? and st_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, dto.getC_amount());
					pstmt.setString(2, dto.getMb_id());
					pstmt.setInt(3, dto.getSt_num());
					
					int tmp = pstmt.executeUpdate();
					if(tmp == 1) {
						result = true;
					}
				}
				System.out.println(" DAO : " + (result? "기존의 정보 수정" : "기존 상품 없음"));
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return result;
		}
		// 기존의 장바구니 체크 - checkCart()
		
		/**
		 * cartAdd(CartDTO dto)
		 * 장바구니에 상품을 추가하는 메서드
		 * @param dto
		 */
		public void cartAdd(CartDTO dto) {
			int c_num = 0;
			try {
				con = getConnection();
				// 1) 장바구니 번호 c_num
				sql = "select max(c_num) from cart";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					c_num = rs.getInt(1) + 1;
				}

				// 2) 장바구니 저장 (insert)

				sql = "insert into cart(c_num,st_num,c_amount,st_name,mb_id) values(?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, c_num);
				pstmt.setInt(2, dto.getSt_num());
				pstmt.setInt(3, dto.getC_amount());
				pstmt.setString(4, dto.getSt_name());
				pstmt.setString(5, dto.getMb_id());

				pstmt.executeUpdate();

				System.out.println(" DAO : 장바구니 등록완료! ");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
		} // 장바구니 상품 추가 - cartAdd(DTO)
		
		/**
		 * getCartList(id)
		 * - id에 해당하는 장바구니 정보 + 장바구니에 들어있는 상품의 정보를 불러오는 메서드
		 * @param id
		 * @return totalList
		 */
		public ArrayList getCartList(String id) {

			ArrayList totalList = new ArrayList();
			List cartList = new ArrayList();		// 장바구니 리스트
			List productList = new ArrayList();		// 상품정보 리스트
			
			try {
				con = getConnection();
				
				// 1. 장바구니 정보 조회
				sql = "select * from cart where mb_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CartDTO cDTO = new CartDTO();
					
					cDTO.setC_amount(rs.getInt("c_amount"));
					cDTO.setC_num(rs.getInt("c_num"));
					cDTO.setMb_id(rs.getString("mb_id"));
					cDTO.setSt_name(rs.getString("st_name"));
					cDTO.setSt_num(rs.getInt("st_num"));
					
					cartList.add(cDTO);	// 장바구니 정보 조회 후 cartList에 저장
					
					System.out.println(" DAO : 장바구니 정보? " + cartList);
					
					// 2. 장바구니에 들어있는 상품(st_num)에 해당하는 상품의 정보를 조회
					sql = "select * from store where st_num=?";
					PreparedStatement pstmt2 = con.prepareStatement(sql);
					pstmt2.setInt(1, cDTO.getSt_num());
					ResultSet rs2 = pstmt2.executeQuery();
					
					if(rs2.next()) {
						StoreDTO sDTO = new StoreDTO();
						
						sDTO.setSt_num(rs2.getInt("st_num"));
						sDTO.setSt_name(rs2.getString("st_name"));
						sDTO.setSt_price(rs2.getInt("st_price"));
						sDTO.setSt_img(rs2.getString("st_img")); 
						sDTO.setSt_text(rs2.getString("st_text"));
						sDTO.setCategory_name(rs2.getString("category_name"));
						sDTO.setCategory_code(rs2.getString("category_code"));
						
						productList.add(sDTO);	// st_num에 해당하는 상품의 정보 조회 후 productList에 저장
						System.out.println(" DAO : 장바구니에 들어있는 상품의 정보? " + productList);
					} // 상품정보 저장완료
				
				}
				
				// totalList에 장바구니 정보, 상품의 정보 저장
				totalList.add(cartList);
				totalList.add(productList);	
				
				System.out.println(totalList);
				
				System.out.println(" DAO : 장바구니, 상품정보 저장 완료 ");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return totalList;
		}
		// 장바구니 상품목록 조회 - getCartList(mb_id)
		
		// 장바구니 삭제(c_num) - deleteCart(c_num)
		
		public int deleteCart(int c_num) {
			int result = -1;
			
			try {
				con = getConnection();
				sql = "delete from cart where c_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, c_num);
				result = pstmt.executeUpdate();
				
				System.out.println(" DAO : " + c_num + "번 장바구니 삭제 완료");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return result;
		}
		// 장바구니 삭제(c_num) - deleteCart(c_num)
		
		// 장바구니 삭제(c_num) - deleteCart(c_num)
		
		public int deleteCart(String mb_id) {
			int result = -1;
			
			try {
				con = getConnection();
				sql = "delete from cart where mb_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mb_id);
				result = pstmt.executeUpdate();
				
				System.out.println(" DAO : " + mb_id + "님 장바구니 삭제 완료");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return result;
		}
		// 장바구니 삭제(c_num) - deleteCart(c_num)
		
		/**
		    * changeAmount(int c_num, int changeAmount)
		    * 장바구니 상품의 개수를 변경하는 메서드
		    */
		   public void changeAmount(int c_num, int changeAmount) {
		      try {
		         con = getConnection();
		         sql = "update cart set c_amount=? where c_num=?";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1, changeAmount);
		         pstmt.setInt(2, c_num);
		         pstmt.executeUpdate();
		         
		         System.out.println("DAO : 장바구니 수량 변경 완료!");
		         
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         closeDB();
		      }
		   }
}
