package com.aim.theater.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.theater.db.RentDAO;
import com.aim.theater.db.RentDTO;

public class AdminReContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AdminReContentAction.execute() 호출 ");
		
		//세션제어(비회원접근불가)
		HttpSession session = request.getSession();
		String mb_id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(mb_id==null) {
			forward.setPath("./Main.aim");
			forward.setRedirect(true);
			return forward;
		}

		String pageNum = request.getParameter("pageNum");
		int r_re_ref = Integer.parseInt(request.getParameter("r_re_ref"));
		
		
		RentDAO dao = new RentDAO();
		//답글조회
		RentDTO dto = dao.getReContent(r_re_ref);
		
		
		//결과에따른 페이지 이동
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(dto == null) {
			out.print("<script>");
			out.print("alert('아직 답변이 없습니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		forward = new ActionForward();
		forward.setPath("./theater/rt_recontent.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
