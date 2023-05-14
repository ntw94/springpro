create table comment(
	comment_no int auto_increment,
	comment_content text,  
	comment_regiDate datetime default now(),
	board_no int not null,
	member_id varchar(50) not null,
	
	primary key(comment_no)
)

insert into comment (comment_content,board_no,member_id) values ('댓글입니다.',50,'hong')

select * from comment;

select * from comment;

delete from comment where comment_no = 4 and member_id = 'hong'

update comment
        	set comment_content = '내가직접 수정했음',
        		comment_regiDate = now()
        	where comment_no = 8 and
        			member_id = 'hong'