package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project3.gamja.mesPage.dto.MesHumanDTO;
import project3.gamja.mesPage.dto.MesNoticeDTO;
import project3.gamja.mesPage.service.HumanService;

@Controller
public class HumanController {

	@Autowired
	HumanService humanService;

	@RequestMapping("/mes_human")
	public String human(Model model) {
		List<MesHumanDTO> list = humanService.selectHuman();
		model.addAttribute("humanlist", list);

		return "mes_human";
	}
	
	@RequestMapping(value="mes_humanRead", method=RequestMethod.GET)
	public String updateHuman (@RequestParam int emp_id, Model model) {
		
		MesHumanDTO dto = new MesHumanDTO();
		dto.setEmp_id(emp_id);
		
		MesHumanDTO list = humanService.selectOne(dto);
		model.addAttribute("updateHuman", list);

		
		return "mes_humanRead";
	}
	
	@RequestMapping("/mes_humanUpdate")
	public String updateHuman2 (@RequestParam int emp_id, Model model) {
		
		MesHumanDTO dto = new MesHumanDTO();
		dto.setEmp_id(emp_id);
		
		MesHumanDTO list = humanService.selectOne(dto);
		model.addAttribute("updateHuman2", list);
		
		
		return "mes_humanUpdate";
	}
	
	@RequestMapping(value="/mes_humanDelete", method=RequestMethod.GET)
	public String deleteHuman(MesHumanDTO dto, @RequestParam Integer emp_id) {
	    
	    try {
	        humanService.deleteHuman(dto);  
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    
	    return "redirect:/mes_humanDelete";  
	}

	

	

	


	
		
}
