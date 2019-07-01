package org.ks.talkBoard;

import java.util.ArrayList;

import org.ks.talkBoard.vo.TalkBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TalkBoardController {
	@Autowired
	@Qualifier(value="talkBoardService")
	private TalkBoardService talkBoardService;
	
	@RequestMapping(value="/mainBoard.do")
	public ModelAndView mainBoard() {
		ArrayList<TalkBoard> list = talkBoardService.mainBoard();
		ModelAndView mv = new ModelAndView();
		System.out.println(list.get(0).getBoardNo());
		mv.addObject("list",list);
		mv.setViewName("talkBoard/mainBoard");
		return mv;
	}
	
	@RequestMapping(value="/newTalkBoard.do")
	public String newTalkBoard() {
		return "talkBoard/newTalkBoard";
	}
	@RequestMapping(value="/insertTalkBoard.do")
	public String insertTalkBoard(TalkBoard tb) {
		System.out.println(tb.getBoardContents());
		int result = talkBoardService.insertTalkBoard(tb);
		if(result>0) {
			System.out.println("글등록 성공");
			return "talkBoard/mainBoard";
		}else {
			System.out.println("등록실패");
			return "/";
		}
	}
	
}
