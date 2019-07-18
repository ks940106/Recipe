package org.ks.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.ks.notice.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView adminNoticeList() {
		ArrayList<Notice> list = noticeServiceImpl.noticeList();
		ModelAndView mav = new ModelAndView();
			mav.addObject("list",list);
			mav.setViewName("admin/notice/adminNoticeList");
		return mav;
	}
	//공지사항 수정
	@RequestMapping(value="/noticeUpdate.do")
	public ModelAndView noticeDetail(HttpServletRequest request) {
		String idx = request.getParameter("idx");
		Notice n = noticeServiceImpl.noticeDetail(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("n",n);
		mav.setViewName("admin/notice/noticeDetail");
		return mav;
	}
	//공지사항 작성
	@RequestMapping(value="/noticeWrite.do")
	public String noticeWrite(HttpServletRequest request) {
		Notice n = new Notice();
		n.setNoticeTitle(request.getParameter("noticeTitle"));
		n.setNoticeContent(request.getParameter("noticeContent"));
		System.out.println(n.getNoticeTitle());
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
}
