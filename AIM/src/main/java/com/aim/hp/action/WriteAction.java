package com.aim.hp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.hp.db.HpDTO;
import com.aim.hp.action.Action;
import com.aim.hp.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : WriteAction_execute() 호출");
		
		// 한글 처리 -> 매핑함
		// 세션 처리 
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(mb_id == null) {
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
		
		// 전달정보 저장 (AskDTO)
		HpDTO dto = new HpDTO();
		
		dto.setMb_id(multi.getParameter("mb_id"));
		dto.setMb_pw(multi.getParameter("mb_pw"));
		dto.setHp_subject(multi.getParameter("hp_subject"));
		dto.setHp_content(multi.getParameter("hp_content"));
		dto.setHp_file(multi.getFilesystemName("hp_file"));
		
		
		// AskDAO 객체
		HpDAO dao = new HpDAO();
		
		// AskBoard()
		dao.HpBoard(dto);
			
		// 페이지 이동정보 생성(티켓 생성)
		forward.setPath("./MyHpList.hp");
		forward.setRedirect(true);
				
		return forward;
	}

}
