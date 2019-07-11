package org.ks.recipe.vo;

import org.ks.member.vo.Member;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class RecipeDetail {
    private Recipe recipe;
    private Member member;

    private List<Step> recipeStep;
    private List<String> recipeWorkImg;

    public List<Step> getRecipeStep() {
        return recipeStep;
    }

    public RecipeDetail(){
        this.recipe = new Recipe();
        this.member = new Member();
        this.recipeStep = new ArrayList<Step>();
        this.recipeWorkImg = new ArrayList<String>();
    }
    public RecipeDetail(Recipe recipe, Member member){
        this.recipe = recipe;
        this.member = member;

        this.recipeStep = new ArrayList<Step>();
        this.recipeWorkImg = new ArrayList<String>();

        List<String> step = new ArrayList<String>();
        List<String> img = new ArrayList<String>();
        if(this.recipe.getRecipeStep()!=null) {
            step = Arrays.asList(this.recipe.getRecipeStep().split("<:>"));
        }
        if(this.recipe.getRecipeStepImg()!=null) {
            img = Arrays.asList(this.recipe.getRecipeStepImg().split("<:>"));
        }
        int cnt;

        if (step.size() > img.size())
            cnt = step.size();
        else
            cnt = img.size();

        for(int i = 0; i<cnt;i++){
            this.recipeStep.add(new Step());
        }
        for(int i = 0; i<step.size();i++){
            this.recipeStep.get(i).setStep(step.get(i));
        }
        for(int i = 0; i<img.size();i++){
            this.recipeStep.get(i).setImg(img.get(i));
        }
        if(this.recipe.getRecipeWorkImg()!=null) {
            this.recipeWorkImg = Arrays.asList(this.recipe.getRecipeWorkImg().split("<:>"));
        }

    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
        List<String> step = new ArrayList<String>();
        List<String> img = new ArrayList<String>();
        if(this.recipe.getRecipeStep()!=null) {
            step = Arrays.asList(this.recipe.getRecipeStep().split("<:>"));
        }
        if(this.recipe.getRecipeStepImg()!=null) {
            img = Arrays.asList(this.recipe.getRecipeStepImg().split("<:>"));
        }
        int cnt;

        if (step.size() > img.size())
            cnt = step.size();
        else
            cnt = img.size();

        for(int i = 0; i<cnt;i++){
            this.recipeStep.add(new Step());
        }
        for(int i = 0; i<step.size();i++){
            this.recipeStep.get(i).setStep(step.get(i));
        }
        for(int i = 0; i<img.size();i++){
            this.recipeStep.get(i).setImg(img.get(i));
        }
        if(this.recipe.getRecipeWorkImg()!=null) {
            this.recipeWorkImg = Arrays.asList(this.recipe.getRecipeWorkImg().split("<:>"));
        }
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }


    public List<String> getRecipeWorkImg() {
        return recipeWorkImg;
    }
}
