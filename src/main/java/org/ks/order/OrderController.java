package org.ks.order;

import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.ks.order.vo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	@Autowired
	@Qualifier(value="orderServiceImpl")
	public OrderService orderServiceImpl;
	
	
	@RequestMapping(value="successOrder.do")
	public String insertOrder(HttpServletRequest request) {
		String recipeNo = request.getParameter("recipe");
		String recipeCount = request.getParameter("recipeCount");
		String id = request.getParameter("id");
		String orderCode = request.getParameter("orderCode");
		String zipCode = request.getParameter("zipCode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone = request.getParameter("phone");
		StringTokenizer st = new StringTokenizer(recipeNo, ",");
		StringTokenizer st1 = new StringTokenizer(recipeCount, ",");
		String[] array = new String[st.countTokens()];
		String[] array1 = new String[st1.countTokens()];
		int i = 0;
		while(st.hasMoreTokens()) {
			array[i] = st.nextToken();
			array1[i] = st1.nextToken();
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
			o.setOrderState("1");
			o.setZipCode(zipCode);
			o.setPhone(phone);
			list.add(o);
		}
		int result = orderServiceImpl.insertOrder(list);
		if(list.size()==result) {
			request.setAttribute("msg", "결제성공");
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("msg", "결제실패");
			request.setAttribute("loc", "/");
		}
		return "common/msg";
	}
}
