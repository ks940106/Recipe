package org.ks.reservation;

import java.util.List;

import org.springframework.stereotype.Repository;

public interface ReservationDao {
	public List selectReservation(String[] reservationDate);
	public List selectOneCaravan(int caravanNo);
	//public void insertReservation(String caravanNo,String reservationDateString);
}
