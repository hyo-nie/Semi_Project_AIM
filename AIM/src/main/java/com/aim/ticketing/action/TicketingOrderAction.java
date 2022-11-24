package com.aim.ticketing.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;
import com.aim.schedule.db.ScheduleDTO;
import com.aim.ticketing.db.ReservationDAO;

public class TicketingOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : TicketingOrderAction.execute() 호출 ");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if (id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			
			return forward;
		}
		
		
		// 데이터 저장
		int scCode = Integer.parseInt(request.getParameter("scCode"));
		String seatNo = request.getParameter("seatNo");
		int adultCnt = Integer.parseInt(request.getParameter("adultCnt"));
		int childCnt = Integer.parseInt(request.getParameter("childCnt"));
		int seniorCnt = Integer.parseInt(request.getParameter("seniorCnt"));
		
		// reservationDAO
		ReservationDAO reDAO = new ReservationDAO();
		ScheduleDTO scDTO = reDAO.getScheduleJoin(scCode);
		String tkCode = reDAO.makeTkCode();
		
		// 좌석변환 시작 (0~99 번호 -> 좌석번호)
		List<Integer> seatArrTmp = new ArrayList<Integer>();
		for (int i = 0; i < adultCnt+childCnt+seniorCnt; i++) {
			seatArrTmp.add(Integer.parseInt(seatNo.split(",")[i]));
		}
		
		seatArrTmp.sort(null);
		List<String> seatArr = new ArrayList<String>();
		
		for (int j = 0; j < seatArrTmp.size(); j++) {
			switch ( ((int)seatArrTmp.get(j)+1)%10 == 0? (((int)seatArrTmp.get(j)+1)/10)-1 : ((int)seatArrTmp.get(j)+1)/10  ) {
			
			case 0: seatArr.add("A"+(( ((int)seatArrTmp.get(j)+1)%10)==0? 10: ((int)seatArrTmp.get(j)+1)%10)  ); break;
			case 1: seatArr.add("B"+(( ((int)seatArrTmp.get(j)+1)%10)==0? 10: ((int)seatArrTmp.get(j)+1)%10)  ); break;
			case 2: seatArr.add("C"+(( ((int)seatArrTmp.get(j)+1)%10)==0? 10: ((int)seatArrTmp.get(j)+1)%10)  ); break;
			case 3: seatArr.add("D"+(( ((int)seatArrTmp.get(j)+1)%10)==0? 10: ((int)seatArrTmp.get(j)+1)%10)  ); break;
			case 4: seatArr.add("E"+(( ((int)seatArrTmp.get(j)+1)%10)==0? 10: ((int)seatArrTmp.get(j)+1)%10)  ); break;
			case 5: seatArr.add("F"+(( ((int)seatArrTmp.get(j)+1)%10)==0? 10: ((int)seatArrTmp.get(j)+1)%10)  ); break;
			case 6: seatArr.add("G"+(( ((int)seatArrTmp.get(j)+1)%10)==0? 10: ((int)seatArrTmp.get(j)+1)%10)  ); break;
			case 7: seatArr.add("H"+(( ((int)seatArrTmp.get(j)+1)%10)==0? 10: ((int)seatArrTmp.get(j)+1)%10)  ); break;
			}
		}
		// 좌석변환 끝
		
		// memberDAO
		MemberDAO mbDAO = new MemberDAO();
		MemberDTO mbDTO = mbDAO.getMember(id);
		
		
		// request 저장
		request.setAttribute("scDTO", scDTO);
		request.setAttribute("seatNo", seatNo);
		request.setAttribute("adultCnt", adultCnt);
		request.setAttribute("childCnt", childCnt);
		request.setAttribute("seniorCnt", seniorCnt);
		request.setAttribute("seatArr", seatArr);
		request.setAttribute("tkCode", tkCode);
		request.setAttribute("mbDTO", mbDTO);
		
		// 페이지 이동
		
		forward.setPath("./ticketing/ticketingOrder.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
