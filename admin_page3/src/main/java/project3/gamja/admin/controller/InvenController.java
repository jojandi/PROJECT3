package project3.gamja.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project3.gamja.admin.dto.InvenDTO;
import project3.gamja.admin.service.InvenService;

@Controller
public class InvenController {

	@Autowired
	InvenService invenService;
	
	// 실시간 재고현황 페이지
	@RequestMapping(value="/inven", method=RequestMethod.GET)
	public String slelctInven(Model model, InvenDTO invenDTO, String countPerPage, String page) {
		// 페이징 기본값 설정
		if(countPerPage == null) countPerPage = "7";
		if(page == null) page = "1";
		
		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);
		
		Map map = invenService.selectInven(count, pageNo);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
//		System.out.println("totalCount : " + map.get("totalCount"));
		System.out.println("countPerPage : " + count);
		System.out.println("page : " + pageNo);
		
		return "inven";
	}
	
}
