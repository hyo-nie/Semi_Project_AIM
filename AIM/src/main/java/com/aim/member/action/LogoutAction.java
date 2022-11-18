package com.aim.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : LogoutAction.execute() 호출 ");
		
		// 세션 초기화 (로그아웃)
		HttpSession session = request.getSession();
		session.invalidate();
		
		// 페이지 이동 준비
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.aim");
		forward.setRedirect(true);
		
		return forward;
	}

	
	

}
