package org.ks.talkBoard;

import java.util.ArrayList;

import org.ks.talkBoard.vo.TalkBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TalkBoardController {
	@Autowired
	@Qualifier(value="talkBoardService")
	private TalkBoardService talkBoardService = new TalkBoardServiceImpl();
	
	@RequestMapping(value="/mainBoard.do")
	public ModelAndView mainBoard() {
		ArrayList<TalkBoard> list = talkBoardService.mainBoard();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("talkBoard/mainBoard");
		return mv;
	}

}
