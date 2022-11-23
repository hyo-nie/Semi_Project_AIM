package com.aim.nt.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.aim.nt.db.NtDAO;
import com.aim.nt.db.NtDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NtUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
				NtDTO dto = new NtDTO();
				dto.setNt_bno(Integer.parseInt(multi.getParameter("nt_bno")));
				dto.setMb_id(multi.getParameter("mb_id"));
				dto.setMb_pw(multi.getParameter("mb_pw"));
				dto.setNt_subject(multi.getParameter("nt_subject"));
				dto.setNt_select(Integer.parseInt(multi.getParameter("nt_select")));
				dto.setNt_content(multi.getParameter("nt_content"));
				
				
				String pageNum = request.getParameter("pageNum");
				
				// DB
				NtDAO dao = new NtDAO();
				
				
				int result = dao.ntupdate(dto);
				
				System.out.println(" M : 결과 "+result);
				
				
				response.setContentType("text/html; charset=UTF-8");
				
				// => 응답페이지의 형태를 html 형태로 사용
				PrintWriter out = response.getWriter();
				
				// => 응답페이지로 출력
				
				if(result == 1) {
					out.print("<script>");
					out.print(" alert('공지사항 수정 완료');");
					out.print(" location.href='./NtList.nt?pageNum="+pageNum+"'; ");
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
					out.print(" alert('공지사항이 없습니다 '); ");
					out.print(" history.back(); ");
					out.print("</script>");
					out.close();
					
					return null;
				}
				
			}
}
