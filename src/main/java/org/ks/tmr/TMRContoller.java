package org.ks.tmr;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.ks.tmr.vo.LMRPageData;
import org.ks.tmr.vo.TMRPageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		String month = new SimpleDateFormat("MM").format(new Date(System.currentTimeMillis()));
		String year = new SimpleDateFormat("yy").format(new Date(System.currentTimeMillis()));
		TMRPageData tpd = tmrserviceImpl.selectTMR(year,month,reqPage);
		model.addAttribute("tpd", tpd);
		return "tmr/tmrPage";
	}
	
	@Scheduled(cron="0 0 0 1 * *")
	public void scheduleTest2() {
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
		insertLmr(year,month);
		System.out.println("지난 달 레시피 등록 성공");
	}
	public void insertLmr(String year,String month) {
		tmrserviceImpl.insertLmr(year,month);
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
}
