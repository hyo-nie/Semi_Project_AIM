package com.aim.movie.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.movie.db.MovieDAO;

public class AdminMovieModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminMovieModifyAction_execute() 호출 ");
		
		// admin 전용 페이지 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null || !id.equals("admin")) {			
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달정보(movieCd)
		String movieCd = request.getParameter("movieCd");
		
		// DAO - 상품정보 가져오기
		MovieDAO dao = new MovieDAO();	
		
		// request 영역에 저장
		request.setAttribute("dto", dao.getMovieDetail(movieCd));
		
		// 페이지 이동 (./admin/AdminMovieModify.jsp)
		forward.setPath("./admin/adminMovieModify.jsp");
		forward.setRedirect(false);		
		
		return forward;
		
	}

	
}
