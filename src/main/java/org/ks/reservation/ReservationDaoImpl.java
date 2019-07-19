package org.ks.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ks.reservation.vo.Reservation;
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
	public List selectOneCaravan(int caravanNo) {
		return sqlSession.selectList("reservation.selectOneCaravan",caravanNo);
	}
	public void insertReservation(Reservation r) {
		sqlSession.insert("reservation.insertReservation",r);
	}
	@Override
	public List selectMypageReservation(String id) {
		return sqlSession.selectList("reservation.selectMypageReservation", id);
	}
	@Override
	public void cancelReservation(String reservationId) {
		sqlSession.update("reservation.cancelReservation",reservationId);
		
	}
	@Override
	public List selectAllReservation() {
		return sqlSession.selectList("reservation.selectAllReservation");
	}
	@Override
	public void reservationUpdate(String reservationId, String reservationState) {
		Map map = new HashMap<String,String>();
		map.put("reservationId", reservationId);
		map.put("reservationState", reservationState);
		sqlSession.update("reservation.reservationUpdate",map);
	}
	@Override
	public List reservationApproveList() {
		return sqlSession.selectList("reservation.reservationApproveList");
	}
}
