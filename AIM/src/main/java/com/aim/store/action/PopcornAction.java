package com.aim.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.store.db.StoreDAO;
import com.aim.store.db.StoreDTO;

public class PopcornAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : PopcornAction_execute()");
		
		StoreDAO dao = new StoreDAO();
		StoreDTO dto = new StoreDTO();
		dto.setCategory_code("2");
		String code = dto.getCategory_code();
		
		List popcornList = dao.getStoreProduct(code);
		System.out.println("상품 정보? " + popcornList);
		
		request.setAttribute("popcornList", popcornList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./store/popcorn.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
