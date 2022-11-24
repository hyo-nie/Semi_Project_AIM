package com.aim.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;
import com.aim.schedule.db.ScheduleDTO;
import com.aim.store.db.OrderDAO;
import com.aim.store.db.OrderDTO;
import com.aim.ticketing.db.ReservationDAO;
import com.aim.ticketing.db.ReservationDTO;

public class MyPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MyPageAction_execute() 호출");
		
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(mb_id == null) {
			forward.setPath("./Main.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		dto = dao.getMember(mb_id);

		System.out.println("dto:" +dto);

		// 영화예매내역 조회
		ReservationDAO reDAO = new ReservationDAO();
		ReservationDTO reDTO = reDAO.getReservationMy(mb_id);
		ScheduleDTO scDTO = null;
		if (reDTO != null) {
			scDTO = reDAO.getScheduleJoin(reDTO.getScCode());
		}
		
		// 영화예매내역 조회 
		request.setAttribute("dto", dto);
		request.setAttribute("reDTO", reDTO);
		request.setAttribute("scDTO", scDTO);
		
		// 스토어 구매 내역 조회
		OrderDAO ordao = new OrderDAO();
		List<OrderDTO> orderList = ordao.getOrderList(mb_id);
		System.out.println(orderList);
		request.setAttribute("orderList", orderList);
		
		forward.setPath("./member/myPage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
