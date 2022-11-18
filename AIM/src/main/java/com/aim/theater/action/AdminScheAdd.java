package com.aim.theater.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.theater.db.TheaterDAO;

public class AdminScheAdd implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AdminScheAdd.execute() 호출 ");
		
		TheaterDAO dao = new TheaterDAO();
		List movieList = dao.getMovieList();
		
		request.setAttribute("movieList", movieList);
		
		// 페이지 이동 준비
		
		ActionForward forward = new ActionForward();
		forward.setPath("./theater/admin_sche_write.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
