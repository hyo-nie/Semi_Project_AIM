package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.store.db.OrderDAO;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : OrderListAction_execute()");

		// 세션정보 체크
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		// OrderDAO 객체 - getOrderList(id)
		OrderDAO orDAO = new OrderDAO();

		// request 영역저장
		request.setAttribute("orderList", orDAO.getOrderList(id));
		
		// 페이지 이동 (./store/buy_list.jsp)
		forward.setPath("./store/buy_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
