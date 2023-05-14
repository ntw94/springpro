package board.model;

import lombok.Data;

@Data
public class Board {
	private int board_no;
	private String board_subject;
	private String board_writer;
	private String board_content;
	private String board_regiDate;
	private String board_views;
	private String member_id;
	private String rate_no; // 좋아요 기능
		
}
