package com.aim.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;

public class MemberUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberUpdateProAction_execute 호출");
		
		// 마이페이지 비회원 안되게
		
		// 전달정보(DTO)
		MemberDTO dto = new MemberDTO();
		
		dto.setMb_id(request.getParameter("mb_id"));
		dto.setMb_pw(request.getParameter("mb_pw"));
		dto.setMb_name(request.getParameter("mb_name"));
		dto.setMb_nick(request.getParameter("mb_nick"));
		dto.setMb_tel(request.getParameter("mb_tel"));
		
		System.out.println(" M : dto : " + dto);
		
		// DAO - 회원 정보 수정 메서드 (MemberUpdate
		MemberDAO dao = new MemberDAO();
//		dao.MemberUpdate(dto);
		System.out.println(" M : dto : " + " 회원 정보 수정 성공");
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./MyPage.aim");
		forward.setRedirect(true);

		return forward;
	}

}
