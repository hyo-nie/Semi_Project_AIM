package com.aim.ticketing.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.movie.db.MovieDTO;
import com.aim.schedule.db.ScheduleDTO;
import com.aim.ticketing.db.ReservationDAO;

public class MovieClickAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MovieClickAction2.execute 호출 ");
		
		// 데이터 저장
		String branch_movie = request.getParameter("branch_movie");
		int branchCd = Integer.parseInt(branch_movie.substring(0, 1));
		String movieCd = branch_movie.substring(1);
		String date = request.getParameter("date");
		
		// dao - getScheduleList
		ReservationDAO dao = new ReservationDAO();
		List<ScheduleDTO> scheduleList = dao.getScheduleList(branchCd, movieCd, date);
		List<MovieDTO> movieList = dao.getMovieList(scheduleList);
		
		// request에 저장
		request.setAttribute("scheduleList", dao.getScheduleList(branchCd, movieCd, date));
		request.setAttribute("movieList", movieList);
		
		System.out.println("scheduleList : " + scheduleList);
		System.out.println("movieList : " + movieList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ticketing/movieClick2.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
