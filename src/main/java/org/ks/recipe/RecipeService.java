package org.ks.recipe;


import org.ks.recipe.vo.Category;
import org.ks.recipe.vo.Recipe;

import java.util.List;

public interface RecipeService {
    List<Category> categoryList();

    int recipeReg(Recipe recipe);
}
