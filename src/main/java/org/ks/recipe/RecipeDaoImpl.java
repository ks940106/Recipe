package org.ks.recipe;

import org.ks.recipe.vo.Category;
import org.ks.recipe.vo.Recipe;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("recipeDaoImpl")
public class RecipeDaoImpl implements RecipeDao {

    @Autowired
    SqlSessionTemplate sqlSession;

    @Override
    public List<Category> categoryList() {
        return sqlSession.selectList("recipe.categoryAll");
    }

    @Override
    public int recipeReg(Recipe recipe) {
        return sqlSession.insert("recipe.recipeReg",recipe);
    }

    @Override
    public List<Recipe> recipeList() {
        return sqlSession.selectList("recipe.recipeAll");
    }
}
