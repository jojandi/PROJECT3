package project3.gamja.mesPage.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.gamja.mesPage.dto.MesMainDTO;
import project3.gamja.mesPage.dto.MesNoticeDTO;
import project3.gamja.mesPage.service.MainService;
import project3.gamja.mesPage.service.NoticeService;



@Controller
public class MainController {
	@Autowired
	MainService mainService;
	
	@RequestMapping("/mes_main")
	public String displayMainPage(Model model) {
	 
	   //데이터: 공지사항 리스트 (emp_id = 4)
	    List<MesMainDTO> notices = mainService.getNoticesByEmpId(4);
	    if (notices == null || notices.isEmpty()) {
	        System.out.println("No notices found for emp_id = 4");
	    }
	    model.addAttribute("noticeList", notices);

	    // 두 개의 데이터를 함께 mes_main.jsp로 전달
	    return "mes_main";
	}
	@RequestMapping("/mesPage")
	@ResponseBody  // JSON으로 반환
	public interface MainDAO {
	    List<MesMainDTO> getStatisticsByGenre(@Param("year") int year, @Param("month") int month);
	}


	
}
