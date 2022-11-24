package com.aim.nt.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.sql.DataSource;

import com.aim.hp.db.HpDTO;

public class NtDAO {
	

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
	
	
		
	// 공지글 리스트 갯수 확인 - getNtCount()
		
	public int getNtCount() {
		int cnt = 0;
		
		try {
			//1.2. 디비연결
			con = getConnection();
			// 3. sql
			sql = "select count(*) from notice_board";
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
	// 공지글 리스트 갯수 확인 - getHpCount()
	
	// 공지 리스트 내용 확인 - getNtList()
			public ArrayList getNtList() {
				System.out.println(" DAO : getNtList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList NtList = new ArrayList();
				
				try {
					// 1.2. 디비연결
					con = getConnection();
					
					// 3. sql & pstmt 객체
					sql = "select * from notice_board";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					
					// 5. 데이터 처리
					while(rs.next()) {
						
						// DB
						NtDTO dto = new NtDTO();
						dto.setMb_id(rs.getString("mb_id"));
						dto.setNt_bno(rs.getInt("nt_bno"));
						dto.setNt_content(rs.getString("nt_content"));
						dto.setNt_date(rs.getDate("nt_date"));
						dto.setNt_file(rs.getString("nt_file"));
						dto.setNt_subject(rs.getString("nt_subject"));
						dto.setNt_re_lev(rs.getInt("nt_re_lev"));
						dto.setNt_re_ref(rs.getInt("nt_re_ref"));
						
						// List
						NtList.add(dto);
						
					}//while
					
					System.out.println(" DAO : 게시판 목록 저장완료! ");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return NtList;
			}
	// 공지 리스트 내용 확인 - getNtList()
			
	// 공지 글정보 가져오기 - getNtList(int startRow,int pageSize)
	public ArrayList getNtList(int startRow,int pageSize) {
		System.out.println(" DAO : getNtList() 호출 ");
		// 글정보 모두 저장하는 배열
		ArrayList NtList = new ArrayList();
							
		try {
			// 1.2. 디비연결
			con = getConnection();
					
			// 3. sql 작성(select) & pstmt 객체
			sql = "select * from notice_board "
					+ "order by nt_re_ref desc,nt_re_lev asc limit ?,?";
					
			pstmt = con.prepareStatement(sql);
								
			// ?????
			pstmt.setInt(1, startRow-1); // 시작행 - 1
			pstmt.setInt(2, pageSize); // 개수
								
			// 4. sql 실행
			rs = pstmt.executeQuery();
					
			// 5. 데이터 처리(DB->DTO->List)
			while(rs.next()) {
									
				// DB -> DTO
				NtDTO dto = new NtDTO();
				dto.setMb_id(rs.getString("mb_id"));
				dto.setNt_bno(rs.getInt("nt_bno"));
				dto.setNt_content(rs.getString("nt_content"));
				dto.setNt_date(rs.getDate("nt_date"));
				dto.setNt_file(rs.getString("nt_file"));
				dto.setNt_subject(rs.getString("nt_subject"));
									
				// DTO -> List
				NtList.add(dto);
									
			}//while
								
			System.out.println(" DAO : 게시판 목록 저장완료! ");
								
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
							
				return NtList;
			}
	// 공지글정보 가져오기 - getNtList(int startRow,int pageSize)
	
	// 공지 글 쓰기
		public void NtBoard(NtDTO dto) {
			int nt_bno = 0;
			
			try {
				// 1.2. 디비연결
				con = getConnection();
				
				// 3. sql 작성(글번호 계산) & pstmt 객체
				sql = "select max(nt_bno) from notice_board";
				
				pstmt = con.prepareStatement(sql);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터처리 (글번호 계산-번호최대값 + 1)
				if(rs.next()) {
					nt_bno = rs.getInt(1)+1;			
				}
				
				System.out.println(" DAO : 글번호 = "+nt_bno);
				
				// 3. sql 작성 & pstmt 객체
				sql = "insert into notice_board(nt_bno,mb_id,mb_pw,nt_select,nt_subject,"
						+ "nt_content,nt_date,nt_re_ref,nt_re_lev) "
						+ "values(?,?,?,?,?,?,now(),?,?)";
			
				pstmt = con.prepareStatement(sql);
				
				// ???
				pstmt.setInt(1, nt_bno);
				pstmt.setString(2, dto.getMb_id());
				pstmt.setString(3, dto.getMb_pw());
				pstmt.setInt(4, dto.getNt_select());
				pstmt.setString(5, dto.getNt_subject());
				pstmt.setString(6, dto.getNt_content());
				pstmt.setInt(7, nt_bno);
				pstmt.setInt(8, 0);
				
				// 4. sql 실행
				pstmt.executeUpdate();
				
							
				System.out.println(" DAO : 글쓰기 완료! ");
				
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
			}
		// 공지 글 쓰기

		// 해당 번호 공지글 가져오기
		
		public NtDTO getNtList(int nt_bno) {
			NtDTO dto=null;
			try {
				// 1.2. 디비연결
				con = getConnection();
				
				// 3. sql 작성(select) & pstmt 객체
				sql = "select * from notice_board where nt_bno = ?";
				pstmt = con.prepareStatement(sql);
				
				// ???
				pstmt.setInt(1, nt_bno);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터처리	
				if(rs.next()) {
					
					// 데이터있을때만 dto객체 생성
					dto = new NtDTO();
					
					// DB정보(rs) -> dto 저장
					dto.setNt_bno(rs.getInt("nt_bno"));
					dto.setMb_id(rs.getString("mb_id"));
					dto.setMb_pw(rs.getString("mb_pw"));
					dto.setNt_subject(rs.getString("nt_subject"));
					dto.setNt_content(rs.getString("nt_content"));
					dto.setNt_file(rs.getString("nt_file"));
					dto.setNt_date(rs.getDate("nt_date"));
					dto.setNt_re_lev(rs.getInt("nt_re_lev"));
					dto.setNt_re_ref(rs.getInt("nt_re_ref"));
					
				}
				
				System.out.println(" DAO : 글 정보 1개 저장완료 ");
					
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return dto;
		}
		
		// 해당 번호 공지글 가져오기
		
		
		// 공지 글 수정하기
		public int ntupdate(NtDTO dto) {
			int result = -1;
						
				try {
					// 1.2. 디비 연결
					con = getConnection();
					
					// 3. sql 작성(select) & pstmt 객체
					sql = "select mb_pw from notice_board where nt_bno=?";
					pstmt = con.prepareStatement(sql);
							
					// ???
					pstmt.setInt(1, dto.getNt_bno());
							
					// 4. sql 실행
					rs = pstmt.executeQuery();
							
					// 5. 데이터 처리
					if(rs.next()) {
						if(dto.getMb_pw().equals(rs.getString("mb_pw"))) {
							// 3. sql 작성(update) & pstmt 객체
							sql = "update notice_board set nt_subject=?,nt_select=?,nt_content=? where nt_bno=?";
							pstmt = con.prepareStatement(sql);
									
							//??? 
							pstmt.setString(1, dto.getNt_subject());
							pstmt.setInt(2, dto.getNt_select());
							pstmt.setString(3, dto.getNt_content());
							pstmt.setInt(4, dto.getNt_bno());
							
									
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
		// 공지 글 수정하기
		
		// 공지 사항 글 삭제하기
		public void NtDelete(int nt_bno) {
			
			try {
				con = getConnection();
				sql = "delete from notice_board where nt_bno = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, nt_bno);
				
				pstmt.executeUpdate();
				
				System.out.println(" DAO : 공지사항 삭제 완료");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
		}
		
		// 공지 사항 글 삭제하기
		
	
}
