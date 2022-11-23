package com.aim.ticketing.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.movie.db.MovieDTO;
import com.aim.schedule.db.ScheduleDTO;
import com.aim.theater.db.TheaterDTO;
import com.aim.ticketing.db.ReservationDAO;
import com.aim.ticketing.db.timeDTO;

public class TicketingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : TicketingAction.execute() 호출 ");
		
		// 영화 선택 정보 (나중에 구현)
		
		// 세션 생성
		
		// ReservationDAO - getTheaterList();
		// 전체 극장 정보 조회 메서드 (List<TheaterDTO> 리턴)
		ReservationDAO dao = new ReservationDAO();
		List<TheaterDTO> theaterList = dao.getTheaterList();
		
		// 스케줄 영화 코드 조회 메서드(중복x) getScheduleList();
		List<ScheduleDTO> scheduleFirst = dao.getScheduleList(1);
		
		// 영화 정보 조회 메서드
		List<MovieDTO> movieFirst = dao.getMovieList(scheduleFirst);
		
		// 날짜 정보 조회 메서드 - getTime()
		List<timeDTO> timeList = dao.getTime();
		
		System.out.println(timeList);
		
		// request에 극장정보 저장
		request.setAttribute("theaterList", theaterList);
		request.setAttribute("scheduleFirst", scheduleFirst);
		request.setAttribute("movieFirst", movieFirst);
		request.setAttribute("timeList", timeList);
		
		// 페이지 이동 준비
		ActionForward forward = new ActionForward();
		forward.setPath("./ticketing/ticketing.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
