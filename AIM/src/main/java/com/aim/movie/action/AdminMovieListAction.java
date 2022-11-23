package com.aim.movie.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.movie.db.MovieDAO;
import com.aim.movie.db.MovieDTO;

public class AdminMovieListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AdminMovieListAction.execute() 호출 ");
		
		// admin 전용 페이지 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null || !id.equals("admin")) {			
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		// MovieDAO - adminGetMovieList()
		MovieDAO dao = new MovieDAO();
		List<MovieDTO> adminMovieList = dao.adminGetMovieList();
		
		// request에 저장
		request.setAttribute("adminMovieList", adminMovieList);
		
		// 페이지 이동 준비
		forward.setPath("./admin/adminMovieList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}	
