package com.aim.ticketing.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.movie.db.MovieDAO;
import com.aim.movie.db.MovieDTO;
import com.aim.schedule.db.ScheduleDTO;
import com.aim.ticketing.db.ReservationDAO;

public class MovieClickAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MovieClickAction.execute() 호출 ");
		
		// 데이터 저장
		String branch_movie = request.getParameter("branch_movie");
		int branchCd = Integer.parseInt(branch_movie.substring(0, 1));
		String movieCd = branch_movie.substring(1);
		String date = request.getParameter("date");
		
		// dao - getScheduleList
		ReservationDAO dao = new ReservationDAO();
		List<ScheduleDTO> scheduleList = dao.getScheduleList(branchCd, movieCd, date);
		List<MovieDTO> movieList = dao.getMovieList(scheduleList);
		
		// 수정중
		MovieDAO mvDAO = new MovieDAO();
		MovieDTO mvDTO = mvDAO.getMovieDetail(movieCd);
		// 수정중
		
		// request에 저장
		request.setAttribute("scheduleList", dao.getScheduleList(branchCd, movieCd, date));
		request.setAttribute("movieList", movieList);
		request.setAttribute("movieDetail", mvDTO);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ticketing/movieClick.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
