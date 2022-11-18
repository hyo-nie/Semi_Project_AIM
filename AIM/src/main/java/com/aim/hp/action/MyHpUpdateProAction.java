package com.aim.hp.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		
		
		// 파일 업로드
		String realPath = request.getRealPath("/upload");
		System.out.println(" M : realPath : "+realPath);
		int maxSize = 10 * 1024 * 1024;
				
		// 파일업로드 -> 파일업로드 객체 생성(MultipartRequest)
		MultipartRequest multi 
				      = new MultipartRequest(
				        request,
				        realPath,
				        maxSize,
				        "UTF-8",
				        new DefaultFileRenamePolicy()
				        );
				
		System.out.println(" M : 첨부파일 업로드 성공! ");			
				
		// DTO 객체 생성 및 데이터 저장
		HpDTO dto = new HpDTO();
		dto.setHp_bno(Integer.parseInt(multi.getParameter("hp_bno")));
		dto.setMb_id(multi.getParameter("mb_id"));
		dto.setHp_deletepw(multi.getParameter("hp_deletepw"));
		dto.setHp_subject(multi.getParameter("hp_subject"));
		dto.setHp_select(multi.getParameter("hp_select"));
		dto.setHp_class(multi.getParameter("hp_class"));
		dto.setHp_content(multi.getParameter("hp_content"));
		
		String pageNum = request.getParameter("pageNum");
		
		// DB
		HpDAO dao = new HpDAO();
		
		
		int result = dao.myhpupdate(dto);
		
		System.out.println(" M : 결과 "+result);
		
		
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
			out.print(" alert(' 비밀번호가 맞지 않습니다 '); ");
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
