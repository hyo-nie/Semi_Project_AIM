package com.aim.theater.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.theater.db.RentDAO;
import com.aim.theater.db.RentDTO;

public class AdminRentalContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AdminRentalContentAction.execute() 호출 ");
		
		//세션제어(비회원접근불가)
		HttpSession session = request.getSession();
		String mb_id = (String) session.getAttribute("mb_id");

		
		ActionForward forward = new ActionForward();
		
		
			if(mb_id==null) {
				forward.setPath("./Main.aim");
				forward.setRedirect(true);
				return forward;
			}
		
		

		int rno = Integer.parseInt(request.getParameter("rno"));
		String pageNum = request.getParameter("pageNum");
		
		RentDAO dao = new RentDAO();
		
		RentDTO dto = dao.getRent(rno);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
			
	    forward = new ActionForward();
		forward.setPath("./theater/admin_rt_content.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
