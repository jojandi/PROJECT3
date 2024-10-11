package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project3.gamja.mesPage.dto.MesNoticeDTO;
import project3.gamja.mesPage.dto.MesPfworkDTO;
import project3.gamja.mesPage.dto.MesStockDTO;
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
	@RequestMapping("/mes_notice2")
	public String notice2() {

		
		
		
		return "mes_notice2";
	}
	
	@RequestMapping(value="/mes_notice2", method=RequestMethod.POST)
	public String insertNotice(MesNoticeDTO dto) {
		
		noticeService.insertNotice(dto);
		
		return "redirect:mes_notice1";
	}
	
	@RequestMapping(value="mes_noticeRead", method=RequestMethod.GET)
	public String readNotice (@RequestParam int notice_id, Model model) {
		
		MesNoticeDTO dto = new MesNoticeDTO();
		dto.setNotice_id(notice_id);
		
		MesNoticeDTO list = noticeService.selectOne(dto);
		model.addAttribute("noticeRead", list);

		
		return "mes_noticeRead";
	}
	
	@RequestMapping("/mes_noticeUpdate")
	public String readNotice2 (@RequestParam int notice_id, Model model) {
		
		MesNoticeDTO dto = new MesNoticeDTO();
		dto.setNotice_id(notice_id);
		
		MesNoticeDTO list = noticeService.selectOne(dto);
		model.addAttribute("noticeRead", list);
		
		
		return "mes_noticeUpdate";
	}
	@RequestMapping(value="/mes_noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate(MesNoticeDTO dto, @RequestParam Integer notice_id) {
		
		noticeService.updateNotice(dto);
		
		
		return "redirect:mes_noticeRead?notice_id="+notice_id;
	}
	@RequestMapping(value="/mes_noticeDelete", method=RequestMethod.GET)
	public String noticeDelete(MesNoticeDTO dto, @RequestParam Integer notice_id) {
		
		noticeService.deleteNotice(dto);
		
		
		return "redirect:mes_notice1";
	}
	

}
