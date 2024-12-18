package project3.gamja.mesPage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project3.gamja.mesPage.dao.MainDAO;
import project3.gamja.mesPage.dao.NoticeDAO;
import project3.gamja.mesPage.dto.MesMainDTO;
import project3.gamja.mesPage.dto.MesNoticeDTO;


@Service
public class MainService {
	
	@Autowired
	MainDAO mainDAO;
	
	public List<MesMainDTO> selectAll(){
		
		List<MesMainDTO> list = mainDAO.selectAll(); 
				
		return list;
	}
	
	 public List<MesMainDTO> getStatisticsByGenre(int month) {
	        return mainDAO.getStatisticsByGenre(month);
	    }
	   

	    public List<MesMainDTO> getNoticesByEmpId(int emp_id) {
	        return mainDAO.findNoticesByEmpId(emp_id);
	    }
	    public Map<String, Integer> getMonthlyOrderAndDelivery(String month) {
	        int orderCount = mainDAO.getMonthlyOrderCount(month);
	        int deliveryCount = mainDAO.getMonthlyDeliveryCount(month);

	        // 결과를 Map에 담아 반환
	        Map<String, Integer> result = new HashMap<String,Integer>();
	        result.put("orderCount", orderCount);
	        result.put("deliveryCount", deliveryCount);
	        return result;
	    }
}
