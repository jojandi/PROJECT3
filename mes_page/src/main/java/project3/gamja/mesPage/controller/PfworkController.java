package project3.gamja.mesPage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.gamja.mesPage.dao.PfworkDAO;
import project3.gamja.mesPage.dto.MesPfworkDTO;
import project3.gamja.mesPage.service.PfworkService;

@Controller
public class PfworkController {
	
	@Autowired
	PfworkService pfService;
	
	@Autowired
	PfworkDAO pfDAO;
	
	// 주문현황 리스트로 가져오기
	@RequestMapping(value="mes_pfwork1", method=RequestMethod.GET)
	public String pfwork1(Model model, Integer seq, Integer count, Integer pageNo) {
		// 페이징 기본값 설정
		if(count == null) count = 7;
		if(pageNo == null) pageNo = 1;
		
		Map map = pfService.selectpf(count, pageNo);
		List<MesPfworkDTO> emp_ID = pfService.selectEmployee();
		List<MesPfworkDTO> bom_code = pfService.selectBom();
		List<MesPfworkDTO> buser = pfService.selectBookflix();
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		model.addAttribute("emp_id", emp_ID);
		model.addAttribute("bom_code", bom_code);
		model.addAttribute("buser_seq", buser);
		
		return "mes_pfwork1";
	}
	
	// 출고현황 리스트로 가져오기
	@RequestMapping(value="mes_pfwork2", method=RequestMethod.GET)
	public String pfwork2(Model model, Integer count, Integer pageNo) {
		// 페이징 기본값 설정
		if(count == null) count = 5;
		if(pageNo == null) pageNo = 1;
		
		Map map = pfService.selectde(count, pageNo);
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		
		return "mes_pfwork2";
	}
	
	// 주문현황 select one
	@RequestMapping(value="mes_pfwork1_read", method=RequestMethod.GET)
	public String PfworkOne (int os_id, Model model) {
		
		MesPfworkDTO dto = new MesPfworkDTO();
		dto.setOs_id(os_id);
		
		List<MesPfworkDTO> bom_code = pfService.selectBom();
		
		MesPfworkDTO list = pfService.selectOne(dto);
		model.addAttribute("list",list);
		model.addAttribute("bom_code", bom_code);
		
		return "mes_pfwork1_read";
	}
	
	// 주문현황 insert
	@RequestMapping(value="insertpf", method=RequestMethod.POST)
	public String insertpf(MesPfworkDTO pfDTO) {
		
		int result = -1;
		
		try {
			result = pfService.insertpf(pfDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("insert : " + result);
		System.out.println(pfDTO);
		
		return "redirect:mes_pfwork1";
	}
	
	// 주문현황 update
	@RequestMapping(value="updatepf", method=RequestMethod.GET)
	public String updatepf(MesPfworkDTO pfDTO) {
		
		int result = -1;
		
		try {
			result = pfService.updatepf(pfDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("update : " + result);
		System.out.println(pfDTO);
		
		return "redirect:mes_pfwork1";
	}
	
	// 주문현황 delete
	@RequestMapping(value="deletepf", method=RequestMethod.DELETE)
	@ResponseBody
	public int deletepf(@RequestBody MesPfworkDTO pfDTO) {
		int result = -1;
		
		try {
			result = pfService.deletepf(pfDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("delete : " + result);
		
		return result;
	}
	
	//////////////////////// 주문현황 -> 작업지시서 insert //////////////////////////
	@RequestMapping(value="pfinsertwo", method=RequestMethod.POST)
	public String pfinsertwo(MesPfworkDTO pfDTO) {
		int result = -1;
		
		System.out.println(pfDTO.getLib_id());
		
		try {
			result = pfService.pfinsertwo(pfDTO);
			if(null == pfDTO.getOs_status()) {
				pfService.pfupdatepf(pfDTO);
				System.out.println("os_status : " + pfDTO.getOs_status());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("insert : " + result);
		
		return "redirect:mes_workorder1";
	}
	
}
