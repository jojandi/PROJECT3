package project3.talking.gamja.controller.mes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project3.talking.gamja.dto.mes.MesGraphDTO;
import project3.talking.gamja.service.mes.GraphService;

@Controller
@RequestMapping("/mes")
public class GraphController {

    @Autowired
    private GraphService graphService;
 
    // JSP 페이지를 보여주는
    @RequestMapping(value = "/mes_graph1", method = RequestMethod.GET)
    public String selectAll() {
        return "mes_graph1";  // JSP 페이지 이름 반환
    }

    @RequestMapping(value = "/mes_graph_data", method = RequestMethod.GET)
    @ResponseBody
    public List<MesGraphDTO> getStatisticsByGenre(
            @RequestParam(value = "year", required = false, defaultValue = "2023") int year, 
            @RequestParam(value = "month", required = false, defaultValue = "1") int month) {
        System.out.println("Year: " + year);
        System.out.println("Month: " + month);

        return graphService.getStatisticsByGenre(year, month);
    }
    @RequestMapping(value = "/mes_graph2", method = RequestMethod.GET)
    public String selectAll_demand() {
        return "mes_graph2";  // JSP 페이지 이름 반환
    }

    @RequestMapping(value = "/mes_graph_data_2", method = RequestMethod.GET)
    @ResponseBody
    public List<MesGraphDTO> getStatisticsByGenreForDemand(
            @RequestParam(value = "year", required = false, defaultValue = "2023") int year, 
            @RequestParam(value = "month", required = false, defaultValue = "1") int month) {
        System.out.println("Year: " + year);
        System.out.println("Month: " + month);

        return graphService.getStatisticsByGenreForDemand(year, month);
    }
    @RequestMapping(value = "/mes_graph3", method = RequestMethod.GET)
    public String selectAll_totalG() {
    	return "mes_graph3";  // JSP 페이지 이름 반환
    }
    
    @RequestMapping(value = "/mes_graph_data_3", method = RequestMethod.GET)
    @ResponseBody
    public List<MesGraphDTO> getForecastData(
    		@RequestParam(value = "year", required = false, defaultValue = "2024") int year, 
    		@RequestParam(value = "month", required = false, defaultValue = "1") int month) {
    	System.out.println("Year: " + year);
    	System.out.println("Month: " + month);
    	
    	return graphService.getForecastData(year, month);
    }
    
}
