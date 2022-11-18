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
		
		// 로그인 체크
		// 세션제어(id)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
//		System.out.println("id : " + id);
//		System.out.println("---------------------------------------------------");
		
		// id 정보 없을 때
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			
			return forward;
		}
		
		// CartDAO - 장바구니 정보
		// => 로그인한 사용자의 장바구니 정보를 가져오기
		CartDAO dao = new CartDAO();
		ArrayList totalList = dao.getCartList(id);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(" M : " + totalList);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@");

		request.setAttribute("cartList", totalList.get(0));
		// 장바구니 리스트
		request.setAttribute("productList", totalList.get(1));
		// 상품 정보 리스트 
		
		forward.setPath("./store/cart.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
