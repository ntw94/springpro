package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _common.BoardPaging;
import board.mapper.BoardMapper;
import board.model.Board;
import comment.mapper.CommentMapper;
import comment.model.Comment;
import member.model.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private CommentMapper commentMapper;
	

	
	//게시판 메인페이지
	@RequestMapping("/boardList.do")
	public String boardList(Model model,HttpServletRequest request,@RequestParam(value="page",required=false,defaultValue="1") String page) {

		if(page == null || page.equals(""))
			page = "1";
		int totalRecord = mapper.getTotalRecord();
		
		int pageSize = 3;
		
		BoardPaging boardPage = new BoardPaging(pageSize,10,totalRecord,Integer.parseInt(page));
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("startRecord", boardPage.getStartRecord()-1);
		map.put("lastRecord", boardPage.getLastRecord());
		map.put("pageSize",pageSize);
		/*
		 * System.out.println(map.toString()); System.out.println(boardPage.toString());
		 */
		
		List<Board> list = mapper.getList(map);
		model.addAttribute("list", list);
		model.addAttribute("page",page);
		model.addAttribute("boardPage",boardPage);

		
		return "board/boardList";
	}

	//게시판 글 등록
	@RequestMapping("/boardInsertForm.do")
	public String boardInsertForm() {

		return "board/boardInsertForm";
	}
	
	//게시판 상세보기
	@GetMapping("/boardView.do")
	public String boardView(Model model,@RequestParam("no") int board_no) {
		

		mapper.setViewUP(board_no);
		Board boardDTO = mapper.getListOne(board_no);
		
		model.addAttribute("boardDTO", boardDTO);
		
		List<Comment> commentList = commentMapper.getList(board_no);
		model.addAttribute("commentList",commentList);
		
		
		
		return "board/boardView";
	}

	
	@PostMapping("/boardInsert")
	public String boardInsert(Board board, RedirectAttributes rttr) {

		if (board.getBoard_subject() == null || board.getBoard_subject().equals("") ||
				board.getBoard_content() == null || board.getBoard_content().equals("") ||
				board.getBoard_writer() == null || board.getBoard_writer().equals("")){
			rttr.addFlashAttribute("msgType", "글 등록 오류");
			rttr.addFlashAttribute("msg", "내용을 다시 입력해 주세요");
		}

		
		  int result = mapper.setInsert(board);
		  if(result == 1) {
			  return "redirect:/boardList.do";
		  }else {
			 rttr.addFlashAttribute("msgType", "글 등록 오류");
			 rttr.addFlashAttribute("msg","글 등록 실패");
			 
			 return "redirect:/boardInsertForm.do";
		  }
	}
	
	@RequestMapping("/boardUpdateForm")
	public String boardUpdateForm(Model model,@RequestParam("no")int board_no) {
		
		Board boardDTO = mapper.getListOne(board_no);
		
		model.addAttribute("boardDTO",boardDTO);
			
		return "/board/boardUpdateForm";
	}
	
	@PostMapping("/boardUpdate")
	public String boardUpdate(Model mode, Board board) {
		
		int result = mapper.setUpdate(board);
		
		return "redirect:/boardView.do?no="+board.getBoard_no();
	}
	
	@PostMapping("/boardDelete")
	public String boardDelete(int board_no) {
		
		int result = mapper.setDelete(board_no);
		
		return "redirect:/boardList.do";
	}

}
