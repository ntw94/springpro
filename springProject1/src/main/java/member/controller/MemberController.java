package member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.mapper.MemberMapper;
import member.model.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper mapper;

	@RequestMapping("/*")
	public String index(Model model) {
		
		
		return "index";
	}
	
	@RequestMapping("/memberRegisterForm.do")
	public String memberRegisterForm() {
		
		return "member/memberRegisterForm";
	}
	
	@PostMapping("/memberInsert")
	public String memberInsert(Member member) {
		
		mapper.setInsert(member);
		
		return "redirect:/";
	}
	
	@RequestMapping("/memberIdCheck.do")
	public @ResponseBody int memberIdCheck(@RequestParam("member_id") String member_id){
		
		System.out.println(member_id);
		Member member= mapper.getListOne(member_id);
		
		if(member != null || member_id.equals("")) {
			return 0;
		}
		return 1;
	}
	
	//로그인
	@RequestMapping("/memberLoginForm.do")
	public String memberLoginForm() {
		
		return "member/memberLoginForm";
	}
	
	@RequestMapping("/memberLogin.do")
	public String memberLogin(Member member , HttpSession session) {
		Member m = mapper.setLogin(member);
		
		System.out.println(m);
		if(m != null) {
			session.setAttribute("member", m);
			return "redirect:/";
		}
		
		return "redirect:/memberLoginForm.do";
	}
	
	@RequestMapping("/memberLogout.do")
	public String memLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
