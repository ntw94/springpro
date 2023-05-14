
create table board(
	board_no int auto_increment,
	board_subject varchar(100) not null,
	board_writer varchar(50) not null,
	board_content text,  
	board_regiDate datetime default now(),
	board_views int default 0,
	member_id varchar(50),
	
	primary key(board_no)
)

drop table board;

select * from board;
select count(*) from board;
select * 
from board
limit 20, 5; -- 여기 start,

  select * 
        from (
        	select (@ROWNUM:=@ROWNUM+1),B.*
        	from board B, (SELECT @ROWNUM:=0) TMP
        )T
        order by board_no desc
        limit 0,3

insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			insert into board (board_subject,board_writer,board_content)
			values('첫번째 글입니다.','홍길동','안녕하세요!!');
			
			
			delete from board;
			