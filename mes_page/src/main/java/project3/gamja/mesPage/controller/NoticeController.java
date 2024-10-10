package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project3.gamja.mesPage.dto.MesNoticeDTO;
import project3.gamja.mesPage.service.NoticeService;


@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/mes_notice1")
	public String notice1(Model model) {
		List<MesNoticeDTO> list = noticeService.selectNotice1();
		model.addAttribute("noticeList1",list);
		
		
		
		return "mes_notice1";
	}
}
