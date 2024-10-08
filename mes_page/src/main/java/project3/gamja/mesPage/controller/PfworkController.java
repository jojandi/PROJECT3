package project3.gamja.mesPage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project3.gamja.mesPage.service.PfworkService;

@Controller
public class PfworkController {
	
	@Autowired
	PfworkService pfService;
	
	@RequestMapping(value="order", method=RequestMethod.GET)
	public String order(Model model, Integer seq, Integer count, Integer pageNo) {
		// 페이징 기본값 설정
		if(count == null) count = 7;
		if(pageNo == null) pageNo = 1;
		
		Map map = pfService.selectpf(count, pageNo);
		System.out.println("map : " + map);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "mes_pfwork";
	}

}
