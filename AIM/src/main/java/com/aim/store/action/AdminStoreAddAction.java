package com.aim.store.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.store.db.AdminStoreDAO;
import com.aim.store.db.StoreDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminStoreAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : StoreAddAction_execute()");
		
			ServletContext CTX = request.getServletContext();
			String realPath = CTX.getRealPath("/upload");
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			System.out.println("M : realPath : " + realPath);
				
			int maxSize = 10 * 1024 * 1024;
				
			MultipartRequest multi = new MultipartRequest(
					request,
					realPath,
					maxSize,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
						
			System.out.println("M : 첨부파일 업로드 완");
				

		StoreDTO dto = new StoreDTO();
		
		dto.setCategory_code(multi.getParameter("category"));
		dto.setCategory_name(multi.getParameter("category_name"));
		dto.setSt_img(multi.getParameter("img"));
		String img = multi.getFilesystemName("img");
		dto.setSt_img(img);
		
		dto.setSt_name(multi.getParameter("name"));
		dto.setSt_price(Integer.parseInt(multi.getParameter("price")));
		dto.setSt_text(multi.getParameter("text"));
		
		
		AdminStoreDAO dao = new AdminStoreDAO();
		dao.addProduct(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminStoreList.ad");
		forward.setRedirect(true);
		
		
		return forward;
	}

}
