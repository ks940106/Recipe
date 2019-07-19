package org.ks.recipe;

import org.ks.recipe.vo.*;

import java.util.List;

public interface RecipeDao {
    List<Category> categoryList();

    int recipeReg(Recipe recipe);

    int stepReg(Recipe recipe);

    int workImgReg(Recipe recipe);

    List<Recipe> recipeList();

    RecipeDetail getRecipeDetail(int parseInt);

    void recipeHit(int recipeNo);

    int recipeLike(Like like);

    Like getLike(String recipeNo, String id);

    int recipeUnLike(Like like);

    int updateLike(int recipeNo);

    List<Recipe> likeRank();

    int orderReg(int recipeNo, int price);

    List<Recipe> recipeList(RecipeSearch recipeSearch);

    int recipeTotal(RecipeSearch recipeSearch);

    int recipeDel(Recipe recipe);

    int recipeUpdate(Recipe recipe);

    int stepUpdate(Recipe recipe);

    int workImgUpdate(Recipe recipe);
}
