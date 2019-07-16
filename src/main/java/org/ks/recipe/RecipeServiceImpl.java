package org.ks.recipe;

import org.ks.recipe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Override
    @Transactional
    public int recipeReg(Recipe recipe) {
        return recipeDaoImpl.recipeReg(recipe);
    }

    @Override
    public List<Recipe> recipeList() {
        return recipeDaoImpl.recipeList();
    }

    @Override
    public RecipeDetail getRecipeDetail(String recipeNo) {
        return recipeDaoImpl.getRecipeDetail(Integer.parseInt(recipeNo));
    }

    @Override
    @Transactional
    public void recipeHit(String recipeNo) {
        recipeDaoImpl.recipeHit(Integer.parseInt(recipeNo));
    }

    @Override
    @Transactional
    public boolean recipeLike(Like like) {
        if(recipeDaoImpl.recipeLike(like)>0){
            recipeDaoImpl.updateLike(like.getRecipeNo());
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean getLike(String recipeNo, String id) {
        Like like = recipeDaoImpl.getLike(recipeNo,id);
        return like != null;
    }

    @Override
    @Transactional
    public boolean recipeUnLike(Like like) {
        if(recipeDaoImpl.recipeUnLike(like)>0){
            recipeDaoImpl.updateLike(like.getRecipeNo());
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List<Recipe> likeRank() {
        return recipeDaoImpl.likeRank();
    }

    @Override
    public int orderReg(int recipeNo, int price) {
        return recipeDaoImpl.orderReg(recipeNo,price);
    }

    @Override
    public List<Recipe> recipeList(RecipeSearch recipeSearch) {
        return recipeDaoImpl.recipeList(recipeSearch);
    }
}
