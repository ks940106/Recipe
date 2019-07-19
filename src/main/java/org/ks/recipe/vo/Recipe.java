package org.ks.recipe.vo;

import java.util.Date;
import java.util.List;

public class Recipe {
    private int recipeNo;
    private String recipeTitle;
    private String recipeWriter;
    private String recipeContents;
    private String recipeMainImg;
    private String recipeCat1;
    private String recipeCat2;
    private String recipeCount;
    private String recipeTime;
    private String recipeLevel;
    private String recipeItem;
    private List<Step> recipeStep;
//    private String recipeStepImg;
    private int recipeLike;
    private int recipeHit;
    private int recipePrice;
    private Date recipeDate;
    private int recipeStock;
    private List<String> recipeWorkImg;
    private String recipeVideo;
    private int recipeState;

    public Recipe() {
        recipeNo = 0;
        recipeTitle = "";
        recipeWriter = "";
        recipeContents = "";
        recipeMainImg = "";
        recipeCat1 = "0";
        recipeCat2 = "0";
        recipeCount = "0";
        recipeTime = "0";
        recipeLevel = "0";
        recipeItem = "";
        recipeLike = 0;
        recipeHit = 0;
        recipePrice = 0;
        recipeDate = new Date();
        recipeStock = 0;
        recipeState = 0;
    }

    @Override
    public String toString() {
        return "Recipe{" +
                "recipeNo=" + recipeNo +
                ", recipeTitle='" + recipeTitle + '\'' +
                ", recipeWriter='" + recipeWriter + '\'' +
                ", recipeContents='" + recipeContents + '\'' +
                ", recipeMainImg='" + recipeMainImg + '\'' +
                ", recipeCat1='" + recipeCat1 + '\'' +
                ", recipeCat2='" + recipeCat2 + '\'' +
                ", recipeCount='" + recipeCount + '\'' +
                ", recipeTime='" + recipeTime + '\'' +
                ", recipeLevel='" + recipeLevel + '\'' +
                ", recipeItem='" + recipeItem + '\'' +
                ", recipeStep=" + recipeStep +
                ", recipeLike=" + recipeLike +
                ", recipeHit=" + recipeHit +
                ", recipePrice=" + recipePrice +
                ", recipeDate=" + recipeDate +
                ", recipeStock=" + recipeStock +
                ", recipeWorkImg='" + recipeWorkImg + '\'' +
                ", recipeVideo='" + recipeVideo + '\'' +
                ", recipeState=" + recipeState +
                '}';
    }

    public Recipe(int recipeNo, String recipeTitle, String recipeWriter, String recipeContents, String recipeMainImg, String recipeCat1, String recipeCat2, String recipeCount, String recipeTime, String recipeLevel, String recipeItem, List<Step> recipeStep, int recipeLike, int recipeHit, int recipePrice, Date recipeDate, int recipeStock, List<String> recipeWorkImg, String recipeVideo, int recipeState) {
        this.recipeNo = recipeNo;
        this.recipeTitle = recipeTitle;
        this.recipeWriter = recipeWriter;
        this.recipeContents = recipeContents;
        this.recipeMainImg = recipeMainImg;
        this.recipeCat1 = recipeCat1;
        this.recipeCat2 = recipeCat2;
        this.recipeCount = recipeCount;
        this.recipeTime = recipeTime;
        this.recipeLevel = recipeLevel;
        this.recipeItem = recipeItem;
        this.recipeStep = recipeStep;
        this.recipeLike = recipeLike;
        this.recipeHit = recipeHit;
        this.recipePrice = recipePrice;
        this.recipeDate = recipeDate;
        this.recipeStock = recipeStock;
        this.recipeWorkImg = recipeWorkImg;
        this.recipeVideo = recipeVideo;
        this.recipeState = recipeState;
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

    public String getRecipeMainImg() {
        return recipeMainImg;
    }

    public void setRecipeMainImg(String recipeMainImg) {
        this.recipeMainImg = recipeMainImg;
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

    public List<Step> getRecipeStep() {
        return recipeStep;
    }

    public void setRecipeStep(List<Step> recipeStep) {
        this.recipeStep = recipeStep;
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

    public int getRecipeStock() {
        return recipeStock;
    }

    public void setRecipeStock(int recipeStock) {
        this.recipeStock = recipeStock;
    }

    public List<String> getRecipeWorkImg() {
        return recipeWorkImg;
    }

    public void setRecipeWorkImg(List<String> recipeWorkImg) {
        this.recipeWorkImg = recipeWorkImg;
    }

    public String getRecipeVideo() {
        return recipeVideo;
    }

    public void setRecipeVideo(String recipeVideo) {
        this.recipeVideo = recipeVideo;
    }

    public int getRecipeState() {
        return recipeState;
    }

    public void setRecipeState(int recipeState) {
        this.recipeState = recipeState;
    }
}
