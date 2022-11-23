package com.aim.nt.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.aim.nt.db.NtDAO;
import com.aim.nt.db.NtDTO;

public class NtContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : NtcontentAction_execute() 실행 ");
		
		// 전달정보(파라메터) 저장
		int nt_bno = Integer.parseInt(request.getParameter("nt_bno"));
		String pageNum = request.getParameter("pageNum");
				
		System.out.println(" M : nt_bno : "+nt_bno+", pageNum : "+pageNum);
				
		// DAO 객체 생성
		NtDAO dao = new NtDAO();
				
		// 글번호에 해당 글 정보를 가져오기
		NtDTO dto = dao.getNtList(nt_bno);
				
		// request 영역에 글정보를 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
				
		// 페이지 이동(준비)
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/ntcontent.jsp");
		forward.setRedirect(false);
				
		return forward;
	}

}
