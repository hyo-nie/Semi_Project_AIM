package com.aim.store.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.store.db.CartDAO;

public class CartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CartAction_execute 호출 ");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			
			return forward;
		}
		

		CartDAO dao = new CartDAO();
		ArrayList totalList = dao.getCartList(id);

		request.setAttribute("cartList", totalList.get(0));
		request.setAttribute("productList", totalList.get(1));

		
		forward.setPath("./store/cart.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
