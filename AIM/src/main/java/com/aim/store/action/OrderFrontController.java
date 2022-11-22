package com.aim.store.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.or")
public class OrderFrontController extends HttpServlet {

   protected void doProcess(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
	      	System.out.println(" C : doProcess() 호출 ");
	      	
		      // 가상주소 계산
		      String requestURI = request.getRequestURI();
		      System.out.println(" C : requestURI : " + requestURI);
		      String ctxPath = request.getContextPath();
		      System.out.println(" C : ctxPath : " + ctxPath);
		      String command = requestURI.substring(ctxPath.length());
		      System.out.println(" C : command : " + command);

		      System.out.println(" C : 가상주소 계산 끝");

		      ActionForward forward = null;
		      Action action = null;
		      
		      if(command.equals("/OrderStart.or")) {
		    	  System.out.println(" C : /OrderStart.or 호출 "); // 패턴3

		    	  // OrderStartAction
		    	  action = new OrderStartAction();
		    	  
		    	 try {
					forward =  action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		      }else if(command.equals("/OrderAddAction.or")) {
		    	  System.out.println(" C : /OrderAddAction.or 호출 "); // 패턴2
		    	  
		    	  //OrderAddAction
		    	  action = new OrderAddAction();
		    	  try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				} 
		      } else if(command.equals("/OrderList.or")) {
		    	  System.out.println(" C : /OrderList.or 호출 ");
		    	  
		    	   // OrderListAction
					action = new OrderListAction();
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
			  }else if(command.equals("/OrderDetail.or")) {
				   System.out.println(" C : /OrderDetail.or 호출 ");
				  
				   // OrderDetailAction()
				   action = new OrderDetailAction();
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
			  } else if(command.equals("/OrderFail.or")) {
				  System.out.println("C : /OrderFail.or");
			  
				  forward = new ActionForward();
				  forward.setPath("./store/buy_fail.jsp");
				  forward.setRedirect(false);
			  } else if(command.equals("/OrderNowAction.or")) {
				  System.out.println("C : /OrderNowAction.or");
				  
				  action = new OrderNowAction();
				  try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			  } else if(command.equals("/OrderNow.or")) {
				  System.out.println("C : /OrderNow.or");
			  
			  }
		      
	   
		      // 가상주소 매핑

		      

		      // 페이지 이동
		      if (forward != null) {
		         if (forward.isRedirect()) { // true
		            System.out.println(" C : sendRedirect() : " + forward.getPath());
		            response.sendRedirect(forward.getPath());
		         } else { // false
		            System.out.println(" C : forward() : " + forward.getPath());
		            RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
		            dis.forward(request, response);
		         }
		      }

		      System.out.println(" C : 페이지 이동 끝");

		   }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doProcess(request, response);
	System.out.println(" C : doGet() 호출");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		System.out.println(" C : doPost() 호출");
	}

}
