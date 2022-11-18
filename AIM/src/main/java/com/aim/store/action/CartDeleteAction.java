package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.store.db.CartDAO;

public class CartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CartDeleteAction_execute 호출 ");
		
		// 세션값 제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");

		// id 정보 없을 때
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			
			return forward;
		}
		
		// 전달정보 저장(c_num)
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		
		// DAO - 장바구니 삭제(c_num)
		CartDAO dao = new CartDAO();
		int result = dao.deleteCart(c_num);
		
		if(result == 1) {
			System.out.println(" M : 장바구니 삭제완료 ");
		}
		
		// 페이지 이동(CartList.ct)
		forward.setPath("./CartList.ct");
		forward.setRedirect(true);
		
		return forward;
	}

}
