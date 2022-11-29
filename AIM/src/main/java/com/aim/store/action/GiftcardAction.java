package com.aim.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.store.db.StoreDAO;
import com.aim.store.db.StoreDTO;

public class GiftcardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : GiftcardAction_execute 호출 ");
		
		
		StoreDTO dto = new StoreDTO();
		dto.setCategory_code("1");
		String card = dto.getCategory_code();
		
		StoreDAO dao = new StoreDAO();
		List Giftcard = dao.getGiftcard(card); 
		

		
		request.setAttribute("Giftcard", Giftcard);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./store/giftcard.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
