package com.aim.nt.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDAO;
import com.aim.member.db.MemberDTO;
import com.aim.nt.db.NtDAO;
import com.aim.nt.db.NtDTO;

public class NtWriteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
						
		ActionForward forward = new ActionForward();
		if(mb_id == null || !mb_id.equals("admin")) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		MemberDAO dao2 = new MemberDAO();
		MemberDTO dto2 =  dao2.getMember(mb_id);
		request.setAttribute("dto2", dto2);
		
		NtDTO dto = new NtDTO();
						
		dto.setMb_id(request.getParameter("mb_id"));
		dto.setMb_pw(request.getParameter("mb_pw"));
		dto.setNt_content(request.getParameter("nt_content"));
		dto.setNt_subject(request.getParameter("nt_subject"));
				
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+request.getParameter("mb_id"));
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+request.getParameter("mb_pw"));
						
		
		NtDAO dao = new NtDAO();
		dao.NtBoard(dto);
							
		forward.setPath("./notice/ntwrite.jsp");
		forward.setRedirect(false);
								
		return forward;
			}

		}