package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.store.db.CartDAO;
import com.aim.store.db.CartDTO;
import com.aim.store.db.StoreDTO;

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
		
		// 장바구니 정보 저장
		// detail 페이지에서 선택한 옵션(개수) + 구매한 회원(mb_id)
		CartDTO dto = new CartDTO();
		
		dto.setSt_num(Integer.parseInt(request.getParameter("st_num")));
		dto.setC_amount(Integer.parseInt(request.getParameter("c_amount")));
		dto.setSt_name(request.getParameter("st_name"));
		dto.setMb_id(id);
		
//		System.out.println(request.getParameter("st_name"));
		System.out.println(" M : " + dto);
//		System.out.println("---------------------------------------");
		
		// DB에 저장
		// 기존에 동일옵션의 정보가 있는지 체크
		// 0 : 수량 update		X : 정보 insert
		CartDAO dao = new CartDAO();
		boolean isUpdate = dao.checkCart(dto);
		// true -> update 완료
		
		if(!isUpdate) {
			// 정보 추가(insert)
			dao.cartAdd(dto);
			System.out.println(" M : 장바구니 추가 ");
		}
		
		// 사용자의 선택에 따라 장바구니 페이지로 이동/상품리스트 이동
		String isMove = request.getParameter("isMove");
		System.out.println(" M : isMove : " + isMove);
		
		if(isMove.equals("true")) {
			// 페이지 이동
			forward.setPath("./CartList.ct");
			forward.setRedirect(true);
		}else {
			// 페이지 이동
			forward.setPath("./StoreMain.st");
			forward.setRedirect(true);
		}
		
		
		return forward;
		
	}

}
