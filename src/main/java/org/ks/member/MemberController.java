package org.ks.member;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ks.member.commons.SHA256Util;
import org.ks.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Autowired
	@Qualifier(value="memberServiceImpl")
	private MemberService memberService;
	//페이지 이동
	@RequestMapping(value="/loginPage.do")
	public String loginPage() {
		return "member/loginPage";
	}
	@RequestMapping(value="/joinPage.do")
	public String joinPage() {
		return "member/joinPage";
	}
	@RequestMapping(value="/insert.do")
	public String insert() {
		return "member/insert";
	}
	@RequestMapping(value="/memberUpdatePage.do")
	public String memberUpdate() {
		return "member/memberUpdatePage";
	}
	//로그인
	@RequestMapping(value="/login.do")
	public String login(HttpServletRequest request,@RequestParam String id,@RequestParam String pw ){
		Member m = new Member();
		m.setId(id);
		try {
			m.setPw(new SHA256Util().encData(pw));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Member member = memberService.login(m);
		String view="";
		if(member==null) {
				request.setAttribute("msg", "로그인 실패");
				request.setAttribute("loc", "/loginPage.do");
				view="common/msg";
				return view;
		}
		else if(member.getName().equals("관리자")) {
			HttpSession session =request.getSession();
			session.setAttribute("member", member);
		}else if(member!= null) {
			HttpSession session =request.getSession();
			session.setAttribute("member", member);
		}
		return "redirect:/index.jsp";

	}
	//로그아웃
	@RequestMapping(value="/logout.do")
	public void logout(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if(session!=null) {
			session.invalidate();
		}
		try {
			response.sendRedirect("/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//회원가입
	@RequestMapping(value="/insertMember.do")
	public String insertMember(HttpServletRequest request,@RequestParam MultipartFile fileUpload){
		String id=request.getParameter("id");
		String pw1 = request.getParameter("pw");
		String name=request.getParameter("name");
		String nickname=request.getParameter("nickname");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String fileUpload1 =request.getParameter("fileUpload");
		System.out.println(fileUpload1);
		String zipCode=request.getParameter("zipCode");
		//파일 업로드
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date d = new Date();
		String date = sdf.format(d);
		String originName = fileUpload.getOriginalFilename();
		String onlyFileName = originName.substring(0,originName.indexOf('.'));
		String extension = originName.substring(originName.indexOf('.'));
		String memberImg = onlyFileName + "_"+ date + extension;
		/*String memberImg1 = savePath+"/" + memberImg;*/
		String pw = null;
		try {
			pw = new SHA256Util().encData(pw1);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Member m = new Member(id, pw, name, nickname, gender, addr1, addr2, phone,memberImg,zipCode);
		int result = memberService.insertMember(m);
		if(!fileUpload.isEmpty()) {
			byte[] bytes;
			try {
				bytes = fileUpload.getBytes();
				File f = new File(memberImg);		
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String view = "common/msg";
		System.out.println(view);
		if(result>0) {
			request.setAttribute("msg", "회원가입 성공");
			request.setAttribute("loc", "/loginPage.do");
		}else {
			request.setAttribute("msg", "회원가입 실패");
			request.setAttribute("loc", "/insert.do");
		}return view;
	}
	//이메일 중복확인
	@RequestMapping(value="emailCheck.do")
	public void emailCheck (HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id=request.getParameter("email");
		String idch=memberService.emailCheck(id);
		PrintWriter Y = response.getWriter();
		if(idch==null) {
			Y.print("Y");
		}else {
			Y.print("N");
		}
		
	}
	//닉네임 중복확인
	@RequestMapping(value="/nickCheck.do")
	public void nickCheck(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String nickname = request.getParameter("nickname");
		String nicknamech=memberService.nickCheck(nickname);
		PrintWriter Y =response.getWriter();
		if(nicknamech==null) {//닉네임 중복 없음
			Y.print("Y");
		}else {//닉네임 중복
			Y.print("N");
		}
	}
	//이메일 인증
	@RequestMapping(value="/emailcertification.do")
	public void emailcertification(HttpServletRequest request,HttpServletResponse response) {
		String id = request.getParameter("email");
		System.out.println("메일 인증");
		String host = "smtp.googlemail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 

	      final String user = "fghij7410@gmail.com"; 
	      final String password = "user1404";       

	      Properties props = new Properties(); 
	      props.put("mail.smtp.host", host); 
	      props.put("mail.smtp.port", 587); 
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable","true");

	  
	      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
	          protected PasswordAuthentication getPasswordAuthentication() { 
	             return new PasswordAuthentication(user, password); 
	             } 
	          });
	       
	       try {
	          MimeMessage message = new MimeMessage(session); 
	          message.setFrom(new InternetAddress(user)); 
	          message.addRecipient(Message.RecipientType.TO, new InternetAddress(id)); 
	          // 메일 제목 
	          message.setSubject("싱싱레시피"); 
	          
	       
	       Random random = new Random();
	       String num = new String();
	       for(int i =0;i<7;i++) {
	          num+=String.valueOf(random.nextInt(9)+1);
	    
	          
	       }
	       // 메일 내용 
	       message.setContent("<!DOCTYPE html>\r\n" + 
	 				"<html>\r\n" + 
	 				"<head>\r\n" + 
	 				"<meta charset=\"UTF-8\">\r\n" + 
	 				"<title>Insert title here</title>\r\n" + 
	 				"</head>\r\n" + 
	 				"    <style>\r\n" + 
	 				"        div{\r\n" + 
	 				"           \r\n" + 
	 				"        }\r\n" + 
	 				"    </style>\r\n" + 
	 				"<body>\r\n" + 
	 				"    <div style=\"padding-left: 50px;padding-top:20px; margin: 100px; width:1155px; border: 2px solid darkgray;\" >\r\n" + 
	 				"        <br>\r\n" + 
	 				"        <div style=\"padding-top:30px;font-weight:bold;\">\r\n" + 
	 				"    <p style=\"text-align:left;\">\r\n" + 
	 				"        저희 싱싱레시피를 이용해 주셔서 감사합니다.<br><br>\r\n" + 
	 				"        \r\n" + 
	 				"        회원님의 본인인증 키는 <span style=\"font-size:20px;\"> "+num+" </span>입니다.<br><br>\r\n" + 
	 				"        보안을 위해 이 링크는 전송된 후 2분이 지나면 만료됩니다.<br><br>\r\n" + 
	 				"        감사합니다. <br>\r\n" + 
	 				"       싱싱레시피 \r\n" + 
	 				"    </p>\r\n" + 
	 				"       </div>\r\n" + 
	 				"    </div>\r\n" + 
	 				"</body>\r\n" + 
	 				"</html>","text/html;charset=euc-kr");  
	       // send the message 
	       Transport.send(message); 
	       System.out.println("Success Message Send"); 
	       RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/member/emailcertification.jsp");
	       request.setAttribute("num", num);
	       try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       } catch (MessagingException e) { 
	          e.printStackTrace(); 
	          } 
	    }
	//마이페이지 비밀번호 체크
	@RequestMapping(value="/myPagePwCheck.do")
	public String myPagePwCheck(HttpServletRequest request){
		String pwCheck=request.getParameter("pwcheck");
		String pw = null;
		try {
			System.out.println("!!");
			pw = new SHA256Util().encData(pwCheck);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(pw);
		HttpSession session = request.getSession(false);
		String id=((Member)session.getAttribute("member")).getId();
		Member member = memberService.pwCheck(id,pw);
		String view="";
		if(member!=null) {
			view="member/myPageUpdate";
		}else {
			request.setAttribute("msg", "비밀번호를 다시 확인해주세요");
			request.setAttribute("loc", "/mypage.do");
			view="common/msg";
		}return view;
	}
	//마이페이지 회원정보 수정
	@RequestMapping(value="/myPageUpdate.do")
	public String myPageUpdate(HttpServletRequest request,HttpServletResponse response,@RequestParam MultipartFile fileUpload)throws ServletException, IOException {
		Member m = new Member();
		m.setId(request.getParameter("id"));
		System.out.println(m.getId());
		String pw1 = request.getParameter("new_pw");
		m.setNickname(request.getParameter("nickname"));
		m.setAddr1(request.getParameter("addr1"));
		m.setAddr2(request.getParameter("addr2"));
		m.setPhone(request.getParameter("phone"));
		m.setMemberImg(request.getParameter("fileUpload")); 
		m.setZipCode(request.getParameter("zipCode"));
		//파일 업로드
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date d = new Date();
		String date = sdf.format(d);
		String originName = fileUpload.getOriginalFilename();
		String onlyFileName = originName.substring(0,originName.indexOf('.'));
		String extension = originName.substring(originName.indexOf('.'));
		String filePath = onlyFileName + "_"+ date + extension;
		String memberImg = savePath+"/" + filePath;
		String pw = null;
		try {
			pw = new SHA256Util().encData(pw1);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		m.setPw(pw);
		m.setMemberImg(filePath);
		System.out.println(m.getAddr1());
		int result = memberService.updateMember(m);
		if(!fileUpload.isEmpty()) {
			byte[] bytes;
			try {
				bytes = fileUpload.getBytes();
				File f = new File(memberImg);		
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String view ="common/msg";
		if(result>0) {
			request.setAttribute("msg","회원 정보 수정 성공");
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("msg","정보 수정 실패");
		}return view;
	}
	//마이페이지 탈퇴
	@RequestMapping(value="/myPageDelete.do")
	public String myPageDelete(HttpServletRequest request,HttpSession session) {
		String id = request.getParameter("id");
		System.out.println(id);
		int result = memberService.deleteMember(id);
		String view="common/msg";
		if(result>0) {
			request.setAttribute("msg", "회원 탈퇴 되었습니다");
			request.setAttribute("loc", "/");
			session=request.getSession(false);
			session.invalidate();
		}else {
			request.setAttribute("msg", "회원탈퇴 불가");
		}return view;
	}
	
	@RequestMapping(value="/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	//관리자 페이지 시작
	@RequestMapping(value="/memberList.do")
	public ModelAndView memberList() {
		ArrayList<Member> list = memberService.memberList();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("admin/member/memberList");
		}
		return mav;
	}
	@RequestMapping(value="memberDelete.do")
	public String memberDelete(HttpServletRequest request) {
		String id = request.getParameter("id");
		int result = memberService.deleteMember(id);
		String view="common/msg";
		if(result>0) {
			request.setAttribute("msg", "회원 삭제");
			request.setAttribute("loc", "memberList.do");
		}else {
			request.setAttribute("msg", "삭제 실패");
			request.setAttribute("loc", "memberList.do");
		}return view;
	}
}



