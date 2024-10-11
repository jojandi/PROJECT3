package project3.gamja.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project3.gamja.admin.service.RequestService;

@Controller
public class RequestController {
	
	@Autowired
	RequestService reService;
	
	@RequestMapping("request")
	public String request(Model model, Integer seq, Integer count, Integer pageNo) {
		// 페이징 기본값 설정
		if(count == null) count = 10;
		if(pageNo == null) pageNo = 1;
		
		Map map = reService.selectre(count, pageNo);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "request";
	}
	
	@RequestMapping("apply")
	public String apply(Model model, Integer seq, Integer count, Integer pageNo) {
		// 페이징 기본값 설정
		if(count == null) count = 10;
		if(pageNo == null) pageNo = 1;
		
		Map map = reService.selectApply(count, pageNo);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "apply";
	}

}
