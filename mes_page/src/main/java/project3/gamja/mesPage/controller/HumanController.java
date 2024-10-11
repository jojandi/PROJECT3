package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project3.gamja.mesPage.dto.MesHumanDTO;
import project3.gamja.mesPage.dto.MesNoticeDTO;
import project3.gamja.mesPage.service.HumanService;
import project3.gamja.mesPage.service.NoticeService;

@Controller
public class HumanController {

	@Autowired
	HumanService humanService;

	@RequestMapping("/mes_human")
	public String human(Model model) {
		List<MesHumanDTO> list = humanService.selectHuman();
		model.addAttribute("humanlist", list);

		return "mes_human";
	}


		  
		  @RequestMapping(value="mes_read", method=RequestMethod.GET) public
		  String readNotice (@RequestParam int emp_id, Model model) {
		 
			  MesHumanDTO dto = new MesHumanDTO(); dto.setEmp_id(emp_id);
		  
		  MesHumanDTO list = new MesHumanDTO();
		  model.addAttribute("mes_read", list);
		 
		  
		 return "mes_read"; }
		 
		 
//		  
//		  @RequestMapping("/mes_noticeUpdate") public String readNotice2 (@RequestParam
//		  int notice_id, Model model) {
//		  
//		  MesNoticeDTO dto = new MesNoticeDTO(); dto.setNotice_id(notice_id);
//		  
//		  MesNoticeDTO list = noticeService.selectOne(dto);
//		  model.addAttribute("noticeRead", list);
//		  
//		 return "mes_noticeUpdate"; }
//		  
//		  
//		  
//		  @RequestMapping(value="/mes_noticeUpdate", method=RequestMethod.POST) public
//		  String noticeUpdate(MesNoticeDTO dto, @RequestParam Integer notice_id) {
//		  
//		  noticeService.updateNotice(dto);
//		  
//		  
//		  return "redirect:mes_noticeRead?notice_id="+notice_id; }
//		  
//		  @RequestMapping(value="/mes_noticeDelete", method=RequestMethod.GET) public
//		  String noticeDelete(MesNoticeDTO dto, @RequestParam Integer notice_id) {
//		  
//		  try { noticeService.deleteNotice(dto);
//		 
//		 }catch (Exception e) { System.out.println(e); }
//		  
//		  
//		  return "redirect:mes_notice1"; }


}
