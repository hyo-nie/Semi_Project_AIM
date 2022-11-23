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
		if(id == null) {							// 아이디 정보가 없다면 이동
			forward.setPath("./Login.aim");	// 로그인 페이지로
			forward.setRedirect(true);
			
			return forward;
		}
		
		// 전달정보(주문번호)
		String o_cnum = request.getParameter("o_cnum");
		System.out.println("주문번호? " + o_cnum);
		
		// OrderDAO - 주문 번호에 해당하는 상품들 조회
		// orderDetail(o_cnum)
		OrderDAO ordao = new OrderDAO();
		
		// request영역
		request.setAttribute("detailInfo", ordao.orderDetail(o_cnum));
		
		// 페이지 이동 ("./store/buy_detail.jsp")
		forward.setPath("./store/buy_detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}


}
