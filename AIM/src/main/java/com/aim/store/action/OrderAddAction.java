package com.aim.store.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDAO;
import com.aim.store.db.CartDAO;
import com.aim.store.db.OrderDAO;
import com.aim.store.db.OrderDTO;

public class OrderAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : OrderAddAction_execute");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim"); 
			forward.setRedirect(true);
			
			return forward;
		}
		
		MemberDAO mb = new MemberDAO();
		mb.Addsum(id, Integer.parseInt(request.getParameter("totalAmountMoney")));
		System.out.println(request.getParameter("totalAmountMoney"));
		mb.updateMemberGrade(id);
		
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setO_id(id);
		orderDTO.setO_tel(request.getParameter("mb_tel"));
		orderDTO.setO_pay(request.getParameter("o_pay"));
//		System.out.println(request.getParameter("o_pay"));

		System.out.println("orderDTO : " + orderDTO);
	
		CartDAO cdao = new CartDAO();
		ArrayList totalList = cdao.getCartList(id);
		
		ArrayList cartList = (ArrayList)totalList.get(0);
		ArrayList productList = (ArrayList)totalList.get(1);		
		
		
		OrderDAO odao = new OrderDAO();
		odao.addOrder(orderDTO, cartList, productList);
				
		cdao.deleteCart(id);
				
		forward.setPath("./OrderList.or");
		forward.setRedirect(true);
				
		return forward;
	}

}
