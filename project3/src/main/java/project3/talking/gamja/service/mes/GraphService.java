package project3.talking.gamja.service.mes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.talking.gamja.dao.mes.GraphDAO;
import project3.talking.gamja.dto.mes.MesGraphDTO;

@Service
public class GraphService {

    @Autowired
    GraphDAO graphDAO;

    public List<MesGraphDTO> selectAll() {
        return graphDAO.selectAll();
    }

    public List<MesGraphDTO> getStatisticsByGenre(int year, int month) {
        return graphDAO.getStatisticsByGenre(year, month);
    }
    public List<MesGraphDTO> selectAll_demand() {
    	return graphDAO.selectAll();
    }
    
    public List<MesGraphDTO> getStatisticsByGenreForDemand(int year, int month) {
    	return graphDAO.getStatisticsByGenreForDemand(year, month);
    }
    public List<MesGraphDTO> selectAll_total() {
    	return graphDAO.selectAll();
    }
    
    public List<MesGraphDTO> getForecastData(int year, int month) {
    	return graphDAO.getForecastData(year, month);
    }
}