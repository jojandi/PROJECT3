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

    // 사원 목록 페이지
    @RequestMapping("/mes_human")
    public String human(Model model) {
        List<MesHumanDTO> list = humanService.selectHuman();
        model.addAttribute("list", list);
        return "mes_human";
    }

    // 사원 상세 페이지
    @RequestMapping("/mes_read")
    public String readNotice(@RequestParam int emp_id, Model model) {
        System.out.println("read 실행확인");
        MesHumanDTO dto = new MesHumanDTO();
        dto.setEmp_id(emp_id);
        MesHumanDTO list = humanService.selectOne(dto);
        model.addAttribute("dto", list);
        return "mes_read";
    }

    // 사원 수정 페이지 이동
    @RequestMapping("/mes_humanUpdate")
    public String updateHuman(@RequestParam int emp_id, Model model) {
        MesHumanDTO dto = new MesHumanDTO();
        dto.setEmp_id(emp_id);
        MesHumanDTO humanData = humanService.selectOne(dto);
        model.addAttribute("updateHuman", humanData);
        return "mes_humanUpdate";
    }

    // 사원 수정 처리
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyHuman(MesHumanDTO dto) {
        try {
            humanService.updateHuman(dto); // 데이터 수정
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mes_human"; // 수정 후 목록 페이지로 이동
    }

    // 사원 삭제 처리
    @RequestMapping(value = "/mes_human/remove", method = RequestMethod.POST)
    public String deleteHuman(@RequestParam int emp_id) {
    	System.out.println("remove 컨트롤러 실행");
        MesHumanDTO dto = new MesHumanDTO();
        dto.setEmp_id(emp_id);
        try {
            humanService.deleteHuman(dto); // 데이터 삭제
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("삭제 확인");
        return "redirect:/mes_human"; // 삭제 후 목록 페이지로 이동
    }
    
    // 사원 추가 처리
    @RequestMapping(value = "/mes_human/insert", method = RequestMethod.POST)
    public String addEmployee(MesHumanDTO dto) {
        try {
            humanService.insertHuman(dto);  // 직원 추가 서비스 호출
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mes_human";  // 추가 후 직원 목록으로 리다이렉트
    }
}
