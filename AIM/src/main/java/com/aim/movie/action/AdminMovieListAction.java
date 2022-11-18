package com.aim.movie.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.movie.db.MovieDAO;
import com.aim.movie.db.MovieDTO;

public class AdminMovieListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AdminMovieListAction.execute() 호출 ");
		
		// MovieDAO - adminGetMovieList()
		MovieDAO dao = new MovieDAO();
		List<MovieDTO> adminMovieList = dao.adminGetMovieList();
		
		// request에 저장
		request.setAttribute("adminMovieList", adminMovieList);
		
		// 페이지 이동 준비
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/adminMovieList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}	
