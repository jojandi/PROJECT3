package project3.gamja.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project3.gamja.user.service.MyApplyService;
import project3.gamja.user.service.MyUseService;

@Controller
public class MyApplyController {
	
	@Autowired
	MyApplyService applyService;

	@RequestMapping(value="/apply", method=RequestMethod.GET)
	public String bookApply(Model model, String seq, Integer count, Integer pageNo) {
		
		// 페이징 기본값 설정
		if(count == null) count = 7;
		if(pageNo == null) pageNo = 1;
		
		Map map = applyService.selectUseRes(seq, count, pageNo);
		
		// select 된 목록들, 목록 갯수, 페이지 jsp에 보냄
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "apply";
	}
	
}
