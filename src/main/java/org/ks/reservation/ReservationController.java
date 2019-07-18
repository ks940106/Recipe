package org.ks.reservation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ks.caravan.vo.Caravan;
import org.ks.reservation.vo.Reservation;
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
	@RequestMapping(value="/peopleSelect.do")
	public String costPage(@RequestParam int caravanNo,@RequestParam String reservationDateString,Model model) {
		Caravan c = reservationServiceImple.selectOneCaravan(caravanNo);
		model.addAttribute("reservationDateString", reservationDateString);
		model.addAttribute("c", c);
		return "reservation/peopleSelect";
	}
	@RequestMapping(value="/paymentPage.do")
	public String payMentPage(Reservation r,Model model,@RequestParam String caravanName,@RequestParam int caravanPeople, @RequestParam int caravanMaxPeople) {
		model.addAttribute("r", r);
		model.addAttribute("caravanName", caravanName);
		model.addAttribute("caravanPeople", caravanPeople);
		model.addAttribute("caravanMaxPeople", caravanMaxPeople);
		return "reservation/paymentPage";
	}
	@RequestMapping(value="/payment.do")
	public String payment(Reservation r,Model model,@RequestParam String caravanName) {
			model.addAttribute("caravanName", caravanName);
			model.addAttribute("r", r);
		return "reservation/payment";
	}
	@RequestMapping(value="/insertReservation.do")
	public String insertReservation(Reservation r,Model model,@RequestParam String caravanName) {
		reservationServiceImple.insertReservation(r);
		model.addAttribute("r",r);
		model.addAttribute("caravanName", caravanName);
		return "reservation/successReservation";
	}
	@RequestMapping(value="/failReservation.do")
	public String failReservation(@RequestParam String error,Model model) {
		model.addAttribute("error", error);
		return "reservation/failReservation";
	}
}
