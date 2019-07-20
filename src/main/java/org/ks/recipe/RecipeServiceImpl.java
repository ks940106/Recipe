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
        int result = 0;
        if(recipeDaoImpl.recipeReg(recipe)>0){
            result += recipeDaoImpl.stepReg(recipe);
            result += recipeDaoImpl.workImgReg(recipe);
        }
        return result;
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
    public PageData<Recipe> recipeList(RecipeSearch recipeSearch) {
        //페이지 당 게시물 수
        int numPerPage = 16;
        int total = recipeDaoImpl.recipeTotal(recipeSearch);
        List<Recipe> recipeList = recipeDaoImpl.recipeList(recipeSearch);
        //총 페이지 수 구하기
        int totalPage = (total%numPerPage==0)?(total/numPerPage):(total/numPerPage)+1;
        String pageNavi= "";
        int pageNaviSize = 5;
        int reqPage = recipeSearch.getPage();
        //페이지 번호
        int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
        //이전 버튼 생성
        if(pageNo !=1) {
            pageNavi += "<a class='pageNo' href='/recipePage.do?q="+recipeSearch.getQ()+"&cat1="+recipeSearch.getCat1()+"&cat2="+recipeSearch.getCat2()+"&order="+recipeSearch.getOrder()+"&page="+(pageNo-1)+"'><</a>";
        }
        //페이지 번호 버튼 생성 ( 1 2 3 4 5 )
        int i = 1;
        while( !(i++>pageNaviSize || pageNo>totalPage) ) { //둘 중 하나라도 만족하면 수행하지 않겠다
            if(reqPage == pageNo) {
                pageNavi += "<span class='pageSelected'>"+pageNo+"</span>"; //4페이지 상태에서 4페이지를 누를수가 없도록 하기 위해서 a태그 없애줌
            }else {
                pageNavi += "<a class='pageNo' href='/recipePage.do?q="+recipeSearch.getQ()+"&cat1="+recipeSearch.getCat1()+"&cat2="+recipeSearch.getCat2()+"&order="+recipeSearch.getOrder()+"&page="+(pageNo)+"'>"+pageNo+"</a>";
            }
            pageNo++;
        }
        //다음 버튼 생성
        if(pageNo <= totalPage) {
            pageNavi += "<a class='pageNo' href='/recipePage.do?q="+recipeSearch.getQ()+"&cat1="+recipeSearch.getCat1()+"&cat2="+recipeSearch.getCat2()+"&order="+recipeSearch.getOrder()+"&page="+(pageNo)+"'>></a>";
        }
        return new PageData<Recipe>(recipeList,pageNavi);
    }
    @Override
    public PageData<Recipe> MyRecipeList(RecipeSearch recipeSearch) {
        //페이지 당 게시물 수
        int numPerPage = 16;
        int total = recipeDaoImpl.recipeTotal(recipeSearch);
        List<Recipe> recipeList = recipeDaoImpl.recipeList(recipeSearch);
        //총 페이지 수 구하기
        int totalPage = (total%numPerPage==0)?(total/numPerPage):(total/numPerPage)+1;
        String pageNavi= "";
        int pageNaviSize = 5;
        int reqPage = recipeSearch.getPage();
        //페이지 번호
        int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
        //이전 버튼 생성
        if(pageNo !=1) {
            pageNavi += "<a class='pageNo' href='/myRecipe.do?page="+(pageNo-1)+"'><</a>";
        }
        //페이지 번호 버튼 생성 ( 1 2 3 4 5 )
        int i = 1;
        while( !(i++>pageNaviSize || pageNo>totalPage) ) { //둘 중 하나라도 만족하면 수행하지 않겠다
            if(reqPage == pageNo) {
                pageNavi += "<span class='pageSelected'>"+pageNo+"</span>"; //4페이지 상태에서 4페이지를 누를수가 없도록 하기 위해서 a태그 없애줌
            }else {
                pageNavi += "<a class='pageNo' href='/myRecipe.do?page="+(pageNo)+"'>"+pageNo+"</a>";
            }
            pageNo++;
        }
        //다음 버튼 생성
        if(pageNo <= totalPage) {
            pageNavi += "<a class='pageNo' href='/myRecipe.do?page="+(pageNo)+"'>></a>";
        }
        return new PageData<Recipe>(recipeList,pageNavi);
    }

    @Override
    public int recipeDel(Recipe recipe) {
        return recipeDaoImpl.recipeDel(recipe);
    }

    @Override
    public int recipeUpdate(Recipe recipe) {
        int result = 0;
        if(recipeDaoImpl.recipeUpdate(recipe)>0){
            result += recipeDaoImpl.stepUpdate(recipe);
            result += recipeDaoImpl.workImgUpdate(recipe);
        }
        return result;
    }

    @Override
    public List<Recipe> product() {
        return recipeDaoImpl.product();
    }
}
