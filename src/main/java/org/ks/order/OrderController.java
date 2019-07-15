package org.ks.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ks.member.vo.Member;
import org.ks.order.vo.Order;
import org.ks.order.vo.OrderPageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;

@Controller
public class OrderController {
	@Autowired
	@Qualifier(value="orderServiceImpl")
	public OrderService orderServiceImpl;
	
	
	@RequestMapping(value="/successOrder.do")
	public String insertOrder(HttpServletRequest request) {
		String recipeNo = request.getParameter("recipe");
		String recipeCount = request.getParameter("recipeCount");
		String recipePrice = request.getParameter("recipePrice");
		String id = request.getParameter("id");
		String orderCode = request.getParameter("orderCode");
		String zipCode = request.getParameter("zipCode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone = request.getParameter("phone");
		StringTokenizer st = new StringTokenizer(recipeNo, ",");
		StringTokenizer st1 = new StringTokenizer(recipeCount, ",");
		StringTokenizer st2 = new StringTokenizer(recipePrice, ",");
  		String[] array = new String[st.countTokens()];
		String[] array1 = new String[st1.countTokens()];
		String[] array2 = new String[st2.countTokens()];
		int i = 0;
		while(st.hasMoreTokens()) {
			array[i] = st.nextToken();
			array1[i] = st1.nextToken();
			array2[i] = st2.nextToken();
			i++;
		}
		ArrayList<Order> list = new ArrayList<Order>();
		
		for(i=0;i<array.length;i++) {
			Order o = new Order();
			o.setOrderCode(orderCode);
			o.setId(id);
			o.setAddr1(addr1);
			o.setAddr2(addr2);
			o.setRecipeNo(Integer.parseInt(array[i]) );
			o.setOrderCount(Integer.parseInt(array1[i]));
			o.setOrderPirce(Integer.parseInt(array2[i]));
			o.setOrderState(1);
			o.setZipCode(zipCode);
			o.setPhone(phone);
			list.add(o);
		}
		int result = orderServiceImpl.insertOrder(list);
		if (list.size() == result) {
			int result1 = orderServiceImpl.deleteCart(list);
			if (list.size() == result1) {

				request.setAttribute("msg", "결제성공");
				request.setAttribute("loc", "/");
			} else {
				request.setAttribute("msg", "결제실패");
				request.setAttribute("loc", "/");
			}
		} else {
			request.setAttribute("msg", "결제실패");
			request.setAttribute("loc", "/");
		}
		return "common/msg";
	}
	
	@RequestMapping(value="/orderList.do")
	public ModelAndView orderList(HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		String id = m.getId();
		ArrayList<Order> list = orderServiceImpl.seleteAllOrderList(id);
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("order/orderList");
		}else {
			mav.setViewName("order/orderList");
		}
		return mav;
	}
	
	@RequestMapping(value="/cancellationOrder.do")
	public String cancellationOrder(HttpServletRequest request) {
		String[] orderNo = request.getParameterValues("orderNo");
		int result = orderServiceImpl.cancellationOrder(orderNo);
		if(result>0) {
			request.setAttribute("msg", "결제취소신청을 완료했습니다.");
			request.setAttribute("loc", "/orderList.do");
			return "common/msg";
		}else {
			request.setAttribute("msg", "결제취소신청을 실패했습니다.");
			request.setAttribute("loc", "/orderList.do");
			return "common/msg";
		}
	}
	
	//관리자
	
	@RequestMapping(value="/orderAdminList.do") //결제페이지 조회
	public String orderAdminList() {
		/*
		OrderPageData list = orderServiceImpl.seleteAllOrderAdminList();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("admin/order/orderAdminList");
		}else {
			mav.setViewName("admin/order/orderAdminList");
		}
		 * */
		return "admin/order/orderAdminList";
	}
	@ResponseBody
	@RequestMapping(value="/seletecancelAdminList") //결제 취소 신청 리스트
	public void seletecancelAdminList(HttpServletResponse response, HttpServletRequest request,@RequestParam String pageNo ) throws JsonIOException, IOException {
		int reqPage = Integer.parseInt(pageNo);
		OrderPageData list = orderServiceImpl.seletecancelAdminList(reqPage);
		response.setContentType("application/json"); //text형태로 나온다.
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
		
	}
	@ResponseBody
	@RequestMapping(value="/seletecancelsuccessAdminList") //결제 취소 완료
	public void seletecancelsuccessAdminList(HttpServletResponse response, HttpServletRequest request,@RequestParam String pageNo ) throws JsonIOException, IOException {
		int reqPage = Integer.parseInt(pageNo);
		OrderPageData list = orderServiceImpl.seletecancelsuccessAdminList(reqPage);
		response.setContentType("application/json"); //text형태로 나온다.
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
		
	}
	@ResponseBody
	@RequestMapping(value="/seletepaymentSuccessAdminList") //결제 완료
	public void seletepaymentSuccessAdminList(HttpServletResponse response, HttpServletRequest request,@RequestParam String pageNo ) throws JsonIOException, IOException {
		int reqPage = Integer.parseInt(pageNo);
		OrderPageData list = orderServiceImpl.seletepaymentSuccessAdminList(reqPage);
		response.setContentType("application/json"); //text형태로 나온다.
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
		
	}
	@ResponseBody
	@RequestMapping(value="/seletepaymentAdminList") //결제 진행중
	public void seletepaymentAdminList(HttpServletResponse response, HttpServletRequest request,@RequestParam String pageNo ) throws JsonIOException, IOException {
		int reqPage = Integer.parseInt(pageNo);
		OrderPageData list = orderServiceImpl.seletepaymentAdminList(reqPage);
		response.setContentType("application/json"); //text형태로 나온다.
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
		
	}
	@RequestMapping(value="/cancellationAdminOrder.do") 
	public ModelAndView cancellationAdminOrder(HttpServletRequest request) {
		String[] orderNo = request.getParameterValues("orderNo");
		int result = orderServiceImpl.cancellationAdminOrder(orderNo);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.addObject("msg","결제를 취소했습니다.");
			mav.addObject("loc","/orderAdminList.do");
			mav.setViewName("common/msg");
		}else {
			mav.addObject("msg","결제취소를 실패 했습니다.");
			mav.addObject("loc","/orderAdminList.do");
			mav.setViewName("common/msg");
		}
		return mav;
	}
	@RequestMapping(value="/successAdminOrder.do")
	public ModelAndView successAdminOrder(HttpServletRequest request) {
		String orderNo = request.getParameter("orderNo");
		StringTokenizer st = new StringTokenizer(orderNo, ",");
		String[] array = new String[st.countTokens()];
		int i=0;
		while(st.hasMoreTokens()) {
			array[i] = st.nextToken();
			i++;
		}
		int result = orderServiceImpl.successAdminOrder(array);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.addObject("msg","결제를 확정했습니다.");
			mav.addObject("loc","/orderAdminList.do");
			mav.setViewName("common/msg");
		}else {
			mav.addObject("msg","결제확정을 실패 했습니다.");
			mav.addObject("loc","/orderAdminList.do");
			mav.setViewName("common/msg");
		}
		return mav;
		
	}
}
