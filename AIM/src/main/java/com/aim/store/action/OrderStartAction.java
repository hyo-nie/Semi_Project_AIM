package com.aim.store.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;
import com.aim.store.db.CartDAO;

public class OrderStartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : OrderStartAction_execute() ");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		

		CartDAO cdao = new CartDAO();
		
		ArrayList totalList = cdao.getCartList(id);
		ArrayList cartList = (ArrayList) totalList.get(0); 
		ArrayList productList = (ArrayList) totalList.get(1); 
		
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = mDAO.getMemberInfo(id);
		
		request.setAttribute("cartList", cartList);
		request.setAttribute("productList", productList);
		request.setAttribute("member", mDTO);
		
		forward.setPath("./store/buy.jsp");
		forward.setRedirect(false);
			
		return forward;
		
	}

}