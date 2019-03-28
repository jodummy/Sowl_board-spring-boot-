package com.sowl_notice.model;

public class SearchCriteria extends Criteria {

    private String keyword;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
    }

    @Override
    public String toString() {
        return "SearchCriteria{" +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}