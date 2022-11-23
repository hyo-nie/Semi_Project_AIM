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
		
		//세션제어(관리자 여부)
		HttpSession session = request.getSession();
		String mb_id = (String) session.getAttribute("mb_id");
		
		//admin과 작성한 id를 가진사람만 id컬럼추가 
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		String pageNum = request.getParameter("pageNum");
		
		RentDAO dao = new RentDAO();
		
		RentDTO dto = dao.getRent(rno);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
	 //================================================================
		
//		//작성된 답변 불러와기
//		 ArrayList rewriteListAll = dao.getReWriteList(rno);
//	    //System.out.println(reviewListAll);
//	    request.setAttribute("rewriteListAll", rewriteListAll);
		
	    ActionForward forward = new ActionForward();
		forward.setPath("./theater/admin_rt_content.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
