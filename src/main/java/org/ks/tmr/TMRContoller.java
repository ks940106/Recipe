package org.ks.tmr;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.ks.tmr.vo.TMR;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TMRContoller {
	@Autowired
	@Qualifier("TMRService")
	private TMRService tmrservice;
	
	@RequestMapping(value="/tmr.do")
	public String tmrPage(Model model) {
		String month = new SimpleDateFormat("MM").format(new Date(System.currentTimeMillis()));
		//System.out.println(str);
		ArrayList<TMR> list = tmrservice.selectTMR(month);
		model.addAttribute("list", list);
		//System.out.println(list.get(0).getRecipeTitle());
		return "tmr/tmrPage";
	}
}
