package org.ks.recipe.vo;

import java.util.List;

public class PageData<T>{
    private List<T> list;
    private String pageNav;

    public PageData() {
    }

    public PageData(List<T> list, String pageNav) {
        this.list = list;
        this.pageNav = pageNav;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public String getPageNav() {
        return pageNav;
    }

    public void setPageNav(String pageNav) {
        this.pageNav = pageNav;
    }
}
