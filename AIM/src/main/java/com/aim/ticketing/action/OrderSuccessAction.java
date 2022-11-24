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
import com.aim.ticketing.db.ReservationDTO;

public class OrderSuccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" OrderSuccessAction.execute() 호출 ");
		
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
		String seatNo = request.getParameter("seatNo");
		int scCode = Integer.parseInt(request.getParameter("scCode"));
		String tkCode = request.getParameter("tkCode");
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int totalCnt = Integer.parseInt(request.getParameter("totalCnt"));
		
		// 좌석변환 시작 (0~99 번호 -> 좌석번호)
		List<Integer> seatArrTmp = new ArrayList<Integer>();
		for (int i = 0; i < totalCnt; i++) {
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
		
		// reservationDAO
		ReservationDAO dao = new ReservationDAO();
		ScheduleDTO scDTO = dao.getScheduleJoin(scCode);
		String seatComp = scDTO.getSeatcomp();
		
		// seatComp DB 정보 -> 배열로 저장
		List<String> seatList = new ArrayList<String>();
		for (int i = 0; i < 80; i++) {
			seatList.add((seatComp.split(",")[i]));
			
		}
		
		// 예매한 좌석 -> 0에서 1로 변경
		List<Integer> seatUpdate = new ArrayList<Integer>();
		for (int j = 0; j < totalCnt; j++) {
			seatUpdate.add(Integer.parseInt(seatNo.split(",")[j]));
		}
		
		for (int k = 0; k < seatUpdate.size(); k++) {
			for (int l = 0; l < seatList.size(); l++) {
				if (l == seatUpdate.get(k)) {
					seatList.set(l,"1");
				}
			}
		}
		
		// 변경된 좌석 배열 스트링으로 변경
		StringBuffer seatTmp = new StringBuffer();
		
		for (int m = 0; m < seatList.size(); m++) {
			if (m == seatList.size()-1) {
				seatTmp.append(seatList.get(m));
			} else {
				seatTmp.append(seatList.get(m)+",");
			}
		}
		
		// reservationDAO - updateSeatComp : 변경된(예약된) 좌석 DB에 저장
		String seatcomp = seatTmp.toString(); 
		dao.updateSeatComp(seatcomp, scCode);
		
		// reservationDAO - insertReservation : 예매 정보 저장
		int result = dao.insertReservation(scDTO, tkCode, totalPrice, totalCnt, id);
		
		// dao.getReservation(tkCode) : tkCode에 해당하는 예매 정보 조회
		ReservationDTO reDTO = dao.getReservation(tkCode);
		
		// 회원 정보 조회
		MemberDAO mbDAO = new MemberDAO();
		MemberDTO mbDTO = mbDAO.getMemberInfo(id);
		
		// 결제성공시 누적금액, 관람횟수 수정
		if (result == 1) {
			mbDAO.updateMemberPay(id, totalPrice);
			mbDAO.updateMemberView(id);
			mbDAO.updateMemberGrade(id);
		}
		
		// request
		request.setAttribute("seatArr", seatArr);
		request.setAttribute("scDTO", scDTO);
		request.setAttribute("reDTO", reDTO);
		request.setAttribute("mbDTO", mbDTO);
		
		// 페이지 이동 준비
		forward.setPath("./ticketing/orderSuccess.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
