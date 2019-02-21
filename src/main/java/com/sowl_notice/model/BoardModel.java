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
	
	private long bbs_sno;
	private long blt_rsrc_sno;
	
	
	@Override
	public String toString() {
		String no = this.no+"";
		return no;
	}
	
}
