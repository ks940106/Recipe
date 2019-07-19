package org.ks.caravan;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ks.caravan.vo.Caravan;
import org.ks.caravan.vo.CaravanImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@Controller
public class CaravanController {

	@Autowired
	@Qualifier(value="CaravanServiceImpl")
	public CaravanService CaravanServiceImpl;
	
	@RequestMapping(value="caravanIntroduce.do")
	public ModelAndView caravanIntroduce() {
		CaravanImg cImg = CaravanServiceImpl.selectCaravanA();
		ModelAndView mav = new ModelAndView();
		if(cImg==null) {
			mav.setViewName("camping/caravanIntroduce");
		}else {
			mav.addObject("c",cImg);
			mav.setViewName("camping/caravanIntroduce");
		}
		return mav;
	}
	@RequestMapping(value="caravanIntroduce2.do")
	public ModelAndView caravanIntroduce2() {
		CaravanImg cImg = CaravanServiceImpl.selectCaravanB();
		ModelAndView mav = new ModelAndView();
		if(cImg==null) {
			mav.setViewName("camping/caravanIntroduce2");
		}else {
			mav.addObject("c",cImg);
			mav.setViewName("camping/caravanIntroduce2");
		}
		return mav;
	}
	@RequestMapping(value="caravanIntroduce3.do")
	public ModelAndView caravanIntroduce3() {
		CaravanImg cImg = CaravanServiceImpl.selectCaravanC();
		ModelAndView mav = new ModelAndView();
		if(cImg==null) {
			mav.setViewName("camping/caravanIntroduce3");
		}else {
			mav.addObject("c",cImg);
			mav.setViewName("camping/caravanIntroduce3");
		}
		return mav;
	}
	
	//관리자
	
	@RequestMapping(value="seletecaravan.do") //카라반 전체리스트
	public ModelAndView caravanList() {
		ArrayList<Caravan> list = CaravanServiceImpl.seleteAllCaravanList();
		ModelAndView mav = new ModelAndView();
		if(list.isEmpty()) {
			mav.setViewName("admin/caravan/seletecaravan");
		}else {
			mav.addObject("list",list);
			mav.setViewName("admin/caravan/seletecaravan");
		}
		return mav;
	}
	@RequestMapping(value="insertCaravan.do")
	public String insertCaravan() {
		return "admin/caravan/insertCaravan";
	}
	@RequestMapping(value="insertCaravanList.do")
	public String insertCaravanList(HttpServletRequest request) {//카라반 등록
		Caravan c = new Caravan();
		ModelAndView mav = new ModelAndView();
		c.setCaravanName(request.getParameter("caravanName"));
		c.setCaravanArea(Integer.parseInt(request.getParameter("caravanArea")) );
		c.setCaravanPeople(Integer.parseInt(request.getParameter("caravanPeople")));
		c.setCaravanMaxPeople(Integer.parseInt(request.getParameter("caravanMaxPeople")));
		c.setCaravanPlusCost(Integer.parseInt(request.getParameter("caravanPlusCost")));
		c.setCaravanCost(Integer.parseInt(request.getParameter("caravanCost")));
		c.setCaravanInfo(request.getParameter("caravanInfo"));
		int result = CaravanServiceImpl.insertCaravanList(c);
		if(result>0) {
			return "redirect:/seletecaravan.do";	
		}else {
			return "redirect:/seletecaravan.do";
			
		}
	}
	@RequestMapping(value="deleteCaravan.do")
	public String deleteCaravan(HttpServletRequest request) {
		String[] caravanNo = request.getParameterValues("caravanNo");
		CaravanServiceImpl.deleteCaravanList(caravanNo);
		return "redirect:/seletecaravan.do";
	}
	@RequestMapping(value="updateCaravan.do")
	public ModelAndView updateCaravan(HttpServletRequest request) {
		String caravanNo = request.getParameter("caravanNo");
		Caravan c = CaravanServiceImpl.updateCaravanList(caravanNo);
		ModelAndView mav = new ModelAndView();
		if(c ==null) {
			 mav.setViewName("/seletecaravan.do");
		}else {
			mav.addObject("caravan", c);
			mav.setViewName("admin/caravan/updateCaravan");
		}
		return mav;
	}
	
