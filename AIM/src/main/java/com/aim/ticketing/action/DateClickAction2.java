package com.aim.ticketing.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.movie.db.MovieDTO;
import com.aim.schedule.db.ScheduleDTO;
import com.aim.ticketing.db.ReservationDAO;

public class DateClickAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : DateClickAction.execute() 호출 ");
		
		// 데이터 저장
		String date = request.getParameter("date");
		String branch_movie = request.getParameter("branch_movie");
		int branchCd = 0;
		String movieCd = "";
		if (branch_movie != null) {
			branchCd = Integer.parseInt(branch_movie.substring(0, 1));
			movieCd = branch_movie.substring(1);
		}
		String tmpbranchCd = request.getParameter("branchCd");
		if (tmpbranchCd != null) {
			branchCd = Integer.parseInt(tmpbranchCd);
		}
		String tmpmovieCd = request.getParameter("movieCd");
		if (tmpmovieCd != null) {
			movieCd = tmpmovieCd;
		}
		
		System.out.println(date + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ dateaction2");
		System.out.println(branchCd + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ dateaction2");
		System.out.println(movieCd + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ dateaction2");
		
		
		// dao - getScheduleList
		ReservationDAO dao = new ReservationDAO();
		List<ScheduleDTO> scheduleList = dao.getScheduleList(branchCd, movieCd, date);
		List<MovieDTO> movieList = dao.getMovieList(scheduleList);
		
		// request에 저장
		request.setAttribute("scheduleList", dao.getScheduleList(branchCd, movieCd, date));
		request.setAttribute("movieList", movieList);
		
//		System.out.println("scheduleList : " + scheduleList);
//		System.out.println("movieList : " + movieList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ticketing/dateClick2.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
		
		
		
		
		

}
