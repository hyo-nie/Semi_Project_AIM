package com.aim.store.action;

import java.util.ArrayList;
import java.util.Vector;

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
		
		// 사용자 정보(세션제어)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
		
		System.out.println("id : " + id);
		System.out.println("---------------------------------------------------");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		// 구매 정보(장바구니 정보)
		CartDAO cdao = new CartDAO();
		
		ArrayList totalList = cdao.getCartList(id);
		ArrayList cartList = (ArrayList) totalList.get(0); 
		ArrayList productList = (ArrayList) totalList.get(1); 
		
		// 사용자 정보
		MemberDAO mDAO = new MemberDAO();
		MemberDTO mDTO = mDAO.getMemberInfo(id);
		
		// 저장해서 view 출력
		request.setAttribute("cartList", cartList);
		request.setAttribute("productList", productList);
		request.setAttribute("member", mDTO);
		
		// 정보 확인용!
//		System.out.println("정보확ㄴ인용!!!!!!! " + productList);
//		System.out.println(member);
	
		// ./store/buy.jsp		페이지 이동
		forward.setPath("./store/buy.jsp");
		forward.setRedirect(false);
			
		return forward;
		
	}

}