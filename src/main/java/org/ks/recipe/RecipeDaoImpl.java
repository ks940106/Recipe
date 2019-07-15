package org.ks.recipe;

import org.ks.recipe.vo.Category;
import org.ks.recipe.vo.Like;
import org.ks.recipe.vo.Recipe;
import org.ks.recipe.vo.RecipeDetail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public int recipeUnLike(Like like) {

        return sqlSession.update("recipe.recipeUnLike",like);
    }

    @Override
    public int updateLike(int recipeNo){
        return sqlSession.update("recipe.updateLike",recipeNo);
    }

    @Override
    public List<Recipe> likeRank() {
        return sqlSession.selectList("recipe.likeRank");
    }

    @Override
    public int orderReg(int recipeNo, int price) {
        Map<String,Integer> map = new HashMap<String, Integer>();
        map.put("recipeNo",recipeNo);
        map.put("price",price);
        return sqlSession.update("recipe.orderReg",map);
    }
}
