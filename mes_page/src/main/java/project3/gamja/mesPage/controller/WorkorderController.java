package project3.gamja.mesPage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	    //BOM 페이지
	    @RequestMapping(value = "/mes_bom", method = RequestMethod.GET)
	    public String mesBom(Model model) {
	        System.out.println("Bomcreate 실행!");

	        List<MesWorkorderDTO> list = woService.getList2();

	        model.addAttribute("list", list);

	        return "mes_bom"; 
	    }
	    
	    @RequestMapping(value = "/mes_bom_read", method = RequestMethod.GET)
	    public String MesBomRead(@RequestParam("bom_code") int bomCode, Model model) {
	        // bom_code 값을 받아서 처리
	        MesWorkorderDTO dto = new MesWorkorderDTO();
	        dto.setBom_code(bomCode);

	        // 서비스 호출해서 해당 bom_code에 대한 데이터를 가져옴
	        MesWorkorderDTO list = woService.MesBomRead(dto);
	        List list2 = woService.bomSelect();

	        // 모델에 데이터 추가
	        model.addAttribute("list", list);
	        model.addAttribute("list2", list2);
	        // bom_read.jsp 페이지로 이동
	        return "mes_bom_read";
	    }
	    
	    @RequestMapping(value = "/updateBom", method = RequestMethod.POST)
	    public String updateBom(
	            @RequestParam("bom_code") String strBomCode,
	            @RequestParam("bom_name") String bomName,
	            @RequestParam("mes_book_code1") String mesBookCode1,
	            @RequestParam("mes_book_code2") String mesBookCode2,
	            @RequestParam("mes_book_code3") String mesBookCode3) {
	        
	        System.out.println("updateBom 실행");

	        // 파라미터 처리
	        int bomCode = Integer.parseInt(strBomCode);

	        // DTO 생성 후 값 설정
	        MesWorkorderDTO orderDTO = new MesWorkorderDTO();
	        orderDTO.setBom_code(bomCode);
	        orderDTO.setBom_name(bomName);
	        orderDTO.setMes_book_code1(Integer.parseInt(mesBookCode1));
	        orderDTO.setMes_book_code2(Integer.parseInt(mesBookCode2));
	        orderDTO.setMes_book_code3(Integer.parseInt(mesBookCode3));

	        // 서비스 호출하여 업데이트
	        int result = woService.updateBom(orderDTO);
	        System.out.println("update 결과 : " + result);

	        // 업데이트 후 리다이렉트
	        return "redirect:mes_bom";
	    }
	}

