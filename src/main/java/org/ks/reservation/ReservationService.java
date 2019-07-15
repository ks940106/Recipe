package org.ks.reservation;

import java.util.ArrayList;

import org.ks.reservation.vo.Reservation;

public interface ReservationService {
	public ArrayList<Reservation> selectReservation(String[] reservationDate);
	public void insertReservation(String caravanNo,String reservationDateString);
}
