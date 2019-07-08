package org.ks.competition;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ks.competition.vo.Competition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
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
	@RequestMapping(value="/pom.do")
	public String pom() {
		return "common/pom";
	}
	@RequestMapping(value="/competitionAdminResultList.do")
	public ModelAndView competitionAdminResult() {
		ArrayList<Competition> list = competitionServiceimpl.competitionList();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("admin/competition/competitionAdmin_ResultList");
		}else {
			mav.setViewName("admin/competition/competitionResultListError");
		}
		return mav;
	}
	@RequestMapping(value="/competitionAdmin_ResultList.do")
	public String competitionAdminResultList() {
		return "/admin/competition/competitionAdmin_ResultList";
	}
	@RequestMapping(value="/competitionAdmin.do")
	public String competitionAdmin() {
		return "/admin/competition/competitionAdmin";
	}
	@RequestMapping(value="/competitionAdminWrite.do")
	public String competitionWrite() {
		return "/admin/competition/competitionWritePage";
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
	@RequestMapping(value="/competitionAdminList.do")
	public String competitionAdminList(@RequestParam String competitionCheck, Model model) {
		Competition c = competitionServiceimpl.competitionView(competitionCheck);
		model.addAttribute("competition",c);
		return "admin/competition/competitionAdmin";
	}
	@RequestMapping(value="/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	@RequestMapping(value="/competitionUpdateWrite.do")
	public String competitionUpdatePage(Model model, @RequestParam int competitionNo ) {
		Competition c = competitionServiceimpl.updateSelectOne(competitionNo);
		model.addAttribute("competition",c);
		return "admin/competition/competitionUpdatePage";
	}
	@RequestMapping(value="/competitionUpdate.do")
	public String competitionUpdate(HttpServletRequest request, HttpServletResponse response, @RequestParam String oldFilename, @RequestParam MultipartFile fileUpload, Competition c) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/competition");
		String status = request.getParameter("status");
		if(!fileUpload.isEmpty()) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date d = new Date();
		String date = sdf.format(d);
		String originName = fileUpload.getOriginalFilename();
		String onlyFileName = originName.substring(0,originName.indexOf('.'));
		String extension = originName.substring(originName.indexOf('.'));
		String filePath = onlyFileName + "_"+ date + extension;
		String fullPath = savePath+"/" + filePath;
		c.setCompetitionImg(filePath);
		System.out.println("새파일  : "+filePath);
		System.out.println("올드파일 : "+oldFilename);
			byte[] bytes;
			try {
				bytes = fileUpload.getBytes();
				File f = new File(fullPath);		
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				System.out.println("업로드성공성공!!!");
				if(oldFilename != null) {
					File deleteFile = new File(savePath+"/"+oldFilename);
					System.out.println(savePath+"/"+oldFilename);
					boolean bool = deleteFile.delete();
					System.out.println(bool?"삭제":"삭제실패");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
				if(status.equals("stay")) {
					c.setCompetitionImg(oldFilename);
				}else {
					File deleteFile = new File(savePath+"/"+oldFilename);
					boolean bool = deleteFile.delete();
					System.out.println(bool?"삭제성공":"삭제실패");
				}
			}
		int result = competitionServiceimpl.competitionUpdate(c);
		String view="";
		if(result>0) {
			request.setAttribute("msg", "수정성공!");
			request.setAttribute("loc", "/");
			view ="common/msg";
		}else {
			request.setAttribute("msg","수정실패");
			view = "common/msg";
		}
		return view;
	}
	@RequestMapping(value="/competitionDelete.do")
	public String competitionDelete(@RequestParam int competitionNo,HttpServletRequest request) {
		int result = competitionServiceimpl.deleteCompetition(competitionNo);
		String view="";
		if(result>0) {
			request.setAttribute("msg","삭제하시겠습니까?");
			request.setAttribute("loc","/");
			view = "common/msg";
		}else {
			request.setAttribute("msg","삭제 실패!");
			request.setAttribute("loc","/");
			view = "common/msg";
		}
		return view;
	}	
}
