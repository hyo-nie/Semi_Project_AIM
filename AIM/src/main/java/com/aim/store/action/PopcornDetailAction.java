package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.store.db.StoreDAO;
import com.aim.store.db.StoreDTO;

public class PopcornDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : PopcornDetailAction()_execute");
		
		// 전달정보 처리
		int st_num = Integer.parseInt(request.getParameter("st_num"));
		
		// 이 번호에 해당하는 상품정보를 페이지에 보여줘야 함
		StoreDAO dao = new StoreDAO();
		StoreDTO dto = dao.getProductInfo(st_num);

		request.setAttribute("dto", dto);
		
		// 페이지 이동 (./store/popcorn_detail.jsp)
		ActionForward forward = new ActionForward();
		forward.setPath("./store/popcorn_detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
