package com.aim.store.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.ad")
public class AdminStoreFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 1. 가상 주소를 계산
				System.out.println("C : 1. 가상주소 계산 시작");

				String requestURI = request.getRequestURI();		
				System.out.println("C : requestURI : " + requestURI);
						
				String ctxPath = request.getContextPath();	
				System.out.println("C : ctxPath : " + ctxPath);
						
				String command = requestURI.substring(ctxPath.length());
				System.out.println("C : command : " + command);
						
				System.out.println("C : 1. 가상주소 계산 끝");
				
				
				// 2. 가상주소 매핑
		    	System.out.println("C : 2. 가상주소 매핑 시작");
		    	
		    	Action action = null;
		    	ActionForward forward = null;
		    	
		    	if(command.equals("/AdminStoreAdd.ad")) {
		    		System.out.println("C: /AdminStoreAdd.ad ");
		    		
		    		forward = new ActionForward();
		    		forward.setPath("./store/admin_store_add.jsp");
		    		forward.setRedirect(false);
		    		
		    	} else if(command.equals("/AdminStoreAddAction.ad")) {
		    		System.out.println("C : /AdminStoreAddAction.ad");
		    		
		    		action = new AdminStoreAddAction();
		    		try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
		    		
		    	} else if(command.equals("/AdminStoreList.ad")) {
		    		System.out.println("C : /AdminStoreList.ad ");
		    		
		    		action = new AdminStoreListAction();
		    		try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
		    		
		    	} else if(command.equals("/AdminStoreDel.ad")) {
		    		System.out.println("C: /AdminStoreDel.ad ");
		    		
		    		action = new AdminStoreDeleteAction();
		    		try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
		    		
		    	} else if(command.equals("/AdminStoreModify.ad")) {
		    		System.out.println("C : /AdminStoreModify.ad");
		    		
		    		action = new AdminStoreModifyAction();
		    		try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
		    		
		    	} else if(command.equals("/AdminStoreModifyPro.ad")) {
		    		System.out.println("C : /AdminStoreModifyPro.ad");
		    		
		    		action = new AdminStoreModifyProAction();
		    		try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
		    	} 
//		    	else if(command.equals("/AdminPickAdd.ad")) {
//		    		System.out.println("C : /AdminPickAdd.ad");
//		    		
//		    		forward = new ActionForward();
//		    		forward.setPath("./store/admin_pick_add.jsp");
//		    		forward.setRedirect(false);
//		    		
//		    	}
		    	
		    	
		    	
		    	System.out.println("C : 2. 가상주소 매핑 끝");
		    	
		    	// 3. 페이지 이동
		    	System.out.println("C : 3. 페이지 이동 시작");
		    	
		    	if(forward != null) {				// 이동경로가 있음
		    		if(forward.isRedirect()) {		// true 일 때,
						System.out.println("C : sendRedirect() : " + forward.getPath());
						response.sendRedirect(forward.getPath());
		    		} else {						// false 일 때,
						System.out.println("C : forward() : " + forward.getPath());
						RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
						dis.forward(request, response);
		    		}
		    	}
		    	
		    	System.out.println("C : 3. 페이지 이동 끝");
		    	
		    	
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
