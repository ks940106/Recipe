package org.ks.recipe.vo;

public class Like {
    private int recipeNo;
    private String id;

    public Like() {
    }

    public Like(int recipeNo, String id) {
        this.recipeNo = recipeNo;
        this.id = id;
    }

    public int getRecipeNo() {
        return recipeNo;
    }

    public void setRecipeNo(int recipeNo) {
        this.recipeNo = recipeNo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
