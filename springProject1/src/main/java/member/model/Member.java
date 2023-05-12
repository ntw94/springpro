package member.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private int member_no;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_email;
	private String member_regiDate;
	
}
