package com.aim.theater.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.theater.db.RentDAO;
import com.aim.theater.db.RentDTO;

public class AdminRentalReWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//페이지 전달정보 저장
		int rno = Integer.parseInt(request.getParameter("rno"));
		String pageNum = request.getParameter("pageNum");
		
		RentDAO dao = new RentDAO();
		
		RentDTO dto = dao.getRent(rno);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./theater/admin_rt_rewrite.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
