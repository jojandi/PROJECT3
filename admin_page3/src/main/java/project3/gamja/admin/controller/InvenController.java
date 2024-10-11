package project3.gamja.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.gamja.admin.dto.InvenDTO;
import project3.gamja.admin.dto.LoanResDTO;
import project3.gamja.admin.service.InvenService;

@Controller
public class InvenController {

	@Autowired
	InvenService invenService;
	
	/////////////////////////////// 재고현황 페이지 ///////////////////////////////
	// 실시간 재고현황 페이지
	@RequestMapping(value="/inven", method=RequestMethod.GET)
	public String slelctInven(Model model, InvenDTO invenDTO, String countPerPage, String page) {
		System.out.println("keyword : " + invenDTO.getKeyword());
		System.out.println("searchType : " + invenDTO.getSearchType());
		
		// 페이징 기본값 설정
		if(countPerPage == null) countPerPage = "10";
		if(page == null) page = "1";
		
		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);
		
		Map map = invenService.selectInven(invenDTO, count, pageNo);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "inven";
	}
	
	// 실시간 재고현황 상세 페이지
	@RequestMapping(value="/inven_", method=RequestMethod.GET)
	public String readInven(Model model, InvenDTO invenDTO, String countPerPage, String page) {
		// 페이징 기본값 설정
		if(countPerPage == null) countPerPage = "10";
		if(page == null) page = "1";
		
		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);
		
		System.out.println("isbn : " + invenDTO.getBook_ISBN());
		System.out.println("lib_id : " + invenDTO.getLib_id());
		
		InvenDTO dto = invenService.readInven(invenDTO);
		
		model.addAttribute("dto", dto);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "inven_";
	}
	
	/////////////////////////////// 예약현황 페이지 ///////////////////////////////
	// 예약 현황 페이지
	@RequestMapping(value="/res", method=RequestMethod.GET)
	public String selectRes(Model model, LoanResDTO loanResDTO, String countPerPage, String page) {
		System.out.println("keyword : " + loanResDTO.getKeyword());
		System.out.println("searchType : " + loanResDTO.getSearchType());
		
		// 페이징 기본값 설정
		if(countPerPage == null) countPerPage = "10";
		if(page == null) page = "1";
		
		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);
		
		Map map = invenService.selectRes(loanResDTO, count, pageNo);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "res";
	}
	
	// 예약 후 대출내역으로 이동 및 재고 업데이트
	@RequestMapping(value="/resLoan", method=RequestMethod.POST)
	@ResponseBody
	public int resLoan(Model model,@RequestBody LoanResDTO loanResDTO, String countPerPage, String page) {

		int updateRes = invenService.updateRes(loanResDTO);
		int inseResLoan = invenService.inseResLoan(loanResDTO);
		int invenLoan = invenService.invenLoan(loanResDTO);
		int invenRes = invenService.invenRes(loanResDTO);
		
		System.out.println("예약현황 업데이트 : " + updateRes);
		System.out.println("예약 -> 대출 : " + inseResLoan);
		System.out.println("재고현황 - 대출중 : " + invenLoan);
		System.out.println("재고현황 - 예약중 해체 : " + invenRes);
		
		return updateRes;
	}
	
	/////////////////////////////// 대출현황 페이지 ///////////////////////////////
	// 대출 현황 페이지
	@RequestMapping(value="/loan", method=RequestMethod.GET)
	public String selectLoan(Model model, LoanResDTO loanResDTO, String countPerPage, String page) {
		System.out.println("keyword : " + loanResDTO.getKeyword());
		System.out.println("searchType : " + loanResDTO.getSearchType());
		
		// 페이징 기본값 설정
		if(countPerPage == null) countPerPage = "10";
		if(page == null) page = "1";
		
		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);
		
		Map map = invenService.selectLoan(loanResDTO, count, pageNo);
		System.out.println(map.get("list"));
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "loan";
	}
	
	// 반납 후 대출내역 업데이트 및 재고 업데이트
	@RequestMapping(value="/loanReturn", method=RequestMethod.POST)
	@ResponseBody
	public int loanReturn(Model model,@RequestBody LoanResDTO loanResDTO, String countPerPage, String page) {

		int laonUpdate = invenService.laonUpdate(loanResDTO);
		int invenUpdate = invenService.invenUpdate(loanResDTO);
		int overUserUpdate = invenService.overUserUpdate(loanResDTO);
		
		System.out.println("대출현황 업데이트 : " + laonUpdate);
		System.out.println("재고 업데이트 : " + invenUpdate);
		System.out.println("연체 업데이트 : " + overUserUpdate);
		
		return laonUpdate;
	}
}
