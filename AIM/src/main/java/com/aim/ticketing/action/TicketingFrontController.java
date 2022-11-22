package com.aim.ticketing.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.tk")
public class TicketingFrontController extends HttpServlet {

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
    	
    	if (command.equals("/Ticketing.tk")) {
    		System.out.println(" C : /Ticketing.tk" );
    		System.out.println(" [패턴3] ");
    		
    		// TicketingAction 객체 생성
    		action = new TicketingAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // Ticketing.tk 끝
    	
    	else if (command.equals("/TheaterClick.tk")) {
    		System.out.println(" C : /TheaterClick.tk ");
    		System.out.println(" C : [패턴3] ");
    		
    		// TheaterClickAction() 객체 생성
    		action = new TheaterClickAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // TheaterClick.tk 끝
    	
    	else if (command.equals("/MovieClick.tk")) {
    		System.out.println(" C : /MovieClick.tk ");
    		System.out.println(" C : [패턴3] ");
    		
    		// MovieClickAction 객체
    		action = new MovieClickAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // MovieClick.tk 끝
    	
    	else if (command.equals("/MovieClick2.tk")) {
    		System.out.println(" C : /MovieClick2.tk ");
    		System.out.println(" C : [패턴3] ");
    		
    		// MovieClickAction2 객체
    		action = new MovieClickAction2();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // MovieClick2.tk 끝
    	
    	else if (command.equals("/DateClick.tk")) {
    		System.out.println(" C : /DateClick.tk ");
    		System.out.println(" C : [패턴3] ");
    		
    		// DateClickAction 객체
    		action = new DateClickAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // DateClick.tk 끝
    	
    	else if (command.equals("/DateClick2.tk")) {
    		System.out.println(" C : /DateClick2.tk ");
    		System.out.println(" C : [패턴3] ");
    		
    		// DateClickAction2 객체
    		action = new DateClickAction2();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // DateClick.tk2 끝
    	
    	else if (command.equals("/SelectSeat.tk")) {
    		System.out.println(" C : /SelectSeat.tk ");
    		System.out.println(" C : [패턴3] ");
    		
    		// SelectSeatAction 객체
    		action = new SelectSeatAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // SelectSeat.mv 끝
    	
    	else if (command.equals("/TicketingOrder.tk")) {
    		System.out.println(" C : /TicketingOrder.tk ");
    		System.out.println(" [패턴3] ");
    		
    		// TicketingOrderAction 객체
    		action = new TicketingOrderAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // TicketingOrder.tk 끝
    	
    	else if (command.equals("/OrderSuccess.tk")) {
    		System.out.println(" C : /OrderSuccess.tk ");
    		System.out.println(" [패턴3] ");
    		
    		// OrderSuccessAction 객체
    		action = new OrderSuccessAction();
    		
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} // OrderSuccess.tk 끝
    	

    	
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
