package com.aim.hp.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.nt.action.Action;
import com.aim.nt.action.ActionForward;

public class MyHpDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MyHpDeleteAction_execute() 호출 ");

		// 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("mb_id");
				
			ActionForward forward = new ActionForward();
				if(id == null) {
					forward.setPath("./Login.aim");
					forward.setRedirect(true);
					return forward;
				}
		
		// 전달된 파라미터 (bno,pass,  pageNum)
		int hp_bno = Integer.parseInt(request.getParameter("hp_bno"));
		String hp_deletepw = request.getParameter("hp_deletepw");
		
		String pageNum = request.getParameter("pageNum");
		
		// HpDAO 객체 - 글삭제 메서드 
		HpDAO dao = new HpDAO();
		
		int result = dao.deleteHp(hp_bno, hp_deletepw);
		
		// 결과에 따른 페이지 이동(JS)
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) {
			out.print("<script>");
			out.print(" alert('게시판 글 삭제 완료!'); ");
			out.print(" location.href='./MyHpList.hp?pageNum="+pageNum+"'; ");
			out.print("</script>");
			out.close();
			
			return null;		
		}else if(result == 0) {
			out.print("<script>");
			out.print(" alert(' 비밀번호 오류! '); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;			
		}else {
			out.print("<script>");
			out.print(" alert(' 글 없음! '); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}		
			
	}

}