package com.aim.movie.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.movie.db.MovieDAO;
import com.aim.movie.db.MovieDTO;

public class AdminMovieModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminMovieModifyProAction_execute 호출");
		
		// admin 전용 페이지 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null || !id.equals("admin")) {			
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달정보(DTO)
		MovieDTO dto = new MovieDTO();
		
		dto.setMovieNm(request.getParameter("movieNm"));
		dto.setOpenDt(request.getParameter("openDt"));
		dto.setGenreNm(request.getParameter("genreNm"));
		dto.setDirectors(request.getParameter("directors"));
		dto.setPoster(request.getParameter("poster"));
		dto.setWatchGradeNm(request.getParameter("watchGradeNm"));
		dto.setShowTm(request.getParameter("showTm"));
		dto.setActors(request.getParameter("actors"));
		dto.setContents(request.getParameter("contents"));
		String test = request.getParameter("boxrank");
		if (!test.equals("")) {
			dto.setBoxrank(Integer.parseInt(request.getParameter("boxrank")));
		}
		dto.setMovieCd(request.getParameter("movieCd"));
		
		System.out.println(" M : dto : " + dto);
		System.out.println(" M : dto : " + "영화 정보 수정 성공");
		
		// DAO - 영화 정보 수정메서드 (AdminMovieModify(DTO))
		MovieDAO dao = new MovieDAO();
		dao.AdminMovieModify(dto);
		System.out.println("영화수정성공");
		
		// 페이지 이동
		forward.setPath("./AdminMovieList.mv");
		forward.setRedirect(true);
		
		return forward;
	}

	
}
