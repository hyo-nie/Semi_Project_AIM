package com.aim.movie.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.movie.db.MovieDAO;

public class AdminMovieDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminMovieDeleteAction_execute 호출 ");
		
		// admin 전용 페이지 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null || !id.equals("admin")) {			
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달정보 저장
		String movieCd = request.getParameter("movieCd");
		
		// DAO - 삭제 메서드
		MovieDAO dao = new MovieDAO();
		dao.AdminMovieDelete(movieCd);
		
		// 페이지 이동
		
		forward.setPath("./AdminMovieList.mv");
		forward.setRedirect(true);
		
		return forward;

	}

}
