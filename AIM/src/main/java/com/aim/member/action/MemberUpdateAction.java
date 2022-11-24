package com.aim.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.member.db.MemberDAO;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberUpdateAction_execute() 호출 ");
		
		// 비회원 못 사용하게 세션 제어
		
		// 전달정보 (mb_id)
		String mb_id = request.getParameter("mb_id");
		
		// DAO - 회원정보 가져오기
		MemberDAO dao = new MemberDAO();
		
		// request 영역에 저장
		request.setAttribute("dto", dao.getMemberInfo(mb_id));
		
		// 페이지 이동 (./member/memberUpdate.jsp)
		ActionForward forward = new ActionForward();
		forward.setPath("./member/memberUpdate.jsp");
		forward.setRedirect(false);		
		
		return forward;
	}

}
