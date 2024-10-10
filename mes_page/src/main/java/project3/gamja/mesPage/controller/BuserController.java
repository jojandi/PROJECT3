package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project3.gamja.mesPage.dto.MesBuserDTO;
import project3.gamja.mesPage.service.BuserService;





@Controller
public class BuserController {

    @Autowired
    private BuserService buserService;

    @RequestMapping("/buser")
    public String listEmp(Model model, @RequestParam(value = "user_id2", required = false) String user_id2) {
        List<MesBuserDTO> userList = buserService.selectBuser(user_id2);
        model.addAttribute("userList", userList);
        return "buser";  // JSP 파일 이름
    }

}