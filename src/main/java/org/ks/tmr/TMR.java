package org.ks.tmr;

import java.sql.Date;

public class TMR {
	 private int recipeNo;
	 private String recipeTitle;
	 private String recipeWriter;
	 private String recipeContents;
	 private String recipeMainimg;
	 private String recipeCat1;
	 private String recipeCat2;
	 private String recipeCount;
	 private String recipeTime;
	 private String recipeLevel;
	 private String recipeItem;
	 private String recipeStep;
	 private String recipeStepimg;
	 private int recipeLike;
	 private int recipeHit;
	 private int recipePrice;
	 private Date recipeDate;
	public TMR() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TMR(int recipeNo, String recipeTitle, String recipeWriter, String recipeContents, String recipeMainimg,
			String recipeCat1, String recipeCat2, String recipeCount, String recipeTime, String recipeLevel,
			String recipeItem, String recipeStep, String recipeStepimg, int recipeLike, int recipeHit, int recipePrice,
			Date recipeDate) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.recipeWriter = recipeWriter;
		this.recipeContents = recipeContents;
		this.recipeMainimg = recipeMainimg;
		this.recipeCat1 = recipeCat1;
		this.recipeCat2 = recipeCat2;
		this.recipeCount = recipeCount;
		this.recipeTime = recipeTime;
		this.recipeLevel = recipeLevel;
		this.recipeItem = recipeItem;
		this.recipeStep = recipeStep;
		this.recipeStepimg = recipeStepimg;
		this.recipeLike = recipeLike;
		this.recipeHit = recipeHit;
		this.recipePrice = recipePrice;
		this.recipeDate = recipeDate;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getRecipeWriter() {
		return recipeWriter;
	}
	public void setRecipeWriter(String recipeWriter) {
		this.recipeWriter = recipeWriter;
	}
	public String getRecipeContents() {
		return recipeContents;
	}
	public void setRecipeContents(String recipeContents) {
		this.recipeContents = recipeContents;
	}
	public String getRecipeMainimg() {
		return recipeMainimg;
	}
	public void setRecipeMainimg(String recipeMainimg) {
		this.recipeMainimg = recipeMainimg;
	}
	public String getRecipeCat1() {
		return recipeCat1;
	}
	public void setRecipeCat1(String recipeCat1) {
		this.recipeCat1 = recipeCat1;
	}
	public String getRecipeCat2() {
		return recipeCat2;
	}
	public void setRecipeCat2(String recipeCat2) {
		this.recipeCat2 = recipeCat2;
	}
	public String getRecipeCount() {
		return recipeCount;
	}
	public void setRecipeCount(String recipeCount) {
		this.recipeCount = recipeCount;
	}
	public String getRecipeTime() {
		return recipeTime;
	}
	public void setRecipeTime(String recipeTime) {
		this.recipeTime = recipeTime;
	}
	public String getRecipeLevel() {
		return recipeLevel;
	}
	public void setRecipeLevel(String recipeLevel) {
		this.recipeLevel = recipeLevel;
	}
	public String getRecipeItem() {
		return recipeItem;
	}
	public void setRecipeItem(String recipeItem) {
		this.recipeItem = recipeItem;
	}
	public String getRecipeStep() {
		return recipeStep;
	}
	public void setRecipeStep(String recipeStep) {
		this.recipeStep = recipeStep;
	}
	public String getRecipeStepimg() {
		return recipeStepimg;
	}
	public void setRecipeStepimg(String recipeStepimg) {
		this.recipeStepimg = recipeStepimg;
	}
	public int getRecipeLike() {
		return recipeLike;
	}
	public void setRecipeLike(int recipeLike) {
		this.recipeLike = recipeLike;
	}
	public int getRecipeHit() {
		return recipeHit;
	}
	public void setRecipeHit(int recipeHit) {
		this.recipeHit = recipeHit;
	}
	public int getRecipePrice() {
		return recipePrice;
	}
	public void setRecipePrice(int recipePrice) {
		this.recipePrice = recipePrice;
	}
	public Date getRecipeDate() {
		return recipeDate;
	}
	public void setRecipeDate(Date recipeDate) {
		this.recipeDate = recipeDate;
	}
}
