package org.ks.tmr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TMRContoller {
	@Autowired
	@Qualifier("TMRService")
	private TMRService tmrservice = new TMRServiceImpl();
	
	@RequestMapping("/tmr.do")
	public String tmrPage() {
		System.out.println("tmr가는지");
		return "tmr/tmrPage";
	}
}
