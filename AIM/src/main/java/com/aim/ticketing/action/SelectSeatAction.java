package com.aim.ticketing.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.movie.db.MovieDAO;
import com.aim.movie.db.MovieDTO;
import com.aim.schedule.db.ScheduleDTO;
import com.aim.ticketing.db.ReservationDAO;

public class SelectSeatAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : SelectSeatAction.execute() 호출 ");
		
		// 데이터 저장
		int select_scCode = Integer.parseInt(request.getParameter("scCode"));
		
		// schedule 조회 메서드 reservation - getSchedule();
		ReservationDAO dao = new ReservationDAO();
		ScheduleDTO scDTO = dao.getScheduleJoin(select_scCode);
		
		String seatComp = scDTO.getSeatcomp();
		
		// seatComp DB 정보 -> 배열로 저장
		List<String> seatList = new ArrayList<String>();
		for (int i = 0; i < 80; i++) {
			seatList.add(seatComp.split(",")[i]);
		}
		
		// VIEW 페이지에 줄번호 출력용 배열
		List<String> seatRow = new ArrayList<String>();
		seatRow.add("A");
		seatRow.add("B");
		seatRow.add("C");
		seatRow.add("D");
		seatRow.add("E");
		seatRow.add("F");
		seatRow.add("G");
		seatRow.add("H");
		
		// request 저장
		request.setAttribute("scDTO", scDTO);
		request.setAttribute("seatList", seatList);
		request.setAttribute("seatRow", seatRow);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./ticketing/selectSeat.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
