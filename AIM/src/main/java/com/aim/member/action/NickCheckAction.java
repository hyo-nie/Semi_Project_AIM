package com.aim.member.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.member.db.MemberDAO;

public class NickCheckAction extends HttpServlet implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : MemberIdCheckAction 호출");
		
		// mb_nick 전달정보 저장
		String mb_nick = request.getParameter("mb_nick");
		System.out.println(" M : mb_nick : " + mb_nick);
		
		// dao 에서 MemberIdCheck 메서드 호출
		MemberDAO dao = new MemberDAO();
		int result = dao.idCheck(mb_nick);
		
		if(result == 1) {
			System.out.println(" M : 아이디 중복, 사용불가 ");
		}else {
			System.out.println(" M : 아이디 중복아님, 사용가능 ");
		}
		
		request.setAttribute("result", result);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./member/nickCheck.jsp?inputNick=" + mb_nick);
		forward.setRedirect(false);
		
		return forward;
	}

}
