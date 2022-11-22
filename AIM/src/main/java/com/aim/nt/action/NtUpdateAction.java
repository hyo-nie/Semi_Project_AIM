package com.aim.nt.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.aim.nt.db.NtDAO;
import com.aim.nt.db.NtDTO;

public class NtUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : NtUpdateAction_execute() 실행 ");
		
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
				
		// 페이지 이동(티켓)
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/ntupdate.jsp");
		forward.setRedirect(false);
				
		return forward;
	}

}
