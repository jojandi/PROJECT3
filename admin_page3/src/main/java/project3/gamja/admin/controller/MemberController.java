package project3.gamja.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project3.gamja.admin.dto.MemberDTO;
import project3.gamja.admin.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping("/member1")
	public String notice(Model model) {
		List<MemberDTO> list = memberService.selectMember();
		model.addAttribute("list",list);
		
			
		return "member1";
	}
	
	@RequestMapping(value="member2", method=RequestMethod.GET)
	public String readMember (@RequestParam int seq, Model model) {
		
		MemberDTO dto = new MemberDTO();
		dto.setUser_seq(seq);
		
		MemberDTO list = memberService.selectOne(dto);
		model.addAttribute("dto", list);

		
		return "member2";
	}
	
	
}
