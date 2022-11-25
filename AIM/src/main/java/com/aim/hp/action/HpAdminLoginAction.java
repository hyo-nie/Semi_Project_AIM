package com.aim.hp.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.nt.db.NtDAO;
import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;
import com.aim.hp.action.Action;
import com.aim.hp.action.ActionForward;
import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;

public class HpAdminLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : HpAdminLoginAction_execute() 호출 ");
		

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
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMember(mb_id);
		
		String pageNum = request.getParameter("pageNum");
		
		HpDTO dto = new HpDTO();
		
		dto.setHp_bno(Integer.parseInt(request.getParameter("hp_bno")));
		dto.setHp_re_ref(Integer.parseInt(request.getParameter("hp_re_ref")));
		dto.setHp_re_lev(Integer.parseInt(request.getParameter("hp_re_lev")));
		dto.setHp_re_seq(Integer.parseInt(request.getParameter("hp_re_seq")));
		dto.setHp_subject(request.getParameter("hp_subject"));
		dto.setMb_id(request.getParameter("mb_id"));
		dto.setMb_pw(request.getParameter("mb_pw"));
		dto.setHp_content(request.getParameter("hp_content"));
		dto.setHp_select(request.getParameter("hp_select"));
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+request.getParameter("hp_content"));
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+request.getParameter("hp_subject"));
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+request.getParameter("hp_select"));
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+request.getParameter("mb_id"));
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+request.getParameter("mb_pw"));
		
		
		// 정보를 request 영역에 저장(view 전달)
		request.setAttribute("dto", dto);
		request.setAttribute("mdto", mdto);
		request.setAttribute("pageNum", pageNum);
				
		// 페이지 이동
		forward.setPath("./hp/rewriteForm.jsp");
		forward.setRedirect(false);
		return forward;
			
		
	}

}
