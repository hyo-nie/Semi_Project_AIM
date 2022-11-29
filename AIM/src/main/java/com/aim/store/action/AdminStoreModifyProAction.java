package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.store.db.AdminStoreDAO;
import com.aim.store.db.StoreDTO;

public class AdminStoreModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : AdminStoreModifyProAction_execute");
		
		StoreDTO dto = new StoreDTO();
		dto.setCategory_code(request.getParameter("category"));
		dto.setCategory_name(request.getParameter("category_name"));
		dto.setSt_name(request.getParameter("name"));
		dto.setSt_price(Integer.parseInt(request.getParameter("price")));
		dto.setSt_text(request.getParameter("text"));
		dto.setSt_num(Integer.parseInt(request.getParameter("st_num")));
		
		AdminStoreDAO dao = new AdminStoreDAO();
		dao.adminStoreModify(dto);

		ActionForward forward = new ActionForward();
		forward.setPath("./AdminStoreList.ad");
		forward.setRedirect(true);
		
		return forward;
	}

}
