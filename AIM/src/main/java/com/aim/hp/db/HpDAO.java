package com.aim.hp.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HpDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// 디비 연결해주는 메서드(커넥션풀)
	private Connection getConnection() throws Exception {
		// 1. 드라이버 로드 // 2. 디비연결

		// Context 객체 생성 (JNDI API)
		Context initCTX = new InitialContext();
		// 디비연동정보 불러오기 (context.xml 파일정보)
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/AIM");
		// 디비정보(연결) 불러오기
		con = ds.getConnection();

		System.out.println(" DAO : 디비연결 성공(커넥션풀) ");
		System.out.println(" DAO : con : " + con);

		return con;
	}

	// 자원해제 메서드-closeDB()
	public void closeDB() {
		System.out.println("DAO : 디비연결자원 해제");

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
	// 자원해제 메서드-closeDB()
	
	// 고객센터 로그인 체크
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
		
	   } 
	// 고객센터 로그인 체크
	
	// 문의 글 쓰기
	public void HpBoard(HpDTO dto) {
		int hp_bno = 0;
		
		try {
			// 1.2. 디비연결
			con = getConnection();
			
			// 3. sql 작성(글번호 계산) & pstmt 객체
			sql = "select max(hp_bno) from help_board";
			
			pstmt = con.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터처리 (글번호 계산-번호최대값 + 1)
			if(rs.next()) {
				hp_bno = rs.getInt(1)+1;			
			}
			
			System.out.println(" DAO : 글번호 = "+hp_bno);
			
			// 3. sql 작성 & pstmt 객체
			sql = "insert into help_board(hp_bno,mb_id,hp_deletepw,hp_subject,"
					+ "hp_content,hp_file,hp_date,hp_re_ref,hp_re_lev,hp_re_seq,hp_select,hp_class) "
					+ "values(?,?,?,?,?,?,now(),?,?,?,?,?)";
		
			pstmt = con.prepareStatement(sql);
			
			// ???
			pstmt.setInt(1, hp_bno);
			pstmt.setString(2, dto.getMb_id());
			pstmt.setString(3, dto.getHp_deletepw());
			pstmt.setString(4, dto.getHp_subject());
			pstmt.setString(5, dto.getHp_content());
			pstmt.setString(6, dto.getHp_file());
			pstmt.setInt(7, hp_bno);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setString(10, dto.getHp_select());
			pstmt.setString(11, dto.getHp_class());
			
			
			// 4. sql 실행
			pstmt.executeUpdate();
			
						
			System.out.println(" DAO : 글쓰기 완료! ");
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
		}
	// 문의 글 쓰기
	
	// 문의 리스트 갯수 확인 - getHpCount()
		public int getHpCount() {
			int cnt = 0;
			
			try {
				//1.2. 디비연결
				con = getConnection();
				// 3. sql
				sql = "select count(*) from help_board";
				pstmt = con.prepareStatement(sql);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				if(rs.next()) {
					
					cnt = rs.getInt("count(*)");
				}
				System.out.println(" DAO : 전체 글 개수 : "+cnt+"개");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return cnt;
		}
	// 문의 리스트 갯수 확인 - getHpCount()
		
	// 문의 리스트 내용 확인 - getHpList()
		public ArrayList getHpList() {
			System.out.println(" DAO : getHpList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList HpList = new ArrayList();
			
			try {
				// 1.2. 디비연결
				con = getConnection();
				
				// 3. sql & pstmt 객체
				sql = "select * from help_board";
				pstmt = con.prepareStatement(sql);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				while(rs.next()) {
					
					// DB
					HpDTO dto = new HpDTO();
					dto.setHp_bno(rs.getInt("Hp_bno"));
					dto.setMb_id(rs.getString("mb_id"));
					dto.setHp_deletepw(rs.getString("hp_deletepw"));
					dto.setHp_subject(rs.getString("hp_subject"));
					dto.setHp_content(rs.getString("hp_content"));
					dto.setHp_file(rs.getString("hp_file"));
					dto.setHp_date(rs.getDate("hp_date"));
					dto.setHp_re_lev(rs.getInt("hp_re_lev"));
					dto.setHp_re_ref(rs.getInt("hp_re_ref"));
					dto.setHp_re_seq(rs.getInt("hp_re_seq"));
					dto.setHp_class(rs.getString("hp_class"));
					dto.setHp_select(rs.getString("hp_select"));
					
					// List
					HpList.add(dto);
					
				}//while
				
				System.out.println(" DAO : 게시판 목록 저장완료! ");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return HpList;
		}
	// 문의 리스트 내용 확인 - getHpList()

	// 문의 글정보 가져오기 - getHpList(int startRow,int pageSize)
		public ArrayList getHpList(int startRow,int pageSize) {
			System.out.println(" DAO : getHPList() 호출 ");
			// 글정보 모두 저장하는 배열
			ArrayList HpList = new ArrayList();
						
			try {
				// 1.2. 디비연결
				con = getConnection();
				
				// 3. sql 작성(select) & pstmt 객체
				sql = "select * from help_board "
						+ "order by hp_re_ref desc,hp_re_lev asc limit ?,?";
				
				pstmt = con.prepareStatement(sql);
							
				// ?????
				pstmt.setInt(1, startRow-1); // 시작행 - 1
				pstmt.setInt(2, pageSize); // 개수
							
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리(DB->DTO->List)
				while(rs.next()) {
								
					// DB -> DTO
					HpDTO dto = new HpDTO();
					dto.setHp_bno(rs.getInt("Hp_bno"));
					dto.setMb_id(rs.getString("mb_id"));
					dto.setHp_deletepw(rs.getString("hp_deletepw"));
					dto.setHp_subject(rs.getString("hp_subject"));
					dto.setHp_content(rs.getString("hp_content"));
					dto.setHp_file(rs.getString("hp_file"));
					dto.setHp_date(rs.getDate("hp_date"));
					dto.setHp_re_lev(rs.getInt("hp_re_lev"));
					dto.setHp_re_ref(rs.getInt("hp_re_ref"));
					dto.setHp_re_seq(rs.getInt("hp_re_seq"));
					dto.setHp_class(rs.getString("hp_class"));
					dto.setHp_select(rs.getString("hp_select"));
								
					// DTO -> List
					HpList.add(dto);
								
				}//while
							
				System.out.println(" DAO : 게시판 목록 저장완료! ");
							
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
						
			return HpList;
		}
		// 문의글정보 가져오기 - getHpList(int startRow,int pageSize)
		
		// 문의글 1개 불러오기 - getHpList(hp_bno)
		public HpDTO getHpList(int hp_bno) {
			HpDTO dto=null;
			try {
				// 1.2. 디비연결
				con = getConnection();
				
				// 3. sql 작성(select) & pstmt 객체
				sql = "select * from help_board where hp_bno = ?";
				pstmt = con.prepareStatement(sql);
				
				// ???
				pstmt.setInt(1, hp_bno);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터처리	
				if(rs.next()) {
					
					// 데이터있을때만 dto객체 생성
					dto = new HpDTO();
					
					// DB정보(rs) -> dto 저장
					dto.setHp_bno(rs.getInt("Hp_bno"));
					dto.setMb_id(rs.getString("mb_id"));
					dto.setHp_deletepw(rs.getString("hp_deletepw"));
					dto.setHp_subject(rs.getString("hp_subject"));
					dto.setHp_content(rs.getString("hp_content"));
					dto.setHp_file(rs.getString("hp_file"));
					dto.setHp_date(rs.getDate("hp_date"));
					dto.setHp_re_lev(rs.getInt("hp_re_lev"));
					dto.setHp_re_ref(rs.getInt("hp_re_ref"));
					dto.setHp_re_seq(rs.getInt("hp_re_seq"));
					dto.setHp_select(rs.getString("hp_select"));
				}
				
				System.out.println(" DAO : 글 정보 1개 저장완료 ");
					
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return dto;
		}
		// 문의 글 1개 불러오기 - getHpList(hp_bno)
		
		// 게시글 수정 -myhpupdate (DTO)
		public int myhpupdate(HpDTO dto) {
			int result = -1;
						
				try {
					// 1.2. 디비 연결
					con = getConnection();
					
					// 3. sql 작성(select) & pstmt 객체
					sql = "select hp_deletepw from help_board where hp_bno=?";
					pstmt = con.prepareStatement(sql);
							
					// ???
					pstmt.setInt(1, dto.getHp_bno());
							
					// 4. sql 실행
					rs = pstmt.executeQuery();
							
					// 5. 데이터 처리
					if(rs.next()) {
						if(dto.getHp_deletepw().equals(rs.getString("hp_deletepw"))) {
							// 3. sql 작성(update) & pstmt 객체
							sql = "update help_board set hp_subject=?,hp_select=?,hp_class=?,hp_content=? where hp_bno=?";
							pstmt = con.prepareStatement(sql);
									
							//??? 
							pstmt.setString(1, dto.getHp_subject());
							pstmt.setString(2, dto.getHp_select());
							pstmt.setString(3, dto.getHp_class());
							pstmt.setString(4, dto.getHp_content());
							pstmt.setInt(5, dto.getHp_bno());
							
									
							// 4. sql 실행
							result = pstmt.executeUpdate();
							
							}else {
									// 비밀번호 오류
									result = 0;
								}				
							}else {
								// 게시판글 없음
								result = -1;
							}
							
							System.out.println(" DAO : 게시판 정보 수정완료 ("+result+")");
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						return result;
					}
		// 게시글 수정 - myhpupdate (DTO)
		
		// 게시판 글 삭제 - MyHpDelete(bno,pass)
					public int deleteHp(int hp_bno,String hp_deletepw) {
						int result = -1;
						
						try {
							// 1.2. 디비 연결
							con = getConnection();
							
							// 3. sql 작성(select) & pstmt 객체
							sql = "select hp_deletepw from help_board where hp_bno=?";
							pstmt = con.prepareStatement(sql);
							
							// ???
							pstmt.setInt(1, hp_bno);
							
							// 4. sql 실행
							rs = pstmt.executeQuery();
							
							// 5. 데이터 처리
							if(rs.next()) {
								if(hp_deletepw.equals(rs.getString("hp_deletepw"))) {
									
									// 3. sql 작성(delete) & pstmt 객체
									sql = "delete from help_board where hp_bno=?";
									pstmt = con.prepareStatement(sql);
									
									pstmt.setInt(1, hp_bno);
									
									// 4. sql 실행
									result = pstmt.executeUpdate();					
								
								}else {
									// 비밀번호 오류
									result = 0;
								}				
							}else {
								// 게시판글 없음
								result = -1;
							}
							
							System.out.println(" DAO : 게시판 정보 삭제완료 ("+result+")");
							
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							closeDB();
						}
						
						return result;
					}
		// 게시판 글 삭제 - MyHpDelete (bno,pass)
					
}
