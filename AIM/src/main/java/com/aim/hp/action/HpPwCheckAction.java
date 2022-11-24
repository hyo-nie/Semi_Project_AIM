package com.aim.hp.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.hp.db.HpDAO;
import com.aim.theater.db.RentDAO;

public class HpPwCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println(" M :HpPwCheckAction.execute() 호출 ");
		
		//전달된 파라미터 hp_bno pass pageNum
		int hp_bno = Integer.parseInt(request.getParameter("hp_bno"));
		String mb_pw = request.getParameter("mb_pw");
		String mb_id = request.getParameter("mb_id");
		String pageNum = request.getParameter("pageNum");
		
		HpDAO dao = new HpDAO();
		
		//패스워드 체크 후 결과값에따라 게시글확인
		int result = dao.CheckList(hp_bno,mb_pw);
		
		//결과에따른 페이지 이동
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) {
			out.print("<script>");
			out.print("alert('본인확인완료');");
			out.print("location.href='./MyHpContent.hp?hp_bno="+hp_bno+"&pageNum="+pageNum+"';");
//										./MyHpContent.hp?hp_bno=${dto.hp_bno }&pageNum=${pageNum}
			out.print("</script>");
			out.close();
			
			return null;
		}else if(result == 0) {
			out.print("<script>");
			out.print("alert('비밀번호 오류');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			
			return null;
		}else {
			out.print("<script>");
			out.print("alert('글없음');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		
	}

}
