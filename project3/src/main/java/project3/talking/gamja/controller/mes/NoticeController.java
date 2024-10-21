package project3.talking.gamja.controller.mes;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project3.talking.gamja.dto.mes.MesNoticeDTO;
import project3.talking.gamja.service.mes.NoticeService;


@Controller
@RequestMapping("/mes")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	

	@RequestMapping(value="mes_notice1", method=RequestMethod.GET)
	public String selectStock1(Model model, Integer seq, Integer count, Integer pageNo) {
		// 페이징 기본값 설정
		if(count == null) count = 10;
		if(pageNo == null) pageNo = 1;
		
		Map map = noticeService.selectNotice1(count, pageNo);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
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
			
			
		try {
			dto.setNotice_id(notice_id);
			System.out.println("@@@@@@@@@@@@delete dto :" + dto);
			noticeService.deleteNotice(dto);
			
		}catch (Exception e) {
			System.out.println(e);
		}
		
		
		return "redirect:mes_notice1";
	}
	

}
