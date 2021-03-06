package org.ks.competition;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ks.competition.vo.Competition;
import org.ks.competition.vo.CompetitionPageData;
import org.ks.member.vo.Member;
import org.ks.participant.vo.Participant;
import org.ks.participant.vo.ParticipantMember;
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
	public String competitionList(Model model, HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e){
			reqPage = 1;
		}
		CompetitionPageData cpd = competitionServiceimpl.competitionList(reqPage);
		model.addAttribute("cpd",cpd);
		return "competition/competitionResultList";
	}
	@RequestMapping(value="/pom.do")
	public String pom() {
		return "common/pom";
	}
	@RequestMapping(value="/competitionAdminResultList.do")
	public String competitionAdminResult(Model model, HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e){
			reqPage = 1;
		}
		CompetitionPageData cpd = competitionServiceimpl.competitionList(reqPage);
		model.addAttribute("cpd",cpd);
		return "admin/competition/competitionAdmin_ResultList";
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
	public String competitionView(@RequestParam String competitionCheck, Model model, @RequestParam String id) {
		if(competitionCheck == null) {
			return "competition/competitionError";
		}
		Competition c = competitionServiceimpl.competitionView(competitionCheck);
		model.addAttribute("competition",c);
		if(c == null) {
			return "competition/competitionError";
		}
		Participant p = null;
		if(!id.equals("'null'")) {
			p = competitionServiceimpl.participantCheck(c.getCompetitionNo(),id);
		}
		model.addAttribute("participant",p);
		return "competition/competitionList";
	}
	@RequestMapping(value="/competitionAdminList.do")
	public String competitionAdminList(@RequestParam String competitionCheck, Model model) {
		Competition c = competitionServiceimpl.competitionView(competitionCheck);
		model.addAttribute("competition",c);
		return "admin/competition/competitionAdmin";
	}
	@RequestMapping(value = "/mypageCompetitionResult.do")
	public String mypageCompetition(Model model,HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		String id = m.getId();
		System.out.println("확인"+id);
		ParticipantMember p = competitionServiceimpl.competitionMypage(id);
		model.addAttribute("participant",p);
		return "competition/competitionMypage";		
	}
	@RequestMapping(value="/competitionAdmin_List.do")
	public String competitionAdmin_ListView(@RequestParam int competitionNo, Model model) {
		/*요리대회 리스트*/
		Competition c = competitionServiceimpl.competitionListView(competitionNo);
		model.addAttribute("competition",c);
		
		/*참가자 전체 리스트*/
		ArrayList<ParticipantMember> list = competitionServiceimpl.participantView(competitionNo);
		model.addAttribute("list",list);
		
		/*합격자 리스트 */
		ArrayList<ParticipantMember> passList = competitionServiceimpl.participantPassList(competitionNo);
		model.addAttribute("passList",passList);
		model.addAttribute("count",passList.size());
		return "admin/competition/competitionAdmin_ListView";
	}
	@RequestMapping(value="/competitionResultAdmin.do")
	public String competitionResultAdmin(@RequestParam int competitionNo, Model model) {
		Competition c = competitionServiceimpl.competitionResultView(competitionNo);
		model.addAttribute("competition",c);
		ArrayList<ParticipantMember> resultList = competitionServiceimpl.participantResultList(competitionNo); 
		model.addAttribute("participant",resultList);
		return "admin/competition/competitionAdmin_ResultView";
	}
	@RequestMapping(value="/competitionResultView.do")
	public String competitionResultView(@RequestParam int competitionNo, Model model) {
		Competition c = competitionServiceimpl.competitionResultViewPage(competitionNo);
		model.addAttribute("competition",c);
		return "competition/competitionResultView";
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
			request.setAttribute("loc", "/adminPage.do");
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
			request.setAttribute("loc","/adminPage.do");
			view = "common/msg";
		}else {
			request.setAttribute("msg","삭제 실패!");
			request.setAttribute("loc","/adminPage.do");
			view = "common/msg";
		}
		return view;
	}
	@RequestMapping(value="/competitionResultDelete.do")
	public String competitionResultDelete(@RequestParam int competitionNo, HttpServletRequest request) {
		int result = competitionServiceimpl.resultDelete(competitionNo);
		String view="";
		if(result>0) {
			request.setAttribute("msg","삭제하시겠습니까?");
			request.setAttribute("loc","/adminPage.do");
			view = "common/msg";
		}else {
			request.setAttribute("msg","삭제 실패!");
			request.setAttribute("loc","/adminPage.do");
			view = "common/msg";
		}
		return view;
	}
	@RequestMapping(value="/competitionAdminSearch.do")
	public String competitionSearch(){
		return "admin/competition/competitionAdmin_search";
	}
	@RequestMapping(value="/participantCheck.do")
	public ModelAndView participantCheck(HttpServletRequest request, @RequestParam String[] checkArr, @RequestParam int competitionNo) {
		System.out.println(checkArr[0]);
		int result = competitionServiceimpl.participantUpdate(checkArr,competitionNo);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:/competitionAdminList.do?competitionCheck='Y'");
		}else {
			mav.setViewName("redirect:/index.jsp");
		}
		return mav;
	}
	@RequestMapping(value="/participantPassCheck.do")
	public ModelAndView participantPassList(HttpServletRequest request, @RequestParam String[] checkPass, @RequestParam int competitionNo) {
		int result = competitionServiceimpl.participantPass(checkPass,competitionNo);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:/competitionAdminList.do?competitionCheck='Y'");
		}else {
			mav.setViewName("redirect:/index.jsp");
		}
		return mav;
	}
	@RequestMapping(value="/participantResult.do")
	public ModelAndView participantResult(HttpServletRequest request, @RequestParam String checkResult, @RequestParam int competitionNo) {
		int result = competitionServiceimpl.participantResult(checkResult,competitionNo);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:/competitionAdminList.do?competitionCheck='Y'");
		}else {
			mav.setViewName("redirect:/index.jsp");
		}
		return mav;
	}
}
