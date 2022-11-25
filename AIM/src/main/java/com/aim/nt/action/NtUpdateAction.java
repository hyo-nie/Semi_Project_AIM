package com.aim.nt.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;
import com.aim.nt.db.NtDAO;
import com.aim.nt.db.NtDTO;

public class NtUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : NtUpdateAction_execute() 실행 ");
		
		//세션 제어
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
				
		ActionForward forward = new ActionForward();
		if(mb_id == null || !mb_id.equals("admin")) {
			forward.setPath("./Main.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMember(mb_id);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@"+request.getParameter("mb_id"));
		System.out.println("@@@@@@@@@@@@@@@@@@@"+request.getParameter("mb_pw"));
		// 페이지 전달정보 저장
		int nt_bno = Integer.parseInt(request.getParameter("nt_bno"));
		String pageNum = request.getParameter("pageNum");
				
		// NtDAO 객체 생성
		NtDAO dao = new NtDAO();
				
		// DB에 저장된 수정할 글번호를 가져와서
		NtDTO dto = dao.getNtList(nt_bno);
				
		// request 영역에 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("mdto", mdto);
				
		// 페이지 이동(티켓)
		forward.setPath("./notice/ntupdate.jsp");
		forward.setRedirect(false);
				
		return forward;
	}

}
