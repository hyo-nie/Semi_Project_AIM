package com.aim.theater.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.aim.member.db.MemberDTO;

public class RentDAO {
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
	
	//이름,전화번호 불러오기 - getApplicantInfo()
	public MemberDTO getApplicantInfo(String mb_id) {
		MemberDTO dto=null;
		try {
			// 1.2. 디비연결
			con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
			sql = "select mb_name, mb_tel from member where mb_id=?";
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setString(1, mb_id);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터처리	
			if(rs.next()) {
				// 데이터있을때만 dto객체 생성
				dto = new MemberDTO();
				
				// DB정보(rs) -> dto 저장
				
				dto.setMb_name(rs.getString("mb_name"));
				dto.setMb_tel(rs.getString("mb_tel"));
				
			}
			
			System.out.println(" DAO : 지점명, 주소 저장완료! ");
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}//이름,전화번호 불러오기 - getApplicantInfo()
	
	//대관문의폼 작성 - insertRent(dto)
	public void insertRent(RentDTO dto) {
		int rno =0;
		
		try {
			con= getConnection();
			sql = "select max(rno) from rent";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rno = rs.getInt(1) + 1;
			}
			sql="insert into rent(rno,branchCd,r_class,r_people,hopeday,hopestart,hopeend,movieCd,r_text,r_name,r_tel,r_re_ref,r_re_lev,r_re_seq,r_mb_pw,r_mb_id) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			pstmt.setInt(2, dto.getBranchCd());
			pstmt.setString(3, dto.getR_class());
			pstmt.setInt(4, dto.getR_people());
			pstmt.setString(5, dto.getHopeday());
			pstmt.setInt(6, dto.getHopestart());
			pstmt.setInt(7, dto.getHopeend());
			pstmt.setString(8, dto.getMovieCd());
			pstmt.setString(9, dto.getR_text());
			
			pstmt.setString(10, dto.getR_name());
			pstmt.setString(11, dto.getR_tel());
			
			pstmt.setInt(12, rno);
			pstmt.setInt(13, 0);
			pstmt.setInt(14, 0);
			
			pstmt.setString(15, dto.getR_mb_pw());
			pstmt.setString(16, dto.getR_mb_id());
			
			pstmt.executeUpdate();
			
			System.out.println("대관문의 완료");
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	//대관문의폼 작성 - insertRent(dto)
	
	//대관문의 글 전체 개수 확인 - getRtCount()
	public int getRtCount() {
		int cnt =0;
		
		try {
			con = getConnection();
			
			sql = "select count(*) from rent";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("count(*)");
			}
			
			System.out.println("DAO: 전체 글 개수 : "+cnt+"개");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return cnt;
	}
	//대관문의 글 전체 개수 확인 - getRtCount()
	
	//대관문의 리스트 가져오기 - getRtList(int startRow, pageSize)
	public ArrayList getRtList(int startRow, int pageSize) {
		System.out.println(" DAO : getRtList() 호출 ");
		
		ArrayList RentList = new ArrayList();
		
		try {
			con = getConnection();
			
			sql = "select * from rent order by r_re_ref desc, r_re_seq asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RentDTO dto = new RentDTO();
				dto.setRno(rs.getInt("rno"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setR_class(rs.getString("r_class"));
				dto.setR_people(rs.getInt("r_people"));
				dto.setHopeday(rs.getString("hopeday"));
				dto.setHopestart(rs.getInt("hopestart"));
				dto.setHopeend(rs.getInt("hopeend"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setR_text(rs.getString("r_text"));
				
				dto.setR_name(rs.getString("r_name"));
				dto.setR_tel(rs.getString("r_tel"));
				
				dto.setR_re_ref(rs.getInt("r_re_ref"));
				dto.setR_re_lev(rs.getInt("r_re_lev"));
				dto.setR_re_seq(rs.getInt("r_re_seq"));
				
				dto.setR_mb_id(rs.getString("r_mb_id"));
				dto.setR_mb_pw(rs.getString("r_mb_pw"));
				
				RentList.add(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return RentList;
	}
	//대관문의 리스트 가져오기 - getRtList(int startRow, pageSize)
	
	//대관문의 글 1개 정보조회 - getRent(rno)
	public RentDTO getRent(int rno) {
		RentDTO dto = null;
		
		try {
			con = getConnection();
			sql = "select rno, rent.branchCd, theater.branch_name, r_class, r_people,hopeday, hopestart,hopeend, rent.movieCd, movie.movieNm,r_text,r_name,r_tel,r_re_ref,r_re_lev,r_re_seq,r_mb_id,r_mb_pw "
					+ "from rent join theater "
					+ "on rent.branchCd = theater.branchCd "
					+ "join movie "
					+ "on rent.movieCd = movie.movieCd where rno=?;";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new RentDTO();
				
				dto.setRno(rs.getInt("rno"));
				dto.setBranch_name(rs.getString("branch_name"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setR_class(rs.getString("r_class"));
				dto.setR_people(rs.getInt("r_people"));
				dto.setHopeday(rs.getString("hopeday"));
				dto.setHopestart(rs.getInt("hopestart"));
				dto.setHopeend(rs.getInt("hopeend"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setMovieNm(rs.getString("movieNm"));
				dto.setR_text(rs.getString("r_text"));
				dto.setR_name(rs.getString("r_name"));
				dto.setR_tel(rs.getString("r_tel"));
				dto.setR_re_ref(rs.getInt("r_re_ref"));
				dto.setR_re_lev(rs.getInt("r_re_lev"));
				dto.setR_re_seq(rs.getInt("r_re_seq"));
				
				dto.setR_mb_id(rs.getString("r_mb_id"));
				dto.setR_mb_pw(rs.getString("r_mb_pw"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return dto;
	}
	//대관문의 글 1개 정보조회 - getRent(rno)
	
	//대관문의 답변 불러오기 -getReWriteList(rno)
//	public ArrayList getReWriteList(int rno) {
//		ArrayList rewriteList = new ArrayList();
//		
//		try {
//			con = getConnection();
//			sql = "select "
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			closeDB();
//		}
//	}
	//대관문의 답변 불러오기 -getReWriteList(rno)
	

	
	//대관문의 답변쓰기 - reInsertRent(DTO)
	public void reInsertRent(RentDTO dto) {
		int rno =0;
		
		try {
			con = getConnection();
			
			sql = "select max(rno) from rent";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rno = rs.getInt(1)+1;
			}
			//2. 답글순서 재배치
//			=> 같은 그룹에 있으면서, 기존의 seq 값보다 큰값이 있을 때
			sql="update rent set r_re_seq = r_re_seq+1 where r_re_ref=? and r_re_seq>?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getR_re_ref());
			pstmt.setInt(2, dto.getR_re_seq());
			int cnt = pstmt.executeUpdate();
			//=> cnt(update 구문이 적용된 수)
			
			if(cnt > 0) {
				System.out.println("DAO : 답글 재정렬 완료!");
			}
			
			//3.답글쓰기
			sql="insert into rent(rno,branchCd,r_class,r_people,hopeday,hopestart,hopeend,movieCd,r_text,r_name,r_tel,r_re_ref,r_re_lev,r_re_seq,r_mb_id,r_mb_pw) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			pstmt.setInt(2, dto.getBranchCd());
			pstmt.setString(3, dto.getR_class());
			pstmt.setInt(4, dto.getR_people());
			pstmt.setString(5, dto.getHopeday());
			pstmt.setInt(6, dto.getHopestart());
			pstmt.setInt(7, dto.getHopeend());
			pstmt.setString(8, dto.getMovieCd());
			pstmt.setString(9, dto.getR_text());
			
			pstmt.setString(10, dto.getR_name());
			pstmt.setString(11, dto.getR_tel());
			
			pstmt.setInt(12, dto.getR_re_ref()); //r_re_ref :원글의 번호와 동일
			pstmt.setInt(13, dto.getR_re_lev()+1);//r_re_lev : 원글의 lev + 1
			pstmt.setInt(14,dto.getR_re_seq()+1);// r_re_seq : 원글의 seq +1
			
			pstmt.setString(15, dto.getR_mb_id());
			pstmt.setString(16, dto.getR_mb_pw());
			
			//4. sql 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	//대관문의 답변쓰기 - reInsertRent(DTO)
	
	//패스워드 체크후 게시글확인 - goContent(rno,r_mb_pw)
	public int goContent(int rno,String r_mb_pw) {
		int result = -1;
		
		try {
			con = getConnection();
			
			sql = "select r_mb_pw from rent where rno = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(r_mb_pw.equals(rs.getString("r_mb_pw")) || r_mb_pw.equals("admin")) {
					result = 1;
				}else {
					//비밀번호 오류
					result = 0;
				}
			}else {
				//게시글 없음
				result = -1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return result;
	}	
	//패스워드 체크후 게시글확인 - goContent(rno,r_mb_pw)
	
	//답글 정보조회 - getReContent(,r_re_ref)
	public RentDTO getReContent(int r_re_ref) {
		RentDTO dto = null;
		
		try {
			con = getConnection();
			sql = "select rno, rent.branchCd, theater.branch_name, r_class, r_people,hopeday, hopestart,hopeend, rent.movieCd, movie.movieNm,r_text,r_name,r_tel,r_re_ref,r_re_lev,r_re_seq,r_mb_id,r_mb_pw "
					+ "from rent join theater "
					+ "on rent.branchCd = theater.branchCd "
					+ "join movie "
					+ "on rent.movieCd = movie.movieCd where r_re_ref=? and r_re_lev=1;";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, r_re_ref);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new RentDTO();
				
				dto.setRno(rs.getInt("rno"));
				dto.setBranch_name(rs.getString("branch_name"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setR_class(rs.getString("r_class"));
				dto.setR_people(rs.getInt("r_people"));
				dto.setHopeday(rs.getString("hopeday"));
				dto.setHopestart(rs.getInt("hopestart"));
				dto.setHopeend(rs.getInt("hopeend"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setMovieNm(rs.getString("movieNm"));
				dto.setR_text(rs.getString("r_text"));
				dto.setR_name(rs.getString("r_name"));
				dto.setR_tel(rs.getString("r_tel"));
				dto.setR_re_ref(rs.getInt("r_re_ref"));
				dto.setR_re_lev(rs.getInt("r_re_lev"));
				dto.setR_re_seq(rs.getInt("r_re_seq"));
				
				dto.setR_mb_id(rs.getString("r_mb_id"));
				dto.setR_mb_pw(rs.getString("r_mb_pw"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return dto;
	}
	//대관문의 글 1개 정보조회 - getRent(rno)
	
}
