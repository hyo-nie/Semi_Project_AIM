package com.aim.nt.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.nt.db.NtDAO;

public class NtDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : NtDeleteAction_execute 호출 ");
		
		int nt_bno = Integer.parseInt(request.getParameter("nt_bno"));
		
		// DAO - 삭제 메서드
		NtDAO dao = new NtDAO();
		
		dao.NtDelete(nt_bno);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./NtList.nt");
		forward.setRedirect(true);
		return forward;
	}

}
