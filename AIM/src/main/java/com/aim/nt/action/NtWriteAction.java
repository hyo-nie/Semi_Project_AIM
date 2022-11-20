package com.aim.nt.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.aim.nt.db.NtDAO;
import com.aim.nt.db.NtDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NtWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : NtWriteAction_execute() ");
		
		//세션 제어
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
				
		ActionForward forward = new ActionForward();
		if(mb_id == null) {
			forward.setPath("./Main.aim");
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
				
		// 전달정보 저장 (NtDTO)
		NtDTO dto = new NtDTO();
				
		dto.setMb_id(multi.getParameter("mb_id"));
		dto.setNt_file(multi.getFilesystemName("nt_file"));
		dto.setNt_content(multi.getParameter("nt_content"));
		dto.setNt_subject(multi.getParameter("nt_subject"));
		
				
				
		// NtDAO 객체
		NtDAO dao = new NtDAO();
				
		// NtBoard()
		dao.NtBoard(dto);
					
		// 페이지 이동정보 생성(티켓 생성)
		forward.setPath("./.jsp");
		forward.setRedirect(false);
						
		return forward;
			}

		}
