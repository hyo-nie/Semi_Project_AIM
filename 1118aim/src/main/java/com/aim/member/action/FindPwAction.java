package com.aim.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.member.db.MemberDAO;

public class FindPwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : findPwAction_execute()");
		
		ActionForward forward = new ActionForward();
		
		// 전달정보 id, tel
		String mb_id = request.getParameter("mb_id");
		String mb_tel = request.getParameter("mb_tel");
		
		// DAO - 패스워드 체크
		MemberDAO dao = new MemberDAO();
		int result = dao.findPw(mb_id, mb_tel);

		
		if(result == 1) {	// 비밀번호를 찾았다면
			forward.setPath("./UpdatePw.aim");
			forward.setRedirect(true);
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('일치하는 회원정보가 없습니다!');");
			out.print("history.back();");
			out.print("</script>");
			
			out.close();
			
			return null;
		}
		

		return forward;
		
	}

}
