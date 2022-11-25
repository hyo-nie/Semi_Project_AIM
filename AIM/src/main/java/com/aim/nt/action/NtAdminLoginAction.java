package com.aim.nt.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.nt.db.NtDAO;
import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;
import com.aim.nt.action.Action;
import com.aim.nt.action.ActionForward;

public class NtAdminLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : HpLoginAction_execute() 호출 ");
		
		//세션 제어
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
				
		ActionForward forward = new ActionForward();
		if(mb_id == null || !mb_id.equals("admin")) {
					forward.setPath("./Login.aim");
					forward.setRedirect(true);
					return forward;
				}
				
		// DAO - 회원정보 가져오는 메서드 ( getMember(ID) )
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember(mb_id);
		
		// 정보를 request 영역에 저장(view 전달)
		request.setAttribute("dto", dto);
				
		// 페이지 이동
		forward.setPath("./notice/ntwrite.jsp");
		forward.setRedirect(false);
		return forward;
			
		
	}

}
