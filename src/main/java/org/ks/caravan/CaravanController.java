package org.ks.caravan;

import java.util.ArrayList;

import org.ks.caravan.vo.Caravan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CaravanController {

	@Autowired
	@Qualifier(value="CaravanServiceImpl")
	public CaravanService CaravanServiceImpl;
	
	@RequestMapping(value="caravanIntroduce.do")
	public String caravanIntroduce() {
		return "camping/caravanIntroduce";
	}
	
	//관리자
	
	@RequestMapping(value="seletecaravan.do")
	public ModelAndView caravanMainImg() {
		ArrayList<Caravan> list = CaravanServiceImpl.seleteAllCaravanList();
		ModelAndView mav = new ModelAndView();
		if(list.isEmpty()) {
			mav.setViewName("admin/caravan/seletecaravan");
		}else {
			mav.addObject("list",list);
			mav.setViewName("admin/caravan/seletecaravan");
		}
		return mav;
	}
}
