package com.aim.theater.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.theater.db.TheaterDAO;

public class adminScheModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달정보
		int scCode = Integer.parseInt(request.getParameter("scCode"));
		
		TheaterDAO dao = new TheaterDAO();
		List getmovie = dao.getMovieList();
		
		request.setAttribute("getsche", dao.getAdminSche(scCode));
		request.setAttribute("getmovie", getmovie);
		
		//페이지 이동(./theater/admin_sche_modify.jsp)
		ActionForward forward = new ActionForward();
		forward.setPath("./theater/admin_sche_modify.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
