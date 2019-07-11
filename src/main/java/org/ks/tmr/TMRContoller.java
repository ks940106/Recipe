package org.ks.tmr;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ks.tmr.vo.LMRPageData;
import org.ks.tmr.vo.Reservation;
import org.ks.tmr.vo.TMRPageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@Controller
public class TMRContoller {
	@Autowired
	@Qualifier("TMRServiceImpl")
	private TMRService tmrserviceImpl;
	
	@RequestMapping(value="/tmr.do")
	public String tmrPage(Model model,HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e){
			reqPage = 1;
		}
		String month = new SimpleDateFormat("MM").format(new Date(System.currentTimeMillis())); //현재 월 받아오기
		String year = new SimpleDateFormat("yy").format(new Date(System.currentTimeMillis())); //현재 연 받아오기
		TMRPageData tpd = tmrserviceImpl.selectTMR(year,month,reqPage);
		model.addAttribute("tpd", tpd);
		return "tmr/tmrPage";
	}
	
	@Scheduled(cron="0 0 0 1 * *")
	public void lmrInsert() {
		String year = new SimpleDateFormat("yy").format(new Date(System.currentTimeMillis()));
		String month = new SimpleDateFormat("MM").format(new Date(System.currentTimeMillis()));
		if(month.equals("01")) {
			year = Integer.toString(Integer.parseInt(year)-1);
			month= "12";
		}else {
			month= Integer.toString(Integer.parseInt(month)-1);
		}
		if(Integer.parseInt(year)<10) {
			year="0"+year;
		}
		if(Integer.parseInt(month)<10) {
			month="0"+month;
		}
		tmrserviceImpl.insertLMR(year,month);
		System.out.println("지난 달 레시피 등록 성공");
	}
	
	@RequestMapping(value="/lmr.do")
	public String lmrPage(Model model,HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e){
			reqPage = 1;
		}
		LMRPageData lpd = tmrserviceImpl.selectLMR(reqPage);
		model.addAttribute("lpd",lpd);
		return "admin/lmr/lmrPage";
	}
	
	@RequestMapping(value="/popup.do")
	public String popup() {
		return "tmr/tmrPopup";
	}
	
	@RequestMapping(value="/c.do")
	public String c() {
		return "tmr/c";
	}
	@RequestMapping(value="/selectReservation.do")
	public void selectReservation(HttpServletRequest request,Model model,HttpServletResponse response) {
		String reservationDateString = request.getParameter("reservationDateString");
		String[] reservationDate = reservationDateString.split(",");
		ArrayList<Reservation> list = tmrserviceImpl.selectReservation(reservationDate);
		
		response.setContentType("text/html;charset=utf-8");
		String jsonList = new Gson().toJson(list);
		System.out.println(jsonList);
		try {
			response.getWriter().append(jsonList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/insertReservation.do")
	public String insertReservation(@RequestParam String caravanNo,@RequestParam String reservationDateString) {
			tmrserviceImpl.insertReservation(caravanNo,reservationDateString);
		return "tmr/c";
	}
}
