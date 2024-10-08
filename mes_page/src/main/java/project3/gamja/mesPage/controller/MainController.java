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
import project3.gamja.mesPage.service.MainService;



@Controller
public class MainController {
	@Autowired
	MainService mainService;
	
	@RequestMapping("/main")
	public String listEmp(Model model) {
		List<MesMainDTO> list = mainService.selectAll();
		model.addAttribute("MainList", list);
		
		return "main";
	}
	@RequestMapping("/mesPage")
	@ResponseBody  // JSON으로 반환
	public interface MainDAO {
	    List<MesMainDTO> getStatisticsByGenre(@Param("year") int year, @Param("month") int month);
	}
	
}
