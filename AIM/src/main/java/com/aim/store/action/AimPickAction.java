package com.aim.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.store.db.StoreDAO;
import com.aim.store.db.StoreDTO;

public class AimPickAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : AimPickAction_execute()");
		
		StoreDAO dao = new StoreDAO();
		StoreDTO aimCombo = dao.getAimPick(6);
		StoreDTO ticket = dao.getAimPick(5);
		StoreDTO giftCard = dao.getAimPick(2);
		
		request.setAttribute("Combo", aimCombo);
		request.setAttribute("ticket", ticket);
		request.setAttribute("giftCard", giftCard);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./store/aimpick.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
