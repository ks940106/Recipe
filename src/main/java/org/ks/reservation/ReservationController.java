package org.ks.reservation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ks.caravan.vo.Caravan;
import org.ks.member.vo.Member;
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
	
	@RequestMapping(value="/mypageReservationResultRecipe.do")
	public String mypageReservationResultRecipe(HttpSession session,Model model) {
		Member m = (Member)session.getAttribute("member");
		ArrayList<Reservation> list = reservationServiceImple.selectMypageReservation(m.getId());
		for(int i = 0; i<list.size();i++) {
			list.get(i).setReservationRequest(list.get(i).getReservationId().substring(0, 4));
		}
		model.addAttribute("list", list);
		return "reservation/mypageReservationResultRecipe";
	}
	@RequestMapping(value="/mypageReservationResultCamping.do")
	public String mypageReservationResultCamping(HttpSession session,Model model) {
		Member m = (Member)session.getAttribute("member");
		ArrayList<Reservation> list = reservationServiceImple.selectMypageReservation(m.getId());
		for(int i = 0; i<list.size();i++) {
			list.get(i).setReservationRequest(list.get(i).getReservationId().substring(0, 4));
		}
		model.addAttribute("list", list);
		return "reservation/mypageReservationResultCamping";
	}
	@RequestMapping(value="/cancelReservationRecipe.do")
	public String cancelReservationRecipe(@RequestParam String reservationId) {
		reservationServiceImple.cancelReservation(reservationId);
		return "redirect:/mypageReservationResultRecipe.do";
	}
	@RequestMapping(value="/cancelReservationCamping.do")
	public String cancelReservationCamping(@RequestParam String reservationId) {
		reservationServiceImple.cancelReservation(reservationId);
		return "redirect:/mypageReservationResultCamping.do";
	}
	@RequestMapping(value="/reservationAdminPage.do")
	public String reservationAdminPage(Model model) {
		ArrayList<Reservation> list = reservationServiceImple.selectAllReservation();
		ArrayList<Reservation> list1 = new ArrayList<Reservation>();
		ArrayList<Reservation> list2 = new ArrayList<Reservation>();
		ArrayList<Reservation> list3 = new ArrayList<Reservation>();
		ArrayList<Reservation> list4 = new ArrayList<Reservation>();
		for(int i = 0; i<list.size();i++) {
			if(list.get(i).getReservationState()==1) {
				list1.add(list.get(i));
			}else if(list.get(i).getReservationState()==2) {
				list2.add(list.get(i));
			}else if(list.get(i).getReservationState()==3) {
				list3.add(list.get(i));
			}else {
				list4.add(list.get(i));
			}
		}
		int count1 = list1.size();
		int count2 = list2.size();
		int count3 = list3.size();
		int count4 = list4.size();
		int page1 = 0;
		int page2 = 0;
		int page3 = 0;
		int page4 = 0;
		if(count1%5==0) {
			page1 = count1/5;
		}else {
			page1 = (count1/5)+1;
		}
		if(count2%5==0) {
			page2 = count2/5;
		}else {
			page2 = (count2/5)+1;
		}
		if(count3%5==0) {
			page3 = count3/5;
		}else {
			page3 = (count3/5)+1;
		}
		if(count4%5==0) {
			page4 = count4/5;
		}else {
			page4 = (count4/5)+1;
		}
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("count1", count1);
		model.addAttribute("count2", count2);
		model.addAttribute("count3", count3);
		model.addAttribute("count4", count4);
		model.addAttribute("page1", page1);
		model.addAttribute("page2", page2);
		model.addAttribute("page3", page3);
		model.addAttribute("page4", page4);
		return "admin/reservation/reservationAdmin";
	}
	@RequestMapping(value="/reservationUpdate.do")
	public String reservationUpdate(@RequestParam String[] reservationId, @RequestParam String reservationState) {
		reservationServiceImple.reservationUpdate(reservationId,reservationState);
		return "redirect:/reservationAdminPage.do";
	}
	@RequestMapping(value="/reservationApproveList.do")
	public String reservationApproveList(Model model) {
		ArrayList<Reservation> list = reservationServiceImple.reservationApproveList();
		model.addAttribute("list", list);
		return "admin/reservation/reservationApproveList";
	}
}
