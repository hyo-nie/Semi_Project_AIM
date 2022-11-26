package com.aim.hp.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;
import com.aim.hp.action.Action;
import com.aim.hp.action.ActionForward;

public class HpLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : HpLoginAction_execute() 호출 ");
		

		//세션 제어
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
				
		if(mb_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
					out.print("<script>");
					out.print("alert('로그인이 필요합니다.');");
					out.print("location.href='./Login.aim?url=HpLogin.hp';");
					out.print("</script>");
					out.flush();
					return null;
				}
				
		// DAO - 회원정보 가져오는 메서드 ( getMember(ID) )
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember(mb_id);
		
		// 정보를 request 영역에 저장(view 전달)
		request.setAttribute("dto", dto);
				
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./hp/boardhp.jsp");
		forward.setRedirect(false);
		return forward;
			
		
	}

}
