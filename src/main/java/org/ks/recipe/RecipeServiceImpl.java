package org.ks.recipe;

import org.ks.recipe.vo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("recipeServiceImpl")
public class RecipeServiceImpl implements RecipeService {

    @Autowired
    @Qualifier(value = "recipeDaoImpl")
    RecipeDao recipeDaoImpl;

    @Override
    public List<Category> categoryList() {
        List<Category> categories = recipeDaoImpl.categoryList();
        return categories;
    }
}
