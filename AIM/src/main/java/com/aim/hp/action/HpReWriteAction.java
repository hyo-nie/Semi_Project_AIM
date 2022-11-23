package com.aim.hp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.aim.hp.action.Action;
import com.aim.hp.action.ActionForward;


public class HpReWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : HpReWriteAction_execute 실행");
		
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
				
			ActionForward forward = new ActionForward();
				if(mb_id == null) {
					forward.setPath("./Login.aim");
					forward.setRedirect(true);
					return forward;
				}
		
		
		// 전달 데이터 저장(pageNum,  bno,re_ref,re_lev,re_seq, 
		//                  subject,name,pass,content)
		
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
		
		// DAO 객체 생성
		HpDAO dao = new HpDAO();
		dao.reInsertHp(dto);
		
		//  페이지 이동(정보 저장)
		forward.setPath("./MyHpList.hp?pageNum="+pageNum);
		forward.setRedirect(true);
		return forward;
	}

}
