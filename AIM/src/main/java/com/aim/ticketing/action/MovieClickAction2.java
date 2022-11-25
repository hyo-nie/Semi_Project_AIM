package com.aim.ticketing.action;

import java.util.ArrayList;
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
//		System.out.println(branchCd + " " + movieCd + " " + date);
		List<ScheduleDTO> scheduleList = dao.getScheduleList(branchCd, movieCd, date);
		List<MovieDTO> movieList = dao.getMovieList(scheduleList);
		
		// 남은 좌석수 계산 로직
		List<String> seatArr = new ArrayList<String>();
		for(int i = 0; i < scheduleList.size(); i++) {
			seatArr.add(scheduleList.get(i).getSeatcomp());
		}
		
		List<Integer> currentSeatArr = new ArrayList<Integer>(); 
		for(int j = 0; j < seatArr.size(); j++) {
			int currentSeat = 0;
			for (int k = 0; k < 80; k++) {
				if (seatArr.get(j).split(",")[k].equals("0")) {
					currentSeat++;
				}
			}
			currentSeatArr.add(currentSeat);
		}
		
		
		// request에 저장
		request.setAttribute("scheduleList", dao.getScheduleList(branchCd, movieCd, date));
		request.setAttribute("movieList", movieList);
		request.setAttribute("currentSeatArr", currentSeatArr);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ticketing/movieClick2.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
