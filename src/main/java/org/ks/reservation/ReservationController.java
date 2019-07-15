package org.ks.reservation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ks.caravan.vo.Caravan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

@Controller
public class ReservationController {
	@Autowired
	@Qualifier("ReservationServiceImpl")
	private ReservationService reservationServiceImple;
	
	@RequestMapping(value="/calendar.do")
	public String calendar() {
		return "reservation/calendar";
	}
	@RequestMapping(value="/selectReservation.do")
	public void selectReservation(HttpServletRequest request,Model model,HttpServletResponse response) {
		String reservationDateString = request.getParameter("reservationDateString");
		String[] reservationDate = reservationDateString.split(",");
		ArrayList<Caravan> list = reservationServiceImple.selectReservation(reservationDate);
		
		response.setContentType("text/html;charset=utf-8");
		String jsonList = new Gson().toJson(list);
		try {
			response.getWriter().append(jsonList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/insertReservation.do")
	public String insertReservation(@RequestParam String caravanNo,@RequestParam String reservationDateString) {
			reservationServiceImple.insertReservation(caravanNo,reservationDateString);
		return "reservation/calendar";
	}
}
