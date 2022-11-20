package com.aim.hp.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.hp.db.HpDAO;
import com.aim.nt.action.Action;
import com.aim.nt.action.ActionForward;

public class MyHpListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MyHpListAction_execute 호출");
		
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("mb_id");
				
			ActionForward forward = new ActionForward();
				if(id == null) {
					forward.setPath("./Login.aim");
					forward.setRedirect(true);
					return forward;
				}
		
		// AskDAO 객체 생성
		HpDAO dao = new HpDAO();

		// 문의한 글 개수 확인
		int cnt = dao.getHpCount();

		System.out.println(" M : 전체 글 개수 : " + cnt + "개");

		
		// 페이징 처리 (1)

		// 한 페이지에 보여줄 글의 개수
		int pageSize = 10;

		// 현재 페이지 확인
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}

		// 시작행 번호 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝행 번호 계산
		int endRow = currentPage * pageSize;
		
		// 문의한 글 리스트 가져오기 (AskDAO - AskListAll)
		ArrayList HpListAll = dao.getHpList(startRow,pageSize);

		
		// 전체 페이지수
		int pageCount = (cnt / pageSize) + (cnt % pageSize == 0 ? 0 : 1);

		// 한 화면에 보여줄 페이지수
		int pageBlock = 5;

		// 페이지블럭의 시작번호
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		
		// 페이지블럭의 끝번호
		int endPage = startPage + pageBlock - 1;

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		System.out.println(" M : "+HpListAll);
		
		// 페이지 정보 전달(request 영역객체 저장)
		request.setAttribute("HpListAll", HpListAll);
		
				
		// 페이징처리 정보 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalCnt", cnt);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// 페이지 이동
		forward.setPath("./hp/myhplist.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
