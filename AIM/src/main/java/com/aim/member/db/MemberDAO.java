package com.aim.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.aim.store.db.OrderDTO;

public class MemberDAO {

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
   
   // 회원가입 메서드 시작 - memberJoin(MemberDTO dto)
   public void memberJoin(MemberDTO dto) {
	      try {
	         con = getConnection();
	         sql = "insert into member(mb_id,mb_pw,mb_name,mb_nick,mb_birth,mb_gender,mb_tel,mb_grade,mb_pay,mb_view)"
	               +"value(?,?,?,?,?,?,?,?,?,?)";
	         pstmt = con.prepareStatement(sql);
	         
	         pstmt.setString(1, dto.getMb_id());
	         pstmt.setString(2, dto.getMb_pw());
	         pstmt.setString(3, dto.getMb_name());
	         pstmt.setString(4, dto.getMb_nick());
	         pstmt.setString(5, dto.getMb_birth());
	         pstmt.setString(6, dto.getMb_gender());
	         pstmt.setString(7, dto.getMb_tel());
	         pstmt.setInt(8, 0);
	         pstmt.setInt(9, 0);
	         pstmt.setInt(10, 0);
	         
	         int result = pstmt.executeUpdate();
	         
	         if(result > 0) {
	            System.out.println("DAO : 회원가입에 성공하셨습니다");
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         closeDB();
	      }
	   } // 회원가입 메서드 끝
   
   // 로그인 체크 메서드 - loginCheck(String mb_id, String mb_pw)
   public int loginCheck(String mb_id, String mb_pw) {
	   int result = -1;
	   
	   try {
		con = getConnection();
		sql = "select mb_pw from member where mb_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mb_id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			if(mb_pw.equals(rs.getString("mb_pw"))) {	// 패스워드 일치, 로그인 성공
				result = 1;
			} else {	// 패스워드가 불일치, 로그인 실패
				result = 0;
			}
		} else {	// 비회원
			result = -1;
		}
		
		System.out.println("DAO : 로그인 결과? " + result);
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		closeDB();
	}
	   
