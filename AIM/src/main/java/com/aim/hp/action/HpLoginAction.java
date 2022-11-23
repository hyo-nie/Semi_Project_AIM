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
		
//		HttpSession session = request.getSession();
//		String mb_id = (String)session.getAttribute("mb_id");
//		String mb_pw = (String)session.getAttribute("mb_pw");
//		
//		ActionForward forward = new ActionForward();
//		if(mb_id == null) {
//			forward.setPath("./Main.aim");
//			forward.setRedirect(true);
//			return forward;
//		}
//		
//		// DAO - 로그인 여부 체크 메서드 loginCheck()
//		HpDAO dao = new HpDAO();
//		int result = dao.loginCheck(mb_id, mb_pw);
//		
//		if(result == 0) {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print("<script>");
//			out.print("alert('비밀번호가 일치하지 않습니다');");
//			out.print("history.back();");
//			out.print("</script>");
//
//			out.close();
//			
//			return null;
//		}
//		
//		if(result == -1) {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print("<script>");
//			out.print("alert('로그인이 되어있지 않습니다');");
//			out.print("history.back();");
//			out.print("</script>");
//
//			out.close();
//			
//			return null;
//		}
//		
//		
//		
//		forward.setPath("./hp/boardhp.jsp");
//		forward.setRedirect(false);	
		
		//세션 제어
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
				
		ActionForward forward = new ActionForward();
		if(mb_id == null) {
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
		forward.setPath("./hp/boardhp.jsp");
		forward.setRedirect(false);
		return forward;
			
		
	}

}
