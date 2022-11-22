package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;
import com.aim.store.db.OrderDAO;
import com.aim.store.db.OrderDTO;
import com.aim.store.db.StoreDAO;
import com.aim.store.db.StoreDTO;

public class OrderNowAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 세션정보 체크
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
				
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달 정보 저장
//		int st_num = Integer.parseInt(request.getParameter("st_num"));
//		String st_name = request.getParameter("st_name");
//		int st_amount = Integer.parseInt(request.getParameter("st_amount"));
		
		// 전달 정보를 이용해서 주문 번호를 만드는 메서드, 주문한 상품정보를 바로 불러오는 메서드를 만들기
		// 주문자 정보(id, tel)은 MemberDAO, session 에서 받아오기
		// 상품정보는 StoreDTO - getProductInfo(st_num)

		// 구매 상품의 정보(st_num, st_name)
		StoreDAO stDAO = new StoreDAO();
		StoreDTO stDTO = new StoreDTO();
		stDTO = stDAO.getProductInfo(Integer.parseInt(request.getParameter("st_num")));
	
		// 주문자 정보(id, tel)
		MemberDAO mbDAO = new MemberDAO();
		MemberDTO mbDTO = new MemberDTO();
		mbDTO = mbDAO.getMemberInfo(id);	
		
		// 저장해서 view에 출력하기
		request.setAttribute("prdtInfo", stDTO);
		request.setAttribute("userInfo", mbDTO);
		request.setAttribute("amount", Integer.parseInt(request.getParameter("c_amount")));

		forward.setPath("./store/buy_now.jsp");
		forward.setRedirect(false);
		
		
		return forward;

	}

}
