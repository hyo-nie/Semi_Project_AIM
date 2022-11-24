package com.aim.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDAO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {

		System.out.println(" M : MemberDeleteAction_execute 호출 ");

		// 전달정보 저장
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		
		// DAO - 회원정보 삭제(deleteMember())
		MemberDAO dao = new MemberDAO();
		int result = dao.MemberDelete(mb_id, mb_pw);
		
		System.out.println(" M : result : "+result);
		
		// 페이지 이동(js)
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result == -1) {
			out.print("<script>");
			out.print(" alert('회원정보가 없습니다.'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}else if(result == 0) {
			out.print("<script>");
			out.print(" alert('올바르게 비밀번호를 입력해주세요.'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}else { // result == 1
			// 세션 초기화
			HttpSession session = request.getSession();
			session.invalidate();
			
			out.print("<script>");
			out.print(" alert('회원 탈퇴가 완료되었습니다. 그동안 이용해주셔서 감사합니다.'); ");
			out.print(" location.href='./MyPage.aim'; ");
			out.print("</script>");
			out.close();
			
			return null;
		
		
		}
		
	}

}
