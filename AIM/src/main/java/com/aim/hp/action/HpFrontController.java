package com.aim.hp.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.nt.action.Action;
import com.aim.nt.action.ActionForward;

@WebServlet("*.hp")
public class HpFrontController extends HttpServlet {

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
		System.out.println("===============================================");
		System.out.println();
		
		// 2. 가상주소 매핑
		System.out.println("===============================================");
		System.out.println("C : 2. 가상주소 매핑 시작");
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	// 로그인 여부 체크
    	if(command.equals("/HpCheck.hp")){
    		System.out.println(" C : /HpCheck.hp 실행");
    		
    		action = new HpCheckAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	
    	
    	// 고객센터 로그인 여부 체크
    	else if(command.equals("/HpLogin.hp")) { 
    		System.out.println(" C : /HpLogin.hp 실행 ");
    		
    		action = new HpLoginAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    		
    	
    	// 문의글 작성
    	else if(command.equals("/Write.hp")) {
    		System.out.println(" C : /Write.hp 실행");
    		
    		// WriteAction() 객체
    		action = new WriteAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	
    	// 문의 리스트 출력
    	else if(command.equals("/MyHpList.hp")) {
    		System.out.println(" C : /MyHpList.hp 실행");
    		
    		// MyAskListAction() 객체
    		action = new MyHpListAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    		
    	}
    	// 문의한 내용 출력
    	else if(command.equals("/MyHpContent.hp")) {
    		System.out.println(" C : /MyHpContent.hp 실행");
    		
    		// MyAskContentAction() 객체
    		action = new MyHpContentAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	// 문의한 내용 수정 전 저장
    	else if(command.equals("/MyHpUpdate.hp")) {
    		System.out.println(" C : MyHpUpdate.hp 실행");
    		
    		//MyAskUpdateAction() 객체
    		action = new MyHpUpdateAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	// 문의한 내용 수정
    	else if(command.equals("/MyHpUpdatePro.hp")) {
    		System.out.println(" C : MyHpUpdatePro.hp 실행");
    	
    		// MyAskUpdateProAction() 객체
    		action = new MyHpUpdateProAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	// 문의한 내용 삭제 유무 확인
    	else if(command.equals("/MyHpDeleteCheck.hp")) {
    		System.out.println(" C : MyHpDeleteCheck.hp 실행 ");
    		
    		forward = new ActionForward();
			forward.setPath("./hp/hpdelete.jsp");
			forward.setRedirect(false);	
    	}
    	
    	
    	// 문의 내용 삭제
    	else if(command.equals("/MyHpDelete.hp")) {
    		System.out.println(" C : MyHpDelete.hp 실행");
    		
    		// MyHpDeleteAction()
    		action = new MyHpDeleteAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	
    	
    	System.out.println("C : 2. 가상주소 매핑 끝\n");
    	System.out.println("===============================================");
		System.out.println();
		
		// 3. 페이지 이동
		System.out.println("===============================================");
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
