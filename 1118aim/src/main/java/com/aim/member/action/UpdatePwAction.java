package com.aim.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.aim.member.db.MemberDAO;

public class UpdatePwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 전달정보 처리
		String id = request.getParameter("id");
//		System.out.println("id : " + id);
		String newPw = request.getParameter("newPw");
		
		// dao로 가서 oldPw가 dao에 있다면 pw를 update 시켜줌
		MemberDAO dao = new MemberDAO();
		dao.UpdatePw(id, newPw);
		
		System.out.println("M : 비밀번호 변경 완료");
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Login.aim");
		forward.setRedirect(true);
		
		return forward;
	}

}
