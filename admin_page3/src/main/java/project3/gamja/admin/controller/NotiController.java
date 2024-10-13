package project3.gamja.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project3.gamja.admin.dto.NotiDTO;
import project3.gamja.admin.service.NotiService;

@Controller
public class NotiController {

	@Autowired
	NotiService notiService;
	
	// 공지사항 목록 
	@RequestMapping("/notice")
	public String notice(Model model) {
		List<NotiDTO> list = notiService.selectNoti();
		model.addAttribute("noticeList",list);
		
			
		return "notice";
	}
	
//	@RequestMapping("/notice2")
//	public String notice2() {
//		
//		
//
//		
//		return "notice2";
//	}
	
	// 공지사항 추가 
	@RequestMapping(value="/notice2", method=RequestMethod.POST)
	public String insertNotice(NotiDTO dto) {
		
		notiService.insertNoti(dto);
		
		return "redirect:notice1";
	}
	
	
	
	

	}
	

