package org.ks.tmr;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.ks.tmr.vo.TMRPageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TMRContoller {
	@Autowired
	@Qualifier("TMRService")
	private TMRService tmrservice;
	
	@RequestMapping(value="/tmr.do")
	public String tmrPage(Model model,HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e){
			reqPage = 1;
		}
		String month = new SimpleDateFormat("MM").format(new Date(System.currentTimeMillis()));
		TMRPageData tpd = tmrservice.selectTMR(month,reqPage);
		model.addAttribute("tpd", tpd);
		return "tmr/tmrPage";
	}
}
