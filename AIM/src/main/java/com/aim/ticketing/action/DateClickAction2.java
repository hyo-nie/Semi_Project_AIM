package com.aim.ticketing.action;

import java.util.ArrayList;
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
		
		
		// dao - getScheduleList
		ReservationDAO dao = new ReservationDAO();
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
		forward.setPath("./ticketing/dateClick2.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
		
		
		
		
		

}
