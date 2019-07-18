package org.ks.freeBoard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.ks.freeBoard.vo.FreeBoard;
import org.ks.freeBoard.vo.FreeBoardPageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {
	@Autowired
	@Qualifier(value="freeBoardService")
	private FreeBoardService freeBoardService;
	
	
	@RequestMapping(value="/insertFreeBoard.do")
	public ModelAndView insertFreddBoard(@RequestParam int boardType) {
		int no = boardType;
		System.out.println(no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("no",no);
		mv.setViewName("camping/insertFreeBoard");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="/newFreeBoard.do")
	public String newFreeBoard(HttpServletRequest request) {
		FreeBoard fb = new FreeBoard();
		String title = request.getParameter("title");
		String content = request.getParameter("contents");
		String nickname = request.getParameter("nickname");
		String type = request.getParameter("boardType");
		fb.setTitle(title);
		fb.setContents(content);
		fb.setNickname(nickname);
		fb.setBoardType(type);
		int result = freeBoardService.newBoard(fb);
		if(result>0) {
			System.out.println("댓글입력성공");
		}else {
			System.out.println("댓글 입력 실패");
		}
		return "18입니다요";
	}
	
	@RequestMapping(value="/freeBoard.do")
	public ModelAndView freeBoard(HttpServletRequest request) {
		int type = 1;
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		FreeBoardPageData fb = freeBoardService.mainBoard(type,reqPage);
		ModelAndView mv = new ModelAndView();
		mv.addObject("fb",fb);
		mv.setViewName("/camping/freeBoard");
		return mv;
	}
	
	@RequestMapping(value="/selectFreeBoard.do")
	public ModelAndView selectFreeBoard(@RequestParam int boardNo) {
		int no = boardNo;
		System.out.println(no);
		int result = freeBoardService.viewCountUp(no);
		FreeBoard fb = freeBoardService.selectBoard(no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("fb",fb);
		mv.setViewName("/camping/selectBoard");
		return mv;
	}
	
	@RequestMapping(value="/deleteFreeBoard.do")
	public String deleteFreeBoard(@RequestParam int boardNo) {
		int result = freeBoardService.deleteFreeBoard(boardNo);
		if(result>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "camping/freeBoard";
	}
	@RequestMapping(value="modifyFreeBoard.do")
	public ModelAndView modifyFreeBoard(@RequestParam int boardNo) {
		ModelAndView mv = new ModelAndView();
		FreeBoard fb = freeBoardService.selectBoard(boardNo);
		mv.addObject("fb",fb);
		mv.setViewName("camping/modifyFreeBoard");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="/modifyCompleteFreeBoard.do")
	public String modifyCompleteFreeBoard(@RequestParam String title,@RequestParam String contents,@RequestParam int boardNo) {
		FreeBoard fb = new FreeBoard();
		fb.setTitle(title);
		fb.setContents(contents);
		fb.setBoardNo(boardNo);
		System.out.println(fb.getTitle());
		System.out.println(fb.getContents());
		System.out.println(fb.getBoardNo());
		int result = freeBoardService.modifyComplete(fb);
		return "수정성공";
	}
	
}
