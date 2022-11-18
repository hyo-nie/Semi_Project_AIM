package com.aim.theater.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.theater.db.TheaterDAO;

public class AdminScheRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AdminScheRemoveAction_execute 호출 ");
		
		// 전달정보 저장
		int scCode = Integer.parseInt(request.getParameter("scCode"));
		
		//삭제메서드
		TheaterDAO dao = new TheaterDAO();
		dao.adminRemoveSche(scCode);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminScheList.th");
		forward.setRedirect(true);
		return forward;
	}

}
