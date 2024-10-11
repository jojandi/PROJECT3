package project3.gamja.mesPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project3.gamja.mesPage.dto.UserLibraryDTO;
import project3.gamja.mesPage.service.LibraryService;



@Controller
public class libraryController {
	
	@Autowired
	LibraryService libraryService;
	
	@RequestMapping(value="user_libraryInfo", method=RequestMethod.GET)
	public String selectLibrary (@RequestParam int lib_id, Model model) {
		
		UserLibraryDTO dto = new UserLibraryDTO();
		dto.setLib_id(lib_id);
		
		UserLibraryDTO list = libraryService.selectLibrary(dto);
		model.addAttribute("selectLibrary", list);

		
		return "user_libraryInfo";
	}
}
