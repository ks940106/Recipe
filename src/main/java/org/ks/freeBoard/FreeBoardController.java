package org.ks.freeBoard;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {
	
	@RequestMapping(value="/insertFreeBoard.do")
	public ModelAndView insertFreddBoard(@RequestParam int boardType) {
		int no = boardType;
		System.out.println(no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("no",no);
		mv.setViewName("camping/insertFreeBoard");
		return mv;
	}
	
	@RequestMapping(value="/newFreeBoard.do")
	public String newFreeBoard(HttpServletRequest request) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String nickname = request.getParameter("nickname");
		String type = request.getParameter("type");
		System.out.println(type);
		System.out.println(nickname);
		System.out.println(title);
		System.out.println(content);
		return "camping/FreeBaord";
	}
	
}
