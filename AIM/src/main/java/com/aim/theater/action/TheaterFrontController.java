package com.aim.theater.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.th")
public class TheaterFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(" C : doProcess() ");

		// 1. 가상주소 계산
		String requestURI = request.getRequestURI();
		System.out.println(" C : requestURI : " + requestURI);
		String ctxPath = request.getContextPath();
		System.out.println(" C : ctxPath : " + ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println(" C : command : " + command);

		System.out.println(" C : 1. 가상주소 계산 끝 \n");

		// 2. 가상주소 매핑(패턴1,2,3)
		ActionForward forward = null;
		Action action = null;
		
		if (command.equals("/branch.th")) {
			System.out.println(" C : /branch.th 호출, 패턴3 ");
			
			//SeomyeonListAction()
			action = new ScheduleListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/DateClick.th")) {
			System.out.println("C : /DateClick.th 호출");
			
			action = new DateClickAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/SeatSelect.th")) {
			System.out.println("C :/SeatSelect.th 호출");
			
			action = new SeatSelectAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		else if(command.equals("/AdminScheAdd.th")) {
			System.out.println(" C : /AdminScheAdd.th 호출, 패턴3 ");
			
			action = new AdminScheAdd();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}//admin_sche_write.jsp로 보내기
		else if(command.equals("/AdminScheAddAction.th")) {
			System.out.println(" C : /AdminScheAddAction.th 호출, 패턴2 ");
			
			action = new AdminScheAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/AdminScheList.th")) {
			System.out.println("C : /AdminScheList.th 호출, 패턴3");
			
			action = new AdminScheListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/adminScheModify.th")) {
			System.out.println("c: /adminScheModify.th 호출, 패턴3");
			
			action = new adminScheModifyAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/AdminScheModifyPro.th")) {
			System.out.println("/AdminScheModifyPro.th 호출, 패턴2");
			
			action = new AdminSchemodifyProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/AdminScheRemove.th")) {
			System.out.println("./AdminScheRemove.th 호출, 패턴2");
			
			action = new AdminScheRemoveAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/RentalWrite.th")) {
			System.out.println("/RentalWrite.th 호출, 패턴3");
			
			action = new RentalWrite();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/RentalAddAction.th")) {
			System.out.println("/RentalAddAction.th 호출, 패턴 2");
			
			action = new RentalAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/AdminRentalList.th")) {
			System.out.println("/AdminRentalList.th 호출, 패턴3");
			
			//AdminRentalList 객체 생성
			action = new AdminRentalListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/AdminRentalPwCheck.th")) {
			System.out.println("/AdminRentalPwCheck.th 호출, 패턴1");
			
			forward = new ActionForward();
			forward.setPath("./theater/admin_pw_check.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/AdminPwCheckAction.th")) {
			System.out.println("/AdminPwCheckAction.th 호출, 패턴2");
			
			action = new AdminPwCheckAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/AdminRentalContent.th")) {
			System.out.println("/AdminRentalContent.th 호출, 패턴3");
			
			action = new AdminRentalContentAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/AdminRentalReWrite.th")) {
			System.out.println("/AdminRentalReWrite.th 호출, 패턴3");
			
			action = new AdminRentalReWrite();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/AdminRentalReWriteAction.th")) {
			System.out.println("/AdminRentalReWriteAction.th 호출, 패턴2");
			
			action = new AdminRentalRewriteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/AdminReContent.th")) {
			System.out.println("/AdminReContent.th 호출, 패턴3");
			
			action = new AdminReContentAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.out.println(" C : 2. 가상주소 매핑(패턴1,2,3) 끝 \n");

		// 3. 페이지 이동
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

		System.out.println(" C : 3. 페이지 이동 끝 \n");

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(" Member - doGet() ");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(" Member - doPost() ");
		doProcess(request, response);
	}
}
