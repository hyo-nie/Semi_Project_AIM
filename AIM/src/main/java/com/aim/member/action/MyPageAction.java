package com.aim.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;

public class MyPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberInfoAction_execute() 호출 ");
		
		//세션 제어
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(mb_id == null) {
			forward.setPath("./Main.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		// DAO - 회원정보 가져오는 메서드 ( getMember(ID) )
		MemberDAO dao = new MemberDAO();
		
		MemberDTO dto = dao.getMember(mb_id);
	
		// 정보 request 저장
		request.setAttribute("dto", dto);
		
		// 페이지 이동
		forward.setPath("./member/mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
