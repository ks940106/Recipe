package org.ks.order;

import javax.servlet.http.HttpServletRequest;

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
	public void insertOrder(HttpServletRequest request) {
		String[] recipeNo = request.getParameterValues("recipe");
		System.out.println(recipeNo[0]);
		
	}
}
