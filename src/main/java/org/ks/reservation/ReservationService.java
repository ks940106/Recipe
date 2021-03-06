package org.ks.reservation;

import java.util.ArrayList;

import org.ks.caravan.vo.Caravan;
import org.ks.reservation.vo.Reservation;

public interface ReservationService {
	public ArrayList<Caravan> selectReservation(String[] reservationDate);
	public Caravan selectOneCaravan(int caravanNo);
	public String selectCaravanImg(String caravanName);
	public void insertReservation(Reservation r);
	public ArrayList<Reservation> selectMypageReservation(String id);
	public void cancelReservation(String reservationId);
	public ArrayList<Reservation> selectAllReservation();
	public void reservationUpdate(String[] reservationId,String reservationState);
	public Reservation selectOneReservation(String reservationId);
}
