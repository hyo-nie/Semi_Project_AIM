package com.aim.movie.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.aim.movie.db.MovieDAO;
import com.aim.movie.db.MovieVo;

public class AdminMovieInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MovieInsertAction.execute() 호출 ");
		
		// admin 전용 페이지 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null || !id.equals("admin")) {			
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		// 무비 API 호출 
		MovieAPI api = new MovieAPI();
		List<JSONObject> boxOfiiceList = api.requestAPI();
		
		// cgv 크롤링 (포스터, 예매율, 줄거리 추출)
		MovieDAO dao = new MovieDAO();
		List<MovieVo> cgvList = dao.getCGVdata();
		
		// request 객체에 저장
		request.setAttribute("boxOfficeList", boxOfiiceList);
		request.setAttribute("cgvList", cgvList);
		
		// 페이지 이동 준비
		forward.setPath("./admin/adminMovieInsertForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
