package org.ks.recipe;

import org.ks.recipe.vo.Category;

import java.util.List;

public interface RecipeDao {
    List<Category> categoryList();
}
