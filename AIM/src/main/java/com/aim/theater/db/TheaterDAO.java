package com.aim.theater.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.aim.member.db.MemberDTO;
import com.aim.schedule.db.ScheduleDTO;

public class TheaterDAO {
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
	
	//날짜 카테고리 -getDateCate()
	public List<ScheduleDTO> getDateCate(int branchCd) {
		List<ScheduleDTO> dateCate = new ArrayList<ScheduleDTO>();
		

		try {
			con = getConnection();
			
			sql = "select distinct branchCd, sc_date from schedule where branchCd=? order by sc_date";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, branchCd);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ScheduleDTO dto = new ScheduleDTO();
				
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setSc_date(rs.getString("sc_date"));
				
				dateCate.add(dto);
			}//while
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}		
		return dateCate;
	}
	//날짜 카테고리 -getDateCate()
	
	//지점/날짜별 영화제목 - getMovieNm()
	public List<ScheduleDTO> getMovieNm(int branchCd, String date){
		List<ScheduleDTO> movieName = new ArrayList<ScheduleDTO>();
		
		try {
			con = getConnection();
			sql="select distinct movie.movieNm, movie.watchGradeNm "
					+ "from movie "
					+ "inner join schedule "
					+ "on schedule.movieCd = movie.movieCd "
					+ "where branchCd=? and sc_date=?;";
//			sql = "select distinct movieNm from schedule where branchCd=? and sc_date=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, branchCd);
			pstmt.setString(2, date);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ScheduleDTO dto = new ScheduleDTO();
				
				dto.setMovieNm(rs.getString("movieNm"));
				dto.setWatchGradeNm(rs.getString("watchGradeNm"));
				
				
				movieName.add(dto);
			}
			
			System.out.println("영화제목 저장완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return movieName;
	}
	//지점/날짜별 영화제목 - getMovieNm()
	
	//지점/날짜/영화 별 상영관과 상영시간 가져오기 - getScheList()
	public List getScheList(int branchCd, String date) {
		List scheList = new ArrayList();
		
		
		try {
			con= getConnection();		
			
			sql="select scCode, schedule.branchCd, sc_date, schedule.roomCd, room.roomNum, schedule.movieCd, schedule.starttime, movie.movieNm, movie.watchGradeNm "
					+ "from schedule "
					+ "inner join movie "
					+ "on schedule.movieCd = movie.movieCd "
					+ "inner join room "
					+ "on schedule.roomCd = room.roomCd "
					+ "where schedule.branchCd=? and sc_date=?;";
//			sql = "select * from schedule where branchCd=? and sc_date=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, branchCd);
			pstmt.setString(2, date);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TheaterDTO dto = new TheaterDTO();
				
				dto.setScCode(rs.getInt("scCode"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setSc_date(rs.getString("sc_date"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setMovieNm(rs.getString("movieNm"));
				dto.setRoomCd(rs.getInt("roomCd"));
				dto.setRoomNum(rs.getString("roomNum"));;
				dto.setStarttime(rs.getString("starttime"));
				dto.setWatchGradeNm(rs.getString("watchGradeNm"));
				
				scheList.add(dto);
			}//while
			
			System.out.println("DAO : 스케줄 리스트 저장완료");
			System.out.println("DAO : "+scheList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return scheList;
	}
	//스케줄 리스트 - getScheList()
	
	//지점 소개 - getBranchIntro()
	public TheaterDTO getBranchIntro(int branchCd) {
		TheaterDTO dto=null;
		try {
			// 1.2. 디비연결
			con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
			sql = "select * from theater where branchCd = ?";
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setInt(1, branchCd);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터처리	
			if(rs.next()) {
				// 데이터있을때만 dto객체 생성
				dto = new TheaterDTO();
				
				// DB정보(rs) -> dto 저장
				
				dto.setBranch_name(rs.getString("branch_name"));
				dto.setBranch_addr(rs.getString("branch_addr"));
				dto.setBranch_longitude(rs.getString("branch_longitude"));
				dto.setBranch_latitude(rs.getString("branch_latitude"));
				
			}
			
			System.out.println(" DAO : 지점명, 주소 저장완료! ");
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}//지점 소개 - getBranchIntro()
	
	
	//선택한 상영정보 리스트
	public TheaterDTO getSelectSche(int scCode) {
		TheaterDTO selectScheList = null;
		
		try {
			con= getConnection();
			
			sql="select scCode, schedule.branchCd, theater.branch_name, sc_date, schedule.roomCd, room.roomNum, schedule.movieCd, schedule.starttime, movie.movieNm, movie.watchGradeNm "
					+ "from schedule "
					+ "inner join movie "
					+ "on schedule.movieCd = movie.movieCd inner join theater "
					+ "on schedule.branchCd = theater.branchCd "
					+ "join room "
					+ "on schedule.roomCd = room.roomCd "
					+ "where schedule.scCode=?;";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, scCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				selectScheList = new TheaterDTO();
				
				selectScheList.setScCode(rs.getInt("scCode"));
				selectScheList.setBranchCd(rs.getInt("branchCd"));
				selectScheList.setBranch_name(rs.getString("branch_name"));
				selectScheList.setSc_date(rs.getString("sc_date"));
				selectScheList.setRoomCd(rs.getInt("roomCd"));
				selectScheList.setRoomNum(rs.getString("roomNum"));
				selectScheList.setMovieCd(rs.getString("movieCd"));
				selectScheList.setStarttime(rs.getString("starttime"));
				selectScheList.setMovieNm(rs.getString("movieNm"));
				selectScheList.setWatchGradeNm(rs.getString("watchGradeNm"));
				selectScheList.setSeatcomp(rs.getInt("seatcomp"));
				
			}//if
			System.out.println("선택한 상영정보 저장완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return selectScheList;
		
	}
	//선택한 상영정보 리스트
	
	//영화정보 조회 getMovieList()
	public List getMovieList() {
		List movieList = new ArrayList();
		
		try {
			con = getConnection();
			sql = "select movieCd, movieNm, watchGradeNm from movie where boxrank>=1 && boxrank<=10";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				TheaterDTO dto = new TheaterDTO();
				
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setMovieNm(rs.getString("movieNm"));
				dto.setWatchGradeNm(rs.getString("watchGradeNm"));
				
				movieList.add(dto);
			}//while
			System.out.println("영화 정보 담기 성공");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return movieList;
	}
	//영화정보 조회 getMovieList()
	
	//스케줄 등록 - insertSche(dto)
	public void insertSche(TheaterDTO dto) {
		int scCode =0;
		
		try {
			con = getConnection();
			
			sql = "select max(scCode) from schedule";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				scCode = rs.getInt(1) + 1;
			}
			
			sql = "insert into schedule(scCode,branchCd,sc_date,roomCd,movieCd,starttime,endtime,runcount) "
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, scCode);
			pstmt.setInt(2, dto.getBranchCd());
			pstmt.setString(3, dto.getSc_date());
			pstmt.setInt(4, dto.getRoomCd());
			pstmt.setString(5, dto.getMovieCd());
			pstmt.setString(6, dto.getStarttime());
			pstmt.setString(7, dto.getEndtime());
			pstmt.setInt(8, dto.getRuncount());
			
			pstmt.executeUpdate();
			
			System.out.println("스케줄 등록 완료");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	//스케줄 등록 - insertSche(dto)
	
	//스케줄 카운트 - getScheCount();
	public int getScheCount() {
		int cnt = 0;
	
		try {
			con = getConnection();
			
			sql="select count(*) from schedule";
			pstmt=con.prepareStatement(sql);
			
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
	//스케줄 카운트 - getScheCount();
	
	
	//관리자 스케줄 리스트 - getAdminScheList()
	public List getAdminScheList(int startRow,int pageSize) {
		List adminScheList = new ArrayList();
		
		try {
			con = getConnection();
			
			sql = "select scCode, schedule.branchCd, theater.branch_name, sc_date, roomCd, schedule.movieCd, movie.movieNm, starttime, endtime, runcount "
					+ "from schedule join theater "
					+ "on schedule.branchCd = theater.branchCd "
					+ "join movie "
					+ "on schedule.movieCd = movie.movieCd "
					+ "order by scCode desc limit ?,?;";
			pstmt = con.prepareStatement(sql);
			
			// ?????
			pstmt.setInt(1, startRow-1); // 시작행 - 1
			pstmt.setInt(2, pageSize); // 개수
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TheaterDTO dto = new TheaterDTO();
				
				dto.setScCode(rs.getInt("scCode"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setBranch_name(rs.getString("branch_name"));
				dto.setSc_date(rs.getString("sc_date"));
				dto.setRoomCd(rs.getInt("roomCd"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setMovieNm(rs.getString("movieNm"));
				dto.setStarttime(rs.getString("starttime"));
				dto.setEndtime(rs.getString("endtime"));
				dto.setRuncount(rs.getInt("runcount"));
				
				adminScheList.add(dto);
			}
			System.out.println("관리자 스케줄 리스트 저장완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return adminScheList;
	}
	//관리자 스케줄 리스트 - getAdminScheList()
	
	//스케줄 1개의 정보 가져오기 - getAdminSche(scCode)
	public TheaterDTO getAdminSche(int scCode) {
		TheaterDTO dto = null;
		
		try {
			con = getConnection();
			sql="select * from schedule where scCode=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, scCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new TheaterDTO();
				
				dto.setScCode(rs.getInt("scCode"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setSc_date(rs.getString("sc_date"));
				dto.setRoomCd(rs.getInt("roomCd"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setStarttime(rs.getString("starttime"));
				dto.setEndtime(rs.getString("endtime"));
				dto.setRuncount(rs.getInt("runcount"));
			}
			System.out.println("스케줄 1개 정보 가져오기 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return dto;
	}
	//스케줄 1개의 정보 가져오기 - getAdminSche(scCode)
	
	//스케줄 수정 - adminModifySche(dto)
	public void adminModifySche(TheaterDTO dto) {
		try {
			con = getConnection();
			
			sql="update schedule set branchCd=?, sc_date=?, roomCd=?, movieCd=?, starttime=?, endtime=?, runcount=? "
					+ "where scCode=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getBranchCd());
			pstmt.setString(2, dto.getSc_date());
			pstmt.setInt(3, dto.getRoomCd());
			pstmt.setString(4, dto.getMovieCd());
			pstmt.setString(5, dto.getStarttime());
			pstmt.setString(6, dto.getEndtime());
			pstmt.setInt(7, dto.getRuncount());
			pstmt.setInt(8, dto.getScCode());
			
			pstmt.executeUpdate();
			
			System.out.println("관리자 스케줄정보 수정완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	//스케줄 수정 - adminModifySche(dto)
	
	//스케줄 삭제 - adminRemoveSche(scCode)
	public void adminRemoveSche(int scCode) {
		try {
			con = getConnection();
			sql = "delete from schedule where scCode=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, scCode);
			
			pstmt.executeUpdate();
			System.out.println("스케줄 삭제완료");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	//스케줄 삭제 - adminRemoveSche(scCode)
	
	
}
