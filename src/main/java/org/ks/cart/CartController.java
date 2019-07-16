package org.ks.cart;

import java.util.ArrayList;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ks.cart.vo.Cart;
import org.ks.member.vo.Member;
import org.ks.recipe.RecipeService;
import org.ks.recipe.RecipeServiceImpl;
import org.ks.recipe.vo.RecipeDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {
	@Autowired
	@Qualifier(value="cartServiceImpl")
	private CartService cartServiceImpl;

	@Autowired
	@Qualifier(value="recipeServiceImpl")
	private RecipeService recipeService;

	@RequestMapping(value="cart.do")//개인장바구니 조회
	public ModelAndView cartView(HttpServletRequest request,HttpSession session) { //매개변수로 아이디를 받아서 아이디로 조회한다.
		Member m = (Member)session.getAttribute("member");
		String id = m.getId();
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
		HttpSession session = request.getSession(false);
		if(session==null || session.getAttribute("member")==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("loc", "/recipe/"+request.getParameter("recipeNo"));
			return "common/msg";
		}
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		String recipeNo = request.getParameter("recipeNo");
		RecipeDetail recipeDetail = recipeService.getRecipeDetail(recipeNo);
		System.out.println("recipeDetail : "+recipeDetail);
		int recipePrice = recipeDetail.getRecipe().getRecipePrice();
		int recipeCount = Integer.parseInt(request.getParameter("count"));
		Cart c = new Cart(0, id, recipeDetail.getRecipe().getRecipeNo(), recipePrice, recipeCount,recipeDetail.getRecipe().getRecipeTitle());
		int result = cartServiceImpl.insertCart(c);
		if(result>0) {
			request.setAttribute("confirm", "장바구니 추가 완료. 장바구니로 가시겠습니까?");
			request.setAttribute("confirmLoc","/cart.do");
			request.setAttribute("loc", "/");
			return "common/msg";
		}else {
			request.setAttribute("msg", "장바구니 추가 실패");
			request.setAttribute("loc", "/recipe/"+request.getParameter("recipeNo"));
			return "common/msg";
		}
	}

	@RequestMapping(value="order.do")
	public ModelAndView order(HttpServletRequest request) {
		String[] cartNo = request.getParameterValues("cartNo");
		ArrayList<Cart> list = cartServiceImpl.orderListCart(cartNo);
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("order/order");
		}else {
			mav.setViewName("order/order"); //장바구니가 하나도 없을때 뷰페이지에서 if문으로 처리해준다.
		}
		return mav;
	}
	
	@RequestMapping(value="deleteCart.do")
	public String deleteCart(HttpServletRequest request) {
		String[] cartNo = request.getParameterValues("cartNo");
		int result= cartServiceImpl.deleteCart(cartNo);
		if(result>0) {
			request.setAttribute("msg", "장바구니 삭제완료");
			request.setAttribute("loc", "cart.do");
			return "common/msg";
		}else {
			request.setAttribute("msg", "장바구니 삭제실패");
			request.setAttribute("loc", "cart.do");
			return "common/msg";
		}
	
	}
	//관리자 페이지용 소스 
	
}
