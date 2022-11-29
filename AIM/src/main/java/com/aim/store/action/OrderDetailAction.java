package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.store.db.OrderDAO;

public class OrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : OrderDetailAction_execute()");
		
		// 사용자 정보(세션제어)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {							
			forward.setPath("./Login.aim");	
			forward.setRedirect(true);
			
			return forward;
		}
		
		String o_cnum = request.getParameter("o_cnum");

		OrderDAO ordao = new OrderDAO();
		
		request.setAttribute("detailInfo", ordao.orderDetail(o_cnum));
		
		forward.setPath("./store/buy_detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}


}
