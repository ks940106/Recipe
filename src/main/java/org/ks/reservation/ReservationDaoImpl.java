package org.ks.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ReservationDaoImpl")
public class ReservationDaoImpl implements ReservationDao{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List selectReservation(String[] reservationDate) {
		List list = sqlSession.selectList("reservation.selectReservation", reservationDate);
		return list;
	}
	public void insertReservation(String caravanNo,String reservationDateString) {
		Map map = new HashMap<String,String>();
		map.put("caravanNo", caravanNo);
		map.put("reservationDateString", reservationDateString);
		sqlSession.insert("reservation.insertReservation",map);
	}
}
