package org.ks.cart;

import java.util.ArrayList;

import org.ks.cart.vo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {
	@Autowired
	@Qualifier("CartServiceImpl")
	private CartService CartServiceImpl;
	
	@RequestMapping(value="cart.do")
	public ModelAndView cartView() { //매개변수로 아이디를 받아서 아이디로 조회한다.
		ArrayList<Cart> list = CartServiceImpl.allListCart();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("cart/cartList");
		}else {
			mav.setViewName("cart/cartList"); //장바구니가 하나도 없을때 뷰페이지에서 if문으로 처리해준다.
		}
		return mav;
	}
}
