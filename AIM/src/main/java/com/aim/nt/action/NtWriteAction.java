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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NtWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : NtWriteAction_execute() ");
		
		//세션 제어
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
				
		ActionForward forward = new ActionForward();
		if(mb_id == null || !mb_id.equals("admin")) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
				
		// 전달정보 저장 (NtDTO)
		NtDTO dto = new NtDTO();
				
		dto.setMb_id(request.getParameter("mb_id"));
		dto.setMb_pw(request.getParameter("mb_pw"));
		dto.setNt_content(request.getParameter("nt_content"));
		dto.setNt_subject(request.getParameter("nt_subject"));
		
		// NtDAO 객체
		NtDAO dao = new NtDAO();
				
		// NtBoard()
		dao.NtBoard(dto);
					
		// 페이지 이동정보 생성(티켓 생성)
		forward.setPath("./NtList.nt");
		forward.setRedirect(true);
						
		return forward;
			}

		}
