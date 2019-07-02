package org.ks.tmr;

import java.util.ArrayList;
import java.util.List;

import org.ks.tmr.vo.TMR;
import org.ks.tmr.vo.TMRPageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("TMRService")
public class TMRServiceImpl implements TMRService{
	@Autowired
	@Qualifier("TMRDao")
	private TMRDao tmrdao;
	
	@Override
	public TMRPageData selectTMR(String month,int reqPage) {
		//페이지 당 게시물 수
		int numPerPage = 10;
		//총 게시물 수 구하기
		int totalCount = new TMRDaoImpl().totalCount(month);
		//총 페이지 수 구하기
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//요청 페이지의 시작 게시물 번호와 끝 게시물 번호 구하기
		//시작 게시물 번호
		int start = (reqPage-1)*numPerPage +1;
		int end = reqPage*numPerPage;
		List l = new TMRDaoImpl().selectTMR(month, start, end);
		ArrayList<TMR> list = (ArrayList<TMR>)l;
		//페이지 네비 작성
		String pageNavi = "";
		//페이지 네비의 수
		int pageNaviSize = 5;
		//페이지 번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//이전 버튼 생성
		if(pageNo !=1) {
			pageNavi += "<a class='btn' href='/tmr.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		//페이지 번호 버튼 생성 ( 1 2 3 4 5 )
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) { //둘 중 하나라도 만족하면 수행하지 않겠다
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>"; //4페이지 상태에서 4페이지를 누를수가 없도록 하기 위해서 a태그 없애줌 
			}else {
				pageNavi += "<a class='btn' href='/tmr.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/tmr.do?reqPage="+pageNo+"'>다음</a>";
		}
		TMRPageData tpd = null;
		tpd = new TMRPageData(list,pageNavi);
		return tpd;
	}
	
}
