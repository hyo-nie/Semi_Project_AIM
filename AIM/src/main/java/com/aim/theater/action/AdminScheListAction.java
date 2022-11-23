package com.aim.theater.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.theater.db.TheaterDAO;

public class AdminScheListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : AdminScheListAction_execute() 호출");
		
		//세션제어(관리자 여부)
		HttpSession session = request.getSession();
		String mb_id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(mb_id==null || !mb_id.equals("admin")) {
			forward.setPath("./Main.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		TheaterDAO dao = new TheaterDAO();
		List adminScheList = dao.getAdminScheList();
		
		request.setAttribute("adminScheList", adminScheList);
		
		// 페이지 이동(./center/admin_goods_list.jsp)
		forward.setPath("./theater/admin_sche_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
