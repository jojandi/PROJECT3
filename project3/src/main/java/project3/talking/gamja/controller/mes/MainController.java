package project3.talking.gamja.controller.mes;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project3.talking.gamja.dto.mes.MesMainDTO;
import project3.talking.gamja.service.mes.MainService;



@Controller("mesMainController")
@RequestMapping("/mes")
public class MainController {
	 @Autowired
	 @Qualifier("mesMainService")
	    private MainService mainService;

	    // 메인 페이지에서 공지사항과 주문/출고 정보를 모두 표시
	    @RequestMapping("/mes_main")
	    public String displayMainPage(@RequestParam(value = "month", required = false) String month, Model model) {
	        // 공지사항 리스트 (emp_id = 4)
	        List<MesMainDTO> notices = mainService.getNoticesByEmpId(4);
	        if (notices == null || notices.isEmpty()) {
	            System.out.println("No notices found for emp_id = 4");
	        }
	        model.addAttribute("noticeList", notices);

	        if (month == null || month.isEmpty()) {
	            month = "2024-10";  
	        }
	        Map<String, Integer> orderAndDeliveryData = mainService.getMonthlyOrderAndDelivery(month);
	        
	        if (orderAndDeliveryData != null) {
	            model.addAttribute("orderCount", orderAndDeliveryData.get("orderCount"));
	            model.addAttribute("deliveryCount", orderAndDeliveryData.get("deliveryCount"));
	        } else {
	            System.out.println("No data found for the selected month: " + month);
	            model.addAttribute("orderCount", 0);
	            model.addAttribute("deliveryCount", 0);
	        }

	        return "mes_main";  
	    }
	}
	
	


	

