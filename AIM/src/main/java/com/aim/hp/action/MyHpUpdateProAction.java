package com.aim.hp.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;

public class MyHpUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MyHpUpdateProAction_execute() 호출 ");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("mb_id");
				
			ActionForward forward = new ActionForward();
				if(id == null) {
					forward.setPath("./Login.aim");
					forward.setRedirect(true);
					return forward;
				}
		
		// DTO 객체 생성 및 데이터 저장
		HpDTO dto = new HpDTO();
		dto.setHp_bno(Integer.parseInt(request.getParameter("hp_bno")));
		dto.setMb_id(request.getParameter("mb_id"));
		dto.setHp_select(request.getParameter("hp_select"));
		dto.setHp_class(request.getParameter("hp_class"));
		dto.setHp_content(request.getParameter("hp_content"));
		
		String pageNum = request.getParameter("pageNum");
		
		// DB
		HpDAO dao = new HpDAO();
		int result = dao.myhpupdate(dto);
		
		System.out.println(" M : 수정완료 "+result);
		
		
		response.setContentType("text/html; charset=UTF-8");
		
		// => 응답페이지의 형태를 html 형태로 사용
		PrintWriter out = response.getWriter();
		
		// => 응답페이지로 출력
		
		if(result == 1) {
			out.print("<script>");
			out.print(" alert('문의 내용 수정 완료');");
			out.print(" location.href='./MyHpList.hp?pageNum="+pageNum+"'; ");
			out.print("</script>");
			out.close();
			
			return null;	
			// 더이상 실행없이 컨트롤러로 전달		
		}else if(result == 0) {
			out.print("<script>");
			out.print(" alert(' 전화번호가 맞지 않습니다 '); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}else { // result == -1
			out.print("<script>");
			out.print(" alert('문의 내역이 없습니다 '); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}
		
	}


}
