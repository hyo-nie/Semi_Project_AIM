package com.aim.hp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;

public class MyHpContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MyHpContentAction_execute() 호출");
		
		// 세션 저장
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("mb_id");
				
			ActionForward forward = new ActionForward();
				if(id == null) {
					forward.setPath("./Login.aim");
					forward.setRedirect(true);
					return forward;
				}
		
		// 전달정보(파라메터) 저장
		int hp_bno = Integer.parseInt(request.getParameter("hp_bno"));
		String pageNum = request.getParameter("pageNum");
		
		System.out.println(" M : hp_bno : "+hp_bno+", pageNum : "+pageNum);
		
		// DAO 객체 생성
		HpDAO dao = new HpDAO();
		
		// 글번호에 해당 글 정보를 가져오기
		HpDTO dto = dao.getHpList(hp_bno);
		
		// request 영역에 글정보를 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		// 페이지 이동(준비)
		forward.setPath("./hp/myhpcontent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}