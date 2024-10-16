package project3.gamja.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project3.gamja.admin.dto.InvenDTO;
import project3.gamja.admin.dto.NotiDTO;
import project3.gamja.admin.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService selectNoti;

	// mainpage
	@RequestMapping(value="/main")
	public String mianSelct(Model model) {
		
		List<NotiDTO> list = selectNoti.selectNoti();
		List<InvenDTO> lib = selectNoti.selectLoanSeq();
		model.addAttribute("noti", list);
		model.addAttribute("lib", lib);
		
		return "main";
	}
	
}
