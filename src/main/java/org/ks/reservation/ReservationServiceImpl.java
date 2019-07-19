package org.ks.reservation;

import java.util.ArrayList;
import java.util.List;

import org.ks.caravan.vo.Caravan;
import org.ks.reservation.vo.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("ReservationServiceImpl")
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	@Qualifier("ReservationDaoImpl")
	private ReservationDao reservationDaoImpl;
	
	public ArrayList<Caravan> selectReservation(String[] reservationDate){
		List list = reservationDaoImpl.selectReservation(reservationDate);
		return (ArrayList<Caravan>)list;
	}
	public Caravan selectOneCaravan(int caravanNo) {
		List list = reservationDaoImpl.selectOneCaravan(caravanNo);
		Caravan c = ((ArrayList<Caravan>)list).get(0);
		return c;
	}
	@Transactional
	public void insertReservation(Reservation r) {
		reservationDaoImpl.insertReservation(r);
	}
	@Override
	public ArrayList<Reservation> selectMypageReservation(String id) {
		List list = reservationDaoImpl.selectMypageReservation(id);
		return (ArrayList<Reservation>)list;
	}
	@Transactional
	public void cancelReservation(String reservationId) {
		reservationDaoImpl.cancelReservation(reservationId);
		
	}
	@Override
	public ArrayList<Reservation> selectAllReservation() {
		List list = reservationDaoImpl.selectAllReservation();
		return (ArrayList<Reservation>)list;
	}
	@Override
	public void reservationUpdate(String[] reservationId, String reservationState) {
		for(int i = 0; i<reservationId.length;i++) {
			reservationDaoImpl.reservationUpdate(reservationId[i],reservationState);
		}
		
	}
	@Override
	public ArrayList<Reservation> reservationApproveList() {
		List list = reservationDaoImpl.reservationApproveList();
		return (ArrayList<Reservation>)list;
	}
}
