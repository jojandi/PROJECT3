package project3.gamja.mesPage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.gamja.mesPage.dto.MesGraphDTO;
import project3.gamja.mesPage.service.GraphService;

@Controller
public class GraphController {

    @Autowired
    GraphService graphService;

    @RequestMapping("/mes_graph")
    public String listEmp(Model model) {
        List<MesGraphDTO> list = graphService.selectAll();
        model.addAttribute("list", list);
        return "mes_graph";
    }

    @Controller
    public class MesMainStatus1Controller {

        @Autowired
        private GraphService graphService; 

        // JSON으로 통계 데이터를 반환하는 메서드
        @RequestMapping("/getBookStatistics")
        @ResponseBody
        public List<MesGraphDTO> getStatisticsByGenre(
                @RequestParam("year") int year, 
                @RequestParam("month") int month) {
            // 서비스에서 연도와 월에 맞는 데이터를 장르별로 가져옴
            return graphService.getStatisticsByGenre(year, month);
        }
    }
}