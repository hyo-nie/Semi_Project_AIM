package com.aim.ticketing.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.schedule.db.ScheduleDTO;
import com.aim.ticketing.db.ReservationDAO;

public class OrderSuccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" OrderSuccessAction.execute() 호출 ");
		
		String seatNo = request.getParameter("seatNo");
		int scCode = Integer.parseInt(request.getParameter("scCode"));
		String tkCode = request.getParameter("tkCode");
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
		
		// reservationDAO
//		dao.insertReservation("scDTO",);
		
		
		// request
		request.setAttribute("seatArr", seatArr);
		request.setAttribute("scDTO", scDTO);
		
		return null;
	}

}
