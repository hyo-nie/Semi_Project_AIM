package com.aim.hp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.aim.hp.action.Action;
import com.aim.hp.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : WriteAction_execute() 호출");
		
		// 한글 처리 -> 매핑함
		// 세션 처리 
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(mb_id == null) {
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		
		
		// 전달정보 저장 (AskDTO)
		HpDTO dto = new HpDTO();
		
		dto.setMb_id(request.getParameter("mb_id"));
		dto.setMb_pw(request.getParameter("mb_pw"));
		dto.setHp_subject(request.getParameter("hp_subject"));
		dto.setHp_content(request.getParameter("hp_content"));
		dto.setHp_select(Integer.parseInt(request.getParameter("hp_select")));
		
		
		
		// AskDAO 객체
		HpDAO dao = new HpDAO();
		
		// AskBoard()
		dao.HpBoard(dto);
			
		// 페이지 이동정보 생성(티켓 생성)
		forward.setPath("./MyHpList.hp");
		forward.setRedirect(true);
				
		return forward;
	}

}
