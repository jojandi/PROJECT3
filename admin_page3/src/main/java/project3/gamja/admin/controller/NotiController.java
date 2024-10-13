package project3.gamja.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import project3.gamja.admin.dto.NotiDTO;
import project3.gamja.admin.service.NotiService;

@Controller
public class NotiController {

    @Autowired
    NotiService notiService;

    // 공지사항 목록 조회
    @RequestMapping("/notice")
    public String notice(Model model) {
        List<NotiDTO> list = notiService.selectAnnouncement();
        model.addAttribute("noticeList", list);
        return "notice";
    }
    
    @RequestMapping("/notice2")
    public String notice2(Model model) {
        List<NotiDTO> list = notiService.selectAnnouncement();
        model.addAttribute("noticeList", list);
        return "notice2";
    }

    // 공지사항 세부 조회 (ann_seq로 조회)
    @RequestMapping("/notice/{ann_seq}")
    public String noticeDetail(@PathVariable("ann_seq") int annSeq, Model model) {
        NotiDTO notice = notiService.selectSeq(annSeq);
        model.addAttribute("notice", notice);
        return "noticeDetail";
    }

    // 공지사항 클래스 조회
    @RequestMapping("/notice/class")
    public String noticeClass(Model model) {
        List<NotiDTO> classList = notiService.selectAnnClass();
        model.addAttribute("classList", classList);
        return "noticeClass";
    }

    // 공지사항 업데이트 (noticeDTO의 데이터를 받아서 업데이트)
    @RequestMapping(value = "/notice/update", method = RequestMethod.POST)
    public String updateNotice(NotiDTO dto) {
        notiService.updateNotice(dto);
        return "redirect:/notice";
    }

    // 공지사항 삭제 (notice_id로 삭제)
    @RequestMapping(value = "/notice/delete/{notice_id}", method = RequestMethod.POST)
    public String deleteNotice(@PathVariable("notice_id") int noticeId) {
        notiService.deleteNotice(noticeId);
        return "redirect:/notice";
    }
}

	
	
	
	

	

