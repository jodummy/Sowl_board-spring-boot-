	package com.sowl_notice.model;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class BoardModel  {
	private int board_no;
    private int no;
	private String board_writer;
	private String board_title;
	private String board_content;
	private String board_insertdate;
	private int board_category;
	@Override
	public String toString() {
		return "BoardModel [board_no=" + board_no + ", no=" + no + ", board_writer=" + board_writer + ", board_title="
				+ board_title + ", board_content=" + board_content + ", board_insertdate=" + board_insertdate
				+ ", board_category=" + board_category + "]";
	}
	
	
	
	
}
