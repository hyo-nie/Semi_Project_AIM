package com.aim.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.movie.action.AdminMovieInsert;

@WebServlet("*.aim")
public class MemberFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 1. 가상 주소를 계산
		System.out.println("C : 1. 가상주소 계산 시작");

		String requestURI = request.getRequestURI();		
		System.out.println("C : requestURI : " + requestURI);
				
		String ctxPath = request.getContextPath();	
		System.out.println("C : ctxPath : " + ctxPath);
				
		String command = requestURI.substring(ctxPath.length());
		System.out.println("C : command : " + command);
				
		System.out.println("C : 1. 가상주소 계산 끝\n");
		
		// 2. 가상주소 매핑
    	System.out.println("C : 2. 가상주소 매핑 시작");

    	Action action = null;
    	ActionForward forward = null;
    	
    	if(command.equals("/Login.aim")) {						// 로그인 페이지
    		System.out.println("C : /Login.aim 호출");
    		System.out.println("C : 패턴1 사용 - view 호출");
    		
    		forward = new ActionForward();
    		forward.setPath("/member/loginForm.jsp");
    		forward.setRedirect(false);
    		
    	} // Login.aim 끝
    	else if(command.equals("/LoginAction.aim")) {			
    		System.out.println("C : /LoginAction.mo");
    		System.out.println("C : 패턴2 - DB사용, 페이지 이동");
    		
    		// LoginAction()
    		action = new LoginAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // LoginAction.aim 끝
    	
    	else if(command.equals("/FindPw.aim")) {				// 비밀번호 찾기 페이지
    		System.out.println("C : /FindPw.aim 호출");
    		System.out.println("C : 패턴1");
    		
    		forward = new ActionForward();
    		forward.setPath("./member/findPw.jsp");
    		forward.setRedirect(false);
    		
    	} // FindPw.aim 끝
    	
    	else if(command.equals("/FindPwAction.aim")) {
    		System.out.println("C : /FindPwAction.aim 호출");
    		System.out.println("C : 패턴2 - DB사용, 페이지 이동");
    		
    		action = new FindPwAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // FindPwAction.aim 끝
    	
    	else if(command.equals("/UpdatePw.aim")){				// 패스워드 변경 페이지
    		System.out.println("C : /UpdatePw.aim 호출 / 패턴1 - view 출력");
    		
    		forward = new ActionForward();
    		forward.setPath("./member/updatePw.jsp");
    		forward.setRedirect(false);
    		
    	} // UpdatePw.aim 끝
    	
    	else if(command.equals("/UpdatePwAction.aim")) {
    		System.out.println("C : /UpdatePwAction.aim 호출 / 패턴2 - DB사용, 페이지 이동");
    		
    		// UpdatePwAction()
    		action = new UpdatePwAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // UpdatePwAction.aim
    	
    	else if(command.equals("/FindId.aim")) {				// 아이디 찾기
    		System.out.println("C : /findId.mo 호출 / 패턴1");
    		
    		forward = new ActionForward();
    		forward.setPath("./member/findId.jsp");
    		forward.setRedirect(false);
    		
    	} // FindId.aim
    	
    	else if(command.equals("/FindIdAction.aim")) {
            System.out.println("C : /FindIdAction.aim 호출");
            
            action = new FindIdAction();
            try {
              forward = action.execute(request, response);
           } catch (Exception e) {
              e.printStackTrace();
           }
        } // FindIdAction.aim 
    	else if(command.equals("/JoinTerms.aim")) {				// 회원가입 약관
    		System.out.println(" C : /JoinTerms.aim 호출 / 패턴1");
    		
    		forward = new ActionForward();
    		forward.setPath("./member/join_Terms.jsp");
    		forward.setRedirect(false);
    		
    	}
    	
    	else if(command.equals("/Join.aim")) {				// 회원가입
     		System.out.println(" C : /Join.aim 호출 / 패턴1");
	   		
 	   		forward = new ActionForward();
 	   		forward.setPath("./member/joinformnew.jsp");
 	   		forward.setRedirect(false);
 	   		
     	} // Join.aim 끝
    	
    	else if(command.equals("/JoinAction.aim")) {
	   		System.out.println(" C : /JoinAction.me 호출");
	   		
		   	// MemberJoinAction() 객체
	   		action = new JoinAction();
	   		
	   		try {
				forward = action.execute(request, response);
				System.out.println(" C : 페이지이동 " + forward);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // JoinAction.aim 끝
    	
    	else if(command.equals("/JoinSuccess.aim")) {				// 회원가입 성공
    		System.out.println(" C : /JoinSuccess.aim 호출 / 패턴1");
    		
    		forward = new ActionForward();
    		forward.setPath("./member/join_success.jsp");
    		forward.setRedirect(false);
    		
    	}
    	
    	
    	else if(command.equals("/IdCheck.aim")) {			// 아이디 중복 확인
   			System.out.println(" C : /IdCheck.aim 호출");
   			
   			forward  = new ActionForward();
   			forward.setPath("./member/idCheck.jsp");
   			forward.setRedirect(false);
   			
	   	} // IdCheck.aim 끝
    	
    	else if(command.equals("/IdCheckAction.aim")) {
	   		System.out.println(" C : /IdCheckAction.aim 호출");
	
	   		// IdCheckAction() 객체
	   		action = new IdCheckAction();
	   		
	   		try {
				forward = action.execute(request, response);
	   		} catch (Exception e) {
				e.printStackTrace();
			}
	   	} // IdCheckAction.aim 끝
    	
    	else if(command.equals("/NickCheck.aim")) {				// 닉네임 중복 확인
   			System.out.println(" C : /NickCheck.aim 호출");
   			
   			forward  = new ActionForward();
   			forward.setPath("./member/nickCheck.jsp");
   			forward.setRedirect(false);
   			
	   	} // NickCheck.aim 끝
    	
    	else if(command.equals("/NickCheckAction.aim")) {
	   		System.out.println(" C : /NickCheckAction.aim 호출");
	
	   		// NickCheckAction() 객체
	   		action = new NickCheckAction();
	   		
	   		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   	} // NickCheckAction.aim 끝
    	
    	else if (command.equals("/Main.aim")) {
    		System.out.println(" C : /Main.aim 호출 ");
    		
    		// MainAction.aim
    		action = new MainAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // Main.aim 끝
    	
    	else if (command.equals("/Logout.aim")) {
    		
    		// LogoutAction() 객체
    		action = new LogoutAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // Logout.aim 끝
    	
    	else if (command.equals("/AdminPage.aim")) {
    		System.out.println(" C : /AdminPage.aim 호출 ");
    		System.out.println(" [패턴1]");
    		
    		forward = new ActionForward();
    		forward.setPath("./admin/adminPage.jsp");
    		forward.setRedirect(false);
    	} // AdminPage.aim 끝
    	
    	else if (command.equals("/MyPage.aim")) {
    		System.out.println("C : /MyPage.aim 호출");
    		System.out.println("[패턴3]");
    		
    		action = new MyPageAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // MyPage.aim 끝
    	
    	else if(command.equals("/MemberUpdate.aim")) {       
        System.out.println("C : /MemberUpdate.aim 호출");
        System.out.println("[패턴1]");
        
        forward = new ActionForward();
        forward.setPath("./member/memberUpdate.jsp");
        forward.setRedirect(false);
        
      } // MemberUpdate.aim 끝
    	
    	else if(command.equals("/MemberDelete.aim")) {       
        System.out.println("C : /MemberDelete.aim 호출");
        System.out.println("[패턴1]");
        
        forward = new ActionForward();
        forward.setPath("./member/memberDelete.jsp");
        forward.setRedirect(false);
        
      } // MemberUpdate.aim 끝
    	

    	
    	System.out.println("C : 2. 가상주소 매핑 끝\n");
	
    	// 3. 페이지 이동
    	System.out.println("C : 3. 페이지 이동 시작");
    	
    	if(forward != null) {		// 이동경로가 있음
    		if(forward.isRedirect()) {		// true 일 때,
				System.out.println("C : sendRedirect() : " + forward.getPath());
				response.sendRedirect(forward.getPath());
    		} else {						// false 일 때,
				System.out.println("C : forward() : " + forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
    		}
    	}
    	
    	System.out.println("C : 3. 페이지 이동 끝\n");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
}
