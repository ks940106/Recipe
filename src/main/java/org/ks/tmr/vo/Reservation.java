package org.ks.tmr.vo;

public class Reservation {
	private int caravanNo;
	private String ReservationDate;
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation(int caravanNo, String reservationDate) {
		super();
		this.caravanNo = caravanNo;
		ReservationDate = reservationDate;
	}
	public int getCaravanNo() {
		return caravanNo;
	}
	public void setCaravanNo(int caravanNo) {
		this.caravanNo = caravanNo;
	}
	public String getReservationDate() {
		return ReservationDate;
	}
	public void setReservationDate(String reservationDate) {
		ReservationDate = reservationDate;
	}
}
