package org.ks.reservation;

import java.util.ArrayList;
import java.util.List;

import org.ks.caravan.vo.Caravan;
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
	@Transactional
	public void insertReservation(String caravanNo,String reservationDateString) {
		reservationDaoImpl.insertReservation(caravanNo,reservationDateString);
	}
}
