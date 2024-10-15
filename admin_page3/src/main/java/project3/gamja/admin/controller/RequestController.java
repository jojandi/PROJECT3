package project3.gamja.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.gamja.admin.dto.ApplyDTO;
import project3.gamja.admin.dto.RequestDTO;
import project3.gamja.admin.service.RequestService;

@Controller
public class RequestController {
	
	@Autowired
	RequestService reService;
	
	///////////////////////////// 도서 발주 /////////////////////////////
	@RequestMapping("request")
	public String request(Model model, Integer seq, Integer count, Integer page) {
		// 페이징 기본값 설정
		if(count == null) count = 10;
		if(page == null) page = 1;
		
		Map map = reService.selectre(count, page);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", page);
		
		return "request";
	}
	
	// 신청 내역 발주로 이동
	@RequestMapping(value="reqOrder", method=RequestMethod.POST)
	@ResponseBody
	public int reqOrder(@RequestBody RequestDTO requestDTO) {
		int[] lr_seqs = requestDTO.getLr_seqs();
		int[] lr_counts = requestDTO.getLr_counts();
		int[] lib_ids = requestDTO.getLib_ids();
		for(int check : lr_seqs) {
			System.out.println("발주번호 : " + check);
		}
		for(int lib_id : lr_counts) {
			System.out.println("발주수량 : " + lib_id);
		}
		for(int lib_id : lib_ids) {
			System.out.println("발주수량 : " + lib_id);
		}
		
		int update = reService.reqUpdate(requestDTO); // 발주에 수량 update
		int result = reService.reqOrder(requestDTO); // 발주 -> mes 주문현황
		System.out.println("수량 update : " + update);
		System.out.println("발주 -> mes 주문현황 : " + result);
		
		return result;
	}
	
	///////////////////////////// 도서 신청 내역 /////////////////////////////
	@RequestMapping("apply")
	public String apply(Model model, Integer seq, Integer count, Integer pageNo) {
		// 페이징 기본값 설정
		if(count == null) count = 10;
		if(pageNo == null) pageNo = 1;
		
		Map map = reService.selectApply(count, pageNo);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "apply";
	}
	
	// 신청 내역 삭제
	@RequestMapping(value="applyDel", method=RequestMethod.DELETE)
	@ResponseBody
	public int applyDelete(@RequestBody ApplyDTO applyDTO) {
		int[] checks = applyDTO.getChecks();
		for(int check : checks) {
			System.out.println("신청번호 : " + check);
		}
		
		int result = reService.applyDelete(applyDTO);
		
		return result;
	}
	
	// 신청 내역 발주로 이동
	@RequestMapping(value="applyReq", method=RequestMethod.POST)
	@ResponseBody
	public int applyReq(@RequestBody ApplyDTO applyDTO) {
		int[] checks = applyDTO.getChecks();
		int[] lib_ids = applyDTO.getLib_ids();
		for(int check : checks) {
			System.out.println("신청번호 : " + check);
		}
		for(int lib_id : lib_ids) {
			System.out.println("도서관 아이디 : " + lib_id);
		}
		
		int result = reService.applyReq(applyDTO);
		int update = reService.applyUpdate(applyDTO);
		System.out.println("신청 -> 발주 : " + result);
		System.out.println("신청 상태 : " + update);
		
		return result;
	}

}
