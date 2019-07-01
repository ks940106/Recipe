package org.ks.competition;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.ks.competition.vo.Competition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompetitionController {
	@Autowired
	@Qualifier(value="competitionServiceimpl")
	private CompetitionService competitionServiceimpl;
	@RequestMapping(value="/competitionResultList.do")
	public ModelAndView competitionList() {
		ArrayList<Competition> list = competitionServiceimpl.competitionList();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("competition/competitionResultList");
		}else {
			mav.setViewName("competition/competitionResultListError");
		}
		return mav;
	}
	@RequestMapping(value="/competitionWrite.do")
	public String competitionWrite() {
		return "competition/competitionWritePage";
	}
	@RequestMapping(value="/competitionWritePage.do")
	public String upload(HttpServletRequest request, Competition c, @RequestParam MultipartFile fileUpload) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/competition");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date d = new Date();
		String date = sdf.format(d);
		String originName = fileUpload.getOriginalFilename();
		String onlyFileName = originName.substring(0,originName.indexOf('.'));
		String extension = originName.substring(originName.indexOf('.'));
		String filePath = onlyFileName + "_"+ date + extension;
		String fullPath = savePath+"/" + filePath;
		c.setCompetitionImg(filePath);
		int result = competitionServiceimpl.insertCompetition(c);
		if(!fileUpload.isEmpty()) {
			byte[] bytes;
			try {
				bytes = fileUpload.getBytes();
				File f = new File(fullPath);		
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				System.out.println("업로드성공성공!!!");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String view ="";
		if(result>0) {
			request.setAttribute("msg", "게시글이 등록 되었습니다.");
			request.setAttribute("loc", "/adminPage.do");
			view = "common/msg";
		}else {
			request.setAttribute("msg", "게시글등록이 실패했습니다.");
			view = "common/msg";
		}
		return view;
	}
	@RequestMapping(value="/competitionList.do")
	public String competitionView(@RequestParam String competitionCheck, Model model) {
		Competition c = competitionServiceimpl.competitionView(competitionCheck);
		model.addAttribute("competition",c);
		return "competition/competitionList";
	}
	@RequestMapping(value="/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	
}
