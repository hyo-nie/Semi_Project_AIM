package com.aim.theater.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.theater.db.RentDAO;

public class AdminPwCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AdminPwCheckAction.execute() 호출 ");
		
		//전달된 파라미터 bno pass pageNum
		int rno = Integer.parseInt(request.getParameter("rno"));
		String r_mb_pw = request.getParameter("r_mb_pw");
		String r_mb_id = request.getParameter("r_mb_id");
		String pageNum = request.getParameter("pageNum");
		
		RentDAO dao = new RentDAO();
		
		//패스워드 체크 후 결과값에따라 게시글확인
		int result = dao.goContent(rno,r_mb_pw);
		
		//결과에따른 페이지 이동
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) {
			out.print("<script>");
			out.print("alert('본인확인완료');");
			out.print("location.href='./AdminRentalContent.th?rno="+rno+"&pageNum="+pageNum+"';");
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
