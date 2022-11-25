package com.aim.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.member.db.MemberDAO;

public class IdCheckAjaxAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : IdCheckAjaxAction.execute() 호출 ");
		
		MemberDAO mbDAO = new MemberDAO();
		String id = request.getParameter("userId");
		
		int result = mbDAO.IdCheckAjax(id);
		
		PrintWriter out = response.getWriter();
		
		if (result == 0) {
			System.out.println("이미 존재하는 아이디입니다!");
		} else {
			System.out.println("사용 가능한 아이디입니다!");
		}
		
		out.write(result + "");
		
		return null;
	}

}
