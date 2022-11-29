package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.store.db.CartDAO;

public class CartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CartDeleteAction_execute 호출 ");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");

		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			
			return forward;
		}
		
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		
		CartDAO dao = new CartDAO();
		int result = dao.deleteCart(c_num);
		
		if(result == 1) {
			System.out.println(" M : 장바구니 삭제완료 ");
		}
		
		forward.setPath("./CartList.ct");
		forward.setRedirect(true);
		
		return forward;
	}

}
