package com.aim.movie.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.movie.db.MovieDAO;

public class MovieHomeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println("M : MovieHomeListAction_execute() 호출");
	    
	    MovieDAO dao = new MovieDAO();
	    
	    List movieList = dao.allMovieList();
	    
	    request.setAttribute("movieList", movieList);
	    
	    
	    ActionForward forward = new ActionForward();
	    forward.setPath("./movie/movieHomeList.jsp");
	    forward.setRedirect(false);
	    
	    return forward;
	}
	
}
