package org.ks.recipe.vo;

public class Category {
    private int categoryNo;
    private int categoryType;
    private String categoryName;

    public Category() {
    }

    public Category(int categoryNo, int categoryType, String categoryName) {
        this.categoryNo = categoryNo;
        this.categoryType = categoryType;
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "Category{" +
                "categoryNo=" + categoryNo +
                ", categoryType=" + categoryType +
                ", categoryName='" + categoryName + '\'' +
                '}';
    }

    public int getCategoryNo() {
        return categoryNo;
    }

    public void setCategoryNo(int categoryNo) {
        this.categoryNo = categoryNo;
    }

    public int getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(int categoryType) {
        this.categoryType = categoryType;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
