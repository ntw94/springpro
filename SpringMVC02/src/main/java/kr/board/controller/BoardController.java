package kr.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

//@Component 보다는 컨트롤러라고 하는게 낫다
@Controller
public class BoardController {

	@Autowired
	BoardMapper boardMapper;
	
	@RequestMapping("/")
	public String main() {

		return "main"; // /WEB-INF/views/boardList.jsp -> forward
	}
	
	//@responsBody-> jackson-databind(객체를-> JSON 데이터포맷으로 변환) 
	@RequestMapping("/boardList.do")
	public @ResponseBody List<Board> boardList(){
		List<Board> list = boardMapper.getLists();
		return list; // JSON 데이터 형식으로 변환(API)해서 리턴하겠다 라는 의미 이때 API가 잭슨 api이다.
	}
	
	
	
}
