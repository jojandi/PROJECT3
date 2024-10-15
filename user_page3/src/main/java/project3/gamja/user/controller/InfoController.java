package project3.gamja.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project3.gamja.user.dto.NotiDTO;
import project3.gamja.user.dto.RequestDTO;
import project3.gamja.user.service.InfoService;


@Controller
public class InfoController {

	@Autowired
	InfoService InfoService;


	  @RequestMapping("/notice") public String listnoti(Model model) {
	  
	  List<NotiDTO> list = InfoService.listnoti(); 
	  System.out.println(list);
	  
	  model.addAttribute("list", list);
	 
	 return "notice"; 
	 }
	  
	 

	@RequestMapping("/notice2")
	public String listnoti2(Model model) {

		List<NotiDTO> list = InfoService.listnoti();
		model.addAttribute("list", list);

		return "notice2";
	}

	@RequestMapping("/notice3")
	public String listnoti3(Model model, int ann_seq) {

		NotiDTO dto = InfoService.selectSeq(ann_seq);
		// 공지사항 조회 인서트 
		model.addAttribute("notice", dto);

		return "notice3";
	}
	
	//페이징 
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String slelctInven(Model model, NotiDTO invenDTO, String countPerPage, String page) {
		// 페이징 기본값 설정
		if(countPerPage == null) countPerPage = "10";
		if(page == null) page = "1";
		
		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);
		
		Map map = InfoService.selectAnnouncement(count, pageNo);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
//		System.out.println("totalCount : " + map.get("totalCount"));
		System.out.println("countPerPage : " + count);
		System.out.println("page : " + pageNo);
		
		return "notice";
	}
	
	
	
	
	
	
	// 도서신청
	// 전체조회
	@RequestMapping("/request")
	public String listreq(Model model) {

		/*
		 * List<RequestDTO> list = InfoService.listreq();
		 * model.addAttribute("list", list);
		 */
		// 리턴값이 타일즈로 가는거임 
		return "request";
	}
	// insert
	@RequestMapping("/requestInsert")
	public String insreq(Model model, @ModelAttribute RequestDTO dto) {
		int result = InfoService.insertApplication(dto);
		System.out.println("dto = " + dto);
		System.out.println(result);
		return "redirect:/request";
	}
	// 업데이트
	@RequestMapping("/requestUpdate")
	public String updatereq(Model model, @ModelAttribute RequestDTO dto) {
		int result = InfoService.editApplication(dto);
		System.out.println("dto = " + dto);
		System.out.println(result);

		// 업데이트 결과에 따라 리다이렉트 처리
		if (result > 0) {
			return "redirect:request"; // 성공 시 요청 페이지로 리다이렉트
		} else {
			model.addAttribute("errorMessage",
					"Update failed. Please try again.");
			return "error"; // 실패 시 에러 페이지로 이동 (필요시 다른 페이지로 설정 가능)
		}
	
	}
}
