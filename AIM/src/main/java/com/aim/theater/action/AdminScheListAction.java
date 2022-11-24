package com.aim.theater.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.theater.db.TheaterDAO;

public class AdminScheListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : AdminScheListAction_execute() 호출");
		
		//세션제어(관리자 여부)
		HttpSession session = request.getSession();
		String mb_id = (String) session.getAttribute("mb_id");
		
		ActionForward forward = new ActionForward();
		if(mb_id==null || !mb_id.equals("admin")) {
			forward.setPath("./Main.aim");
			forward.setRedirect(true);
			return forward;
		}
		
		TheaterDAO dao = new TheaterDAO();
		
		//글개수 확인
		int cnt = dao.getScheCount();
		System.out.println("M : 전체글개수 : "+cnt+"개");
		
		
		
		//////////////////////////////////
		//페이징처리_1
		// 한 페이지에 보여줄 글의 개수 
       int pageSize = 15;
       
       // http://localhost:8088/JSP/board/boardList.jsp?pageNum=2
    		   
       // 현 페이지가 몇페이지 인지 확인
       String pageNum = request.getParameter("pageNum");
       if(pageNum == null){
    	   pageNum = "1";
       }
       
       // 시작행 번호 계산하기  1   11   21    31   41 .....
       int currentPage = Integer.parseInt(pageNum);
       int startRow = (currentPage-1)*pageSize+1;
       
       // 끝행 번호 계산하기  10   20   30   40  50.....
       int endRow = currentPage * pageSize;
       ///////////////////////////////////////////////
       
       
       //전체 글 리스트
		List adminScheList = dao.getAdminScheList(startRow,pageSize);
		
		
		//페이징처리_2
		// 전체 페이지수 
		int pagecnt = (cnt/pageSize)+(cnt%pageSize==0? 0:1);
		
		// 한 화면에 보여줄 페이지수
		int pageBlock = 5;
		
		// 페이지블럭의 시작번호    1~10 => 1,  11~20 => 11  21~30 => 21
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		// 페이지블럭의 끝번호
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pagecnt){
		endPage = pagecnt; 
		}
		
		//뷰에 전달
		request.setAttribute("adminScheList", adminScheList);
		
		//페이징처리 정보 저장
		request.setAttribute("totalCnt", cnt);
		request.setAttribute("PageNum", pageNum);
		request.setAttribute("PageCount", pagecnt);
		request.setAttribute("PageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// 페이지 이동(./center/admin_goods_list.jsp)
		forward.setPath("./theater/admin_sche_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
