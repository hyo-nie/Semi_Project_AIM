package com.aim.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.member.db.MemberDAO;

public class FindIdAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    System.out.println("M : FindIdAction_execute()");
    
    // 전달정보
    String mb_name = request.getParameter("mb_name");
    String mb_tel = request.getParameter("mb_tel");
    
    MemberDAO dao = new MemberDAO();
    String mb_id = dao.findId(mb_name, mb_tel);
    
    if(mb_id == null) {
      PrintWriter out = response.getWriter();
      out.print("<script>");
      out.print("alert('일치하는 회원이 존재하지 않습니다');");
      out.print("history.back();");
      out.print("</script>");
      out.close();
      return null;  
    }
    
    request.setAttribute("mb_id", mb_id);
    
   ActionForward forward = new ActionForward();
   forward.setPath("./member/findIdAfter.jsp"); 
   forward.setRedirect(false);
   
   return forward;

  }

}