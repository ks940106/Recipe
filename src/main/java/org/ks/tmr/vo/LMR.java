package org.ks.tmr.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class LMR {
	private int recipeNo1;
	private String recipeTitle1;
	private String recipeWriter1;
	private int recipeNo2;
	private String recipeTitle2;
	private String recipeWriter2;
	private int recipeNo3;
	private String recipeTitle3;
	private String recipeWriter3;
    private Date recipeDate;
	public LMR() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LMR(int recipeNo1, String recipeTitle1, String recipeWriter1, int recipeNo2, String recipeTitle2,
			String recipeWriter2, int recipeNo3, String recipeTitle3, String recipeWriter3, Date recipeDate) {
		super();
		this.recipeNo1 = recipeNo1;
		this.recipeTitle1 = recipeTitle1;
		this.recipeWriter1 = recipeWriter1;
		this.recipeNo2 = recipeNo2;
		this.recipeTitle2 = recipeTitle2;
		this.recipeWriter2 = recipeWriter2;
		this.recipeNo3 = recipeNo3;
		this.recipeTitle3 = recipeTitle3;
		this.recipeWriter3 = recipeWriter3;
		this.recipeDate = recipeDate;
	}
	public int getRecipeNo1() {
		return recipeNo1;
	}
	public void setRecipeNo1(int recipeNo1) {
		this.recipeNo1 = recipeNo1;
	}
	public String getRecipeTitle1() {
		return recipeTitle1;
	}
	public void setRecipeTitle1(String recipeTitle1) {
		this.recipeTitle1 = recipeTitle1;
	}
	public String getRecipeWriter1() {
		return recipeWriter1;
	}
	public void setRecipeWriter1(String recipeWriter1) {
		this.recipeWriter1 = recipeWriter1;
	}
	public int getRecipeNo2() {
		return recipeNo2;
	}
	public void setRecipeNo2(int recipeNo2) {
		this.recipeNo2 = recipeNo2;
	}
	public String getRecipeTitle2() {
		return recipeTitle2;
	}
	public void setRecipeTitle2(String recipeTitle2) {
		this.recipeTitle2 = recipeTitle2;
	}
	public String getRecipeWriter2() {
		return recipeWriter2;
	}
	public void setRecipeWriter2(String recipeWriter2) {
		this.recipeWriter2 = recipeWriter2;
	}
	public int getRecipeNo3() {
		return recipeNo3;
	}
	public void setRecipeNo3(int recipeNo3) {
		this.recipeNo3 = recipeNo3;
	}
	public String getRecipeTitle3() {
		return recipeTitle3;
	}
	public void setRecipeTitle3(String recipeTitle3) {
		this.recipeTitle3 = recipeTitle3;
	}
	public String getRecipeWriter3() {
		return recipeWriter3;
	}
	public void setRecipeWriter3(String recipeWriter3) {
		this.recipeWriter3 = recipeWriter3;
	}
    public String getRecipeDate() {
        String date = new SimpleDateFormat("yyyy / MM").format(recipeDate);
        return date;
    }
	public void setRecipeDate(Date recipeDate) {
		this.recipeDate = recipeDate;
	}
}
