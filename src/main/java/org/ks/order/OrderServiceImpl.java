package org.ks.order;

import java.util.ArrayList;
import java.util.List;

import org.ks.order.vo.Order;
import org.ks.order.vo.OrderPageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("orderServiceImpl")
public class OrderServiceImpl implements OrderService {

	@Autowired
	@Qualifier(value="orderDaoImpl")
	private OrderDao orderDaoImpl;
	
	@Transactional
	@Override
	public int insertOrder(ArrayList<Order> list) {
		
		int result = 0;
		for(Order o : list) {
			
		int re = orderDaoImpl.insertOrder(o);
			if(re>0) {
				result++;
			}
		}
		return result;
		
	}

	@Override
	public int deleteCart(ArrayList<Order> list) {
		int result = 0;
		for(Order o : list) {
			int re = orderDaoImpl.deleteCart(o);
			if(re>0) {
				result++;
			}
		}
		return result;
	}

	@Override
	public ArrayList<Order> seleteAllOrderList(String id) {
		return (ArrayList<Order>)(orderDaoImpl.seleteAllOrderList(id));
	}

	@Override
	public int cancellationOrder(String[] orderNo) {
		int result = orderDaoImpl.cancellationOrder(orderNo);
		return result;
	}
	//관리자
	

	@Override
	public int cancellationAdminOrder(String[] orderNo) {
		int result = orderDaoImpl.cancellationAdminOrder(orderNo);
		return result;
	}

	@Override
	public int successAdminOrder(String[] orderNo) {
		int result = orderDaoImpl.successAdminOrder(orderNo);
		return result;
	}

	@Override
	public OrderPageData seletecancelAdminList(int reqPage) {
		int numPerPage = 4;//페이지당 게시물 수
		List countList = orderDaoImpl.orderCount();
		int totalCount = countList.size(); //총 게시물 수 구하기
		int totalPage =(totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1; //총 페이지 수 구하기
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo!=1) {
			pageNavi +="<a  onclick='seletecancelAdminList("+(pageNo-1)+")'>이전</a>";
		}
		int j =1;
		while(!(j++>pageNaviSize|| pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageSelected'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='pageNo' onclick='seletecancelAdminList("+(pageNo)+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
				if(pageNo <= totalPage) {
					pageNavi +="<a class='pageBtn' onclick='seletecancelAdminList("+(pageNo)+")'>다음</a>";
				}
		ArrayList<Order>list=(ArrayList<Order>)(orderDaoImpl.seletecancelAdminList(start,end));
		OrderPageData opd = new OrderPageData(list,pageNavi);
		return  opd;
	}

	@Override
	public OrderPageData seletecancelsuccessAdminList(int reqPage) {
		int numPerPage = 4;//페이지당 게시물 수
		List countList = orderDaoImpl.orderCount3();
		int totalCount = countList.size(); //총 게시물 수 구하기
		int totalPage =(totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1; //총 페이지 수 구하기
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo!=1) {
			pageNavi +="<a  onclick='seletecancelsuccessAdminList("+(pageNo-1)+")'>이전</a>";
		}
		int j =1;
		while(!(j++>pageNaviSize|| pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageSelected'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='pageNo' onclick='seletecancelsuccessAdminList("+(pageNo)+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
				if(pageNo <= totalPage) {
					pageNavi +="<a class='pageBtn' onclick='seletecancelsuccessAdminList("+(pageNo)+")'>다음</a>";
				}
		ArrayList<Order>list=(ArrayList<Order>)(orderDaoImpl.seletecancelsuccessAdminList(start,end));
		
		OrderPageData opd = new OrderPageData(list,pageNavi);
		return  opd;
	}

	@Override
	public OrderPageData seletepaymentAdminList(int reqPage) {
		int numPerPage = 4;//페이지당 게시물 수
		List countList = orderDaoImpl.orderCount1();
		int totalCount = countList.size(); //총 게시물 수 구하기
		int totalPage =(totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1; //총 페이지 수 구하기
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo!=1) {
			pageNavi +="<a  onclick='seletepaymentAdminList("+(pageNo-1)+")'>이전</a>";
		}
		int j =1;
		while(!(j++>pageNaviSize|| pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageSelected'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='pageNo' onclick='seletepaymentAdminList("+(pageNo)+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
				if(pageNo <= totalPage) {
					pageNavi +="<a class='pageBtn' onclick='seletepaymentAdminList("+(pageNo)+")'>다음</a>";
				}
		ArrayList<Order>list=(ArrayList<Order>)(orderDaoImpl.seletepaymentAdminList(start,end));
		
		OrderPageData opd = new OrderPageData(list,pageNavi);
		return  opd;
	}

	@Override
	public OrderPageData seletepaymentSuccessAdminList(int reqPage) {
		int numPerPage = 4;//페이지당 게시물 수
		List countList = orderDaoImpl.orderCount2();
		int totalCount = countList.size(); //총 게시물 수 구하기
		int totalPage =(totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1; //총 페이지 수 구하기
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo!=1) {
			pageNavi +="<a class='pageBtn'  onclick='seletepaymentSuccessAdminList("+(pageNo-1)+")'>이전</a>";
		}
		int j =1;
		while(!(j++>pageNaviSize|| pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageSelected'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='pageNo' onclick='seletepaymentSuccessAdminList("+(pageNo)+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
				if(pageNo <= totalPage) {
					pageNavi +="<a class='pageBtn' onclick='seletepaymentSuccessAdminList("+(pageNo)+")'>다음</a>";
				}
		ArrayList<Order>list=(ArrayList<Order>)(orderDaoImpl.seletepaymentSuccessAdminList(start,end));
		
		OrderPageData opd = new OrderPageData(list,pageNavi);
		return  opd;
	}

	@Override
	public OrderPageData seleteAllOrderAdminList() {
		// TODO Auto-generated method stub
		return null;
	}

}
