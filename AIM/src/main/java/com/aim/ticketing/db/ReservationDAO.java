package com.aim.ticketing.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.aim.movie.db.MovieDTO;
import com.aim.schedule.db.ScheduleDTO;
import com.aim.theater.db.TheaterDTO;

public class ReservationDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// 디비 연결
	private Connection getConnection() throws Exception {
		Context initCTX = new InitialContext();

		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/AIM");

		con = ds.getConnection();

		return con;
	} // 디비 연결

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
	 * getTheaterList() : 극장 정보 조회 메서드, List<TheaterDTO> 값 리턴
	 */
	public List<TheaterDTO> getTheaterList() {
		List<TheaterDTO> theaterList = null;
		
		try {
			con = getConnection();
			sql = "select * from theater";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			// 데이터처리
			theaterList = new ArrayList<TheaterDTO>();
			while(rs.next()) {
				TheaterDTO dto = new TheaterDTO();
				dto.setBranch_addr(rs.getString("branch_addr"));
				dto.setBranch_name(rs.getString("branch_name"));
				dto.setBranchCd(rs.getInt("branchCd"));
				
				theaterList.add(dto);
			}
			
			System.out.println(" DAO : 극장 리스트 조회 완료! ");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return theaterList;
	} // getTheaterList()
	
	
	/**
	 * getScheduleList() : 지점코드 (branchCd)를 파라미터로 받아서 해당 지점에서 상영하는 영화 목록 조회, List리턴, 영화정보 중복x
	 */
	public List<ScheduleDTO> getScheduleList(int branchCd) {
		List<ScheduleDTO> scheduleList = null;
		
		try {
			con = getConnection();
			sql = "select distinct movieCd,branchCd from schedule where branchCd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, branchCd);
			
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			scheduleList = new ArrayList<ScheduleDTO>();
			
			while(rs.next()) {
				ScheduleDTO dto = new ScheduleDTO();
				
//				dto.setScCode(rs.getInt("scCode"));
//				dto.setSc_date(rs.getString("sc_date"));
//				dto.setRoomCd(rs.getInt("roomCd"));
//				dto.setStarttime(rs.getString("starttime"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setMovieCd(rs.getString("movieCd"));
				
				scheduleList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return scheduleList;
	} // getScheduleList()
	
	/**
	 * getScheduleMovieCd() : 지점코드 (branchCd)를 파라미터로 받아서 해당 지점에서 상영하는 영화 목록 조회, List리턴, 영화정보 중복x
	 */
	public List<ScheduleDTO> getScheduleMovieCd(int branchCd) {
		List<ScheduleDTO> scheduleList = null;
		
		try {
			con = getConnection();
			sql = "select distinct movieCd from schedule where branchCd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, branchCd);
			
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			scheduleList = new ArrayList<ScheduleDTO>();
			
			while(rs.next()) {
				ScheduleDTO dto = new ScheduleDTO();
				
//				dto.setScCode(rs.getInt("scCode"));
//				dto.setSc_date(rs.getString("sc_date"));
//				dto.setRoomCd(rs.getInt("roomCd"));
//				dto.setStarttime(rs.getString("starttime"));
//				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setMovieCd(rs.getString("movieCd"));
				
				scheduleList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return scheduleList;
	} // getScheduleMovieCd()
	
	
	
	

	/**
	 * getScheduleList(branchCd, movieCd) : 지점코드 (branchCd), 영화코드 (movieCd) 를 파라미터로 받아 스케줄 정보 조회
	 */
	public List<ScheduleDTO> getScheduleList(int branchCd, String movieCd) {
		List<ScheduleDTO> scheduleList = null;
		
		try {
			con = getConnection();
			sql = "select * from schedule where branchCd = ? && movieCd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, branchCd);
			pstmt.setString(2, movieCd);
			
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			scheduleList = new ArrayList<ScheduleDTO>();
			
			while(rs.next()) {
				ScheduleDTO dto = new ScheduleDTO();
				
				dto.setScCode(rs.getInt("scCode"));
				dto.setSc_date(rs.getString("sc_date"));
				dto.setRoomCd(rs.getInt("roomCd"));
				dto.setStarttime(rs.getString("starttime"));
				dto.setEndtime(rs.getString("endtime"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setRuncount(rs.getInt("runcount"));
				
				scheduleList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return scheduleList;
	} // getScheduleList(branchCd, movieCd)
	
	/**
	 * getScheduleList(branchCd, movieCd, date) : 지점코드 (branchCd), 영화코드 (movieCd), 상영날짜(date) 를 파라미터로 받아 스케줄 정보 조회
	 */
	public List<ScheduleDTO> getScheduleList(int branchCd, String movieCd, String date) {
		List<ScheduleDTO> scheduleList = null;
		
		try {
			con = getConnection();
			sql = "select * from schedule A join room B on A.roomCd = B.roomCd where A.branchCd = ? && A.movieCd = ? && A.sc_date = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, branchCd);
			pstmt.setString(2, movieCd);
			pstmt.setString(3, date);
			
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			scheduleList = new ArrayList<ScheduleDTO>();
			
			while(rs.next()) {
				ScheduleDTO dto = new ScheduleDTO();
				
				dto.setScCode(rs.getInt("scCode"));
				dto.setSc_date(rs.getString("sc_date"));
				dto.setRoomCd(rs.getInt("roomCd"));
				dto.setStarttime(rs.getString("starttime"));
				dto.setEndtime(rs.getString("endtime"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setRuncount(rs.getInt("runcount"));
				dto.setSeatcomp(rs.getString("seatcomp"));
				dto.setRoomNum(rs.getString("roomNum"));
				
				scheduleList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return scheduleList;
	} // getScheduleList(branchCd, movieCd, date)
	
	
	/**
	 * getMovieList(List<moviedto>) - 영화 정보 조회 메서드 : 영화코드로 영화정보 조회
	 */
	public List<MovieDTO> getMovieList(List<ScheduleDTO> scheduleList) {
		List<MovieDTO> list = null;
		
		try {
		
			con = getConnection();
			
			list = new ArrayList<MovieDTO>();
			for (ScheduleDTO sdto : scheduleList) {
				
				sql = "select * from movie where movieCd = ? order by boxrank";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, sdto.getMovieCd());
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					MovieDTO dto = new MovieDTO();
					
					dto.setMovieCd(rs.getString("movieCd"));
					dto.setMovieNm(rs.getString("movieNm"));
					dto.setOpenDt(rs.getString("openDt"));
					dto.setGenreNm(rs.getString("genreNm"));
					dto.setDirectors(rs.getString("directors"));
					dto.setPoster(rs.getString("poster"));
					dto.setAudiAcc(rs.getInt("audiAcc"));
					dto.setBookRating(rs.getInt("bookRating"));
					dto.setWatchGradeNm(rs.getString("watchGradeNm"));
					dto.setShowTm(rs.getString("showTm"));
					dto.setActors(rs.getString("actors"));
					dto.setContents(rs.getString("contents"));
					dto.setBoxrank(rs.getInt("boxrank"));
					
					list.add(dto);
				}
			}
			
			System.out.println(" DAO : 영화 정보 조회 완료 ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return list;
	} // getMovieList(movieCd) 끝
	
	/**
	 * getTime() 날짜 정보 조회 메서드
	 */
	public List<timeDTO> getTime() {
		
		Calendar cal = Calendar.getInstance();
		
		List<timeDTO> timeList = new ArrayList<timeDTO>();
		
		
		for (int i = 0; i < 8; i++) {
			
			
			// 년
			int year = cal.get(Calendar.YEAR);
			// 월
			int month = cal.get(Calendar.MONTH)+1;
			// 일
			int date = cal.get(Calendar.DATE);
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
			String korDayOfWeek = "";
			switch (dayOfWeek % 7) {
			case 1 : korDayOfWeek = "일"; break;
			case 2 : korDayOfWeek = "월"; break;
			case 3 : korDayOfWeek = "화"; break;
			case 4 : korDayOfWeek = "수"; break;
			case 5 : korDayOfWeek = "목"; break;
			case 6 : korDayOfWeek = "금"; break;
			case 0 : korDayOfWeek = "토"; break;
			}
			// yyyy-MM-dd
			String yyyyMMdd = year+"-"+month+"-"+date;
			
			timeDTO tDTO = new timeDTO();
			
			tDTO.setMonth(month);
			tDTO.setDate(date);
			tDTO.setKorDayOfWeek(korDayOfWeek);
			tDTO.setYyyyMMdd(yyyyMMdd);
			
			timeList.add(tDTO);
			
			cal.add(Calendar.DATE, 1);
		}
		
		System.out.println(" DAO : 시간정보 저장 완료! ");
		
		return timeList;
	}
	// getTime() 끝
	
	
	/**
	 *  getSchedule(scCode)
	 */
	public ScheduleDTO getSchedule(int scCode) {
		ScheduleDTO dto = null;
		
		try {
			con = getConnection();
			sql = "select * from schedule where scCode = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, scCode);
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if (rs.next()) {
				dto = new ScheduleDTO();
				
				dto.setScCode(rs.getInt("scCode"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setSc_date(rs.getString("sc_date"));
				dto.setRoomCd(rs.getInt("roomCd"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setStarttime(rs.getString("starttime"));
				dto.setEndtime(rs.getString("endtime"));
				dto.setRuncount(rs.getInt("runcount"));
				dto.setSeatcomp(rs.getString("seatcomp"));
			}
			
			System.out.println(" DAO : schedule 조회 완료 ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return dto;
	} // getScheduleMovieCd()	
	
	
	/**
	 * getMovieInfo(scheduleDTO) - 스케줄 코드로 무비 정보 조회하는 메서드 
	 */
	public MovieDTO getMovieName(ScheduleDTO scDTO) {
		MovieDTO dto = null;
		
		try {
			con = getConnection();
			sql = "select * from movie where movieCd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, scDTO.getMovieCd());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MovieDTO();
				dto.setMovieNm(rs.getString("movieNm"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}
	// getMovieInfo(scCode)

	
	/**
	 *  getScheduleJoin(scCode) - scCode에 해당하는 날짜의 다양한 정보를 조회하는 메서드, join 사용
	 */
	public ScheduleDTO getScheduleJoin(int scCode) {
		ScheduleDTO dto = null;
		
		try {
			con = getConnection();
			sql = "SELECT A.scCode, A.branchCd, A.sc_date, A.roomCd, A.movieCd, A.starttime, A.endtime, A.seatComp, "
					+ "B.branch_name, C.roomNum, D.movieNm, D.poster, D.watchGradeNm, D.showTm "
					+ "FROM schedule A JOIN theater B "
					+ "ON A.branchCd = B.branchCd "
					+ "JOIN room C "
					+ "ON A.roomCd = C.roomCd "
					+ "JOIN movie D "
					+ "ON A.movieCd = D.movieCd "
					+ "where scCode = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, scCode);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto = new ScheduleDTO();
				
				dto.setScCode(rs.getInt("scCode"));
				dto.setBranchCd(rs.getInt("branchCd"));
				dto.setSc_date(rs.getString("sc_date"));
				dto.setRoomCd(rs.getInt("roomCd"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setStarttime(rs.getString("starttime"));
				dto.setEndtime(rs.getString("endtime"));
				dto.setSeatcomp(rs.getString("seatcomp"));
				dto.setBranch_name(rs.getString("branch_name"));
				dto.setRoomNum(rs.getString("roomNum"));
				dto.setMovieNm(rs.getString("movieNm"));
				dto.setPoster(rs.getString("poster"));
				dto.setWatchGradeNm(rs.getString("watchGradeNm"));
				dto.setShowTm(rs.getString("showTm"));
				
				System.out.println(" DAO : Schedule Join 정보 저장 완료 ");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return dto;
	}
	// getScheduleJoin(scCode)
	
	
	
	/**
	 *  makeTkCode() 
	 */
	public String makeTkCode() {
		String tkCode = null;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		
		
		try {
			con = getConnection();
			sql = "select count(*) from reservation";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				tkCode = "AIM" + sdf.format(cal.getTime()) + "-" + (rs.getInt(1)+1);
			}
			
			System.out.println(" DAO : tkCode : " + tkCode);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return tkCode;
	}
	// makeTkCode() 
	
	/**
	 * updateSeatcomp(seatcomp,scCode) - 좌석정보(String), 스케줄번호를 입력받아서 DB에 예매된 좌석 정보 업데이트
	 */
	public void updateSeatComp(String seatcomp, int scCode) {
		try {
			con = getConnection();
			sql = "update schedule set seatcomp=? where scCode=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, seatcomp);
			pstmt.setInt(2, scCode);
			
			pstmt.executeUpdate();

			System.out.println(" DAO : 예매 좌석 컬럼 수정 완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// updateSeatcomp(seatcomp,scCode)
	
	/**
	 * insertReservation(scDTO, tkCode, totalPirce, cusCnt)
	 */
	public int insertReservation(ScheduleDTO scDTO, String tkCode, int totalPrice, int totalCnt, String id) {
		int result = 0;
		
		try {
			con = getConnection();
			sql = "insert into reservation (tkCode,movieCd,totalPrice,cusCnt,payment,mb_id,scCode) "
					+ "values(?,?,?,?,?,?,?) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tkCode);
			pstmt.setString(2, scDTO.getMovieCd());
			pstmt.setInt(3, totalPrice);
			pstmt.setInt(4, totalCnt);
			pstmt.setString(5, "card"); // 임시값, 일단 카드로 통일
			pstmt.setString(6, id);
			pstmt.setInt(7, scDTO.getScCode());
			
			pstmt.executeUpdate();
			
			result = 1;
			System.out.println(" DAO : 영화 예매 정보 저장 성공! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}
	// insertReservation()
	
	/**
	 * getReservation(tkCode) : tkCode로 해당 예매 정보 조회 메서드
	 */
	public ReservationDTO getReservation(String tkCode) {
		ReservationDTO dto = null;
		
		try {
			con = getConnection();
			sql = "select * from reservation where tkCode = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tkCode);
			rs = pstmt.executeQuery();
			
			// 데이터처리
			if (rs.next()) {
				dto = new ReservationDTO();
				
				dto.setScCode(rs.getInt("scCode"));
				dto.setCusCnt(rs.getInt("cusCnt"));
				dto.setMb_id(rs.getString("mb_id"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setPayment(rs.getString("payment"));
				dto.setTkCode(rs.getString("tkCode"));
				dto.setTotalPrice(rs.getInt("totalPrice"));
				
				System.out.println(" DAO : 예매 정보 조회 완료 ! ");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return dto;
	}
	// getReservation(tkCode)
	
	/**
	 * getReservationMy(id) : 회원 id정보로 가장 최근에 예매 정보 조회
	 */
	public ReservationDTO getReservationMy(String id) {
		ReservationDTO dto = null;
		
		try {
			con = getConnection();
			sql = "select * from reservation where mb_id = ? order by tkCode desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			// 데이터처리
			if (rs.next()) {
				dto = new ReservationDTO();
				
				dto.setScCode(rs.getInt("scCode"));
				dto.setCusCnt(rs.getInt("cusCnt"));
				dto.setMb_id(rs.getString("mb_id"));
				dto.setMovieCd(rs.getString("movieCd"));
				dto.setPayment(rs.getString("payment"));
				dto.setTkCode(rs.getString("tkCode"));
				dto.setTotalPrice(rs.getInt("totalPrice"));
				
				System.out.println(" DAO : 예매 정보 조회 완료 ! ");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return dto;
	}
	// getReservation(tkCode)
	
	
//	/**
//	 * getScheduleList() : 극장/상영관,좌석 정보 조회 메서드, List<ScheduleDTO> 값 리턴
//	 */
//	public List<ScheduleDTO> getScheduleList() {
//		List<ScheduleDTO> scheduleList = null;
//
//		try {
//			con = getConnection();
//			
//			sql = "SELECT A.scCode, A.sc_date, A.starttime, A.movieCd, A.roomCd, "
//					+ " B.branch_name, C.completeCnt, C.totalseatCnt "
//					+ " FROM schedule A JOIN theater B "
//					+ " ON A.branchCd = B.branchCd "
//					+ " JOIN room C "
//					+ " ON A.roomCd = C.roomCd";
//			pstmt = con.prepareStatement(sql);
//			
//			rs = pstmt.executeQuery();
//			
//			// 데이터 처리
//			scheduleList = new ArrayList<ScheduleDTO>();
//			
//			while(rs.next()) {
//				ScheduleDTO dto = new ScheduleDTO();
//				
//				dto.setScCode(rs.getInt("scCode"));
//				dto.setSc_date(rs.getString("sc_date"));
//				dto.setStarttime(rs.getString("starttime"));
//				dto.setMovieCd(rs.getString("movieCd"));
//				dto.setRoomCd(rs.getInt("roomCd"));
//				dto.setBranch_name(rs.getString("branch_name"));
//				dto.setCompleteCnt(rs.getInt("completeCnt"));
//				dto.setTotalseatCnt(rs.getInt("totalseatCnt"));
//				
//				
//				scheduleList.add(dto);
//			}
//			
//			System.out.println(" ReservationDAO : 극장/상영관/스케줄 정보 조회 완료 : " + scheduleList);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			closeDB();
//		}
//		return scheduleList;
//	} // getScheduleList()
	
	
}
