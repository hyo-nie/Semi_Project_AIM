package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.store.db.StoreDAO;
import com.aim.store.db.StoreDTO;

public class PopcornDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : PopcornDetailAction()_execute");
		
		int st_num = Integer.parseInt(request.getParameter("st_num"));
		
		StoreDAO dao = new StoreDAO();
		StoreDTO dto = dao.getProductInfo(st_num);

		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./store/popcorn_detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
