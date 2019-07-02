package org.ks.talkBoard;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.ks.talkBoard.vo.TalkBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	public String insertTalkBoard(HttpServletRequest request,@RequestParam MultipartFile fileTest,TalkBoard tb) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/talkBoard");
		System.out.println(savePath);
		//img1.jpg
		String originName = fileTest.getOriginalFilename();
		//img1
		String onlyFileName = originName.substring(0, originName.indexOf("."));
		//jpg
		String extension = originName.substring(originName.indexOf("."));
		//img_1(현재시간을 초단위).jpg
		String filePath = onlyFileName+"_"+"1"+extension;
		String fullPath = savePath+"/"+filePath;
		if(!fileTest.isEmpty()) {
			try {
				byte[] bytes = fileTest.getBytes();
				File f = new File(fullPath);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				System.out.println("파일업로드 성공");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		tb.setBoardImg(filePath);
		System.out.println(fullPath);
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
