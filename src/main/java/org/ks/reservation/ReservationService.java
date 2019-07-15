package org.ks.reservation;

import java.util.ArrayList;
import java.util.List;

import org.ks.caravan.vo.Caravan;
import org.ks.reservation.vo.Reservation;

public interface ReservationService {
	public ArrayList<Caravan> selectReservation(String[] reservationDate);
	public void insertReservation(String caravanNo,String reservationDateString);
}
