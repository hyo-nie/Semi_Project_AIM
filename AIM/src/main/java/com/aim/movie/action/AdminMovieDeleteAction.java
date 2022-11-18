package com.aim.movie.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.movie.db.MovieDAO;

public class AdminMovieDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminMovieDeleteAction_execute 호출 ");
		
		// 전달정보 저장
		String movieCd = request.getParameter("movieCd");
		
		// DAO - 삭제 메서드
		MovieDAO dao = new MovieDAO();
		dao.AdminMovieDelete(movieCd);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminMovieList.mv");
		forward.setRedirect(true);
		
		return forward;

	}

}
