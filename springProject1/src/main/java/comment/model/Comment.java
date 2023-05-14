package comment.model;

import lombok.Data;


@Data
public class Comment {
	private String comment_no;
	private String comment_content;
	private String board_no;
	private String member_id;
	private String comment_regiDate;
	
	
}
