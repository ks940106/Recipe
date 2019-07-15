package org.ks.camping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CampingController {
	@RequestMapping(value="/campingAbout.do")
	public String about() {
		return "camping/about";
	}
}
