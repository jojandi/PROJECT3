package project3.talking.gamja.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project3.talking.gamja.dto.admin.InvenDTO;
import project3.talking.gamja.dto.admin.NotiDTO;
import project3.talking.gamja.service.admin.MainService;

@Controller("adminMainController")
@RequestMapping("/admin")
public class MainController {
	
	@Autowired
	@Qualifier("adminMainService")
	MainService selectNoti;

	// mainpage
	@RequestMapping(value="/main")
	public String mianSelct(Model model) {
		
		List<NotiDTO> list = selectNoti.selectNoti();
		List<InvenDTO> lib = selectNoti.selectLoanSeq();
		model.addAttribute("noti", list);
		model.addAttribute("lib", lib);
		
		return "admin_main";
	}
	
}
