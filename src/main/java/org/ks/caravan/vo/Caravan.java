package org.ks.caravan.vo;

public class Caravan {
	private int caravanNo;
	private String caravanName;
	private int caravanArea;
	private int caravanPeople;
	private int caravanMaxPeople;
	private int caravanPlusCost;
	private int caravanCost;
	private String caravanInfo;
	private String caravanMainImg;
	private String caravanImg;
	private String caravanImg1;
	public Caravan(int caravanNo, String caravanName, int caravanArea, int caravanPeople, int caravanMaxPeople,
			int caravanPlusCost, int caravanCost, String caravanInfo, String caravanMainImg, String caravanImg,
			String caravanImg1) {
		super();
		this.caravanNo = caravanNo;
		this.caravanName = caravanName;
		this.caravanArea = caravanArea;
		this.caravanPeople = caravanPeople;
		this.caravanMaxPeople = caravanMaxPeople;
		this.caravanPlusCost = caravanPlusCost;
		this.caravanCost = caravanCost;
		this.caravanInfo = caravanInfo;
		this.caravanMainImg = caravanMainImg;
		this.caravanImg = caravanImg;
		this.caravanImg1 = caravanImg1;
	}
	public Caravan() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCaravanImg1() {
		return caravanImg1;
	}
	public void setCaravanImg1(String caravanImg1) {
		this.caravanImg1 = caravanImg1;
	}
	public int getCaravanNo() {
		return caravanNo;
	}
	public void setCaravanNo(int caravanNo) {
		this.caravanNo = caravanNo;
	}
	public String getCaravanName() {
		return caravanName;
	}
	public void setCaravanName(String caravanName) {
		this.caravanName = caravanName;
	}
	public int getCaravanArea() {
		return caravanArea;
	}
	public void setCaravanArea(int caravanArea) {
		this.caravanArea = caravanArea;
	}
	public int getCaravanPeople() {
		return caravanPeople;
	}
	public void setCaravanPeople(int caravanPeople) {
		this.caravanPeople = caravanPeople;
	}
	public int getCaravanMaxPeople() {
		return caravanMaxPeople;
	}
	public void setCaravanMaxPeople(int caravanMaxPeople) {
		this.caravanMaxPeople = caravanMaxPeople;
	}
	public int getCaravanPlusCost() {
		return caravanPlusCost;
	}
	public void setCaravanPlusCost(int caravanPlusCost) {
		this.caravanPlusCost = caravanPlusCost;
	}
	public int getCaravanCost() {
		return caravanCost;
	}
	public void setCaravanCost(int caravanCost) {
		this.caravanCost = caravanCost;
	}
	public String getCaravanInfo() {
		return caravanInfo;
	}
	public void setCaravanInfo(String caravanInfo) {
		this.caravanInfo = caravanInfo;
	}
	public String getCaravanMainImg() {
		return caravanMainImg;
	}
	public void setCaravanMainImg(String caravanMainImg) {
		this.caravanMainImg = caravanMainImg;
	}
	public String getCaravanImg() {
		return caravanImg;
	}
	public void setCaravanImg(String caravanImg) {
		this.caravanImg = caravanImg;
	}
	
}
