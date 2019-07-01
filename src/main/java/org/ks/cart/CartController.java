package org.ks.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.ks.cart.vo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {
	@Autowired
	@Qualifier(value="cartServiceImpl")
	private CartService cartServiceImpl;
	
	@RequestMapping(value="cart.do")//개인장바구니 조회
	public ModelAndView cartView() { //매개변수로 아이디를 받아서 아이디로 조회한다.
		String id = "admin@naver.com";
		ArrayList<Cart> list = cartServiceImpl.allListCart(id);
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("cart/cartList");
		}else {
			mav.setViewName("cart/cartList"); //장바구니가 하나도 없을때 뷰페이지에서 if문으로 처리해준다.
		}
		return mav;
	}
	
	@RequestMapping(value="insertcart.do")
	public String insertcart(HttpServletRequest request) {
		String id ="admin@naver.com";
		int recipeNo = 101;
		int recipePrice = 0;
		int recipeCount = 1;
		Cart c = new Cart(0, id, recipeNo, recipePrice, recipeCount,null);
		int result = cartServiceImpl.insertCart(c);
		if(result>0) {
			request.setAttribute("msg", "장바구니 추가 완료");
			request.setAttribute("loc", "/");
			return "common/msg";
		}else {
			request.setAttribute("msg", "장바구니 추가 실패");
			request.setAttribute("loc", "/");
			return "common/msg";
		}
	}
}
