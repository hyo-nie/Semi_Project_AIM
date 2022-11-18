package com.aim.hp.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.aim.hp.action.ActionForward;
import com.aim.member.db.MemberDAO;

public class HpCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : HpAdminAction_execute() 호출 ");
		
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		
		// DAO - 로그인 여부 체크 메서드 loginCheck()
		HpDAO dao = new HpDAO();
		int result = dao.loginCheck(mb_id, mb_pw);
		
		if(result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('비밀번호가 일치하지 않습니다');");
			out.print("history.back();");
			out.print("</script>");

			out.close();
			
			return null;
		}
		
		if(result == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('존재하지 않는 회원입니다');");
			out.print("history.back();");
			out.print("</script>");

			out.close();
			
			return null;
		}
		
		// 로그인 성공
		HttpSession session = request.getSession();
		session.setAttribute("mb_id", mb_id);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./HpAdmin.hp");
		forward.setRedirect(true);	
		
		return forward;
	}

}