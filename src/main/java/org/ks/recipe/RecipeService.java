package org.ks.recipe;


import org.ks.recipe.vo.*;

import java.util.List;

public interface RecipeService {
    List<Category> categoryList();

    int recipeReg(Recipe recipe);

    List<Recipe> recipeList();

    RecipeDetail getRecipeDetail(String recipeNo);

    void recipeHit(String recipeNo);

    boolean recipeLike(Like like);

    boolean getLike(String recipeNo, String id);

    boolean recipeUnLike(Like like);

    List<Recipe> likeRank();

    int orderReg(int recipeNo, int price);

    PageData<Recipe> recipeList(RecipeSearch recipeSearch);


    PageData<Recipe> MyRecipeList(RecipeSearch recipeSearch);

    int recipeDel(Recipe recipe);
}
