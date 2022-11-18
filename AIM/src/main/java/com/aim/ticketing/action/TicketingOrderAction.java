package com.aim.ticketing.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TicketingOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : TicketingOrderAction.execute() 호출 ");
		
		
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./ticketing/ticketingOrder.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
