package com.aim.store.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.st")
public class StoreFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
				System.out.println("C : 1. 가상주소 계산 시작");

				String requestURI = request.getRequestURI();		
				System.out.println("C : requestURI : " + requestURI);
						
				String ctxPath = request.getContextPath();	
				System.out.println("C : ctxPath : " + ctxPath);
						
				String command = requestURI.substring(ctxPath.length());
				System.out.println("C : command : " + command);
						
				System.out.println("C : 1. 가상주소 계산 끝");
				
				
				
		    	System.out.println("C : 2. 가상주소 매핑 시작");
		    	
		    	Action action = null;
		    	ActionForward forward = null;
		    	
		    	if(command.equals("/PopcornList.st")) {
		    		System.out.println("C : /PopcornList.st 호출 / 패턴3 ");
		    		
		    		action = new PopcornAction();
		    		try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
		    		
		    	} else if(command.equals("/PopcornDetail.st")) {
		    		System.out.println("C : /PopcornDetail.st 호출 / 패턴3");
		    		
		    		action = new PopcornDetailAction();
		    		try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
		    		
		    	} else if(command.equals("/StoreMain.st")) {
		    		System.out.println("C : /StoreMain.st");
		    		
		    		action = new StoreMainAction();
		    		try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
		    	}    if(command.equals("/GiftcardList.st")) {
		        	System.out.println(" C : /GiftcardList.st 호출 ");
		        	
		        	action = new GiftcardAction();
		        	
		        	try {
		    			forward = action.execute(request, response);
		    		} catch (Exception e) {
		    			e.printStackTrace();
		    		}
		        }else if(command.equals("/GiftcardDetail.st")) {
		        	System.out.println(" C : /GiftcardDetail.st 호출 ");
		        	
		        	action = new GiftcardDetailAction();
		        	try {
		    			forward = action.execute(request, response);
		    		} catch (Exception e) {
		    			e.printStackTrace();
		    		}
		        } else if(command.equals("/AimPick.st")) {
		        	System.out.println("C : /AimPick.st");
		        	
		        	action = new AimPickAction();
		        	try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
		        }
		    	
		    	System.out.println("C : 2. 가상주소 매핑 끝");
		    	
		    	System.out.println("C : 3. 페이지 이동 시작");
		    	
		    	if(forward != null) {				
		    		if(forward.isRedirect()) {		
						System.out.println("C : sendRedirect() : " + forward.getPath());
						response.sendRedirect(forward.getPath());
		    		} else {					
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
