package org.ks.recipe;

import org.ks.recipe.vo.Category;
import org.ks.recipe.vo.Recipe;
import org.ks.recipe.vo.RecipeDetail;

import java.util.List;

public interface RecipeDao {
    List<Category> categoryList();

    int recipeReg(Recipe recipe);

    List<Recipe> recipeList();

    RecipeDetail getRecipeDetail(int parseInt);

    void recipeHit(int recipeNo);
}