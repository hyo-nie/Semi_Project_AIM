package com.aim.theater.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.theater.db.RentDAO;
import com.aim.theater.db.RentDTO;

public class AdminRentalRewriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : AdminRentalRewriteAction_excute() 호출");
		
		//세션제어(관리자 여부)
		HttpSession session = request.getSession();
		String mb_id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(mb_id==null || !mb_id.equals("admin")) {
			forward.setPath("./Main.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		//전달된 파라미터 pageNum rno r_re_ref r_re_lev r_re_seq r_name r_text
		
		String pageNum = request.getParameter("pageNum");
		
		RentDTO dto = new RentDTO();
		dto.setRno(Integer.parseInt(request.getParameter("rno")));
		dto.setR_re_ref(Integer.parseInt(request.getParameter("r_re_ref")));
		dto.setR_re_lev(Integer.parseInt(request.getParameter("r_re_lev")));
		dto.setR_re_seq(Integer.parseInt(request.getParameter("r_re_seq")));
		
		dto.setBranchCd(Integer.parseInt(request.getParameter("branchCd")));
		dto.setR_class(request.getParameter("r_class"));
		dto.setR_people(Integer.parseInt(request.getParameter("r_people")));
		dto.setHopeday(request.getParameter("hopeday"));
		dto.setHopestart(Integer.parseInt(request.getParameter("hopestart")));
		dto.setHopeend(Integer.parseInt(request.getParameter("hopeend")));
		dto.setMovieCd(request.getParameter("movieCd"));
		dto.setR_tel(request.getParameter("r_tel"));
		
		
		dto.setR_name(request.getParameter("r_name"));
		dto.setR_text(request.getParameter("r_text"));
		
		RentDAO dao = new RentDAO();
		dao.reInsertRent(dto);
		
		//페이지이동
		forward.setPath("./AdminRentalList.th?pageNum"+pageNum);
		forward.setRedirect(true);
		return forward;
	}

}
