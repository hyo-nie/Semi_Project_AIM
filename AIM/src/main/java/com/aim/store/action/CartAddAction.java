package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.store.db.CartDAO;
import com.aim.store.db.CartDTO;

public class CartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : CartAddAction_execute 호출 ");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim"); 
			forward.setRedirect(true);
			
			return forward;
		}

		CartDTO dto = new CartDTO();
		
		dto.setSt_num(Integer.parseInt(request.getParameter("st_num")));
		dto.setC_amount(Integer.parseInt(request.getParameter("c_amount")));
		dto.setSt_name(request.getParameter("st_name"));
		dto.setMb_id(id);

		CartDAO dao = new CartDAO();
		boolean isUpdate = dao.checkCart(dto);
		
		if(!isUpdate) {
			dao.cartAdd(dto);
			System.out.println(" M : 장바구니 추가 ");
		}
		
		boolean buyNowGbn = request.getParameter("buyNow") == null ? false : true;
		
		if(buyNowGbn) {
			dao.deleteCart(id); 
			dao.cartAdd(dto); 
		}

		String isMove = request.getParameter("isMove");
		System.out.println(" M : isMove : " + isMove);
		
		if(isMove.equals("true")) {
			forward.setPath("./CartList.ct");
			forward.setRedirect(true);
		}else {
			forward.setPath("./StoreMain.st");
			forward.setRedirect(true);
		}
		
		
		return forward;
		
	}

}
