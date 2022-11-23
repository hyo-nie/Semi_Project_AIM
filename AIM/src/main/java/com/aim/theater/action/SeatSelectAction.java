package com.aim.theater.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.theater.db.TheaterDAO;
import com.aim.theater.db.TheaterDTO;

public class SeatSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : SeatSelctAction_execute() 호출");
		
		// 로그인 체크
		// 세션제어(id)
		HttpSession session = request.getSession();
		String mb_id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(mb_id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;			
		}
		
		//전달정보 저장 - 스케줄코드 전달받음
		int scCode = Integer.parseInt(request.getParameter("scCode"));
		
		TheaterDAO dao = new TheaterDAO();
		
		//선택한 지점/날짜/영화/상영관/상영시간 가져오기(첫번째날짜 디폴트)
		TheaterDTO selectSche = dao.getSelectSche(scCode);
		
		//연결된 view 페이지로 정보 전달
		request.setAttribute("selectSche", selectSche);
		
		//페이지 이동	
		forward.setPath("./theater/seat.jsp");
		forward.setRedirect(false);
		
		return forward;

	}

}
