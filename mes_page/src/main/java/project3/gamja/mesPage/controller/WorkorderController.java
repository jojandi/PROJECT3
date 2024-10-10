package project3.gamja.mesPage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project3.gamja.mesPage.dto.MesWorkorderDTO;
import project3.gamja.mesPage.service.WorkorderService;

@Controller
public class WorkorderController {
	
	@Autowired
	WorkorderService woService;
	
	
	@RequestMapping(value="mes_workorder1", method=RequestMethod.GET)
	public String workorder1(Model model, Integer seq, Integer count, Integer pageNo) {
		
		// 페이징 기본값 설정
		if(count == null) count = 7;
		if(pageNo == null) pageNo = 1;
		
		Map map = woService.selectwo(count, pageNo);
		List<MesWorkorderDTO> bom_code = woService.selectBom();
		
		model.addAttribute("map", map);
		model.addAttribute("countPerPage", count);
		model.addAttribute("page", pageNo);
		model.addAttribute("bom_code", bom_code);
		
		return "mes_workorder1";
	}
	
	@RequestMapping(value="mes_workorder1_read", method=RequestMethod.GET)
	public String workorderRead(int wo_id, Model model) {
		
		MesWorkorderDTO dto = new MesWorkorderDTO();
		
		dto.setWo_id(wo_id);
		
		MesWorkorderDTO list = woService.selectOne(dto);
		
		model.addAttribute("list", list);
		
		return "mes_workorder1_read";
	}
	
	@RequestMapping(value="/workorderUpdate", method=RequestMethod.POST)
   public String workorderUpdate(MesWorkorderDTO dto) {
      
	System.out.println("update 실행 ");
	
       try {
           if ("완료".equals(dto.getWo_status())) {
               // 1. tbl_order 테이블에서 해당 주문 삭제
        	   woService.deletewo(dto);
               
               // 2. mes_book 테이블에서 book_count 업데이트 (수량 추가)
        	   woService.updatewo(dto);
        	   System.out.println(dto.getWo_count());
           }
           
       } catch (Exception e) {
           // 예외 발생 시 에러 로그 출력
           e.printStackTrace(); // 콘솔에 전체 예외 정보를 출력
       }
       return "redirect:mes_workorder1";
   }
	
	@RequestMapping(value="insertwo", method=RequestMethod.POST)
	public String insertwo(MesWorkorderDTO dto) {
		int result = -1;
		
		try {
			result = woService.insertwo(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("insert : " + result);
		
		return "redirect:mes_workorder1";
	}
	
}
