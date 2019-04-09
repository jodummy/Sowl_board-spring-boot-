package com.sowl_notice.model;

public class SearchCriteria extends Criteria {

	private String keyword;
	private int category;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "SearchCriteria{" + category + "category" + "keyword='" + keyword + '\'' + '}';
	}

}