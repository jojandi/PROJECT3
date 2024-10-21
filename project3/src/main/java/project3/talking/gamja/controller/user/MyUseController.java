package project3.talking.gamja.controller.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project3.talking.gamja.service.user.MyUseService;

@Controller
@RequestMapping("/user")
public class MyUseController {
	
	@Autowired
	MyUseService useService;

	// 이용내역 - 예약 내역 select
	@RequestMapping(value="/res", method=RequestMethod.GET)
	public String res(Model model, Integer seq, Integer count, Integer pageNo) {
		
		// 페이징 기본값 설정
		if(count == null) count = 7;
		if(pageNo == null) pageNo = 1;
		
		// 회원id, 목록 갯수, 페이지
		Map map = useService.selectUseRes(seq, count, pageNo);
		
		map.put(pageNo, map);
		// select 된 목록들, 목록 갯수, 페이지 jsp에 보냄
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "myres";
	}
	
	// 이용내역 - 대출 내역 select
	@RequestMapping(value="/loan", method=RequestMethod.GET)
	public String loan(Model model, Integer seq, Integer count, Integer pageNo) {
		
		// 페이징 기본값 설정
		if(count == null) count = 7;
		if(pageNo == null) pageNo = 1;
		
		// 회원id, 목록 갯수, 페이지
		Map map = useService.selectUseLoan(seq, count, pageNo);
		
		// select 된 목록들, 목록 갯수, 페이지 jsp에 보냄
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
				
		return "myloan";
	}
	
	// 이용내역 - 연체 내역 select
	@RequestMapping(value="/over", method=RequestMethod.GET)
	public String over(Model model, Integer seq, Integer count, Integer pageNo) {
		
		// 페이징 기본값 설정
		if(count == null) count = 7;
		if(pageNo == null) pageNo = 1;
		
		// 회원id, 목록 갯수, 페이지
		Map map = useService.selectUseOver(seq, count, pageNo);
		
		// select 된 목록들, 목록 갯수, 페이지 jsp에 보냄
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "myover";
	}
	
	
	
}
