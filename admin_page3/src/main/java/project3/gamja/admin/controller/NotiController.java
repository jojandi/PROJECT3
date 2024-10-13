package project3.gamja.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	

	}
	

