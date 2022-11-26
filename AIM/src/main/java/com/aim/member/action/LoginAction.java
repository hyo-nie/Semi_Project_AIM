package com.aim.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDAO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : LoginAction_execute() 호출 ");
		
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		String movieCd = request.getParameter("movieCd");
		String url = request.getParameter("url");
		
		
		// Ticketing 에서 넘어왔으면
		String ticketing = request.getParameter("ticketing");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ticketing);
		
		// DAO - 로그인 여부 체크 메서드 loginCheck()
		MemberDAO dao = new MemberDAO();
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
		
		if (ticketing!=null && ticketing.equals("Y")) {
			forward.setPath("./Ticketing.tk");
			forward.setRedirect(true);
			return forward;
		}
		if(mb_id != null) {
			forward.setPath("./HpLogin.hp?mb_id="+mb_id);
			forward.setRedirect(true);
			return forward;
		}
		if(movieCd!=null && url!=null) {
			forward.setPath("./"+url+"?movieCd="+movieCd);
			forward.setRedirect(true);
		} else {
			forward.setPath("./Main.aim");
			forward.setRedirect(true);	
		}
		return forward;
	}

}
