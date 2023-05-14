package comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import comment.mapper.CommentMapper;
import comment.model.Comment;

@RequestMapping("/comment")
@RestController
public class CommentController {
	@Autowired
	CommentMapper commentMapper;
	
	@GetMapping("/listAll/{board_no}")
	public List<Comment> boardList(@PathVariable("board_no") int board_no){
		List<Comment> list = commentMapper.getList(board_no);
		
		return list;
	}
	
	@PostMapping("/insert")
	public void commentInsert(Comment comment) {
		commentMapper.setInsert(comment);
	}
	
	@GetMapping("/delete")
	public void commentDelete(@RequestParam("comment_no")int comment_no,@RequestParam("member_id")String member_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("comment_no", comment_no);
		map.put("member_id",member_id);
		
		int res = commentMapper.setDelete(map);
	}
	
	@PutMapping("/update")
	public void commentUpdate(@RequestBody Comment comment) {
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("comment_no",comment.getComment_no());
		map.put("member_id",comment.getMember_id());
		map.put("comment_content",comment.getComment_content());
		
		System.out.println(map.toString());
		
		commentMapper.setUpdate(map);
		
	}
	
	
}
