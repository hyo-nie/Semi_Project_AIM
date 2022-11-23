package com.aim.store.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.store.db.CartDAO;
import com.aim.store.db.OrderDAO;
import com.aim.store.db.OrderDTO;

public class OrderAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : OrderAddAction_execute");
		
		// 세션제어(로그인체크)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
		
		// id 정보 없을 때
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim"); 
			forward.setRedirect(true);
			
			return forward;
		}
		
		// 전달된 주문 정보(id, o_tel, o_pay)
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setO_id(id);
		orderDTO.setO_tel(request.getParameter("mb_tel"));
		orderDTO.setO_pay(request.getParameter("o_pay"));
		System.out.println(request.getParameter("o_pay"));

		System.out.println("orderDTO : " + orderDTO);
	
		// 주문 상품 정보 (장바구니 정보 + 상품 정보)
		CartDAO cdao = new CartDAO();
		ArrayList totalList = cdao.getCartList(id);
		
		// 주문 상품정보
		ArrayList cartList = (ArrayList)totalList.get(0);
		ArrayList productList = (ArrayList)totalList.get(1);		
		
		// 결제 호출
//		System.out.println(" M : 결제 호출");
		
		// 주문정보 저장
		OrderDAO odao = new OrderDAO();
		odao.addOrder(orderDTO, cartList, productList);
				
		// 장바구니 정보 삭제
		cdao.deleteCart(id);
				
		// 페이지 이동
		forward.setPath("./OrderList.or");
		forward.setRedirect(true);
				
		return forward;
	}

}
