package org.ks.camping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CampingController {
	@RequestMapping(value="/campingAbout.do")
	public String about() {
		return "camping/about";
	}
	@RequestMapping(value="/campingTravel.do")
	public String travel() {
		return "camping/travel";
	}
	
}
