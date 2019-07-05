package org.ks.member;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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

import org.ks.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
    //로그인
    @RequestMapping(value="/login.do")
    public String login(HttpServletRequest request,@RequestParam String id,@RequestParam String pw ) {
        Member m = new Member();
        m.setId(id);
        m.setPw(pw);
        Member member = memberService.login(m);
        String view="";
        if(member==null) {
            request.setAttribute("msg", "로그인 실패");
            //request.setAttribute("loc", "WEB-INF/views/member/loginPage.jsp");
        }
        else if(member.getName().equals("관리자")) {
            HttpSession session =request.getSession();
            session.setAttribute("member", member);
            request.setAttribute("msg","관리자 입니다" );
            request.setAttribute("loc", "/");
        }else if(member!= null) {
            HttpSession session =request.getSession();
            session.setAttribute("member", member);
            request.setAttribute("msg","로그인성공" );
            request.setAttribute("loc", "/");
        }
        view="common/msg";
        return view;
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
	/*@RequestMapping(value="/insertMember.do")
	public String insertMember(HttpServletRequest request,@RequestParam MultipartFile fileUpload) {
		System.out.println("컨트롤러");
		String id=request.getParameter("id");
		String pw = request.getParameter("pw");
		String name=request.getParameter("name");
		String nickname=request.getParameter("nickname");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");

		String zipCode=request.getParameter("zipCode");
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
				System.out.println("업로드성공성공!!!");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String view="";
		if(result>0) {
			request.setAttribute("msg", "회원가입 성공");
			request.setAttribute("loc", "/login.do");
			view = "common/msg";
		}else {
			request.setAttribute("msg", "회원가입 실패");
			request.setAttribute("loc", "/insert.do");
			view = "common/msg";
		}return view;
	}*/
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

    @RequestMapping(value="/mypage.do")
    public String mypage() {
        return "member/mypage";
    }
}



