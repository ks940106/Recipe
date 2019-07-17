package org.ks.freeBoard;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FreeBoardController {
	
	@RequestMapping(value="/insertFreeBoard.do")
	public String insertFreddBoard(@RequestParam int boardType) {
		int no = boardType;
		System.out.println(no);
		return "camping/insertFreeBoard";
	}
	
	
}
