package kr.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

//@Component 보다는 컨트롤러라고 하는게 낫다
@Controller
public class BoardController {

	 @Autowired
	private BoardMapper mapper;
	
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		
		List<Board> list = mapper.getLists();
		
		model.addAttribute("list",list);
	
		return "boardList"; // /WEB-INF/views/boardList.jsp -> forward
	}
	
	@GetMapping("/boardForm.do")
	public String boardForm() {
		
		return "boardForm"; // /WEB-INF/views/boardForm.jsp-> forward
	}
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board vo) {
		mapper.boardInsert(vo);
		
		return "redirect:/boardList.do"; // redirect
	}
	
	@GetMapping("/boardContent.do")
	public String boardContent(@RequestParam("idx")int idx,Model model) {
		
		Board vo = mapper.boardContent(idx);
		System.out.println(vo.getContent());
		model.addAttribute("vo",vo);
		
		return "boardContent";// boardContent.jsp
	}
	
}
