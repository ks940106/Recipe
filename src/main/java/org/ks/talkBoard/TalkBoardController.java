package org.ks.talkBoard;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.ks.talkBoard.vo.TalkBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	public String insertTalkBoard(MultipartHttpServletRequest request,@RequestParam MultipartFile filedata,TalkBoard tb) {
		System.out.println(tb.getNickname());
		System.out.println(filedata);
		System.out.println(request.getFiles("filedata").size());
		String[] FF = request.getParameterValues("fileName");
		System.out.println(FF.length);
		List<MultipartFile> fi = request.getFiles("filedata");
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		if(fi.size()>0) {
		for(MultipartFile m : fi) {
			//System.out.println(m.getOriginalFilename());
			if(m.isEmpty()) {
				fi.remove(m);
			}
		}
	
		
		}
		if(FF != null) {
			if(!fi.isEmpty()) {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/talkBoard");
				String img = "";
				int q = 0;
				for(MultipartFile m : fi) {
						System.out.println("q : "+q);
						if(m.getOriginalFilename().equals(FF[q])) {
						System.out.println(savePath);
						//List<MultipartFile> fileList = request.getFiles("filedata");
						//img1.jpg
//						String originName = filedata.getOriginalFilename();
				         String originName = m.getOriginalFilename();
						//img1
						String onlyFileName = originName.substring(0, originName.indexOf("."));
						//jpg
						String extension = originName.substring(originName.indexOf("."));
						//img_1(현재시간을 초단위).jpg
						SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
						Calendar c = Calendar.getInstance();
						String time = format.format(c.getTime());
						String filePath = onlyFileName+"_"+time+"_"+"1"+extension;
						String fullPath = savePath+"/"+filePath;
						if(!m.isEmpty()) {
							try {
								byte[] bytes = m.getBytes();
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
						if(fi.size() > 1 ) {
							img += filePath+"/";
						}else {
							img = filePath+"/";
						}
						System.out.println(originName);
						System.out.println(fullPath);
						System.out.println(tb.getBoardContents());
						
						System.out.println(img);
						tb.setBoardImg(img);
						}
					q++;
				}
		}else {
			tb.setBoardImg("");
			}
		}else {
			tb.setBoardImg("");
		}
		
					
			
		
		
		
		
		
		
		
		
		int result = talkBoardService.insertTalkBoard(tb);
		if(result>0) {
			System.out.println("글등록 성공");
			return "talkBoard/mainBoard";
		}else {
			System.out.println("등록실패");
			return "/";
		}
	}
	@RequestMapping(value="selectTalkBoard.do")
	public ModelAndView selectTalkBoard(@RequestParam String boardNo) {
		int no = Integer.parseInt(boardNo);
		System.out.println("넘어온 보드넘버 : "+no);
		TalkBoard tb = talkBoardService.selectTalkBoard(no);
		System.out.println(tb.getBoardContents());
		ModelAndView mv = new ModelAndView();
		mv.addObject("tb",tb);
		mv.setViewName("talkBoard/selectTalkBoard");
		return mv;
	}
	
	@RequestMapping(value="/deleteTalkBoard.do")
	public String deleteTalkBoard(@RequestParam String boardNo) {
		int no = Integer.parseInt(boardNo);
		TalkBoard tb = talkBoardService.selectTalkBoard(no);
		System.out.println(tb.getBoardImg());
		String img = tb.getBoardImg();
		String[] file = img.split("/");
		File f = null;
		for(int i=0;i<file.length;i++) {
			f = new File("C:\\Users\\wlsdh\\Desktop\\Recipe\\src\\main\\webapp\\resources\\talkBoard\\"+file[i]);
			f.delete();
		}
		int result = talkBoardService.deleteTalkBoard(no);
		System.out.println("삭제 0실패 1성공 : "+result);
		if(result ==0) {
			return "/";
		}else {
			return "talkBoard/mainBoard";
		}
	}
	@RequestMapping(value="/modifyTalkBoard.do")
	public ModelAndView modifyTalkBoard(@RequestParam String boardNo) {
		int no = Integer.parseInt(boardNo);
		TalkBoard tb = talkBoardService.selectTalkBoard(no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("tb",tb);
		mv.setViewName("talkBoard/modifyTalkBoard");
		return mv;
	}
	@RequestMapping(value="/modifyCompleteTalkBoard.do")
	public String modifyCompleteTalkBoard(MultipartHttpServletRequest request,@RequestParam MultipartFile filedata,TalkBoard tb) {
		System.out.println("11");
		
		String fullImg = request.getParameter("fullImg");	//DB에 저장된 img값
		String[] fImg = fullImg.split("/");					//DB에 저장된 img값을 구분자/로 잘라서 fImg에 배열로저장
		String[] img = request.getParameterValues("oneImg");	//jsp에서 넘어온 배열을 img배열에 저장
		System.out.println("풀 : "+fImg[0]);
		System.out.println("이미지 : "+img[0]);
		System.out.println(img[0].isEmpty());
		String saveImg = "";
		File f = null;
		if(img[0].isEmpty()) {
			for(int i=0; i<fImg.length;i++) {
				f = new File("C:\\Users\\wlsdh\\Desktop\\Recipe\\src\\main\\webapp\\resources\\talkBoard\\"+fImg[i]);
				f.delete();
			}
		}else {
		String modifyImg = fullImg;
		for(int i=0;i<fImg.length;i++) {
			for(int j=0; j<img.length;j++) {
				if(fImg[i].equals(img[j])) {
					System.out.println("수정 파일 : "+img[j]);
					modifyImg = modifyImg.replaceAll(img[j]+"/", "");
					saveImg += img[j]+"/";
					System.out.println("삭제 이미지 누적 : "+modifyImg);
				}
			}
		}
		System.out.println(modifyImg);
		System.out.println(saveImg);
		String[] deleteImg = modifyImg.split("/");
		
		for(int i=0;i<deleteImg.length;i++) {
			f = new File("C:\\Users\\wlsdh\\Desktop\\Recipe\\src\\main\\webapp\\resources\\talkBoard\\"+deleteImg[i]);
			f.delete();
		}
		}
		if(!filedata.isEmpty()) {
		System.out.println(tb.getNickname());
		String savePath = request.getSession().getServletContext().getRealPath("/resources/talkBoard");
		System.out.println(savePath);
		String imgName = "";
		List<MultipartFile> fileList = request.getFiles("filedata");
		for (MultipartFile mf : fileList) {
            String originName = mf.getOriginalFilename();
            System.out.println(originName);
          //img1
    		String onlyFileName = originName.substring(0, originName.indexOf("."));
    		//jpg
    		String extension = originName.substring(originName.indexOf("."));
    		//img_1(현재시간을 초단위).jpg
    		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
    		Calendar c = Calendar.getInstance();
    		String time = format.format(c.getTime());
    		String filePath = onlyFileName+"_"+time+"_"+"1"+extension;
    		String fullPath = savePath+"/"+filePath;
    		if(!mf.isEmpty()) {
    			try {
    				byte[] bytes = mf.getBytes();
    				File f2 = new File(fullPath);
    				FileOutputStream fos = new FileOutputStream(f2);
    				BufferedOutputStream bos = new BufferedOutputStream(fos);
    				bos.write(bytes);
    				bos.close();
    				System.out.println("파일업로드 성공");
    			} catch (IOException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		}
    		if(fileList.size() > 1 ) {
    			imgName += filePath+"/";
    		}else {
    			imgName = filePath;
    		}
    		System.out.println(originName);
    		System.out.println(fullPath);
    		System.out.println(tb.getBoardContents());
    		}
    		tb.setBoardImg(saveImg+imgName);
			}else {
				tb.setBoardImg(saveImg);
			}
    		System.out.println(tb.getBoardImg());
    		int result = talkBoardService.updateTalkBoard(tb);
    		if(result>0) {
    			System.out.println("글등록 성공");
    			return "talkBoard/mainBoard";
    		}else {
    			System.out.println("등록실패");
    			return "talkBoard/mainBoard";
    		}
	}
}
