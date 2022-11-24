package com.aim.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberUpdateAction_execute() 호출 ");
		
		// 비회원 못 사용하게 세션 제어
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(mb_id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		dto = dao.getMember(mb_id);

		System.out.println("dto:" +dto);

//		// 전달정보(mb_id)
//		String mb_id = request.getParameter("mb_id");
		
//		// DAO - 회원정보 가져오기
//		MemberDAO dao = new MemberDAO();s
	
		// request 영역에 저장
		request.setAttribute("dto", dao.getMember(mb_id));
		
		// 페이지 이동 (./member/memberUpdate.jsp)
		forward.setPath("./member/memberUpdate.jsp");
		forward.setRedirect(false);		
		
		return forward;
	}

}
