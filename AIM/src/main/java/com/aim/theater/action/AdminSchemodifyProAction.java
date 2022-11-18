package com.aim.theater.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.theater.db.TheaterDAO;
import com.aim.theater.db.TheaterDTO;

public class AdminSchemodifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : AdminScheModifyPro.th 호출");
		
		TheaterDTO dto = new TheaterDTO();
		
		dto.setScCode(Integer.parseInt(request.getParameter("scCode")));
		dto.setBranchCd(Integer.parseInt(request.getParameter("branchCd")));
		dto.setSc_date(request.getParameter("sc_date"));
		dto.setRoomCd(Integer.parseInt(request.getParameter("roomCd")));
		dto.setMovieCd(request.getParameter("movieCd"));
		dto.setStarttime(request.getParameter("starttime"));
		dto.setEndtime(request.getParameter("endtime"));
		dto.setRuncount(Integer.parseInt(request.getParameter("runcount")));
		
		TheaterDAO dao = new TheaterDAO();
		dao.adminModifySche(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminScheList.th");
		forward.setRedirect(true);
		
		return forward;
	}

}
