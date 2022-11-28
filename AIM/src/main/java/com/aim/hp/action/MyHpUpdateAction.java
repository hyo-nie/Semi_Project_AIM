package com.aim.hp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.aim.hp.action.Action;
import com.aim.hp.action.ActionForward;

public class MyHpUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MyHpUpdateAction_execute() 호출  ");
		
		// 세션제어
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
				
			ActionForward forward = new ActionForward();
				if(mb_id == null) {
					forward.setPath("./Login.aim");
					forward.setRedirect(true);
					return forward;
				}
		
		// 페이지 전달정보 저장
		int hp_bno = Integer.parseInt(request.getParameter("hp_bno"));
		String pageNum = request.getParameter("pageNum");
		
		// AskDAO 객체 생성
		HpDAO dao = new HpDAO();
		
		// DB에 저장된 수정할 글번호를 가져와서
		HpDTO dto = dao.getHp(hp_bno);
		
		// request 영역에 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		// 페이지 이동(티켓)
		forward.setPath("./hp/myhpupdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}