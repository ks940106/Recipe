package org.ks.tmr;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.ks.tmr.vo.LMRPageData;
import org.ks.tmr.vo.TMRPageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TMRContoller {
	@Autowired
	@Qualifier("TMRServiceImpl")
	private TMRService tmrserviceImpl;
	
	@RequestMapping(value="/tmr.do")
	public String tmrPage(Model model,HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e){
			reqPage = 1;
		}
		String month = new SimpleDateFormat("MM").format(new Date(System.currentTimeMillis())); //현재 월 받아오기
		String year = new SimpleDateFormat("yy").format(new Date(System.currentTimeMillis())); //현재 연 받아오기
		TMRPageData tpd = tmrserviceImpl.selectTMR(year,month,reqPage);
		model.addAttribute("tpd", tpd);
		return "tmr/tmrPage";
	}
	
	@Scheduled(cron="0 0 0 1 * *")
	public void lmrInsert() {
		String year = new SimpleDateFormat("yy").format(new Date(System.currentTimeMillis()));
		String month = new SimpleDateFormat("MM").format(new Date(System.currentTimeMillis()));
		if(month.equals("01")) {
			year = Integer.toString(Integer.parseInt(year)-1);
			month= "12";
		}else {
			month= Integer.toString(Integer.parseInt(month)-1);
		}
		if(Integer.parseInt(year)<10) {
			year="0"+year;
		}
		if(Integer.parseInt(month)<10) {
			month="0"+month;
		}
		tmrserviceImpl.insertLMR(year,month);
		System.out.println("지난 달 레시피 등록 성공");
	}
	
	@RequestMapping(value="/lmr.do")
	public String lmrPage(Model model,HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e){
			reqPage = 1;
		}
		LMRPageData lpd = tmrserviceImpl.selectLMR(reqPage);
		model.addAttribute("lpd",lpd);
		return "admin/lmr/lmrPage";
	}
	@RequestMapping(value="/lmrUpload.do")
	public String lmrUpload(@RequestParam MultipartFile file,@RequestParam String originfile,HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/tmr/");
		File delFile = new File(savePath+originfile);
        if( delFile.exists() ){
            if(delFile.delete()){
                System.out.println("파일삭제 성공");
            }else{
                System.out.println("파일삭제 실패");
            }
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }
        
		String fileName = file.getOriginalFilename();
		if(!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				File uploadFile = new File(savePath+fileName);
				FileOutputStream fos = new FileOutputStream(uploadFile);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		tmrserviceImpl.updateFile(fileName);
		return "redirect:/lmr.do";
		
		
	}
	@RequestMapping(value="/popup.do")
	public String popup(Model model) {
		String img = tmrserviceImpl.lmrImg();
		model.addAttribute("img", img);
		return "tmr/tmrPopup";
	}
	@RequestMapping(value="/lmrImg.do")
	public String lmrImg(Model model) {
		String img = tmrserviceImpl.lmrImg();
		model.addAttribute("img", img);
		return "admin/lmr/lmrImg";
	}
}
