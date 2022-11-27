package com.aim.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;

public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("MemberJoinAction 호출");
		
		MemberDTO dto = new MemberDTO();
		dto.setMb_id(request.getParameter("mb_id"));
		dto.setMb_pw(request.getParameter("mb_pw"));
		dto.setMb_name(request.getParameter("mb_name"));
		dto.setMb_nick(request.getParameter("mb_nick"));
		
		String telArr = request.getParameter("mb_tel2") + "-" + request.getParameter("mb_tel3") + "-" + request.getParameter("mb_tel4");
		
		String birthArr = request.getParameter("mb_birth1") + "-" +  request.getParameter("mb_birth2") + "-" + request.getParameter("mb_birth3");
		
		dto.setMb_tel(telArr);
		dto.setMb_birth(birthArr);
		
		System.out.println(" M : dto : " + dto);
		
		MemberDAO dao = new MemberDAO();
		dao.memberJoin(dto);
		System.out.println(" M : dto : " + "회원가입 성공");
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Login.aim"); // 로그인페이지
		forward.setRedirect(true);
		
		return forward;
	}

}
