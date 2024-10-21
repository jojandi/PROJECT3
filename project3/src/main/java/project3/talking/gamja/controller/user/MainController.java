package project3.talking.gamja.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project3.talking.gamja.dto.user.NotiDTO;
import project3.talking.gamja.service.user.MainService;

@Controller
@RequestMapping("/user")
public class MainController {
	
	@Autowired
	MainService selectNoti;

	// mainpage
	@RequestMapping(value="/main")
	public String mianSelct(Model model) {
		
		List<NotiDTO> list = selectNoti.selectNoti();
		model.addAttribute("noti", list);
		
		return "main";
	}
	
}
