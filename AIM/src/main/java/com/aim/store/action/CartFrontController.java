package com.aim.store.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.ct")
public class CartFrontController extends HttpServlet {
	   protected void doProcess(HttpServletRequest request, HttpServletResponse response)
		   throws ServletException, IOException {
		   
		   
		   System.out.println(" C : doProcess() ");
	
		      // 가상주소 계산
		      String requestURI = request.getRequestURI();
		      System.out.println(" C : requestURI : " + requestURI);
		      String ctxPath = request.getContextPath();
		      System.out.println(" C : ctxPath : " + ctxPath);
		      String command = requestURI.substring(ctxPath.length());
		      System.out.println(" C : command : " + command);

		      System.out.println(" C : 가상주소 계산 끝 ");

		      ActionForward forward = null;
		      Action action = null;
		   

		      // 가상주소 매핑
		      if(command.equals("/CartAddAction.ct")) {
		    	  System.out.println(" C : CartAddAction.ct 호출 "); // 패턴2 장바구니 담고 페이지 이동
		    	  
		    	  // CartAddAction()
		    	  action = new CartAddAction();
		    	  
		    	  try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		      } else if(command.equals("/CartList.ct")) {
		    	  System.out.println(" C : /CartList.ct 호출 "); // 패턴3 장바구니 리스트페이지 출력
		    	  
		    	  // CartAction()
		    	  action = new CartAction();
		    	  try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		    	  
		      } else if(command.equals("/CartDeleteAction.ct")) {
		    	  System.out.println(" C : CartDeleteAction.ct 호출 "); // 패턴 2 장바구니 상품 삭제 후 페이지 이동
		    	  
		    	  // CartDeleteAction()
		    	  action = new CartDeleteAction();
		    	  
		    	  try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		      }else if(command.equals("/CartAmountChangeAction.ct")) {
	               System.out.println("C : CartAmountChangeAction.ct 호출 ");
	               
	               action = new CartAmountChangeAction();
	               try {
	               forward = action.execute(request, response);
	            } catch (Exception e) {
	               e.printStackTrace();
	            }
	               
	            }

		    	  
		      System.out.println("가상주소 매핑 완료");
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

		      System.out.println(" C : 페이지 이동 끝 ");

		   }
	   
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doProcess(request, response);
	    System.out.println(" C : doGet()");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doProcess(request, response);
	    System.out.println(" C : doPost()");
	}

	
}
