package com.aim.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.store.db.CartDAO;

public class CartAmountChangeAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      System.out.println("M : CartAmountChangeAction_execute()");

      // 전달정보 저장(c_num, change_amount)
      int c_num = Integer.parseInt(request.getParameter("c_num"));
      int changeAmount = Integer.parseInt(request.getParameter("change_amount"));
      
      CartDAO dao = new CartDAO();
      dao.changeAmount(c_num, changeAmount);
      
      return null;
   }

}