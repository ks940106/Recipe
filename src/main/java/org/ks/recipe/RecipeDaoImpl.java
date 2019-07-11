package org.ks.recipe;

import org.ks.recipe.vo.Category;
import org.ks.recipe.vo.Like;
import org.ks.recipe.vo.Recipe;
import org.ks.recipe.vo.RecipeDetail;
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

    @Override
    public RecipeDetail getRecipeDetail(int recipeNo) {
        return sqlSession.selectOne("recipe.recipeDetail",recipeNo);
    }

    @Override
    public void recipeHit(int recipeNo) {
        sqlSession.update("recipe.recipeHit",recipeNo);
    }

    @Override
    public int recipeLike(Like like) {
        return sqlSession.update("recipe.recipeLike",like);
    }

    @Override
    public Like getLike(String recipeNo, String id) {
        Like key = new Like(Integer.parseInt(recipeNo),id);
        return sqlSession.selectOne("recipe.getLike",key);
    }
}
