package org.ks.recipe.vo;

public class RecipeSearch {
    private String q;
    private String cat1;
    private String cat2;
    private String order;
    private int page;
    private String id;

    public int getIsProduct() {
        return isProduct;
    }

    public void setIsProduct(int isProduct) {
        this.isProduct = isProduct;
    }

    private int isProduct;

    @Override
    public String toString() {
        return "RecipeSearch{" +
                "q='" + q + '\'' +
                ", cat1='" + cat1 + '\'' +
                ", cat2='" + cat2 + '\'' +
                ", order='" + order + '\'' +
                ", page=" + page +
                ", id='" + id + '\'' +
                ", isProduct='" + isProduct + '\'' +
                '}';
    }

    public RecipeSearch() {
        this.q = "";
        this.cat1 = "";
        this.cat2 = "";
        this.order = "";
        this.id = "";
        this.page = 1;
        this.isProduct = 0;
    }

    public String getQ() {
        return q;
    }

    public void setQ(String q) {
        this.q = q;
    }

    public String getCat1() {
        return cat1;
    }

    public void setCat1(String cat1) {
        this.cat1 = cat1;
    }

    public String getCat2() {
        return cat2;
    }

    public void setCat2(String cat2) {
        this.cat2 = cat2;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPage(String page) {
        try{
            this.page = Integer.parseInt(page);
        }catch (Exception e){
            this.page = 1;
        }
    }

}
