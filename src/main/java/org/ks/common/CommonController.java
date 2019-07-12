package org.ks.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	@RequestMapping(value="/singsingCampingIndex.do")
	public String singsingCampingIndex() {
		return "common/singsingCampingIndex";
	}
}
