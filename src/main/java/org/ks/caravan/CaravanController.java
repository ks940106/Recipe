package org.ks.caravan;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value="seletecaravan.do") //카라반 전체리스트
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
	@RequestMapping(value="insertCaravan.do")
	public String insertCaravan() {
		return "admin/caravan/insertCaravan";
	}
	@RequestMapping(value="insertCaravanList.do")
	public String insertCaravanList(HttpServletRequest request) {//카라반 등록
		Caravan c = new Caravan();
		ModelAndView mav = new ModelAndView();
		c.setCaravanName(request.getParameter("caravanName"));
		c.setCaravanArea(Integer.parseInt(request.getParameter("caravanArea")) );
		c.setCaravanPeople(Integer.parseInt(request.getParameter("caravanPeople")));
		c.setCaravanMaxPeople(Integer.parseInt(request.getParameter("caravanMaxPeople")));
		c.setCaravanPlusCost(Integer.parseInt(request.getParameter("caravanPlusCost")));
		c.setCaravanCost(Integer.parseInt(request.getParameter("caravanCost")));
		c.setCaravanInfo(request.getParameter("caravanInfo"));
		int result = CaravanServiceImpl.insertCaravanList(c);
		if(result>0) {
			return "redirect:/seletecaravan.do";	
		}else {
			return "redirect:/seletecaravan.do";
			
		}
	}
}
