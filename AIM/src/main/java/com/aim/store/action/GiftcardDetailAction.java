package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.aim.store.db.StoreDAO;
import com.aim.store.db.StoreDTO;

public class GiftcardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : GiftcardDetailAction_execute 호출 ");
		
		int st_num = Integer.parseInt(request.getParameter("st_num"));
		
		StoreDAO dao = new StoreDAO();
		StoreDTO dto = dao.getGiftcardDetail(st_num);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./store/giftcard_detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
