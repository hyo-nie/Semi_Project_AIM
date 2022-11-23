package com.aim.theater.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDTO;
import com.aim.theater.db.TheaterDAO;

public class AdminScheAdd implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AdminScheAdd.execute() 호출 ");
		
		
		
		TheaterDAO dao = new TheaterDAO();
		
		//영화정보 불러오기
		List rentmovieList = dao.getMovieList();
		

		request.setAttribute("movieList", rentmovieList);
		
		// 페이지 이동 준비
		ActionForward forward = new ActionForward();
		forward.setPath("./theater/admin_sche_write.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
