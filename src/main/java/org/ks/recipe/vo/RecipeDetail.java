package org.ks.recipe.vo;

import org.ks.member.vo.Member;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class RecipeDetail {
    private Recipe recipe;
    private Member member;
    private String category1;
    private String category2;

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
//    public RecipeDetail(Recipe recipe, Member member){
//        this.recipe = recipe;
//        this.member = member;
//
//        this.recipeStep = new ArrayList<Step>();
//        this.recipeWorkImg = new ArrayList<String>();
//
//        List<String> step = new ArrayList<String>();
//        List<String> img = new ArrayList<String>();
//        if(this.recipe.getRecipeStep()!=null) {
//            step = Arrays.asList(this.recipe.getRecipeStep().split("<:>"));
//        }
//        if(this.recipe.getRecipeStepImg()!=null) {
//            img = Arrays.asList(this.recipe.getRecipeStepImg().split("<:>"));
//        }
//        int cnt;
//
//        if (step.size() > img.size())
//            cnt = step.size();
//        else
//            cnt = img.size();
//
//        for(int i = 0; i<cnt;i++){
//            this.recipeStep.add(new Step());
//        }
//        for(int i = 0; i<step.size();i++){
//            this.recipeStep.get(i).setStep(step.get(i));
//        }
//        for(int i = 0; i<img.size();i++){
//            this.recipeStep.get(i).setImg(img.get(i));
//        }
//        if(this.recipe.getRecipeWorkImg()!=null) {
//            this.recipeWorkImg = Arrays.asList(this.recipe.getRecipeWorkImg().split("<:>"));
//        }
//
//    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
        this.recipeStep = recipe.getRecipeStep();
        this.recipeWorkImg = recipe.getRecipeWorkImg();
//        List<String> step = new ArrayList<String>();
//        List<String> img = new ArrayList<String>();
//        if(this.recipe.getRecipeStep()!=null) {
//            step = Arrays.asList(this.recipe.getRecipeStep().split("<:>"));
//        }
//        if(this.recipe.getRecipeStepImg()!=null) {
//            img = Arrays.asList(this.recipe.getRecipeStepImg().split("<:>"));
//        }
//        int cnt;
//
//        if (step.size() > img.size())
//            cnt = step.size();
//        else
//            cnt = img.size();
//
//        for(int i = 0; i<cnt;i++){
//            this.recipeStep.add(new Step());
//        }
//        for(int i = 0; i<step.size();i++){
//            this.recipeStep.get(i).setStep(step.get(i));
//        }
//        for(int i = 0; i<img.size();i++){
//            this.recipeStep.get(i).setImg(img.get(i));
//        }
//        if(this.recipe.getRecipeWorkImg()!=null) {
//            this.recipeWorkImg = Arrays.asList(this.recipe.getRecipeWorkImg().split("<:>"));
//        }
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

    public String getCategory1() {
        return category1;
    }

    public void setCategory1(String category1) {
        this.category1 = category1;
    }

    public String getCategory2() {
        return category2;
    }

    public void setCategory2(String category2) {
        this.category2 = category2;
    }
    public String getCount(){
        try {
            switch (Integer.parseInt(this.recipe.getRecipeCount().trim())){
                case 1:
                    return "1인분";
                case 2 :
                    return "2인분";
                case 3:
                    return "3인분";
                case 4:
                    return "4인분";
                case 5:
                    return "5인분";
                case 6:
                    return "6인분이상";
                default:
                    return "";
            }
        }catch (Exception e){
            return "";
        }

    }
    public String getTime(){
        try {
            switch (Integer.parseInt(this.recipe.getRecipeTime().trim())) {
                case 5:
                    return "5분이내";
                case 10:
                    return "10분이내";
                case 15:
                    return "15분이내";
                case 20:
                    return "20분이내";
                case 30:
                    return "30분이내";
                case 60:
                    return "60분이내";
                case 90:
                    return "90분이내";
                case 120:
                    return "2시간이내";
                case 999:
                    return "2시간이상";
                default:
                    return "";
            }
        }catch (Exception e){
            return "";
        }
    }

    public String getLevel(){
        try {
            switch (Integer.parseInt(this.recipe.getRecipeLevel().trim())){
                case 1:
                    return "아무나";
                case 2:
                    return "초급";
                case 3:
                    return "중급";
                case 4:
                    return "고급";
                case 5:
                    return "신의경지";
                default:
                    return "";
            }
        }catch (Exception e){
            return "";
        }
    }

    @Override
    public String toString() {
        return "RecipeDetail{" +
                "recipe=" + recipe +
                ", member=" + member +
                ", category1='" + category1 + '\'' +
                ", category2='" + category2 + '\'' +
                ", recipeStep=" + recipeStep +
                ", recipeWorkImg=" + recipeWorkImg +
                '}';
    }
}
