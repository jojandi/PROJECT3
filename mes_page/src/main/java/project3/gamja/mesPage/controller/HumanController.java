package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project3.gamja.mesPage.dto.MesHumanDTO;
import project3.gamja.mesPage.service.HumanService;

@Controller
public class HumanController {

    @Autowired
    HumanService humanService;

    @RequestMapping("/mes_human")
    public String human(Model model) {
        List<MesHumanDTO> list = humanService.selectHuman();
        model.addAttribute("list", list);

        return "mes_human";
    }

    @RequestMapping("/mes_read")
    public String readNotice(@RequestParam int emp_id, Model model) {
        System.out.println("read 실행확인");
        MesHumanDTO dto = new MesHumanDTO();
        dto.setEmp_id(emp_id);

        MesHumanDTO list = humanService.selectOne(dto);
        model.addAttribute("dto", list);

        return "mes_read";
    }

    @RequestMapping("/mes_humanUpdate")
    public String updateHuman(@RequestParam int emp_id, Model model) {

        MesHumanDTO dto = new MesHumanDTO();
        dto.setEmp_id(emp_id);

        MesHumanDTO humanData = humanService.selectOne(dto);
        model.addAttribute("updateHuman", humanData);

        return "mes_humanUpdate";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyHuman(MesHumanDTO dto) {
        try {
            humanService.updateHuman(dto); // 데이터 수정
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mes_human"; // 수정 후 목록 페이지로 이동
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String deleteHuman(@RequestParam int emp_id) {
        MesHumanDTO dto = new MesHumanDTO();
        dto.setEmp_id(emp_id);

        try {
            humanService.deleteHuman(dto); // 데이터 삭제
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("삭제확인");
        return "redirect:/mes_human"; // 삭제 후 목록 페이지로 이동
    }
}