	return result;
	
   } // 로그인 체크 메서드 끝
   
   // 패스워드 찾기 메서드 - findPw(String id, String tel)
   public int findPw(String id, String tel) {   
	   int result = 0;
	   
	   try {
		con = getConnection();
		sql = "select mb_id from member where mb_tel=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, tel);
		rs = pstmt.executeQuery();
		
		if(rs.next()) { // 데이터 존재함 - 이용자를 찾음....
			result = 1;
		} 
		
		System.out.println("DAO : 비밀번호 찾기 완");
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		closeDB();
	}
	   
	return result;
   
   }  // 패스워드 찾기 메서드 끝
   
   // 패스워드 변경 메서드 - UpdatePw()
   public void UpdatePw(String id, String newPw) {
	   try {
		con = getConnection();
		sql = "update member set mb_pw=? where mb_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, newPw);
		pstmt.setString(2, id);
		pstmt.executeUpdate();

		System.out.println("DAO : 변경된 비밀번호? " + newPw);
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		closeDB();
	}
	   
   } // 패스워드 변경 메서드 끝
   
   // 아이디 찾기 메서드 시작 - (String mb_name, String mb_tel)
   public String findId(String mb_name, String mb_tel) {
     String mb_id = null;
     try {
       con = getConnection();
       sql = "select mb_id from member where mb_name=? and mb_tel=?";
       pstmt = con.prepareStatement(sql);
       pstmt.setString(1, mb_name);
       pstmt.setString(2, mb_tel);
       rs = pstmt.executeQuery();
       
       while(rs.next()) {
         mb_id = rs.getString("mb_id");
       }
      
     } catch (Exception e) {
       e.printStackTrace();
     } finally {
       closeDB();
     }
     return mb_id;
     
   } // 아이디 찾기 메서드 끝
   
   // 아이디 중복체크 - idCheck(mb_id)
   public int idCheck(String mb_id) {
	   int result = 0; 		// 0으로 초기화 -> 중복X, 아이디 사용가능
	   						// 1일때 중복 -> 아이디 사용불가
	   
	   try {
		con = getConnection();
		sql = "select * from member where mb_id=?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, mb_id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			// 중복일 때
			result = 1;
			System.out.println(" DAO : 아이디 중복결과 ("+result+")");
	   } // 중복 아닐 때
			System.out.println(" DAO : 아이디 중복결과 ("+result+")");
	
	   } catch (Exception e) {
		e.printStackTrace();
	   } finally {
		closeDB();
	   }
	   
	   return result;
   } // 아이디 중복체크 - idCheck(mb_id)
   
   
   // 닉네임 중복체크 - NickCheck(mb_nick)
   	public int NickCheck(String mb_nick) {
	   int result = 0; 
	   try {
		con = getConnection(); 
		sql = "select * from member where mb_nick=?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, mb_nick);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			// 중복일때
			result = 1;
			System.out.println(" DAO : 닉네임 중복결과 ("+result+")");
	   } // 중복아닐때
			System.out.println(" DAO : 닉네임 중복결과 ("+result+")");
	
	   } catch (Exception e) {
		e.printStackTrace();
	   } finally {
		closeDB();
	   }
	   
	   return result;
   } // 닉네임 중복체크 끝 - NickCheck(mb_nick)
   
   	
    // id에 해당하는 회원의 info을 받아오는 메서드 - getMemberInfo(id)
    public MemberDTO getMemberInfo(String mb_id) {
 	   MemberDTO dto = null;
 	   
 	   try {
 		con = getConnection();
 		sql = "select * from member where mb_id=?";
 		pstmt = con.prepareStatement(sql);
 		pstmt.setString(1, mb_id);
 		rs = pstmt.executeQuery();
 		
 		if(rs.next()) {
 			dto = new MemberDTO();
 			
 			dto.setMb_birth(rs.getString("mb_birth"));
 			dto.setMb_gender(rs.getString("mb_gender"));
 			dto.setMb_grade(rs.getInt("mb_grade"));
 			dto.setMb_id(mb_id);
 			dto.setMb_name(rs.getString("mb_name"));
 			dto.setMb_nick(rs.getString("mb_nick"));
 			dto.setMb_pay(rs.getInt("mb_pay"));
 			dto.setMb_pw(rs.getString("mb_pw"));
 			dto.setMb_tel(rs.getString("mb_tel"));
 			dto.setMb_view(rs.getInt("mb_view"));
 		}
 	} catch (Exception e) {
 		e.printStackTrace();
 	}
 	   return dto;
    }
    //getMemberInfo() 끝
   
   // 회원정보조회
    public MemberDTO getMember(String mb_id){
		MemberDTO dto = new MemberDTO();
		try {
			con = getConnection();
			sql = "select * from member where mb_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setMb_id(rs.getString("mb_id"));
				dto.setMb_pw(rs.getString("mb_pw"));
				dto.setMb_name(rs.getString("mb_name"));
				dto.setMb_gender(rs.getString("mb_gender"));
				dto.setMb_nick(rs.getString("mb_nick"));
				dto.setMb_birth(rs.getString("mb_birth"));
				dto.setMb_pay(rs.getInt("mb_pay"));
				dto.setMb_tel(rs.getString("mb_tel"));
				dto.setMb_grade(rs.getInt("mb_grade"));
				dto.setMb_view(rs.getInt("mb_view"));
			}
			System.out.println(" DAO : 회원 정보 저장완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}
    // 회원정보조회
    
	  /**
	   * Addsum()
	   * 구매 시 구매금액을 member테이블 mbpay에 구매금액을 누적시키는 메서드
	   */
	  
    public void Addsum(String mb_id, String mb_pay){
    	
    	try {
			con = getConnection();
			sql = "update class7_220721_team3.member set mb_pay=mb_pay+? where mb_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb_pay);
			pstmt.setString(2, mb_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
    }
   
}
