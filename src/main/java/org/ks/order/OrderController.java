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
import com.google.gson.JsonIOException;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class OrderController {
	@Autowired
	@Qualifier(value="orderServiceImpl")
	public OrderService orderServiceImpl;
	
	IamportClient client;
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
			o.setOrderPrice(Integer.parseInt(array2[i]));
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
	//캠핌 마이페이지에서 오더리스트
		@RequestMapping(value="/orderListCamping.do")
		public ModelAndView orderListCamping(HttpSession session) {
			Member m = (Member)session.getAttribute("member");
			String id = m.getId();
			ArrayList<Order> list = orderServiceImpl.seleteAllOrderList(id);
			ModelAndView mav = new ModelAndView();
			if(!list.isEmpty()) {
				mav.addObject("list",list);
				mav.setViewName("order/orderListCamping");
			}else {
				mav.setViewName("order/orderListCamping");
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
		String[] orderCode = request.getParameterValues("orderCode");
		String[] orderPrice = request.getParameterValues("orderPrice");
		System.out.println(orderCode[0]); 
		System.out.println(orderCode[1]); 
		System.out.println(orderPrice[0]); 
		System.out.println(orderPrice[1]); 
		
		testGetToken();
		ModelAndView mav = new ModelAndView();
		for(int i=0;i<orderNo.length;i++) {
		
			String test_already_cancelled_merchant_uid = orderCode[i];
			CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); //merchant_uid를 통한 전액취소
			cancel_data.setEscrowConfirmed(true); //에스크로 구매확정 후 취소인 경우 true설정
			
			
			try {
				IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
				
				if(payment_response.getResponse()!=null) {
					// 이미 취소된 거래는 response가 null이다
					System.out.println(payment_response.getMessage());
					int result = orderServiceImpl.cancellationAdminOrder(orderNo);
					if(result>0) {
						mav.addObject("msg","결제를 취소했습니다.");
						mav.addObject("loc","/orderAdminList.do");
						mav.setViewName("common/msg");
					}else {
						mav.addObject("msg","결제취소를 실패 했습니다.");
						mav.addObject("loc","/orderAdminList.do");
						mav.setViewName("common/msg");
					}
				}
			} catch (IamportResponseException e) {
				System.out.println(e.getMessage());
				
				switch(e.getHttpStatusCode()) {
				case 401 :
					//TODO
					break;
				case 500 :
					//TODO
					break;
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
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
	public void setup() {
		String test_api_key = "2467380268982332";
		String test_api_secret = "8oIhttMGVutfixvXmpQDIcSadr6ujuWsSEJm8w230vjj2Ogpd62WjU7xmd2GHY8ACSWKoYOpt7IwVZW8";
		client = new IamportClient(test_api_key, test_api_secret);
	}
	public void testGetToken() {
		setup();
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
	}
}
