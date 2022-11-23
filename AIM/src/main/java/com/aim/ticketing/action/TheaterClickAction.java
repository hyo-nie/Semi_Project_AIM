package com.aim.ticketing.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.movie.db.MovieDTO;
import com.aim.schedule.db.ScheduleDTO;
import com.aim.ticketing.db.ReservationDAO;

public class TheaterClickAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" TheaterClickAction.execute() 호출 ");

		// 데이터 저장
		int branchCd = Integer.parseInt(request.getParameter("branchCd"));
		
		// ReservationDAO - getScheduleList() 영화정보 조회 메서드(중복x)
		ReservationDAO dao = new ReservationDAO();
		List<ScheduleDTO> scheduleList = dao.getScheduleList(branchCd);
		
		List<MovieDTO> movieList = dao.getMovieList(scheduleList);
		
		// request 저장
		request.setAttribute("scheduleList", scheduleList);
		request.setAttribute("movieList", movieList);
			
//		for (ScheduleDTO dto : scheduleList) {
//		
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		
//			
//			out.print(" <li class=''> ");
//			out.print("  <a href='#none'> ");
//			out.print("   <div class='group_infor'> ");
//			out.print("    <div class='bx_tit'> ");
//			out.print("     <span class='ic_grade gr_12'></span> "); // 등급정보 추가필요
//			out.print("     <strong class='tit'>" + dto.getMovieCd() + "</strong> ");
//			out.print("    </div> ");
//			out.print("   </div> ");
//			out.print("  </a> ");
//			out.print(" </li> ");
//			out.close();
//		
//		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ticketing/theaterClick.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
