package org.ks.caravan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CaravanController {

	@Autowired
	@Qualifier(value="CaravanServiceImpl")
	public CaravanService CaravanServiceImpl;
	
	@RequestMapping(value="caravanIntroduce.do")
	public String caravanIntroduce() {
		return "camping/caravanIntroduce";
	}
}
