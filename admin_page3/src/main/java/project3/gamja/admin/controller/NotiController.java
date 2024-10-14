package project3.gamja.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.gamja.admin.dto.NotiDTO;
import project3.gamja.admin.service.NotiService;

@Controller
public class NotiController {

	@Autowired
	NotiService notiService;

	// 인설트 폼으로 들어감
	@RequestMapping("/notice")
	public String notice(Model model) {
		return "notice";
	}

	// 공지사항2 셀렉트
	@RequestMapping("/notice2")
	public String notice2(Model model) {
		List<NotiDTO> list = notiService.selectAnnouncement();
		System.out.println("list: " + list);
		model.addAttribute("noticeList", list);
		return "notice2";
	}

	// 공지사항 세부 조회 (ann_seq로 조회)
	// http://localhost:8080/admin/notice3/4
	@RequestMapping("/notice3_{ann_seq}")
	public String noticeDetail(@PathVariable("ann_seq") int annSeq,
			Model model) {
		NotiDTO notice = notiService.selectSeq(annSeq);

		model.addAttribute("notice", notice);
		return "notice3";
	}

	// 공지사항 인서트
	@RequestMapping(value = "/insertNoti", method = RequestMethod.POST)
	public String insertNotice(NotiDTO dto) {
		System.out.println("dto " + dto);
		notiService.insertNotice(dto);
		return "redirect:/notice2";
	}

	// 공지사항 업데이트 (noticeDTO의 데이터를 받아서 업데이트)
	@RequestMapping(value = "/notice2", method = RequestMethod.GET)
	public String updateNotice(NotiDTO dto) {
		notiService.updateNotice(dto);
		return "redirect:/notice2";
	}

	// // 공지사항 삭제 (아작스)
	// @RequestMapping(value = "/notice2", method = RequestMethod.POST)
	// public String deleteNotice(int noticeId) {
	// notiService.deleteNotice(noticeId);
	// return "redirect:/notice2";
	// }
	
	//@RequestMapping 경로설정
    @RequestMapping(value = "/notice2", method = RequestMethod.DELETE)
    @ResponseBody  
    public String delEmp(@RequestBody NotiDTO notiDTO) {
    	System.out.println("삭제확인");
    	int delete = notiService.deleteNotice(notiDTO);
    	System.out.println("삭제 : " + delete);
    	
        return "deleteNoti";
    }
			
	

}
