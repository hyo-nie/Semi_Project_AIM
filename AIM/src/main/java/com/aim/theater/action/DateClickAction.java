package com.aim.theater.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.schedule.db.ScheduleDTO;
import com.aim.theater.db.TheaterDAO;

public class DateClickAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DateClickAction.execute() 호출");
		
		//전달정보 저장 - 날짜와 지점코드 전달받음
		String date = request.getParameter("date");
		int branchCd = Integer.parseInt(request.getParameter("branchCd"));
		
		//DB에 저장된 정보를 가져오기
		TheaterDAO dao = new TheaterDAO();
		
		//지점/날짜 별 영화제목 받아오기
		List<ScheduleDTO> movieName = dao.getMovieNm(branchCd, date);
		//지점과 날짜별 스케줄리스트 가져오기
		List scheduleList = dao.getScheList(branchCd,date);
		
		//연결된 view 페이지로 정보 전달
	
		request.setAttribute("movieName", movieName);
		request.setAttribute("scheduleList", scheduleList);
				
				
		//페이지 이동	
		ActionForward forward = new ActionForward();
		forward.setPath("./theater/dateClick.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
