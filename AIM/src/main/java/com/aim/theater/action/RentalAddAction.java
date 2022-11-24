package com.aim.theater.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.theater.db.RentDAO;
import com.aim.theater.db.RentDTO;

public class RentalAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : RentalAddAction.execute() 호출 ");
		
		RentDTO dto = new RentDTO();
		
		dto.setBranchCd(Integer.parseInt(request.getParameter("branchCd")));
		dto.setR_class(request.getParameter("r_class"));
		dto.setR_people(Integer.parseInt(request.getParameter("r_people")));
		dto.setHopeday(request.getParameter("hopeday"));
		dto.setHopestart(Integer.parseInt(request.getParameter("hopestart")));
		dto.setHopeend(Integer.parseInt(request.getParameter("hopeend")));
		dto.setMovieCd(request.getParameter("movieCd"));
		dto.setR_text(request.getParameter("r_text"));
		dto.setR_name(request.getParameter("r_name"));
		dto.setR_tel(request.getParameter("r_tel"));
		dto.setR_mb_pw(request.getParameter("r_mb_pw"));
		dto.setR_mb_id(request.getParameter("r_mb_id"));
		
		
		RentDAO dao = new RentDAO();
		
		dao.insertRent(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminRentalList.th");
		forward.setRedirect(true);
		return forward;

	}

}
