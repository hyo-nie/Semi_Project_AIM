package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.aim.store.db.StoreDAO;
import com.aim.store.db.StoreDTO;

public class GiftcardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : GiftcardDetailAction_execute 호출 ");
		
		// 메인 로그인페이지와 연결이 안되어 있어서 id 세션을 임의로 넣어줌
//		HttpSession session = request.getSession();
//		session.setAttribute("id", "id");
		
		// st_num 저장
		int st_num = Integer.parseInt(request.getParameter("st_num"));
//		String st_name = request.getParameter("st_name");
		
		// DAO - getGiftcard(card)
		StoreDAO dao = new StoreDAO();
		StoreDTO dto = dao.getGiftcardDetail(st_num);
		
		request.setAttribute("dto", dto);
		
		// 페이지 이동 (./store/giftcard_detail.jsp)
		ActionForward forward = new ActionForward();
		forward.setPath("./store/giftcard_detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