	@RequestMapping(value="caravanMainImg.do")
	public ModelAndView caravanMainImg() {
		ArrayList<Caravan> list = CaravanServiceImpl.selectRepresentationCaravan();
		ModelAndView mav = new ModelAndView();
		if(list.isEmpty()) {
			mav.setViewName("admin/caravan/seletecaravan");
		}else {
			mav.addObject("list",list);
			mav.setViewName("admin/caravan/caravanMainImg");
		}
		return mav;
	}
	@RequestMapping(value="/updaterepresentationCaravan.do")
	public ModelAndView updaterepresentationCaravan(HttpServletRequest request) {
		String caravanNo = request.getParameter("caravanNo");
		CaravanImg c = CaravanServiceImpl.updaterepresentationCaravan(caravanNo);
		ModelAndView mav = new ModelAndView();
		if(c ==null) {
			 mav.setViewName("/caravanMainImg.do");
		}else {
			mav.addObject("caravan", c);
			mav.setViewName("admin/caravan/representationCaravan");
		}
		return mav;
	}
	
	@RequestMapping(value="/updateinsertCaravan.do")
	public String updateinsertCaravan(
			HttpServletRequest request,
			@RequestParam(value="fileTest",required=true) List<MultipartFile> fileTest
			)  {
		String caravanNo = request.getParameter("caravanNo");
		CaravanImg cImg= new CaravanImg();
		ArrayList<String> filePathList = new ArrayList<String>();
		if(fileTest.size()>0) {
			for(int i =0;i<fileTest.size();i++) {
				Date d = new Date();
				SimpleDateFormat sysdate = new SimpleDateFormat("yyMMddHHmmss"+i);
				String savePath = request.getSession().getServletContext().getRealPath("/resources/img/");
				String originName = fileTest.get(i).getOriginalFilename();
				String onlyFileName =originName.substring(0, originName.indexOf("."));
				String extension = originName.substring(originName.indexOf("."));
				String filePath = onlyFileName+"_"+sysdate.format(d)+extension;
				String fullPath = savePath+"/"+filePath;
				filePathList.add(filePath);
				
				try {
					byte[] bytes = fileTest.get(i).getBytes();
					File f = new File(fullPath);
					FileOutputStream fos = new FileOutputStream(f);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					System.out.println("파일업로드 성공!");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			cImg.setCaravanMainImg(filePathList.get(0));
			cImg.setCaravanImg(filePathList.get(1));
			cImg.setCaravanImg1(filePathList.get(2));
			cImg.setCaravanNo(Integer.parseInt(caravanNo));
		}
		CaravanImg c = CaravanServiceImpl.updaterepresentationCaravan(caravanNo);
		if(!c.getCaravanMainImg().equals(filePathList.get(0))) {
			String fullPath = request.getSession().getServletContext().getRealPath("/resources/img/"+c.getCaravanMainImg());
			File f = new File(fullPath);
			f.delete();
		}
		if(!c.getCaravanImg().equals(filePathList.get(1))) {
			String fullPath = request.getSession().getServletContext().getRealPath("/resources/img/"+c.getCaravanImg());
			File f = new File(fullPath);
			f.delete();
		}
		if(!c.getCaravanImg1().equals(filePathList.get(2))) {
			String fullPath = request.getSession().getServletContext().getRealPath("/resources/img/"+c.getCaravanImg1());
			File f = new File(fullPath);
			f.delete();
		}
		int result = CaravanServiceImpl.updateInsertCaravan(cImg);
		if(result>0) {
			return "redirect:/updaterepresentationCaravan.do?caravanNo="+(String)caravanNo;
		
		}else {
			return "redirect:/updaterepresentationCaravan.do?caravanNo="+(String)caravanNo;
		}	
	}
	/*
	@ResponseBody
	@RequestMapping(value="/selectCaravanA.do")
	public void selectCaravanA(HttpServletResponse response) throws JsonIOException, IOException {
		CaravanImg cImg = CaravanServiceImpl.selectCaravanA();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(cImg,response.getWriter());
	}
	 * */
	
}
