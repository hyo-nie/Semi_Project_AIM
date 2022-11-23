package com.aim.theater.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.member.db.MemberDTO;
import com.aim.theater.db.RentDAO;
import com.aim.theater.db.TheaterDAO;

public class RentalWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : RentalWrite.execute() 호출 ");
		
		
		//세션제어(id) - 로그인했는지 확인
		//로그인했을 때 세션영역에 저장한 아이디 정보를 불러옴
		HttpSession session = request.getSession();	
		String mb_id = (String) session.getAttribute("mb_id");
		
		
		//로그인상태 아니면 로그인페이지로 이동시킴
		ActionForward forward = new ActionForward();
		if(mb_id == null) {
			forward.setPath("./Main.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		
		TheaterDAO dao = new TheaterDAO();
		List movieList = dao.getMovieList();
		
		
		RentDAO dao2 = new RentDAO();
		//이름, 전화번호 불러오기
		MemberDTO memberInfo = dao2.getApplicantInfo(mb_id);
		
		request.setAttribute("movieList", movieList);
		request.setAttribute("memberInfo", memberInfo);
		
		//페이지 이동 준비

		forward.setPath("./theater/rental.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
