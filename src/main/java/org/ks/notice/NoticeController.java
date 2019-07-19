package org.ks.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.ks.notice.vo.Notice;
import org.ks.notice.vo.NoticePageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@Autowired
	@Qualifier(value="noticeServiceImpl")
	private NoticeService noticeServiceImpl;
	
	//페이지 이동
	@RequestMapping(value="/noticeWritePage.do")
	public String noticeWritePage() {
		String view ="/admin/notice/noticeWrite";
		return view;
	}
	//관리자 페이지 공지사항 리스트
	@RequestMapping(value="/adminNoticeList.do")
	public ModelAndView adminNoticeList(HttpServletRequest request) {
		int reqPage;
		try {
			reqPage=Integer.parseInt(request.getParameter("reqPage"));
		}catch (Exception e) {
			reqPage=1;
		}
		NoticePageData list = noticeServiceImpl.noticeList(reqPage);
		ModelAndView mav = new ModelAndView();
			mav.addObject("list",list);
			mav.setViewName("admin/notice/adminNoticeList");
		return mav;
	}
	//관라지 페이지에서 공지사항 상세보기
	@RequestMapping(value="/noticeUpdatePage.do")
	public ModelAndView noticeUpdatePage(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		Notice n = noticeServiceImpl.noticeDetail(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("n",n);
		mav.setViewName("admin/notice/noticeDetail");
		return mav;
	}
	//공지사항 수정
	@RequestMapping(value="/noticeUpdate.do")
	public String noticeUpdate(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String noticeTitle = request.getParameter("noticeTitle").replaceAll("<", "&lt");
		String noticeContent = request.getParameter("noticeContent").replaceAll("<", "&lt");
		Notice n = new Notice(idx, noticeTitle, noticeContent, null);
		int result = noticeServiceImpl.noticeUpdate(n);
		String view="common/msg";
		if(result>0) {
			request.setAttribute("msg", "공지사항 수정 성공");
			request.setAttribute("loc", "/adminNoticeList.do");
		}else {
			request.setAttribute("msg", "공지사항 수정 실패");
			request.setAttribute("loc", "/adminNoticeList.do");
		}return view;
		
	}
	//공지사항 작성
	@RequestMapping(value="/noticeWrite.do")
	public String noticeWrite(HttpServletRequest request) {
		Notice n = new Notice();
		n.setNoticeTitle(request.getParameter("noticeTitle"));
		n.setNoticeContent(request.getParameter("noticeContent"));
		String content = n.getNoticeContent().replaceAll("<", "&lt");
		n.setNoticeContent(content);
		String title = n.getNoticeTitle().replaceAll("<", "&lt");
		n.setNoticeTitle(title);
		int result = noticeServiceImpl.noticeWrite(n);
		String view="common/msg";
		if(result>0) {
			request.setAttribute("msg", "공지사항 등록 성공");
			request.setAttribute("loc", "/adminNoticeList.do");
		}else {
			request.setAttribute("msg", "공지사항 등록 실패");
		}
		return view;
	}
	//캠핑 공지사항 리스트 보여주기
	@RequestMapping(value="/noticeList.do")
	public ModelAndView noticeList(HttpServletRequest request) {
		int reqPage;
		try {
			reqPage=Integer.parseInt(request.getParameter("reqPage"));
		}catch (Exception e) {
			reqPage=1;
		}
		NoticePageData list = noticeServiceImpl.noticeListCamping(reqPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("camping/noticeList");
	return mav;
	}
	//캠핑공지사항 상세보기
	@RequestMapping(value="/noticeDetail.do")
	public ModelAndView noticeDetail(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		Notice n = noticeServiceImpl.noticeDetail(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("n",n);
		mav.setViewName("camping/noticeDetail");
		return mav;
	}
	//관리자 페이지에서 공지사항 삭제
	@RequestMapping(value="/noticeDelete.do")
	public String noticeDelete(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int result = noticeServiceImpl.noticeDelete(idx);
		String view="common/msg";
		if(result>0) {
			request.setAttribute("msg", "공지사항 삭제");
		}else {
			request.setAttribute("msg", "공지사항 삭제 실패");
		}request.setAttribute("loc", "/adminNoticeList.do");
		return view;
	}
}
