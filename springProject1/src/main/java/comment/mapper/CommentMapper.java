package comment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import comment.model.Comment;


@Mapper
public interface CommentMapper {
	
	public List<Comment> getList(int comment_no);
	
	public Comment getListOne(int comment_no);
	public int setInsert(Comment comment);
	public int setDelete(@Param("map")Map<String,Object> map);
	public int setUpdate(@Param("map")Map<String,Object> map);
	
}
