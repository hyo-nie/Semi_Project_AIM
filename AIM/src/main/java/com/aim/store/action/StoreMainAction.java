package com.aim.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.store.db.StoreDAO;
import com.aim.store.db.StoreDTO;

public class StoreMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : StoreMainAction_execute()");
		
		
		StoreDAO dao = new StoreDAO();
		List gc_list = dao.getStoreProduct("1");		
		List pop_list = dao.getStoreProduct("2");		
		StoreDTO aimCombo = dao.getAimPick(6);
		StoreDTO ticket = dao.getAimPick(5);
		StoreDTO giftCard = dao.getAimPick(2);
		
		request.setAttribute("gc_list", gc_list);
		request.setAttribute("pop_list", pop_list);
		
		request.setAttribute("Combo", aimCombo);
		request.setAttribute("ticket", ticket);
		request.setAttribute("giftCard", giftCard);
	
		ActionForward forward = new ActionForward();
		forward.setPath("./store/store_main.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
