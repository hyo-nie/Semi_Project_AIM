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
		
		// * 첨부파일 
		// 1. upload 폴더를 생성 (가상의 업로드 경로가 생김)
		//	  파일이 저장되는 실제 경로는 tomcat - 서버
			ServletContext CTX = request.getServletContext();
			String realPath = CTX.getRealPath("/upload");
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			System.out.println("M : realPath : " + realPath);
				
		// 2. 업로드 크기 제어하기(10MB)
			int maxSize = 10 * 1024 * 1024;
				
		// 3. 라이브러리 설치(cos.jar)
				
		// 4. MultipartRequest 객체 생성(업로드)
			MultipartRequest multi = new MultipartRequest(
					request,
					realPath,
					maxSize,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
						
			System.out.println("M : 첨부파일 업로드 완");
				
		// 전달정보 저장 : 폼태그 -> DTO
		StoreDTO dto = new StoreDTO();
		
		dto.setCategory_code(multi.getParameter("category"));
		dto.setCategory_name(multi.getParameter("category_name"));
		dto.setSt_img(multi.getParameter("img"));
		String img = multi.getFilesystemName("img");
		dto.setSt_img(img);
		
		dto.setSt_name(multi.getParameter("name"));
//		dto.setSt_num(maxSize);
		dto.setSt_price(Integer.parseInt(multi.getParameter("price")));
		dto.setSt_text(multi.getParameter("text"));
		
		
		// 상품 등록 메서드(addProduct)
		// dto에 저장된 상품을 디비에 저장해주는 메서드
		AdminStoreDAO dao = new AdminStoreDAO();
		dao.addProduct(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./AdminStoreList.ad");
		forward.setRedirect(true);
		
		
		return forward;
	}

}
