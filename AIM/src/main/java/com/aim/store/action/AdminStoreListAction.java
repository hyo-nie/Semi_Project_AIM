package com.aim.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aim.store.db.AdminStoreDAO;


public class AdminStoreListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : AdminStoreListAction_execute()");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mb_id");
				
		ActionForward forward = new ActionForward();
		if(id == null || !id.equals("admin")) {			
			forward.setPath("./Login.aim");
			forward.setRedirect(true);
			return forward;
		}

		AdminStoreDAO dao = new AdminStoreDAO();
		List adminStoreList = dao.getAdminStoreList();
		
		request.setAttribute("adminStoreList", adminStoreList);
		
		forward.setPath("./store/admin_store_list.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
