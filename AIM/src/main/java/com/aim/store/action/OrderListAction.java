package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.store.db.OrderDAO;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : OrderListAction_execute()");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		OrderDAO orDAO = new OrderDAO();

		request.setAttribute("orderList", orDAO.getOrderList(id));
		
		forward.setPath("./store/buy_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
