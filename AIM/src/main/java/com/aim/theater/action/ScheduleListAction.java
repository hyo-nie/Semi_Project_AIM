package com.aim.theater.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aim.schedule.db.ScheduleDTO;
import com.aim.theater.db.TheaterDAO;
import com.aim.theater.db.TheaterDTO;

public class ScheduleListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : ScheduleListAction_execute()");
		Date today = new Date(); // 오늘날짜 불러오기
		SimpleDateFormat tdfm = new SimpleDateFormat("yyyy-MM-dd"); // sc_date와 비교하기 위한 날짜타입 변환
	
		
		//전달정보 저장 - 날짜와 지점코드 전달받음
		String date = request.getParameter("date");
		int branchCd = Integer.parseInt(request.getParameter("branchCd"));
		
		if(date == null) {
			date = tdfm.format(today);
			
		}
		
		//DB에 저장된 정보를 가져오기
		TheaterDAO dao = new TheaterDAO();		 
		
		//지점소개 정보 가져오기
		TheaterDTO dto = dao.getBranchIntro(branchCd);
		
		//지점별 날짜 카테고리 가져오기
		List<ScheduleDTO> dateList = dao.getDateCate(branchCd);
		
		//지점/날짜 별 영화제목 받아오기
		List<ScheduleDTO> fmovieName = dao.getMovieNm(branchCd, date);
		
		
		//지점/날짜/영화 별 상영관과 상영시간 가져오기(첫번째날짜 디폴트)
		List<ScheduleDTO> scheduleFirst = dao.getScheList(branchCd,date);
		
		// 남은 좌석수 계산 로직
		List<String> seatArr = new ArrayList<String>();
		for(int i = 0; i < scheduleFirst.size(); i++) {
			seatArr.add(scheduleFirst.get(i).getSeatcomp());
		}
		
		List<Integer> currentSeatArr = new ArrayList<Integer>(); 
		for(int j = 0; j < seatArr.size(); j++) {
			int currentSeat = 0;
			for (int k = 0; k < 80; k++) {
				if (seatArr.get(j).split(",")[k].equals("0")) {
					currentSeat++;
				}
			}
			currentSeatArr.add(currentSeat);
		}
		
		
		
		//연결된 view 페이지로 정보 전달
		request.setAttribute("dto", dto);
		request.setAttribute("dateList", dateList);
		request.setAttribute("fmovieName", fmovieName);
		request.setAttribute("scheduleFirst", scheduleFirst);
		request.setAttribute("currentSeatArr", currentSeatArr);
		request.setAttribute("seatArr", seatArr);
		
		//페이지 이동	
		ActionForward forward = new ActionForward();
		forward.setPath("./theater/selectedTheater.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
